#!/bin/bash
set -euo pipefail

# ── Paths ──
LEARNING_ENGINE="$HOME/RCs/claude-learning"
GLOBAL_DIR="$HOME/.claude/learning"
CONFIG="$LEARNING_ENGINE/engine/config.json"
PROMPT_TEMPLATE="$LEARNING_ENGINE/engine/extract-prompt.md"
PROJECT_TEMPLATE="$LEARNING_ENGINE/project-template"
ERROR_LOG="$GLOBAL_DIR/error.log"

# ── Ensure global dirs exist ──
mkdir -p "$GLOBAL_DIR/pending" "$GLOBAL_DIR/notebooks"

# ── Read hook JSON from stdin ──
HOOK_INPUT=$(cat)

# ── Extract transcript path and project dir from hook payload ──
# TODO: Verify exact field names once hook payload format is confirmed
read -r TRANSCRIPT_PATH PROJECT_DIR <<< "$(echo "$HOOK_INPUT" | python3 -c "
import sys, json
data = json.load(sys.stdin)
transcript = data.get('transcript_path', '')
project = data.get('cwd', data.get('project_dir', ''))
print(transcript, project)
" 2>/dev/null || echo "")"

if [ -z "$TRANSCRIPT_PATH" ] || [ ! -f "$TRANSCRIPT_PATH" ]; then
    echo "$(date): No transcript found. Input keys: $(echo "$HOOK_INPUT" | python3 -c "import sys,json; print(list(json.load(sys.stdin).keys()))" 2>/dev/null)" >> "$ERROR_LOG"
    exit 0
fi

# ── Auto-bootstrap: set up project if not yet configured ──
if [ -n "$PROJECT_DIR" ] && [ -d "$PROJECT_DIR/.claude" ]; then
    # Install /reflect skill if missing
    if [ ! -f "$PROJECT_DIR/.claude/commands/reflect.md" ]; then
        mkdir -p "$PROJECT_DIR/.claude/commands"
        cp "$PROJECT_TEMPLATE/reflect.md" "$PROJECT_DIR/.claude/commands/reflect.md"
        echo "$(date): Auto-installed /reflect skill in $PROJECT_DIR" >> "$ERROR_LOG"
    fi

    # Create project learning dirs if missing
    mkdir -p "$PROJECT_DIR/.claude/learning/pending"
    mkdir -p "$PROJECT_DIR/.claude/learning/notebooks"

    # Add CLAUDE.md snippet if not already present
    if [ -f "$PROJECT_DIR/CLAUDE.md" ] && ! grep -q "Personal Learning System" "$PROJECT_DIR/CLAUDE.md" 2>/dev/null; then
        echo "" >> "$PROJECT_DIR/CLAUDE.md"
        cat "$PROJECT_TEMPLATE/claude-md-snippet.md" >> "$PROJECT_DIR/CLAUDE.md"
        echo "$(date): Auto-added learning section to $PROJECT_DIR/CLAUDE.md" >> "$ERROR_LOG"
    fi

    # Add pending/ to .gitignore if not already
    if [ -f "$PROJECT_DIR/.gitignore" ] && ! grep -q ".claude/learning/pending/" "$PROJECT_DIR/.gitignore" 2>/dev/null; then
        echo "" >> "$PROJECT_DIR/.gitignore"
        echo "# Learning system pending patterns (transient)" >> "$PROJECT_DIR/.gitignore"
        echo ".claude/learning/pending/" >> "$PROJECT_DIR/.gitignore"
    fi
fi

# ── Check message count ──
MIN_MESSAGES=$(python3 -c "import json; print(json.load(open('$CONFIG'))['min_session_messages'])")

MSG_COUNT=$(python3 -c "
import json
t = json.load(open('$TRANSCRIPT_PATH'))
msgs = t if isinstance(t, list) else t.get('messages', t.get('transcript', []))
user_msgs = [m for m in msgs if m.get('role') in ('user', 'assistant')]
print(len(user_msgs))" 2>/dev/null || echo "0")

if [ "$MSG_COUNT" -lt "$MIN_MESSAGES" ]; then
    exit 0
fi

# ── Keyword pre-filter ──
HAS_CORRECTIONS=$(python3 -c "
import json
config = json.load(open('$CONFIG'))
keywords = [kw.lower() for kw in config['correction_keywords']]
t = json.load(open('$TRANSCRIPT_PATH'))
msgs = t if isinstance(t, list) else t.get('messages', t.get('transcript', []))
user_text = ' '.join(
    m.get('content', '') if isinstance(m.get('content'), str)
    else ' '.join(p.get('text','') for p in m.get('content',[]) if isinstance(p, dict))
    for m in msgs if m.get('role') == 'user'
).lower()
found = any(kw in user_text for kw in keywords)
print('yes' if found else 'no')" 2>/dev/null || echo "no")

if [ "$HAS_CORRECTIONS" != "yes" ]; then
    exit 0
fi

# ── Extract correction segments (truncated to ~2000 chars) ──
SEGMENTS=$(python3 -c "
import json
config = json.load(open('$CONFIG'))
keywords = [kw.lower() for kw in config['correction_keywords']]
t = json.load(open('$TRANSCRIPT_PATH'))
msgs = t if isinstance(t, list) else t.get('messages', t.get('transcript', []))
msgs = [m for m in msgs if m.get('role') in ('user', 'assistant')]

def get_text(m):
    c = m.get('content', '')
    if isinstance(c, str):
        return c
    if isinstance(c, list):
        return ' '.join(p.get('text','') for p in c if isinstance(p, dict))
    return ''

segments = []
for i, m in enumerate(msgs):
    if m.get('role') != 'user':
        continue
    text = get_text(m)
    if not any(kw in text.lower() for kw in keywords):
        continue
    context = []
    if i > 0:
        context.append('[Assistant]: ' + get_text(msgs[i-1])[:300])
    context.append('[User]: ' + text[:500])
    if i + 1 < len(msgs):
        context.append('[Assistant]: ' + get_text(msgs[i+1])[:300])
    segments.append('\n'.join(context))

print('\n---\n'.join(segments)[:2000])" 2>/dev/null || echo "")

if [ -z "$SEGMENTS" ]; then
    exit 0
fi

# ── Call claude -p for extraction ──
TIMESTAMP=$(date +%s)
PROMPT=$(cat "$PROMPT_TEMPLATE")

OUTPUT=$(echo "$SEGMENTS" | claude -p --model haiku --bare --output-format json "$PROMPT" 2>> "$ERROR_LOG") || {
    echo "$(date): claude -p failed" >> "$ERROR_LOG"
    exit 0
}

if [ -z "$OUTPUT" ]; then
    echo "$(date): claude -p returned empty" >> "$ERROR_LOG"
    exit 0
fi

# ── Route patterns to correct pending/ directory ──
python3 -c "
import json, os, sys

try:
    output = json.loads('''$OUTPUT''')
    result = output.get('result', '[]')
    patterns = json.loads(result) if isinstance(result, str) else result
except:
    sys.exit(0)

if not isinstance(patterns, list):
    sys.exit(0)

global_pending = os.path.expanduser('~/.claude/learning/pending')
project_dir = '$PROJECT_DIR'
project_pending = os.path.join(project_dir, '.claude/learning/pending') if project_dir else None

os.makedirs(global_pending, exist_ok=True)
if project_pending:
    os.makedirs(project_pending, exist_ok=True)

for i, p in enumerate(patterns):
    if not isinstance(p, dict):
        continue
    scope = p.get('scope', 'generic')
    if scope == 'this-file-only':
        continue
    target = project_pending if (scope == 'project' and project_pending) else global_pending
    path = os.path.join(target, f'${TIMESTAMP}_{i}.json')
    with open(path, 'w') as f:
        json.dump(p, f, ensure_ascii=False, indent=2)
" 2>> "$ERROR_LOG"

# ── Notify if pending count exceeds threshold ──
PENDING_COUNT=0
PENDING_COUNT=$(($(ls "$GLOBAL_DIR/pending/"*.json 2>/dev/null | wc -l) + 0))
if [ -n "$PROJECT_DIR" ] && [ -d "$PROJECT_DIR/.claude/learning/pending" ]; then
    PENDING_COUNT=$((PENDING_COUNT + $(ls "$PROJECT_DIR/.claude/learning/pending/"*.json 2>/dev/null | wc -l)))
fi

if [ "$PENDING_COUNT" -ge 5 ]; then
    osascript -e "display notification \"You have $PENDING_COUNT patterns waiting for review. Run /reflect in Claude Code.\" with title \"Learning System\"" 2>/dev/null || true
fi
