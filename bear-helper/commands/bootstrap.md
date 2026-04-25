---
description: Bootstrap bear-helper on this machine — install caveman CLAUDE.md and yolo alias for spawning Sophia.
allowed-tools: Read, Bash, Edit, Write
---

You are running the **bear-helper bootstrap**. Set up this machine so the user can run `yolo` to launch the Sophia orchestrator.

## Steps

### 1. Resolve plugin install path

The plugin's installed location varies by machine. Find the active install:

```bash
ls -d ~/.claude/plugins/cache/*/bear-helper/*/ 2>/dev/null | head -1
```

Use that path for `templates/CLAUDE.md.caveman`. Call it `$PLUGIN_DIR`.

### 2. Install / update CLAUDE.md

- If `~/.claude/CLAUDE.md` already exists:
  - Diff it against `$PLUGIN_DIR/templates/CLAUDE.md.caveman`
  - If they match, skip
  - Otherwise, backup to `~/.claude/CLAUDE.md.bak.$(date +%s)`, then copy template

- If `~/.claude/CLAUDE.md` does not exist: copy template directly

Use `cp`. Show user the source and destination.

### 3. Add yolo alias to ~/.zshrc

The target alias is exactly:
```
alias yolo='claude --agent bear-helper:Sophia:AGENT --dangerously-skip-permissions'
```

- Read `~/.zshrc`
- If a line starting with `alias yolo=` exists, replace it (use `sed -i ''` on macOS or write the file)
- If no yolo alias, append the new one with a comment line above: `# bear-helper: yolo launches Sophia orchestrator`
- Skip if the alias is already exactly correct

### 4. Verify Sophia is registered

Run `claude agents list 2>&1` and confirm `bear-helper:Sophia:AGENT` appears. If it doesn't, instruct the user to `claude plugin uninstall bear-helper && claude plugin install bear-helper@bear-marketplace`.

### 5. Report

Tell the user (繁中, casual tone):

```
✨ bear-helper bootstrap 完成

✓ CLAUDE.md → caveman 版（備份在 {.bak path 或 "無需備份"}）
✓ yolo alias → 已就緒
✓ Sophia agent → registered

下一步：
  source ~/.zshrc
  yolo

進去後 Sophia 會用繁中跟你打招呼。
```

## Rules

- NEVER overwrite ~/.claude/CLAUDE.md without backup
- NEVER duplicate the yolo alias line in ~/.zshrc
- If anything fails, report what you did + what to do manually
