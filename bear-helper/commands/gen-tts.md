---
description: Generate OpenAI TTS audio clips for PromptFit workout announcements.
---

Generate OpenAI TTS audio clips for PromptFit workout announcements.

Project root: `/Users/bearhsiung/promptfit-app`
Script: `tools/gen-tts/gen-tts.ts`
Output: `client/public/audio/tts/`
Reads API key from: `.dev.vars` → `OPENAI_API_KEY`

## Workflow

### Step 1 — Dry-run first (always)
```bash
cd /Users/bearhsiung/promptfit-app && npx tsx tools/gen-tts/gen-tts.ts --dry-run
```
Show the user the full list of clips that would be generated. Ask for confirmation before proceeding.

### Step 2 — Generate all clips
```bash
npx tsx tools/gen-tts/gen-tts.ts --voice nova
```
Default voice is `nova`. User can specify any of: `alloy`, `ash`, `ballad`, `coral`, `echo`, `fable`, `nova`, `onyx`, `sage`, `shimmer`, `verse`

### Step 3 — Generate voice comparison samples
```bash
npx tsx tools/gen-tts/gen-tts.ts --samples
```
Generates one clip per voice using the sample text. Then create the voice comparison prototype page (see below).

### Step 4 — Create voice comparison prototype page
After `--samples` runs, create `client/src/pages/TtsVoiceProto.tsx` at route `/proto/tts-voices`.

The page should:
- Show all voices in a grid
- For each voice: name, description, and an `<audio controls>` player pointing to `/audio/tts/samples/{voice}.mp3`
- Use Morning Linen design system
- Include a "Pick this voice" button that copies the voice name to clipboard

Register the route in `client/src/App.tsx` and add to the CLAUDE.md proto table.

## Common commands

```bash
# Re-generate everything with a different voice
npx tsx tools/gen-tts/gen-tts.ts --voice onyx --force

# Only generate new clips (skip existing)
npx tsx tools/gen-tts/gen-tts.ts

# Generate samples for voice comparison only
npx tsx tools/gen-tts/gen-tts.ts --samples --sample-text "Dead Bug. 30 seconds."

# List all available voices
npx tsx tools/gen-tts/gen-tts.ts --list-voices
```

## When to re-run
- New exercises added to `exercises.ts` → run without `--force` (skips existing, generates new)
- Switching voices → run with `--voice <name> --force`
- Adding new static phrases → add to `STATIC_PHRASES` array in the script, then run

## Output structure
```
client/public/audio/tts/
  phrase_1.mp3
  phrase_2.mp3
  phrase_3.mp3
  phrase_get_ready.mp3
  phrase_rest.mp3
  phrase_next_up.mp3
  phrase_left.mp3
  phrase_right.mp3
  phrase_complete.mp3
  push_up.mp3
  dead_bug.mp3
  ... (one per exercise)
  samples/
    alloy.mp3
    ash.mp3
    nova.mp3
    ... (one per voice)
```
