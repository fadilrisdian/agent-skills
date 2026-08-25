---
name: error-discovery
description: Run error analysis on a dataset. Build a review UI, select diverse samples, monitor annotations, and organize failure modes.
---

# Error Discovery Skill

This skill guides an interactive error analysis session for datasets (JSONL, CSV, JSON, etc.) of LLM outputs or traces, aimed at discovering failure modes through sample review.

The skill is split into two parts: this file covers phases 1–4 (read data, design UI, build it, select samples), while `review-loop.md` handles phase 5 (the interactive review session).

---

## Progress Updates

Keep the user informed at each step. Before starting a phase, explain what you're about to do and why. After finishing, summarize what was done and what's next.

---

## Phase 1: Understand the Domain and Data

### 1a: Read and Inventory the Data
Load the file and examine 5–10 records. For each record, identify all fields (types and meaning), which are primary content vs. metadata, and which fields vary across records vs. remain constant.

### 1b: Identify the Content Structure
Determine which pattern fits the data:
- Single text field (article, summary, email, translation)
- Input/output pair (prompt + completion, question + answer)
- Multi-turn trace (sequence of messages with roles: system, human, assistant, tool calls, tool results, thinking/reasoning blocks)
- Code (source files, patches, diffs)
- Structured output (JSON, function calls, extracted entities, classifications)
- Composite (task description + agent trace + final output)

For multi-turn traces, identify what roles exist, whether there are tool call/result pairs, whether there are thinking/reasoning blocks, and what the logical grouping of turns is.

### 1c: Identify Dimensions of Variation
Consider what differs **between** data points (metadata, structural features, outcome labels) and **within** each data point (author/role of segments, content type of segments, importance/relevance of segments).

### 1d: Think About What "Bad" Means
Sketch a few plausible failure categories for the domain. Expect the human reviewer to discover most of them during the actual review process.

---

## Phase 2: Design the Visual Encoding

Before writing code, design how every dimension of variation maps to a visual property.

### Core Gestalt Principles
- **Similarity** (color, shape): group related items visually — e.g., different message roles get different colors.
- **Proximity** (spacing): items in the same logical group are spaced close together; separate groups have more space.
- **Common region** (containers, backgrounds): items sharing a boundary are perceived as grouped — e.g., a tool call and its result share a container.
- **Figure/ground** (opacity, contrast): important content is high-contrast; less important content recedes.

### Visual Encoding Rules
Map each dimension to exactly one visual channel:

- **Color hue**: use for the most important categorical distinction (e.g., message role in multi-turn traces). Each role gets a distinct hue at full saturation. Don't use hue for quantitative data.
- **Opacity/saturation**: reduce only for content literally redundant across records (e.g., identical boilerplate). "Do not mute content by role" — any role can contain the actual bug.
- **Spacing**: tight (4–8px) within a logical group, medium (16–24px) between groups, large (32–48px) between major sections.
- **Typography**: proportional font for prose, monospace for code, small/muted for metadata, italic or distinct treatment for thinking/reasoning blocks.
- **Border/container**: group a tool call and its result in a shared container with a subtle border.
- **Structural outlier flags**: pre-compute dataset-level averages for key structural features; flag outliers as small badges in the header only (e.g., "6 headings (more than 89%)"). Keep it minimal — most records should have zero or one flag.

---

## Phase 3: Build the Review Interface

### Architecture
- Python HTTP server using stdlib `http.server` (no dependencies).
- Endpoints:
  - `GET /` — serves the HTML app
  - `GET /api/samples` — returns current sample set
  - `POST /api/samples` — lets the agent push new samples
  - `GET /api/annotations` — returns current annotations
  - `POST /api/annotations` — saves annotations on every change
  - `GET /api/graph` — returns 2D projection of all records for the cluster map
  - `GET /api/patterns` — returns current failure mode taxonomy
  - `POST /api/patterns` — lets the agent push updated taxonomy
  - `GET /api/suggestions` — returns agent-suggested annotations
  - `POST /api/suggestions` — lets the agent push suggestions
- On-disk files in an `error_discovery_data/` directory: `samples.json`, `annotations.json`, `graph.json`, `patterns.json`, `suggestions.json`.
- The HTML app auto-saves to the server on every annotation and polls for new samples and suggestions.

### HTML App Structure
Three views, toggled from the top bar:

**1. Article/Content View** — the main review interface.
- **Header**: title + label + topic, minimal. Structural outlier flags only for genuine outliers. No cluster IDs, sampling metadata, or percentile bars.
- **Body**: render primary content per content type:
  - *Multi-turn traces*: each message is a block with a colored left-border or background tint per role. Role label at the top of each block. Assign a distinct hue to each role, consistent across all records, all at full opacity by default. Render thinking/reasoning blocks with a visually distinct treatment (lighter background, italic, or slightly indented) while keeping full readability. Show tool call function names prominently; put parameters in collapsible formatted JSON. Make long tool results collapsible with a summary line visible. Reduce opacity only for content literally identical across all records. Group related turns (thinking block + tool call + tool result) with tight spacing and a shared container.
  - *Single text*: render markdown as formatted HTML (e.g., marked.js) or plain text with paragraph breaks.
  - *Code/diffs*: syntax highlighting (highlight.js or Prism via CDN), green background for additions, red for deletions, line numbers shown.
  - *Input/output pairs*: stack with a clear divider, or side-by-side if both are short, with each section labeled.
- **Inline annotation**: reviewer selects text → floating popover appears with a text input → Enter to save → span highlighted. When the popover appears and input is focused, wrap the selected range in a temporary highlight span (class "pending-highlight") **before** focusing the input to prevent the browser from clearing the native selection. Remove the temporary highlight when the annotation is saved, cancelled, or dismissed.
- **Margin notes**: annotations and suggestions appear as side notes in a right margin column, aligned vertically with their corresponding highlighted text. Use a two-column layout: article body on the left (flex: 1, max-width ~720px) and a margin-notes column on the right (width ~240px). Each margin note uses `position: absolute` inside the margin column, with its top offset calculated from `getBoundingClientRect` on both the highlight and the margin container, taking the difference — **do NOT add scrollTop**. Stack notes with a minimum gap to prevent overlap. Include hover linking between margin notes and their highlights. Each margin note shows the quoted text, the reviewer's note, and edit/delete buttons (visible on hover). Do not use hover tooltips as the primary way to show annotation content.
- **Agent suggestions**: visually distinct from human annotations — dashed border and muted tint for inline highlights; different left-border color and an "agent suggestion" tag for margin notes. Accept/dismiss buttons always visible (not hover-gated). Accepting promotes a suggestion to an annotation.
- No quality labels, no dropdowns, no structured forms. Free-text notes only.
- Auto-save to server on every change; localStorage backup.
- Poll for new samples and suggestions periodically; show a banner or toast when new ones arrive.

**2. Map View** — 2D scatter plot.
- Records projected via PCA/UMAP.
- Color by cluster (match hull colors), not by label.
- Shape distinguishes categories (e.g., circles vs. squares).
- Sample items shown as larger nodes with a dark border.
- Annotated items in a distinct color (e.g., orange).
- Cluster hulls drawn as subtle background shapes.
- Hover tooltip shows title, metadata, and annotation count.
- Clicking a sample node navigates to its content view.

**3. Progress View** — two sections:
- *Failure modes*: a treemap of categorized modes. Each block is a failure mode, sized by annotation count, with notes listed inside. Clicking a note navigates to that annotation in the content view.
- *Agent suggestions to review*: a list with checkboxes showing failure mode, quoted text, and source record per row. Clicking text navigates to that location in the article. A "Select all" checkbox at the top, plus "Accept selected" and "Dismiss selected" buttons for bulk review.

---

## Phase 4: Cluster and Select Initial Samples

1. Extract features appropriate to the content type (identified in Phase 1c).
2. Cluster using KMeans or similar on normalized features, targeting 6–10 clusters.
3. Build the initial sample (15–25 items for datasets over 50):
   - ~60–70%: cluster representatives (1–2 items closest to each centroid, mixing categories/labels).
   - ~30–40%: random samples from the full dataset regardless of cluster, to cover dimensions clustering may miss.
   - Remove duplicates.
4. Prioritize diversity — the goal is discovering failure modes, not estimating their prevalence.

---

## Phase 5: Run the Interactive Review Loop

Once the app is running and the human starts reviewing, follow `review-loop.md` for the ongoing interactive session. Use the Monitor Tool during the interactive review process.
