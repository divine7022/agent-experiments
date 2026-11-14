# plan

status: APPROVED 2026-11-14 ("setup everything i have said"). Decisions: D1 push private first, going public is a separate go. D2 redraw and credit. D3 skip the plugin. D4 private repo, cloned on the laptop. Text below is the plan as proposed; agent names and local paths are replaced by role names.

## goal

Stop writing one-off prompts and start shaping the work as graphs: audit my agent system with the four shapes (chain, diamond, branch, loop), fix what the audit finds, keep what I learn in a second brain I can browse in Obsidian, and publish the experiment the way a colleague publishes his: prompt, plan, results, one page.

## already done (read only, or new files in my own space)

- `PROMPT.md`: the opening message, word for word.
- `GRAPH_AUDIT.md`: the system drawn as a graph, wait test on every edge, diamond and branch candidates, every loop and its missing cap.
- A seed vault at a private folder (raw sources, wiki notes, index, log, schema).
- Looked inside the BuildPartner plugin without installing it.

## what i picked and why

1. **Vault is a plain folder in the Karpathy layout, Obsidian is only the viewer.** `raw/` holds sources and is never edited, `wiki/` holds linked notes the agent maintains, `index.md` is the catalog, `log.md` is append only. No database, no memory product, no MCP server. Reason: the practitioner survey found plain markdown is what the serious people use, and a folder works on the cluster where Obsidian cannot run.
2. **Vault is private and separate from the published experiment.** It holds colleagues' names, project internals and my own notes. The public page gets only what is written for it.
3. **Build `/improve-system` and `/verification-loop` myself instead of installing the plugin.** The plugin signs in to an account, runs an MCP server pulled from npm at start, adds six hooks to every session, uploads usage events, and its CLAUDE.md block routes any non-code question to its paid skill. Its two useful ideas are a branch skill and a loop skill, which are a page of markdown each.
4. **Fix the pipeline in the order the audit ranks it:** caps on the two uncapped loops first (cheap, removes a real risk), then the stage 1 and final-review diamonds, then the `/review` and `/voice` routers.
5. **Redraw the figures.** The four shapes are generic graph diagrams; I draw my own SVGs in one style and credit the video with a link. His frames stay in the private vault as a source.
6. **One experiment per folder, his file set:** `README.md`, `PROMPT.md`, `PLAN.md`, results, and a built page with a footer that says how it was made.

## decisions i need from you

**D1. Public repo and rule 2.** My colleague's layout shows the prompts and says an agent did the work. Your rule 2 says nothing that leaves the machine may show that. These cannot both hold for this repo. My recommendation: make this one repo an explicit, named exception under your personal account, keep rule 2 everywhere else, and scrub the page of project internals and colleagues' names (the agent names `science-critic` and the reviewer panel would be renamed or described by role). The alternative is a private repo with no public page.

**D2. Figures.** Redraw and credit (recommended), or publish his screenshots as they are. The second is his copyrighted material on your public page.

**D3. Plugin.** Skip it (recommended) or install it anyway. The one-time install code in your message has not been used or sent anywhere.

**D4. How the vault reaches your Mac.** A private GitHub repo you clone on the Mac and open in Obsidian (recommended), or keep it on the cluster only and read it in the editor. Either way I push nothing until you say push.

## steps, after approval

1. Loop caps: `self-validator` 3 passes, voice rewrites 2 passes with a grep check, `test-gate.sh` blocks once. Edits to three skill files and one hook; diff shown first.
2. Pipeline diamonds: stage 1 fans out researchers by angle with the planner sweep alongside; stage 6 and 7 run together with `style-reviewer` joined in; a claim-check stage fans out `source-verifier`. Each fan-out brief gets a "not your job" line and the merge reports how many workers answered.
3. `/verification-loop` skill: work, check, feedback, repeat, hard cap, with four check types (tests or dry run, source check, tell check, doc review).
4. `/improve-system` skill, four routes: graph audit, correction to rule or hook, session history mining, memory consolidation.
5. `/review` and `/voice` routers over the existing skills. The existing skills stay; the routers only pick.
6. Vault: ingest the workflow audit and the tool survey properly, mirror the 85 memory files in as a read-only folder (they already use `[[links]]`), add an ingest skill and a lint pass.
7. Figures: four shape SVGs plus before and after drawings of my pipeline.
8. Page and repo: `README.md`, a static page built from the markdown, a GitHub Pages workflow with pinned actions and no CI re-runs, depending on D1.
9. Check: run the pipeline once on a small real task before and after, compare wall time and agent count; red team the audit claims against the skill files.

## what done looks like

- Every loop in the system has a number on it.
- One real task runs through the changed pipeline and the before and after numbers are in the results.
- The vault opens in Obsidian on the Mac and the graph view shows the notes linked.
- The repo has prompt, plan, results and a page, and I have read every file in it before it is pushed.

## not doing

- No n8n, no memory database, no downloaded skill packs.
- No fan-out inside the one-shot `pr-reviewer` agent.
- No merge of the three R style skills until they are read in full.
- No commit, push, repo creation or Pages publish without an explicit go.
