# Writing explanation

Explanation is the only one of the four documentation types written for someone who has stepped *away* from the keyboard. It serves understanding, not action — it's what a reader turns to when they want the bigger picture, not when they need to get something done right now. It answers an implicit or explicit "why," or "can you tell me more about...?"

Explanation doesn't have to carry a label that says "Explanation" — it's equally at home under headings like *Background*, *Discussion*, *Concepts*, or *Design*. What matters is what it's doing, not what it's called.

## Why it's easy to neglect

Explanation is less *urgent* than the other three types — nobody's blocked without it the way they'd be blocked without a working how-to guide — but it is not less *important*. Without it, a practitioner's grasp of a system stays fragmented: they can perform steps and look things up, but they can't reason about the system or adapt to situations the other docs didn't anticipate. It also tends to get neglected structurally, because unlike the other three types, its scope isn't handed to you by a task, a lesson plan, or a system's own architecture — you have to draw the boundary yourself. A useful trick: imagine a real "why...?" question and let that question define the scope of the piece.

## Principles to apply

**Give it room to be discursive.** Unlike the other three types, explanation is allowed to circle its subject, approach it from multiple angles, and take its time. It doesn't need to march through a fixed structure.

**Make connections.** Actively relate the topic to other parts of the system, to prior design decisions, to alternatives that weren't chosen, even to ideas from outside the immediate subject if that illuminates it.

**Provide real context.** Explain *why*, not just *what*: historical reasons, technical constraints, trade-offs made, the reasoning behind a default. This is where the "why" that a how-to guide or tutorial deliberately withheld gets its proper home.

**Frame each piece as being "about" something.** A useful naming test: you should be able to put an implicit "about" in front of the title — *About the caching layer*, *About authentication design*. If you can't, the scope may be too vague or too broad.

**Let opinion and perspective in, deliberately.** This is the one place documentation is allowed to say "X is a better default than Y because..." or weigh competing approaches. Explanation is where trade-offs, alternatives, and judgment calls belong — but flag them as such rather than presenting one opinion as settled fact.

**Keep it bounded even while being discursive.** The risk of an open-ended form is that it starts absorbing content that belongs elsewhere — a full set of instructions, or a complete technical listing. If you catch yourself writing step-by-step directions or an exhaustive spec inside an explanation piece, that content belongs in a how-to guide or reference page instead; link to it rather than inlining it.

## Characteristic language

- Causal/historical framing: "The reason for X is that historically, Y..."
- Comparative judgment: "W is generally preferable to Z, because..."
- Analogy and context-building: "X in this system is similar to Y in [other system], though..."
- Weighing alternatives openly: "Some teams prefer W because Z — that can work well, but..."
- Unfolding internal mechanics for understanding's sake (not for operating anything): "X interacts with Y like this: ..."

## What NOT to do

- Don't turn it into a how-to guide by adding numbered action steps — link to the relevant how-to guide instead.
- Don't turn it into reference by adding exhaustive fact-listing or tables of options — link to reference instead.
- Don't be falsely neutral — flatten-out, opinion-free explanation is often just a worse version of reference. Explanation earns its place by offering perspective reference can't.
- Don't leave the scope totally open-ended — pick a real "why" question and let it bound the piece.
