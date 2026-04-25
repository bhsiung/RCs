# Bear-helper Sophia Migration — Benchmark Report

**Date**: 2026-04-25
**Method**: 5 representative prompts × 3 modes, single sequential pass each, model `haiku`, `--no-session-persistence` to ensure isolation.

## Test Setup

5 prompts (see `bench/prompts.txt`):
1. **Plan discipline** — "幫我把 photo crop UI 改成支援多選。先給我 plan 不要直接寫 code。"
2. **Persona** — "為什麼我的 React useEffect 不會 trigger？我 dependency 都加了。"
3. **Delegation** — "我剛改完一段 auth flow，幫我 review 一下。先看 token expiry 那塊。"
4. **Vague intent** — "fix this bug"
5. **Explanation** — "解釋一下 useMemo 跟 useCallback 差在哪"

Three modes compared:
- **before** — original 52-line CLAUDE.md, all `bear-helper:*` skills active
- **after-naked** — caveman 11-line CLAUDE.md, agents replace skills (`claude` without `--agent`)
- **after-yolo** — caveman CLAUDE.md + `--agent bear-helper:Sophia:AGENT`

## Memory (token usage per call)

Total context = `input_tokens + cache_creation + cache_read`. Lower is better.

| File | before | after-naked | after-yolo |
|------|--------|-------------|------------|
| 01 | 100,463 | 101,015 | 54,672 |
| 02 | 32,776 | 32,875 | 12,941 |
| 03 | 32,783 | 66,206 | 12,948 |
| 04 | 32,755 | 32,854 | 12,920 |
| 05 | 32,772 | 32,871 | 12,937 |
| **avg** | **46,310** | **53,164** | **21,284** |
| **vs before** | — | **+15%** ❌ | **−54%** ✅ |

System-prompt-only (cache_creation, ignoring cache_read):

| Mode | avg system tokens |
|------|-------------------|
| before | 7,698 |
| after-naked | 12,531 (run 01 cache-cold spike skews it) |
| after-yolo | 3,954 |

### Key insight

- **CLAUDE.md shrink alone (52 → 11 lines) saved ~600 tokens — barely 1% of total context.** Most context is the CLI's default system prompt (tool definitions, MCP servers, skill discovery, etc.), not user CLAUDE.md.
- **The real win is `--agent` mode**, which replaces the default system prompt with Sophia's lean prompt.
- After-naked actually went up slightly (~15%) — caveman CLAUDE.md alone doesn't help and benchmark variance is dominated by which run hit the 1h cache.

## Cost (USD per call, haiku)

| Mode | avg cost |
|------|----------|
| before | $0.0176 |
| after-naked | $0.0226 (+28%) |
| after-yolo | **$0.0104 (−41%)** |

## Output verbosity (output_tokens avg)

| Mode | avg output |
|------|-----------|
| before | 742 |
| after-naked | 492 |
| after-yolo | 655 |

Yolo stays expressive (persona requires Murakami-style storytelling) without being over-long.

## Quality scoring (qualitative, 1–5 each)

| Dimension | before | after-naked | after-yolo |
|-----------|--------|-------------|------------|
| Plan discipline (asks before doing) | 4 | 4 | **5** |
| Persona (繁中, Taiwanese tone, Murakami analogy) | 5 | 2 ❌ | **5** |
| Conciseness | 3 | 4 | **4** |
| Delegation hints | n/a | n/a | n/a* |
| Overall feel | 4 | 2.5 | **4.5** |

*Delegation not testable here — all 5 prompts were Plan-phase requests (needed more info), so Sophia never actually spawned a worker. Verify in Phase 9 manual test.

Sample comparison on prompt 5 ("解釋 useMemo vs useCallback")
- **before**: "想像妳每天早上要做決定..." (Murakami analogy ✅)
- **after-naked**: dry technical explanation ❌ (persona stripped)
- **after-yolo**: "想像一下你在做便當生意 🍱" (Murakami analogy ✅, persona intact)

## Verdict

| Exit criterion | Result |
|----------------|--------|
| Memory: yolo total tokens ≤ before | ✅ −54% |
| Memory: caveman naked ≤ before | ❌ ~+15% (but acceptable — naked mode is a fallback, not the primary path) |
| Quality: yolo ≥ before | ✅ persona retained, Plan discipline tighter |
| Cost: yolo cheaper | ✅ −41% |

**PASS for the primary `yolo` workflow.** The migration achieves its goals when used as intended (`yolo` for orchestration). The caveman-CLAUDE.md savings on its own are negligible — the architectural win is moving the orchestration prompt into a plugin agent and triggering it via `--agent`.

## Caveats

- Benchmark used `haiku` for cost/speed; absolute numbers differ from default opus, but relative deltas should hold.
- Run 01 in each mode hits cache-cold; runs 02–05 benefit from cache reuse. Bench preserves this same pattern across modes.
- "Persona" and "Plan discipline" scoring is qualitative — see raw `*.json` files for full responses.
- Delegation behavior (Sophia spawning Alex/Kyle/Dev) was not exercised by these 5 prompts. Manual test in Phase 9.
