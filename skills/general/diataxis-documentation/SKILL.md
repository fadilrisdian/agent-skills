---
name: diataxis-documentation
description: Guides the writing, structuring, auditing, and reorganizing of technical documentation using the Diátaxis framework (tutorials, how-to guides, reference, explanation). Use this skill whenever the user asks to write or improve a tutorial, how-to guide, walkthrough, quickstart, getting-started guide, API reference, technical reference, README, user guide, developer docs, help docs, knowledge-base article, or conceptual/explainer doc — even if they don't name Diátaxis explicitly. Also use it when the user asks how to organize a documentation site or repo, wants feedback on existing docs, is unsure what "kind" of doc something should be, mentions mixing up tutorials and how-to guides, or explicitly mentions "Diátaxis," "the four documentation types," or "docs architecture."
---

# Diátaxis documentation framework

Diátaxis is a system for thinking about technical documentation, created by Daniele Procida and documented at [diataxis.fr](https://diataxis.fr/). This skill distills that framework into practical guidance for writing, classifying, and structuring documentation. When citing or crediting the framework to the user, point them to diataxis.fr rather than reproducing its text.

## The core idea

Documentation users are always in one of two relationships to a subject: they are **studying** it (trying to acquire skill or knowledge) or **working** with it (trying to apply skill or knowledge they already have). Separately, what they need is either about **action** (what to do) or **cognition** (what to know).

Crossing those two axes produces exactly four kinds of documentation, each answering a different kind of question:

| | serves **study** (acquisition) | serves **work** (application) |
|---|---|---|
| **about action** (doing) | **Tutorial** — "Can you teach me to...?" | **How-to guide** — "How do I...?" |
| **about cognition** (knowing) | **Explanation** — "Why...?" | **Reference** — "What is...?" |

This is the single most important idea in the framework: **the same piece of content needs completely different treatment depending on whether the reader is studying or working, and whether they need to act or to know.** Most documentation problems — a tutorial that reads like a manual, a reference page full of tips, a "how-to" that's really a lesson — come from blurring this distinction.

Diátaxis is not a filing scheme to impose on day one. It's a diagnostic tool you return to constantly: for any piece of content, ask which quadrant it belongs to, then write (or rewrite) it according to that quadrant's rules.

## Step 1: Classify before writing — use the compass

Before drafting or editing anything, work out which of the four quadrants it belongs in. Ask two questions:

1. **Does this inform action or cognition?** — is the reader going to *do* something with it, or *know/understand* something from it?
2. **Does this serve acquisition or application?** — is the reader *learning* (building a skill for the first time) or *working* (applying a skill they already have)?

| informs... | serves... | → | belongs in |
|---|---|---|---|
| action | acquisition | | **tutorial** |
| action | application | | **how-to guide** |
| cognition | application | | **reference** |
| cognition | acquisition | | **explanation** |

Apply this at any scale — to a whole document, a section, or a single paragraph. If a paragraph inside a how-to guide is actually explaining *why* rather than directing *what to do next*, it's explanation that has leaked into the wrong quadrant, and belongs elsewhere (or, at most, a one-line gesture toward it with a link out).

When the classification feels ambiguous, two rules of thumb resolve most cases:
- **Tutorial vs. how-to guide**: would a complete beginner need a teacher present for this, with guaranteed success and no real choices (tutorial)? Or does it assume the reader is already competent and just needs directions for a real-world task, forks and all (how-to guide)? See `references/distinguishing-guide.md` for the full comparison — this is the single most common conflation in software docs.
- **Reference vs. explanation**: would someone read this *while* doing the task (reference), or only *away* from the keyboard, reflecting on the topic (explanation)? If it's boring, lists-y, and consultable, it's reference. If you can imagine reading it in the bath, it's explanation.

## Step 2: Write according to the quadrant's rules

Each of the four types has its own purpose, tone, structure, and characteristic language. Load the matching reference file before drafting substantial content of that type — each one covers the writing principles, common failure modes, and example phrasing in more depth than fits here:

- **`references/tutorials.md`** — learning-oriented lessons. Read this before writing a getting-started guide, onboarding walkthrough, or "build your first X" tutorial.
- **`references/how-to-guides.md`** — goal-oriented directions. Read this before writing task guides, cookbooks, "how to configure/deploy/troubleshoot X" content.
- **`references/reference-guides.md`** — information-oriented technical description. Read this before writing API references, config option listings, CLI references, schemas.
- **`references/explanation.md`** — understanding-oriented discussion. Read this before writing conceptual guides, architecture overviews, design-decision write-ups, "why does X work this way" articles.

A fast summary of each, if you just need the gist:

| | Tutorial | How-to guide | Reference | Explanation |
|---|---|---|---|---|
| does | teaches, leads | guides | states, describes | clarifies, discusses |
| answers | "Teach me to...?" | "How do I...?" | "What is...?" | "Why...?" |
| oriented to | learning | a goal | information | understanding |
| form | a lesson | a series of steps | dry, structured description | discursive prose |
| analogy | teaching a child to cook | a recipe | nutrition label | a book on food history |
| tone | encouraging, first-person plural ("we'll...") | imperative, conditional ("if you want x, do y") | neutral, factual, no opinions | reflective, can include opinion and alternatives |
| avoid | explaining *why*; offering choices | teaching; exhaustive completeness | instructing; interpreting | step-by-step instructions; exhaustive fact-listing |

**Never mix modes within one document.** A tutorial that stops to fully explain a concept breaks the learner's flow — give a one-sentence gesture and link to the explanation instead. A reference page that starts justifying design decisions has stopped being reference — move that content to explanation and link to it. This discipline is the main lever Diátaxis gives you for improving existing docs.

## Step 3: Structuring a documentation set

Default architecture — four top-level sections, each with its own landing page that briefly introduces its contents (not just a bare list):

```
Tutorials/          <- landing page + numbered lessons
How-to guides/       <- landing page, grouped by task area
Reference/           <- landing page, mirrors the structure of the actual system/API
Explanation/         <- landing page, topic-based articles
```

Don't create these four empty folders on day one and feel obliged to fill them — that produces hollow, padded documentation. Instead, build structure from the inside out: improve or add one piece of content at a time, classified correctly, and let the four-part structure emerge once enough content naturally belongs somewhere. See `references/structuring-docs.md` for handling larger or more complex sites (deep hierarchies, multiple audiences/platforms, contents-page design, list-length limits).

When asked to **audit or reorganize** an existing set of docs, work through it piece by piece rather than proposing a full top-down restructure: pick a page or section, classify it against the compass, flag where it's blurring two modes (e.g., a "how-to" that's secretly a tutorial, or reference riddled with tips and opinions), and recommend the smallest change that fixes it. Small, continuous correction is how Diátaxis is meant to be applied — not a big-bang rewrite. See `references/structuring-docs.md` for the underlying workflow philosophy and the functional-quality/deep-quality distinction it's built on.

## Quick checklist before delivering documentation content

- [ ] Every section is classifiable into exactly one of the four quadrants
- [ ] Tutorials contain no unlinked digressions into explanation, no real choices/branches, and produce a visible result at every step
- [ ] How-to guides assume competence, stay focused on the goal, and don't pad themselves with reference-level completeness or tutorial-level teaching
- [ ] Reference material is neutral, consistently structured, and mirrors the shape of the thing it describes — no instructions, no opinions
- [ ] Explanation is allowed to discuss, connect ideas, and take a point of view — but contains no step-by-step instructions
- [ ] Titles say precisely what the content delivers (e.g. "How to configure X", not just "Configuring X")
