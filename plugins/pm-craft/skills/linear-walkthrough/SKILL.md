---
name: linear-walkthrough
description: Generates a narrative, step-by-step walkthrough document from source material — code, docs, diagrams, meeting notes, tickets, or any combination.
disable-model-invocation: true
---

# Linear Walkthrough

<!-- Inspired by: https://simonwillison.net/guides/agentic-engineering-patterns/linear-walkthroughs/ -->

A walkthrough is not a reference document or a summary. It is a **guided tour**: it takes the reader from the beginning to the end, building understanding progressively, with each section setting up the next.

## Before You Start

Clarify two things — ask if not obvious from context:

### 1. Audience
- **Product / non-senior technical**: Focus on *what* and *why*. Use analogies. Explain jargon when it appears. Keep implementation detail light unless it directly clarifies intent. Think: "would a smart PM who codes a little follow this?"
- **Engineering / senior technical**: Full detail. Implementation specifics, edge cases, architectural decisions, tradeoffs.
- **Mixed or unknown**: Default to PM-level narrative, with optional "Under the Hood" callout blocks for deeper technical content that more technical readers can explore.

### 2. Intent / downstream use
Why is this walkthrough being created? This shapes depth and emphasis:

| Intent | Emphasis |
|---|---|
| *"I'm learning this"* | Breadth-first, context-heavy, analogies welcome |
| *"I need to explain this to my team"* | Narrative-first, minimal assumed knowledge |
| *"I'm preparing documentation"* | Precision matters, include edge cases |
| *"I want to build a tutorial from this"* | Modular sections, each concept clearly labelled and self-contained |

If you're not sure, ask. If the user doesn't know either, default to "learning" mode and note the assumption.

## Intake

Source material may be any combination of:
- Code files or repositories
- Product documents, PRDs, TDDs
- Architecture diagrams or written descriptions
- Meeting notes or transcripts
- Jira tickets or task lists
- A verbal description of a concept

**For code**: read the actual source — file-reading and search tools where available, shell commands (`cat`, `grep`) otherwise. Never write about code from memory; that is how implementation details get hallucinated.

If source material is incomplete or partially provided, flag the gaps before writing (see Handling Uncertainty).

## Survey Before You Walk

Before writing, take stock of what you have:

1. **Inventory** the key components (files, sections, concepts, modules, decisions)
2. **Find the entry point** — where does understanding naturally start? (Often not where the code starts.)
3. **Determine reading order** — not alphabetical or file order, but the sequence that builds understanding progressively
4. **Note uncertainties** — anything ambiguous, missing, or that you'd need to guess about

Share the outline with the user if the material is complex or unfamiliar, so they can redirect before you invest in a full draft.

## Writing the Walkthrough

Each section should do three things:

- **Orient**: Tell the reader what they're about to learn and why it matters in context
- **Explain**: Walk through the logic clearly, at the calibrated depth
- **Connect**: Show how this relates to what came before and what it enables next

Avoid the temptation to just describe *what* the code/doc does. The value of a walkthrough is explaining *why* things are structured the way they are — the intent behind the decisions.

### Callout Conventions

Use these blockquote callouts to layer depth without interrupting the narrative. They render as styled admonitions in Obsidian and GitHub, and degrade to plain blockquotes everywhere else:

```
> [!NOTE] Why this matters
> Context and motivation — the "why" behind a design choice.

> [!TIP] Under the Hood
> Deeper technical detail. PM-level readers can skip this block.

> [!WARNING] Uncertainty
> When you're making a best guess. State your assumption and confidence.

> [!EXAMPLE] Analogy
> For making abstract concepts concrete for non-technical readers.
```

## Output Format

Save as a single Markdown file — to the path the user specifies, or `<slug>-walkthrough.md` in the current working directory:

```
---
tags: [walkthrough]
source: <what was walked through>
audience: <pm-level | engineering | mixed>
intent: <learning | explanation | documentation | tutorial-input>
date: <today>
---

# Walkthrough: [Subject]

## What This Covers
<1–2 sentences: what system/concept this covers and why someone would read it>

## The Lay of the Land
<A brief map of the territory — the key components and how they relate, before diving in. Think of this as orienting the reader so the sections ahead don't feel like a surprise.>

## [Section 1: Logical entry point]

## [Section 2: Next building block]

...

## [Section N: Final component / synthesis]

## Uncertainties & Assumptions
<Bulleted list of things you weren't certain about, your best guess for each, and why. Empty if everything was clear.>

## What to Explore Next
<Optional: pointers to related material, logical follow-on questions, or things the walkthrough surfaces but doesn't resolve.>
```

Section count and names should reflect the actual material — don't force a fixed number of headings.

Before delivering, check the draft against the Survey: every inventoried component must appear in a section, or be explicitly listed under Uncertainties & Assumptions or What to Explore Next. Nothing drops silently.

## Handling Uncertainty

When you have to guess — large codebases, partial documents, verbal descriptions:

- Make the best inference you can from available evidence
- Flag it with a `> [!WARNING] Uncertainty` callout
- State your reasoning: *"I'm assuming X because Y — if that's wrong, this section may not be accurate"*

Never fabricate implementation details, invent function behaviour, or silently paper over gaps. If you can't extract or verify something, say so explicitly. An honest gap is more useful than confident fiction.
