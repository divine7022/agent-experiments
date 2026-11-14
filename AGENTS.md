# rules for this repo

one folder per experiment. each experiment is a question i put to my agent setup, the plan i approved, and what came out.

## every experiment folder has

1. `README.md` -- the problem in two sentences, what was done, deviations from the plan.
2. `PROMPT.md` -- my opening message, word for word. edits are counted in the header.
3. `PLAN.md` -- the plan as approved, with the approval line and date on top.
4. `RESULTS.md` -- what changed, in numbers, each with where to recount it.
5. `figures/` -- drawn for this repo. no screenshots of other people's work.
6. `index.html` -- one static page with a footer saying how it was made.

## rules

- the prompt is never cleaned up. typos stay.
- a number in RESULTS.md says where to recount it. if the source is not in the repo, it says so.
- anything not run is listed as not run.
- role names only: no colleague names, no internal project names, no local paths.
- third party ideas are credited with a link; third party figures are redrawn, not copied.
- no CI. the page is static and built by hand with `build.sh`.
- nothing is published or made public without my explicit go.
- no site generator and no helper package until a second experiment needs one.
