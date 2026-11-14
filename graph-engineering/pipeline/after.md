---
name: agent-pipeline
description: The standing multi-agent pipeline for every real task -- lead writes the work order, research and plan sweep fanned out together, guide check on the plan, code, dry run, capped self-validation loop, a review fan-out (science, maintainer, red team, R style), then one recommended next step. Use at the start of any substantive task (analysis, calibration/SA pass, pipeline change, doc for the team), or when the user says "pipeline", "full pass", or "do this properly". Skip for trivial mechanical edits.
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
| scientific programmer (library craft + workflow skeleton) | `programmer` (writes) + `style-reviewer` (R style review) |
| lead + guide (work order first, then how an expert colleague would do this) | `lead` |
| maintainer review  | `maintainer-reviewer` |
| dry-run / smoke-test | `dry-run-verifier` |
| self-validation loop | `self-validator` |
| critique agent  | `science-critic` |
| red team | `red-team` |
| read-only exploration / spec | `planner` |
| claim vs authoritative source | `source-verifier` |
| run record after production | `provenance` |

## the stages, in order

gates are hard: do not start a later stage on work that failed an earlier one. report at each gate.

0. **lead** -- `lead` in lead mode gets the goal in the user's words plus the paths of what
   exists and returns the work order: end state, steps, owners, what runs together, the check for
   each, one bigger move, and at most one decision for the user. the orchestrator then runs the
   whole order through the stages below without checking in; it stops only for a commit, push,
   post, publish, or delete. the plan review his method asks for is the work order itself: show it
   to the user in a few lines at the top, then start; the user redirects if they disagree. when a stage ends and the next move is unclear, ask `lead`, not
   the user.
1. **research + sweep (fan out)** -- in ONE message: `researcher` (one per angle when the question
   has more than one: mechanism, method, published value, tool docs), `domain-scientist` when the task
   touches process behavior, priors, magnitudes, or treatment effects, and `planner` sweeping the
   code/data end to end. the planner does not need the research result, so it does not wait for it.
   every brief says what the other workers cover ("not your job: ..."). skip the researchers only
   when the task touches no science, method, or published value.
2. **plan (merge)** -- the orchestrator reconciles the sweep with the research into one short spec
   with the single recommended approach, and says how many workers reported and which did not.
   then `lead` reads the spec: problem stated, script vs function vs package, stage, prior art,
   dependency weight. at most three notes. apply them or say why not.
3. **implement** -- `programmer` writes to the spec and states which standard it picked
   (library or long numerical workflow). for non-code deliverables (docs, configs, event files)
   the orchestrator writes, same standard.
4. **prove** -- `dry-run-verifier` computes the smallest representative case against the
   authoritative reference before any production run or final output.
5. **validate (loop, max 3 passes)** -- `self-validator` enumerates and computes the edge cases;
   fixes go back to `programmer`; the full list re-runs. stop when a pass is clean. after a
   failing third pass, stop anyway and report the remaining failures as characterized.
6. **review (fan out)** -- in ONE message, on the same artifact: `science-critic` (simplest thing,
   provenance, units, honest uncertainty), `maintainer-reviewer` (maintainer seat: is it needed, what
   already guarantees it, scope, can a reader follow it), `red-team` (fresh context, tries
   to break it), and `style-reviewer` when there is an R diff. for a claim-heavy deliverable also
   one `source-verifier` per load-bearing claim. none of them edits.
7. **merge + fix (max 2 rounds)** -- the orchestrator merges the reviews into one list, states
   which reviewers reported, drops duplicates, and resolves conflicts out loud (the maintainer reviewer asking to
   delete a check vs red team asking to add one: keep it only if the failure would be silent;
   a style finding that contradicts the standard `programmer` declared for the file, library
   or long numerical workflow, is dropped). fixes go to `programmer`. after a fix round,
   re-run `dry-run-verifier` on the changed code, then only the reviewers whose findings were
   acted on. after two rounds, stop and report what is still open.
8. **deliver** -- one outcome-first summary, what was verified vs not, and the single recommended
   next step, plus one `lead` line on what to learn from this task. `provenance` writes the
   RUN_RECORD as soon as a production run finishes; it does not wait for review. user decides.

## parallelism and cost

- stage 1 and stage 6 are fan-outs: all workers launch in one message.
- a fan-out that loses a worker still returns something, so every merge names who reported.
- every loop has a number: validation 3 passes, review fixes 2 rounds.
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
