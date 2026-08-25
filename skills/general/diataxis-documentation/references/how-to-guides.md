# Writing how-to guides

A how-to guide gives an already-competent reader directions to solve a real, specific problem or reach a specific goal. It serves *work*, not study. Unlike a tutorial, you're not responsible for the reader's learning or safety — you're responsible for getting them to a correct result efficiently.

## Define it by the user's goal, not by the tool

The most common failure in how-to guides is writing them from the perspective of the system rather than the person. "To shut off the water, turn the tap clockwise" and "To deploy the configuration, click Deploy" are not useful guidance — they just narrate the interface, which any competent user could already figure out. A real how-to guide answers a need the interface doesn't make obvious: *how much* to turn it and why, *which* configuration options actually match a given real-world situation.

Good test: could this guide's title be reworded as "How to accomplish [specific real-world outcome]"? If the content only walks through a tool's screens rather than serving that outcome, it's not yet a how-to guide.

Tools are incidental. A how-to guide should feel free to cut across multiple tools, commands, or parts of a system if that's what the underlying task actually requires — the task defines the boundaries, not the software's own module structure.

## Principles to apply

**Stay laser-focused on the goal.** No teaching, no full explanation, no reference-style completeness. If something needs explaining or fully documenting, link to explanation or reference rather than inlining it — a digression here is a failure of discipline, not generosity.

**Design for the real world, not a clean demo.** Real tasks branch, have edge cases, and don't always go in a strict line. Use conditional structure ("if X, do Y; otherwise do Z") rather than forcing everything into one linear script. It's fine — expected, even — for a how-to guide to fork, or to have multiple valid entry and exit points.

**Favor usability over completeness.** A how-to guide doesn't need to be a complete, self-contained journey the way a tutorial does. It's fine to start and end at a reasonable point and expect the reader to connect it to their own context.

**Give a real sequence of actions**, including points of judgment, not just literal clicks. "Actions" includes deciding and evaluating, not only typing commands.

**Order steps by logic, not convenience.** Sequence should follow real dependencies (step 2 requires step 1) or cognitive flow (doing A first sets up the reader's thinking for B), not just the order that was easiest to write.

**Optimize for flow.** Notice where you're forcing the reader to jump between tools or hold onto a half-finished thought for too long before resolving it — that's friction. The best how-to guides feel like they anticipate the reader's next need.

**Title precisely.** Say exactly what the guide shows, as a "how to" statement. "How to configure connection retry policies" is good. "Configuring retry policies" is ambiguous (could be *whether*, not *how*). Just "Retry policies" is worse still — could be anything. Precise titles also help readers (and search) find the guide at all.

## Characteristic language

- Direct statement of the problem being solved: "This guide shows you how to..."
- Conditional imperatives: "If you want X, do Y. To achieve W, do Z."
- Deliberate hand-off to other docs for anything outside scope: "See the reference guide for the full list of options" — rather than listing them all here.

## What NOT to do

- Don't narrate the obvious ("click the button labeled Save").
- Don't add a paragraph of background/rationale — one clause of context is the ceiling; link elsewhere for more.
- Don't try to cover every possible variation exhaustively — that's reference's job. Cover the realistic paths a working user will actually hit.
- Don't structure it as a strict, unbranching script if the real task genuinely has decision points — collapsing them creates a guide that quietly fails for anyone whose situation differs even slightly.
- Don't confuse "basic" with "tutorial" — a how-to guide can absolutely cover a simple, routine task (e.g., filling out a form correctly) as long as it's serving *work* rather than *learning*. See `distinguishing-guide.md`.
