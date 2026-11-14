# results

2026-11-14. Counts, not timings. Each row says where to recount it. Nothing was timed; see "not run".

`pipeline/before.md` and `pipeline/after.md` are the pipeline definition before and after, with agent names replaced by role names.

## the pipeline, before and after

| | before | after | recount from |
|---|---|---|---|
| numbered stages | 8 | 9 | `grep -cE "^[0-9]+\. \*\*" pipeline/*.md` |
| fan-outs | 1 (two research workers) | 2 (research with the planner joined in; final review) | "one message" in the stage text |
| waits removed | | 3: the planner on research, the red team on the critique, the run record on review | stages 1, 6 and 8 of `after.md` against 1, 2, 6, 7, 8 of `before.md` |
| readers at final review | 2, as two stages | 3 together, plus a style reviewer on an R diff, plus one source checker per claim | stage 6 of `after.md` |
| agents in the role map that no stage calls | 2 | 0 | `GRAPH_AUDIT.md` section 1 |
| loops the audit found, with a cap | 0 of 4 | 3 of 4 | `GRAPH_AUDIT.md` section 4, table below |
| routers | 0 | 4, with 4, 4, 5 and 3 routes | the skills are in my setup, not in this repo |

## loops

| loop | before | after |
|---|---|---|
| validate and fix | until clean | 3 passes, then stop and report |
| "does this read as hand written" rewrite (3 skills) | "keep going" on a judgment | 2 rewrites, ended by a grep whose exit status is the check |
| stop hook on failing tests | would block every time. It was never switched on, so it never looped. | blocks once. Checked: exits 0 when the turn is already continuing; exits 2 otherwise when the tests fail (tested with a stub test command that fails). Still not switched on. |
| edit hook that flags typography on every save | no cap | unchanged. The audit asked for a per-file opt-out for verbatim sources; not built. |

One new loop came with the review fan-out: review, fix, review again. It is capped at 2 rounds.

## added

- A lead step at the front. It returns a work order: end state, steps, owner, what runs together, the check for each. The three-note plan check stays where it was. This repo was built from the first work order.
- Four routers: a verification loop (four checks, each capped), a system-improvement router (four routes), a review router (five), a voice router (three).

## what review caught

A maintainer-seat read of the new skills found the grep check exits 2 with no output under a C locale, which would have read as a pass, and that it missed the capitalised trailer it exists to catch. A red team read of this file found the first version of the table above counted stages where it should have counted edges, and called a hook "capped" that was never registered. Both are fixed here.

## not run

- No wall time or agent count from real runs. The work order asked for 3 runs per arm on one small task; i did not spend them. The tables say the graph changed shape, not that it got faster.
- The new pipeline has not yet carried a real task end to end.
- The four routers have been written and reviewed, not exercised.
- `pipeline_after.svg` simplifies the review-fix loop: it draws the arrow back to the programmer; the definition reruns the dry run and then only the reviewers whose findings were acted on.
