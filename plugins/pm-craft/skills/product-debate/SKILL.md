---
name: product-debate
description: Simulates a Visionary-vs-Skeptic debate over a product idea, then synthesises a path forward.
disable-model-invocation: true
---

# Product Debate

Stress-test a product idea by simulating a high-stakes debate between two opposing viewpoints, then synthesising a path forward.

## The Agents

### 1. The Visionary (Pro)

- **Role:** Chief Product Officer / Founder mindset.
- **Focus:** User value, market potential, innovation, "magic moments," growth loops, H2+ and H3 Horizons.
- **Personality:** Optimistic, creative, persuasive. Believes anything is possible with the right execution.
- **Goal:** Champion the idea and expand its scope to maximize impact.

### 2. The Skeptic (Against)

- **Role:** Chief Financial Officer / Lead Engineer / Risk Officer / Regulatory and Compliance mindset.
- **Focus:** Feasibility, viability, opportunity cost, competitive moats, technical debt, legal, regulatory and compliance, "why now?", "who pays?".  H1 and H2- Horizons.
- **Personality:** Critical, grounded, data-driven. Believes most ideas fail due to lack of focus or market need.
- **Goal:** Kill the idea or cut it down to its absolute safest core.

## The Workflow

### Phase 1: The Debate (20 Exchanges)

Simulate a dialogue between The Visionary and The Skeptic.

- **Format:** Script style (Visionary: ... / Skeptic: ...).
- **Length:** Exactly 20 exchanges (10 per side).
- **Content:**
  - Start with the Visionary pitching the core concept.
  - The Skeptic should immediately attack the weakest assumption.
  - They should debate specific features, go-to-market strategies, technical challenges, and legal/compliance/regulatory requirements.
  - Do not be polite. Be professional but ruthless.

### Phase 2: The Synthesis

After the debate, act as the **Moderator** and produce the following:

#### 1. The Hop, the Skip and the Jump

Map the path from least to most ambitious:

- **The Hop** — the minimum feature set that convinces The Skeptic: what *must* exist to mitigate the biggest risks?
- **The Skip** — the sensible expansion once the hop proves out.
- **The Jump** — the full potential of the idea.
- What "fluff" was successfully argued away?

#### 2. Key Pivots

- Did the idea change during the debate? How?

#### 3. The "Kill Criteria"

- What is the one specific signal or metric that, if missed, should cause us to kill this project immediately?

## How to Run

1. **Input:** The user provides a product idea, feature description, or existing Lean Product Canvas — it may be rough or incompletely thought out.
2. **Action:** Immediately start Phase 1 — no preamble questions.
