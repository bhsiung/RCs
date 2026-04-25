#!/usr/bin/env bash
# Run benchmark: 5 prompts × 1 mode, output JSON files.
# Usage: run_bench.sh <out_dir> [--agent <name>]
set -eo pipefail

OUT_DIR="$1"
shift
EXTRA_ARGS=("$@")

PROMPTS_FILE="/Users/bearhsiung/RCs/bear-helper/bench/prompts.txt"

mkdir -p "$OUT_DIR"

i=0
while IFS= read -r prompt; do
  i=$((i+1))
  [ -z "$prompt" ] && continue
  out="$OUT_DIR/0${i}.json"
  echo "[bench] $i -> $out"
  (cd /tmp && claude --print --output-format json --model haiku --no-session-persistence "${EXTRA_ARGS[@]}" "$prompt" < /dev/null > "$out")
done < "$PROMPTS_FILE"

echo "[bench] done."
