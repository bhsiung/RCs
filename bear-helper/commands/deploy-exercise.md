---
description: Deploy Stage 3 exercise images from promptfit-internal to promptfit-app.
---

Deploy Stage 3 exercise images from promptfit-internal to promptfit-app.

You are in the `/Users/bearhsiung/promptfit-internal` project.

## Usage modes

**By run number** (recommended — uses runs.ts as source of truth):
```
python3 scripts/deploy_to_app.py --run 024
```

**By exercise IDs**:
```
python3 scripts/deploy_to_app.py swing deadlift bird_dog
```

**Auto-detect all undeployed**:
```
python3 scripts/deploy_to_app.py
```

## Steps

1. Run dry-run (no `--apply`) and show output to user
2. Ask for confirmation
3. If confirmed, run with `--apply`
4. Report what was copied and what changed in imageAssets.ts / exercises.ts
5. **Rebuild**: Run `cd ~/promptfit-app && pnpm build` to recompile TypeScript (imageAssets.ts / exercises.ts changes won't take effect without this)
6. **Verify**: Use browser plugin to check `http://localhost:8787/library`:
   - Load mcp__claude-in-chrome__tabs_context_mcp to find the tab
   - Navigate to `http://localhost:8787/library` and hard-refresh
   - Run JS to scan for "Preview" badges — exercises in BILATERAL_REAL/UNILATERAL_REAL should have `isPlaceholder: false` (no badge)
   - Cross-reference against the deployed exercise list and report: ✅ confirmed real / ❌ still showing placeholder
   - If any show placeholder after rebuild: check exercise_id matches in exercises.ts / imageAssets.ts

## Unilateral detection

The script auto-detects unilateral exercises by checking for `{id}_left_f*` files:
- **Bilateral**: writes to `BILATERAL_REAL`, sets `hasAnimation: true`
- **Unilateral**: writes to `UNILATERAL_REAL`, sets `hasAnimation: true` + `unilateral: true`
  - If the exercise was previously in BILATERAL_REAL, it gets moved automatically

## File naming convention

- Bilateral:  `{id}_f1_{stage}_{hash}.png` / `{id}_f2_{stage}_{hash}.png`
- Unilateral: `{id}_f1/f2_*` = RIGHT side, `{id}_left_f1/f2_*` = LEFT side

## Multi-frame support (>2 frames)

Exercises with f3, f4, … frames (e.g. flutter_kick with 4-frame loop) are handled automatically:
- **Detection**: script scans for `animation_{id}_bilateral_stage3_f3.png`, `f4.png`, … up to f19
- **Bilateral**: extra frames written to `EXTRA_FRAMES[id].neutral` in imageAssets.ts
- **Unilateral**: extra frames written to `EXTRA_FRAMES[id].left` / `.right`
- **Anchor**: inserts before `// ─── EXTRA_FRAMES_DEPLOY_ANCHOR` comment in imageAssets.ts
- `getActiveFrames()` in the app concatenates `[frame1, frame2, ...extras]` automatically

File naming for extra frames:
```
animation_{id}_bilateral_stage3_f3.png
animation_{id}_bilateral_stage3_f4.png
animation_{id}_left_stage3_f3.png   ← unilateral left extras
animation_{id}_right_stage3_f3.png  ← unilateral right extras
```

## Notes

- Stage priority: stage3 > stage2 > stage1
- Single-frame exercises: create stage3_f2 as a copy of stage3_f1 before deploying
- Any WARNINGs about missing flags → flag to user, likely exercise_id mismatch in exercises.ts
