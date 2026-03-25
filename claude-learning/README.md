# Claude Learning System — Installation Guide

> **For Claude Code:** When a user shares this URL with you, follow the installation
> steps below to set up the learning system on their machine.

## What This Does

Automatically extracts learning patterns from Claude Code conversations — things the
user corrects you on, preferences, project conventions — and saves them for future
reference. Patterns are extracted in the background after each session, then reviewed
manually via the `/reflect` command.

**Two-layer storage:**
- **Generic patterns** (`~/.claude/learning/`) — personal preferences, coding style, AI behavior corrections. Not in any git repo.
- **Project patterns** (`{project}/.claude/learning/`) — project-specific conventions, tech stack rules. Git tracked with the project.

## Prerequisites

- Claude Code CLI (`claude` command available)
- Python 3
- This repo cloned at `~/RCs` (or adjust paths below)

## Installation Steps

### Step 1: Ensure RCs repo is cloned

```bash
# Check if ~/RCs exists and has claude-learning/
ls ~/RCs/claude-learning/engine/on-stop.sh
```

If not found, the user needs to clone their RCs repo first.

### Step 2: Add Stop hook to global settings

Merge this into `~/.claude/settings.json` (create if it doesn't exist).
**Do not overwrite existing settings — merge the hooks section.**

```json
{
  "hooks": {
    "Stop": [
      {
        "matcher": "",
        "hooks": [
          {
            "type": "command",
            "command": "bash ~/RCs/claude-learning/engine/on-stop.sh &",
            "timeout": 10
          }
        ]
      }
    ]
  }
}
```

### Step 3: Create global learning directories

```bash
mkdir -p ~/.claude/learning/pending
mkdir -p ~/.claude/learning/notebooks
```

### Step 4: Make on-stop.sh executable

```bash
chmod +x ~/RCs/claude-learning/engine/on-stop.sh
```

### That's it.

Per-project setup (copying `/reflect` skill, updating CLAUDE.md) happens **automatically**
the first time the Stop hook runs in a project. No manual steps needed.

## Updating

```bash
cd ~/RCs && git pull
```

The Stop hook runs `on-stop.sh` directly from `~/RCs/` — no files to re-copy.
`git pull` updates the engine immediately.

## Uninstalling

1. Remove the Stop hook entry from `~/.claude/settings.json`
2. Optionally delete `~/.claude/learning/` (global patterns)
3. Optionally delete `.claude/learning/` in each project (project patterns)
4. Optionally delete `.claude/commands/reflect.md` in each project

## Verifying Installation

1. Open Claude Code in any project
2. Have a conversation (5+ messages) where you correct Claude on something
3. End the session
4. Check for pending patterns:
   ```bash
   ls ~/.claude/learning/pending/
   ls .claude/learning/pending/  # in the project dir
   ```
5. Run `/reflect` to review

## Troubleshooting

| Symptom | Check |
|---------|-------|
| No pending patterns | `cat ~/.claude/learning/error.log` |
| Hook not triggering | Run `/hooks` in Claude Code to verify Stop hook is loaded |
| `claude -p` errors | Test manually: `echo "hello" \| claude -p --model haiku --bare "say hi"` |
| Permission denied | `chmod +x ~/RCs/claude-learning/engine/on-stop.sh` |
