# Resolving the two classic conflations

Two mix-ups account for most of the confusion in real documentation. Use this file when you're not sure which quadrant a piece of content belongs to.

## Tutorial vs. how-to guide (the most common conflation)

Both are practical and both walk the reader through ordered steps, which is exactly why they get merged so often — and why doing so causes real damage: a document that tries to be both ends up serving neither the learner nor the working practitioner well.

The distinction comes down entirely to *whose need is being served* — study, or work:

| | Tutorial (study) | How-to guide (work) |
|---|---|---|
| purpose | help the reader acquire basic competence | help an already-competent reader complete a task |
| responsibility | falls on the writer (like a teacher) | falls on the reader (like a professional using a manual) |
| path | one single, fixed, carefully managed path | can fork, branch, have multiple entry/exit points |
| setting | contrived — the environment is set up to guarantee success | the real world, with all its variability |
| safety | must be totally safe; reader can always restart | can't promise safety; sometimes there's only one shot |
| knowledge assumed | reader may not even know what questions to ask yet | reader is assumed to already be asking the right questions |
| explicitness | spells out embodied/basic details (where to click, how to type it) | assumes this is already implicit knowledge |
| scope | concrete and particular — one specific worked example | general — has to work across many real cases |

**A trap to avoid**: don't equate this with "basic vs. advanced." A how-to guide can absolutely cover something simple and routine (e.g., a checklist for a mundane administrative task). A tutorial can cover something advanced (e.g., a specialized workshop for experienced practitioners learning a new, hard skill). Complexity is orthogonal to this distinction — what matters is only: is this reader currently studying, or currently working?

**Quick test**: if you deleted this document, would the reader be unable to *learn* the underlying skill (tutorial), or just unable to complete *this specific task* today, despite already having the skill (how-to guide)?

## Reference vs. explanation

Both belong to the "cognition" side of the map — neither one gives the reader steps to follow, both are propositional/theoretical knowledge. The distinction is again about study vs. work:

- **Reference** is what a working reader needs *while* doing something — often literally open in a second tab as they work.
- **Explanation** is what a reader turns to once they've *stepped away* from the task, to understand it better.

Rules of thumb that resolve most ambiguous cases:
- If it's dry, list-like, and something you'd consult rather than read — it's reference.
- If you could imagine someone reading it away from their desk, purely out of interest — it's explanation.
- Ask: "would someone reach for this mid-task, or only when reflecting on the topic afterward?"

**Where it goes wrong in practice**: reference material that starts as a clean list of facts often *drifts* into explanation as the writer adds "and here's why this matters" asides or expansive examples that start explaining *how it came to be* rather than just *what it is*. This is natural (the material is often genuinely interesting) but it should be caught and split out — leave the reference page purely factual, and give the "why" its own explanation page, linked from the reference.

If intuition alone doesn't resolve a case, fall back to the compass in `SKILL.md`: does this content inform action or cognition, and does it serve acquisition or application? The answer is decisive even when the surface genre feels blurry.
