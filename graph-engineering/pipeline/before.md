---
name: agent-pipeline
description: The standing multi-agent pipeline for every real task -- research, science framing, plan, code, dry run, self-validation loop, a reviewer, red team, then one recommended next step. Use at the start of any substantive task (analysis, calibration/SA pass, pipeline change, doc for the team), or when the user says "pipeline", "full pass", or "do this properly". Skip for trivial mechanical edits.
---

# agent pipeline

the everyday harness. one orchestrator (the main session) drives specialist subagents through fixed
gates so the work is researched, computed, validated, and critiqued before the user sees it. this
implements the target pipeline in my roadmap file.

## role -> agent map

| role the user asks for | agent to launch |
|---|---|
| web researcher | `researcher` |
| domain-scientist scientist | `domain-scientist` |
| coding agent (team standard) | `programmer` (writes) + `style-reviewer` (reviews) |
| dry-run / smoke-test | `dry-run-verifier` |
| self-validation loop | `self-validator` |
| critique agent  | `science-critic` |
| red team | `red-team` |
| read-only exploration / spec | `planner` |
| claim vs authoritative source | `source-verifier` |
| run record after production | `provenance` |

## the stages, in order

gates are hard: do not start a later stage on work that failed an earlier one. report at each gate.

1. **research** -- `researcher` (+ `domain-scientist` in parallel when the task touches process behavior,
   priors, magnitudes, or treatment effects). output: cited findings + the ecological read.
   skip only when the task touches no science, method, or published value.
2. **frame + plan** -- `planner` sweeps the code/data end to end and returns a short spec with the
   single recommended approach. the orchestrator reconciles it with stage 1 and decides.
3. **implement** -- `programmer` writes to the spec (loads `r-coding-style` + `r-dev`).
   for non-code deliverables (docs, configs, event files) the orchestrator writes, same standard.
4. **prove** -- `dry-run-verifier` computes the smallest representative case against the
   authoritative reference before any production run or final output.
5. **validate** -- `self-validator` enumerates and computes the edge cases, loops with fixes
   (fixes go back to `programmer`) until a full pass is clean or failures are characterized.
6. **critique** -- `science-critic` on the assembled deliverable: simplest-thing, provenance, units,
   honest uncertainty, technical-writing standard. apply its revisions.
7. **red team** -- `red-team`, fresh context, tries to break the final artifact.
   fix what it confirms; disagree explicitly where warranted.
8. **deliver** -- one outcome-first summary, what was verified vs not, and the single recommended
   next step. `provenance` writes the RUN_RECORD if a production run happened. user decides.

## parallelism and cost

- stages 1a/1b (researcher + domain-scientist) always launch together in one message.
- stage 6 and 7 can run in parallel when the deliverable is final-shaped; otherwise critique first.
- pass each agent only the context it needs (paths, the claim list, the spec) -- not the whole
  conversation. collect conclusions, not transcripts.

## when to skip

- trivial mechanical edits (typo, rename, one-line fix, a commit): no pipeline, just do it.
- read-only questions ("what does X contain"): open the source and answer; no agents needed
  unless the sweep is genuinely broad (then `planner` or Explore).
- mid-pipeline user steers replace stages, they do not append: if the user overrides the plan,
  restart from the stage the override touches.

## standing rules (bind every stage)

- never claim from memory -- every factual statement from a source opened now.
- no workarounds: root cause, standard conventional way, or stop and research.
- compute on compute nodes (`qsub` skill) for anything heavy; scratch to /scratch, cleaned up.
- zero AI fingerprint in anything that leaves the machine. no em-dash, use --.
- never commit/push/post without explicit approval. shared team data is read only.
