# figures

Original redraws for the graph engineering page. Screenshots are frames from the source video (https://www.youtube.com/watch?v=5nB8Rs4l0_M) and were used only as reference for what each figure explains; layout, wording and styling here are our own. Screenshot names are shortened to their timestamp ("Screenshot 2026-11-14 at <time> PM.png").

All files: viewBox width 960, stroke width 2, ink is `currentColor`, accent `#2a7ad1`, warn `#c9571a`, no background. Inline the SVG (or set `color` on it) so ink follows the page theme.

| file | caption | screenshot(s) | what the screenshot showed |
|---|---|---|---|
| fig01_chain.svg | Chain: each step waits for the result of the one before it. | 10.59.18 | Card "1 chain": three circles A, B, C joined by arrows, tagged as the shape you already use by default. |
| fig02_diamond.svg | Diamond: one step splits the work across independent workers, another merges what they return. | 10.59.27 | Card "2 diamond": a dashed "n?" node fanning out to three circles that converge on a dashed "synth" node, tagged as good for multi-threading tasks. |
| fig03_branch.svg | Branch: a router reads the request and takes exactly one route. | 10.34.41, 11.00.08 | Two versions of the branch card: "in" node, a dashed diamond "route", one solid arrow and two dashed arrows to three targets. Text: one in, several possible outs, exactly one taken; good for skill routing and simplifying a system. |
| fig04_loop.svg | Loop: work, check, and send the failure back until the check passes. | 10.43.57 | Card "loop (until done)": "work" node, a dashed "again?" diamond with a "yes" edge pointing backward and a "no" edge to "done". |
| fig05_isolated_context.svg | Each worker runs in its own context and cannot see what the others are doing. | 11.03.49 | Text slide "sub-agents": each has its own context and does not know what the other one is doing. No diagram. |
| fig06_fanout_failures.svg | Two ways a fan-out goes wrong: workers that overlap do the same work twice, and a worker that returns nothing does not stop the merge. | 11.04.42 | Text slide on tasks that are not really independent: duplicated work that burns budget or misses context, and silent failures where the graph does not break when one worker fails; advice to fan out where cost of error is low. No diagram. |
| fig07_branch_limit.svg | Keep a router to five routes or fewer; a sixth is the cue to simplify or split. | 11.05.49 | Text slide "the general rule of thumb": no more than five branches, above that ask whether to simplify or break the skill up. No diagram. |
| fig08_loop_cap.svg | A capped loop: after the last allowed try it stops and reports instead of running on. | 11.06.57 | A prompt box titled "audit any loops you have": check every loop for a maximum number of iterations, add a limit where missing, list the loops and caps. No diagram. |
| fig09_four_shapes.svg | The four shapes side by side: chain, diamond, branch, loop. | 11.08.18 | Text slide defining graph engineering as arranging the agent work in the structure that best fits the problem. No diagram. |
| pipeline_before.svg | The pipeline before the audit: one long chain, two workers feeding the planner, and a fix loop with no cap. | none (GRAPH_AUDIT.md) | n/a |
| pipeline_after.svg | The pipeline after: a lead step first, a research and planning fan-out, a validation loop capped at 3 passes, a review fan-out, and review fixes capped at 2 rounds. | none (pipeline definition after the audit) | n/a |
