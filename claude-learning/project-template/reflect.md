---
description: Review pending learning patterns and audit stale notebook entries.
---

Review pending patterns from the learning system and optionally audit stale entries.

## Steps

### 1. Check pending patterns

Read all JSON files in these directories:
- `~/.claude/learning/pending/` (generic patterns)
- `.claude/learning/pending/` (project-specific patterns, if exists)

If no pending files exist, skip to step 4.

### 2. Present each pattern for review

For each pending JSON file, display:

```
---
Pattern: {title}
Scope: {scope} -> Notebook: {notebook}
Rule: {rule}
Why: {why}

[y] Accept  [n] Reject  [e] Edit rule text
---
```

Ask the user for their decision on each pattern.

### 3. Process approved patterns

For each approved pattern:

1. **Contradiction check**: Read the target notebook. If any existing pattern contradicts this one, show both and ask which to keep, merge, or delete.

2. **Dedup check**: If a substantially similar pattern exists, increment its `Hits` count and update `Last-validated` instead of adding a duplicate.

3. **Capacity check**: If the notebook has 30+ entries, show the weakest pattern (oldest + lowest hits + stale) and ask to confirm eviction.

4. **Write to notebook** in this format:
   ```markdown
   ### {title}
   - **Rule**: {rule}
   - **Why**: {why}
   - **Scope**: {scope}
   - **Added**: {YYYY-MM-DD}
   - **Last-validated**: {YYYY-MM-DD}
   - **Hits**: 1
   ```

5. **Update `_index.md`** in the notebooks directory.

6. **Delete the pending JSON file**.

Notebook locations:
- Generic: `~/.claude/learning/notebooks/{notebook}.md`
- Project: `.claude/learning/notebooks/{notebook}.md`

### 4. Audit stale patterns (optional)

Check all notebooks for patterns where `Last-validated` is older than 60 days.

If stale patterns exist, ask:
> "Found {N} stale patterns (>60 days). Want to audit them?"

If yes, for each stale pattern:
- [k] Keep (resets Last-validated to today)
- [d] Delete
- [s] Skip

### 5. Summary

```
Review complete
- Approved: {n}
- Rejected: {n}
- Deduped (hits+1): {n}
- Stale audited: {n}
```
