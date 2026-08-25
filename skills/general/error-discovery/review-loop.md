# Review Loop

**Two modes:** "Breadth" covers diverse samples to find different failure modes; "Depth" examines a found mode thoroughly across all records.

**Launch:** Start the Python server, open the browser, then monitor `error_discovery_data/annotations.json` by polling every 2 seconds — not with filesystem events.

**As annotations arrive:**
- Categorize each into a failure mode
- Maintain a running taxonomy: `{mode_name: {description, count, example_ids, example_quotes[]}}`
- Push updates to `POST /api/patterns`

**Depth scanning:** "Spawn one background subagent per failure mode" — give it the mode name, description, and example quotes. It scans all records and returns suggested annotations. Merge results and push to `POST /api/suggestions`.

**Breadth sampling:** Cover unreviewed cluster gaps, add random picks, push to `POST /api/samples`.

**Re-review:** Encourage it explicitly — criteria drift means earlier records may have missed instances of modes discovered later.

**Convergence:** Track whether new records reveal new modes or repeat known ones. "When the rate of new discoveries drops, suggest stopping or narrowing focus."

**Core principle:** "The human notices, the agent organizes." Suggestions require human accept/dismiss; favor recall over precision.
