# graph engineering my agent setup

My agent pipeline was mostly a chain: eight stages, one small fan-out, and loops that stopped "when clean". I wanted to know which of those waits were real and which loops could spin.

The idea and the four shapes (chain, diamond, branch, loop) are from Austin Marchese's video, [Stanford's Graph Method Explained: How to 10x Your Claude Productivity](https://www.youtube.com/watch?v=5nB8Rs4l0_M), which builds on a course by Andrew Ng. I ran his audit prompts on my own setup, fixed what they found, and wrote down what changed.

- [the page](https://divine7022.github.io/agent-experiments/graph-engineering/)
- [PROMPT.md](PROMPT.md): what i asked, word for word
- [PLAN.md](PLAN.md): the plan as approved
- [GRAPH_AUDIT.md](GRAPH_AUDIT.md): the audit, edge by edge
- [RESULTS.md](RESULTS.md): what changed, in counts
- `pipeline/`: the pipeline definition before and after

## what was done

1. Drew the system as nodes and edges and asked of every edge: does this step need the result of the one before it?
2. Turned two chains into fan-outs, with a "not your job" line in every brief and a merge that says who reported.
3. Put a number on three of the four loops the audit found, and on the one new loop.
4. Wrote four small routers so i stop picking reviewers and checks by hand.
5. Added a lead step at the front that writes the work order.

## deviations from the plan

- The plugin from the video was read and not installed. It signs in to an account and adds hooks to every session; its two useful ideas fit in a page each.
- Figures are redrawn for this repo, not screenshots.
- The notes vault from the plan is private and not part of this repo.
- No timed before and after run. Counts only.
