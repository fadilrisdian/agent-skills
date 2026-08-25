# Structuring documentation sets, and applying Diátaxis as a workflow

## Basic site structure

The default shape is four top-level sections, one per quadrant, each with a landing page:

```
Tutorials/
    landing page (overview + context)
    Lesson 1
    Lesson 2
How-to guides/
    landing page
    grouped by task area (e.g. Install, Deploy, Scale)
Reference/
    landing page
    mirrors the actual structure of the system (CLI, API, config, etc.)
Explanation/
    landing page
    topic-based articles
```

For larger products, it's fine to add another layer of hierarchy within a section (e.g., splitting "How-to guides > Install" into "Local installation," "Docker," "VM," "Container" sub-guides) rather than flattening everything into one long list.

### Landing pages are not just lists

A good landing page briefly *introduces* the material below it — a sentence or two of framing per group of links — rather than presenting a bare bullet list. This gives readers context before they commit to clicking through, and it's also where you get to show the shape of what the product can actually do.

### Keep lists short

Long, unordered lists are hard for humans to scan. As a rule of thumb, once a list of links exceeds roughly seven items, look for a natural way to group or subdivide it rather than leaving one long flat list.

## Handling complexity: multiple audiences or platforms

Real products sometimes need documentation split along another dimension entirely — different platforms (e.g. product used on different clouds), or different audiences (end users, integrators, contributors). This creates a genuine two-dimensional problem: does the platform/audience split go *above* the four Diátaxis categories, or *below* them?

There's no universal answer — the deciding question is always: how does the *user* actually experience the product? If a user on Platform A is very unlikely to ever need Platform B's docs, keep audience/platform as the top-level split, with the four Diátaxis categories nested inside each. If most content is genuinely shared and only a slice diverges, keep Diátaxis at the top level and fork only where necessary. Diátaxis doesn't mandate a single rigid tree — it mandates that *within* whatever tree you build, each piece of content stays disciplined to its quadrant.

## Diátaxis as an ongoing workflow, not a one-time reorg

This is the part people most often get wrong when first applying the framework: **don't treat it as a plan to execute** ("first we'll build out all four sections, then migrate everything"). Treat it as a lens you apply continuously.

The recommended way of working:

1. **Pick something** — whatever's in front of you: the page you're already looking at, the last thing a user complained about, or something chosen at random if nothing else presents itself. Don't go hunting for the single "most important" problem to fix first — that search itself becomes a way to avoid starting.
2. **Assess it** against the framework: what need does this content actually serve? What quadrant does it belong to? Is it currently blurring two quadrants together? Is its language and structure appropriate to that quadrant?
3. **Decide the smallest next improvement** — not a full rewrite, just the next correct step.
4. **Make that change and ship it** — publish or commit it, and consider that unit of work done.
5. **Repeat**, picking the next thing.

Explicitly avoid: creating four empty top-level folders before there's content to put in them; large batched rewrites held back until "everything" is ready; trying to plan the ideal end-state structure up front. The four-part structure is meant to *emerge* from a series of individually-correct small changes, not be imposed from above on day one. Documentation improved this way is always usable and coherent at every point along the way, even though it's never fully "finished" (much like a living, growing plant is never finished but is complete at every stage).

## Two kinds of quality (useful framing when giving feedback on docs)

When evaluating or giving feedback on documentation, it helps to separate two different kinds of quality:

- **Functional quality** — accuracy, completeness, consistency, correctness. This is objective and checkable: is the reference page actually correct? Are all the config options documented? Diátaxis doesn't hand you functional quality directly, but consistently applying it tends to *expose* functional gaps that were previously hidden (e.g., making reference material mirror the system's real structure tends to reveal undocumented parts of that structure).
- **Deep quality** — things like flow, anticipating the reader's needs, and simply feeling good to use. This is subjective, judged rather than measured, and is what separates documentation that's merely correct from documentation that's genuinely excellent. Diátaxis helps here by keeping each piece of content disciplined to one clear purpose, which is a large part of what makes documentation feel coherent and well-paced rather than cluttered.

Deep quality is only meaningful once functional quality is in place — beautifully-paced documentation that's factually wrong or incomplete isn't actually good documentation. When giving feedback, check functional quality first (is it correct and complete?), then deep quality (does it fit the reader's actual moment-to-moment needs?).
