# Impeccable

Design vocabulary for AI coding agents, for UI / frontend work — https://impeccable.style
(source: https://github.com/pbakaus/impeccable, by Paul Bakaus)

Provides `PRODUCT.md` / `DESIGN.md` context files, design commands (`shape`,
`critique`, `audit`, `typeset`, `layout`, `polish`, `distill`, `harden`, ...),
a design hook that checks UI edits, and an "AI slop" detector usable in CI.

## Install

```bash
./tools/impeccable/install.sh ~/code/my-app            # npx impeccable install
./tools/impeccable/install.sh ~/code/my-app --shared   # npx skills add pbakaus/impeccable
```

Claude Code plugin alternative: `/plugin marketplace add pbakaus/impeccable`,
then install from `/plugin` → Discover.

## Set up (in the agent chat)

`/impeccable init`, then `/impeccable hooks on` (approve the hooks in your tool).

## Update

`npx impeccable update` or `npx skills update impeccable`.
