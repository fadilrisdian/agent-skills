# OpenSpec

Spec-driven development workflow for AI coding agents — https://openspec.dev

OpenSpec is a CLI, not a single skill file: `openspec init` generates the
slash commands/skills for whichever agents you choose (Claude Code, Codex,
Cursor, Copilot, Gemini CLI, ...) inside the target project.

## Install

```bash
./tools/openspec/install.sh                 # CLI only
./tools/openspec/install.sh ~/code/my-app   # CLI + `openspec init` in a project
```

Manual: `npm install -g @fission-ai/openspec@latest` (Node.js >= 22.12.0).

## Use

Inside a project: `openspec init`, then `/opsx:explore`, `/opsx:propose`,
`/opsx:apply`, `/opsx:verify`, `/opsx:archive`. Run `openspec update` to
refresh generated guidance after upgrading.
