# diagram-design

Agent skill that creates diagrams as a single self-contained HTML file with inline SVG
(45 diagram types, light/dark/editorial variants; can match brand colors and redraw
draw.io, Mermaid and Excalidraw files). MIT licensed.
Source: https://github.com/cathrynlavery/diagram-design

## Install

```bash
./tools/diagram-design/install.sh ~/code/my-app   # npx skills add cathrynlavery/diagram-design
```

Other hosts:

- Claude Code: `/plugin marketplace add cathrynlavery/diagram-design` then
  `/plugin install diagram-design@diagram-design`
- Codex: `codex plugin marketplace add cathrynlavery/diagram-design` then
  `codex plugin add diagram-design@diagram-design`
- GitHub Copilot: `copilot plugin marketplace add cathrynlavery/diagram-design` then
  `copilot plugin install diagram-design@diagram-design`
- Pi: `pi install https://github.com/cathrynlavery/diagram-design`
- Kiro: import `https://github.com/cathrynlavery/diagram-design/tree/main/skills/diagram-design`
- OpenCode: copy/symlink `skills/diagram-design/` into its skills directory
