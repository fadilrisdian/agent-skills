# Writing reference guides

Reference documentation exists to state facts about a system, accurately and completely, so a working user can trust it as ground truth. It is *consulted*, not read start-to-finish. Think of it the way you'd think of a map, a nutrition label, or an API spec: neutral, structured, and indifferent to what the reader intends to do with the information.

## The defining discipline: describe, and only describe

This is harder than it sounds, because plain neutral description isn't how people naturally write. The instinct is always to explain, justify, warn colorfully, or add a helpful tip — all of which are valuable, but none of which belong here. Every time that instinct fires while writing reference material, treat it as a signal to link out to an explanation or how-to guide instead of inlining it.

Reference material makes no assumptions about the reader's purpose. The same API reference page should serve someone building a dashboard and someone doing a security audit equally well — it doesn't take sides or anticipate a use case.

## Principles to apply

**Be austere.** No opinions, no "you might want to," no storytelling. State what is true.

**Be structurally consistent.** Reference is only useful if readers can predict where to find things. Pick a pattern (for a given kind of entity — endpoint, class, config key, CLI flag) and apply it identically everywhere. Don't get creative with structure here; save creative writing for explanation.

**Mirror the shape of the thing being described.** If the underlying system has a hierarchy (module → class → method, or resource → sub-resource → field), the documentation's structure should reflect that hierarchy directly. This isn't about forcing an artificial structure — it's about not fighting the system's actual shape, since doing so is what makes gaps and inconsistencies in the docs (and sometimes in the system itself) become visible.

**Use examples as illustration, not instruction.** A short example of a command or call is a legitimate, valuable part of reference material — it clarifies usage without drifting into "how to accomplish X," which belongs in a how-to guide. Keep examples minimal and representative, not narrated.

**State facts, list exhaustively, and flag hard constraints plainly.** Reference content typically takes the form of: factual statements about behavior; enumerations (commands, flags, endpoints, error codes, limits); and clear warnings where something is required, forbidden, or dangerous ("you must...", "never...", "not permitted unless...").

**Don't rely solely on auto-generation.** Auto-generated reference (e.g., from docstrings or an OpenAPI spec) is valuable because it stays accurate to the code, but it is rarely sufficient on its own — it typically lacks the organizing structure, cross-links, and illustrative examples a human reader needs.

## Characteristic language

- Flat factual statements: "X is available as `some.module.CONSTANT`, defined in `path/to/file`."
- Enumeration: "Available sub-commands are: a, b, c, d."
- Plain constraint statements: "You must use A. You must not apply B unless C is true. Never do D."

## What NOT to do

- Don't explain *why* something works the way it does — link to explanation.
- Don't show *how to accomplish a task* using the described feature — link to a how-to guide.
- Don't editorialize ("this is the recommended approach," "most users prefer...") — that's an opinion, which belongs in explanation.
- Don't let structure drift from the system it documents just because a different arrangement reads more smoothly — accurate structure beats prose flow here.
- Don't treat exhaustive auto-generated output as a finished reference section without adding the human organizing layer (grouping, examples, cross-links).
