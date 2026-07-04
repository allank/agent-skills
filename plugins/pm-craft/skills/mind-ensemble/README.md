# Mind Ensemble

**A skill for structured thinking through mental models and personas.**

Mind Ensemble democratises access to mental models—frameworks and role-based perspectives that improve decision-making. The core problem it addresses is this: mental models are powerful, but they have a high barrier to entry. They require prior study, feel academic, and it is rarely obvious *which* framework fits *which* problem.

This skill solves that by providing guided access through an LLM interface.

---

## The Core Concept

Mind Ensemble operates on two key principles:

1. **Progressive Disclosure.** Users unfamiliar with formal frameworks can start with intuitive *personas* (e.g., "The Skeptic" or "CFO"). Those with existing fluency can access the full *framework* library directly.

2. **Multiple Interaction Modes.** Rather than forcing a single analytical approach, the skill offers four distinct modes—each suited to different problem types.

---

## Two Tracks

| Track | Lens Type | Target User |
|-------|-----------|-------------|
| **Simple** | Personas (role-based) | Anyone—no prior knowledge required |
| **Expert** | Frameworks + Personas | Practitioners familiar with mental models |

The distinction here is important: Expert mode includes *all* lenses (personas and frameworks), while Simple mode surfaces only the more intuitive personas.

---

## Four Modes

The modes follow a music metaphor—an ensemble of instruments, each contributing a distinct voice.

| Mode | Inputs | Output |
|------|--------|--------|
| **Tuning** | Problem description | Recommended lens(es) with rationale |
| **Solo** | 1 lens + problem | Deep analysis through a single perspective |
| **Counterpoint** | 2 lenses + problem | Two perspectives in dialogue, finding middle ground |
| **Harmony** | 2 lenses + problem | Synthesised approach blending both lenses |

### Mode Details

**Tuning** is the entry point. Describe your problem; the skill recommends which lens to apply. This is particularly useful when you do not know which framework is appropriate.

**Solo** provides focused depth. You select one lens and receive a structured analysis from that perspective—including blind spots and actionable next steps.

**Counterpoint** stages a dialogue between two perspectives. The output surfaces tensions, identifies common ground, and proposes a middle path. This is not a formal debate; it is a balanced exploration.

**Harmony** goes further: it synthesises a *new* approach by blending principles from two lenses. The hybrid is not named—it is simply applied to your specific problem.

---

## The Lens Library

The skill includes **31 lenses**: 11 personas and 20 frameworks.

### Personas (11)

Personas are role-based perspectives. They require no prior knowledge—users intuitively understand "think like a CFO."

| Category | Personas |
|----------|----------|
| **Archetypes** | Visionary, Skeptic, Pragmatist, Contrarian, Customer |
| **Functional Roles** | CFO, Engineer, Compliance Officer, Legal Counsel, Operations Manager, Sales/Growth |

### Frameworks (20)

Frameworks are formal mental models. Each card includes the author, source link, key questions, strengths, and blind spots.

| Category | Frameworks |
|----------|------------|
| **Strategic / Systems** | Cynefin, Three Horizons, Wardley Mapping, Systems Thinking, Idealised Design |
| **Problem Solving** | First Principles, 5 Whys, Inversion, MECE |
| **Decision Making** | Second-Order Thinking, Pre-mortem, Reversible vs Irreversible |
| **Creativity** | Six Thinking Hats, SCAMPER |
| **Product / Discovery** | Jobs to Be Done, Opportunity Solution Trees, Lean Canvas, Kano Model |
| **Risk / Foresight** | Scenario Planning, Red Team |

---

## Usage

### As a Skill (Gemini CLI, Antigravity, Claude Code)

Place the `mind-ensemble/` folder in your `.agent/skills/` directory. The skill will be automatically available.

**Example prompts:**

```
Use the Skeptic lens to analyse my idea: launching a subscription tier for our product.
```

```
Analyse this problem using Visionary vs CFO: should we build our own payment infrastructure?
```

```
Blend Jobs to Be Done and Pre-mortem to evaluate this idea: offering predictive markets to crypto investors.
```

### As an API (Composed Prompt)

For UI or API-based implementations, compose a single prompt containing:
- System instructions (mode, constraints, output format)
- Lens card content (from the relevant `.md` files)
- User problem description

See the `frameworks/` and `personas/` directories for the raw card content.

---

## Output Requirements

Every output includes:

1. **Analysis** — core insights from the lens(es)
2. **Actionable Next Steps** — concrete things to do
3. **Educational Scaffolding** — brief explanation of the lens(es) used
4. **Attribution Links** — links to original sources

In Simple mode, outputs include *graduation hints*—suggestions for related Expert frameworks.

---

## Extending the Library

To add a new lens, create a `.md` file in `personas/` or `frameworks/` using this schema:

```yaml
name: "Framework Name"
type: framework  # or "persona"
author: "Original Author"
source_url: "https://..."

premise: |
  One-liner describing the core idea.

voice: |
  How this lens "speaks"—personality, tone, typical phrases.

key_questions:
  - "Question this lens naturally asks"

strengths:
  - What it does well

blind_spots:
  - Where it fails or has gaps

good_for:
  - Problem types it suits

not_good_for:
  - Problem types it does not suit
```

Update `SKILL.md` to reference the new lens.

---

## Attribution

Mind Ensemble surfaces mental models from their original authors. Each framework card includes a `source_url` linking to authoritative resources. The skill is designed to encourage users to learn more—not to replace the original work.

---

## License

MIT
