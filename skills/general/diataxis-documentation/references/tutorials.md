# Writing tutorials

A tutorial is a **lesson**, not a manual. It exists to give a learner a successful, hands-on first experience with something — not to get a task done, and not to make them "know" facts. The learner should come away having *done* something meaningful, and having built confidence, even if they can't yet explain everything they just did.

Think of the relationship as teacher and pupil: in this contract, almost all the responsibility sits with you, the writer. The reader's only job is to follow along. You don't get to blame the reader for "not reading carefully" — if they fail, the tutorial failed.

## The central difficulty

In a live lesson, a teacher watches the student, notices confusion, and corrects mistakes in real time. A written tutorial can't do that. You have to write something so carefully sequenced and so reliable that it succeeds for every reader, every time, without you there to rescue them. That's a much higher bar than it sounds — treat tutorial-writing as the hardest documentation you'll do, and budget accordingly (they also tend to need the most maintenance, since a change anywhere in the sequence can break the whole path).

## Principles to apply

**Tell the learner where they're headed, briefly.** One or two sentences at the top ("In this tutorial we'll build and deploy a small web app; along the way you'll touch on containers and environment config") — not a promise of what they'll "learn," which is presumptuous, but a picture of what they'll build or do.

**Give a visible result at every step, and give it early.** Learners build confidence by seeing cause and effect. Never let more than a step or two pass without something observable happening. If a step produces no visible feedback, add a checkpoint ("you should now see...").

**Narrate what to expect.** At each step, tell the reader what they should see happen, so they know they're still on track: "the server will respond with...", "you'll notice the prompt changes to...". If you know a step commonly goes wrong, preempt it: "if you don't see X, you probably skipped Y."

**Point out things worth noticing.** A learner deep in the mechanics of "doing" often won't register meaningful details unless you flag them — a changed prompt, a new file that appeared, a status flip. Call these out explicitly as you go; this is where a lot of real learning quietly happens.

**Protect the feeling of flow.** Skilled practice has a rhythm — action, result, understanding, next action. Your job is to string together tasks so the learner falls into that rhythm rather than getting knocked out of it by confusion or dead ends.

**Let readers repeat steps.** Repetition builds confidence and is sometimes the only way people really absorb something. Where possible, design steps so they can be re-run safely.

**Ruthlessly cut explanation.** This is the hardest discipline for most writers, because once you understand something you want to *frame* it for others — but a mid-lesson digression into "why" breaks concentration and blocks learning. Give the absolute minimum ("we use HTTPS because it's safer") and link out to a full explanation for later, when the reader is ready to seek it out on their own terms. Never assume the reader wants the explanation *now* just because you're tempted to give it.

**Stay concrete, not general.** Ground every instruction in the specific and particular ("run this exact command," "click this exact button") rather than abstracting to general principles. Counterintuitively, this is *also* the best way to help someone eventually grasp the general pattern — abstraction that comes from lived, concrete experience sticks; abstraction handed to someone up front does not.

**Cut choices and alternatives.** A tutorial is one single path. Don't mention the other three ways to do this command, or the config flag you're not using. Every fork is cognitive overhead that risks derailing a beginner. Save alternatives for how-to guides.

**Test it until it's bulletproof.** You will not find every failure mode by reading your own draft. Have real people — ideally true beginners — run it, and fix what breaks.

## Characteristic language

Use these patterns as a gut-check for whether a passage still reads like a tutorial:

- First-person plural: "**We'll** create a...", "Now **we're** going to..." — signals you're alongside the learner, not lecturing at them.
- Direct, unambiguous imperatives in sequence: "First, do X. Now do Y. Now that you've done Y, do Z."
- Minimal, deferred explanation: "We do X here because Y (more on this later)" — with a link, not a paragraph.
- Expectation-setting: "The output should look something like...", "Notice that...", "Let's check that..."
- A small, warm acknowledgment of what was achieved at the end — earned, not gushing.

## What NOT to do

- Don't write "In this tutorial you will learn..." as your opener — it's presumptuous and vague. Describe what they'll *build or do* instead.
- Don't explain a concept in the middle of a step because it feels incomplete without it. Link out.
- Don't offer configuration options, alternate approaches, or "you could also..." asides.
- Don't assume any troubleshooting skill — if something can go wrong, either prevent it structurally or explicitly flag it.
- Don't confuse this with a how-to guide: a tutorial is not "the basic version" of a task — see `distinguishing-guide.md` for the full distinction, since this is the most common documentation mix-up.
