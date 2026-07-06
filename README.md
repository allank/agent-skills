# agent-skills

Allan Kent's open-source PM and productivity skills for Claude Code and Antigravity.

## Plugins

### pm-craft

PM craft skills — thinking, exploration, and communication. Three fire automatically from conversation; the rest you invoke by name (`/pm-craft` routes you if you forget which).

| Skill | Invocation | What it does |
|-------|------------|--------------|
| `pm-craft` | `/pm-craft` | Router — matches your need to the right skill below |
| `product-grill` | automatic | Stress-test a product idea by interview — six PM lenses → conviction brief |
| `thinking-partner` | automatic | Systems thinking coach — Cynefin, Three Horizons, Wardley Mapping, Idealised Design |
| `lpc-author` | `/lpc-author` | Socratic coaching through writing a Lean Product Canvas |
| `product-debate` | `/product-debate` | Simulated Visionary-vs-Skeptic debate over an idea, then a synthesised path forward |
| `linear-walkthrough` | `/linear-walkthrough` | Narrative, step-by-step walkthrough of code, docs, or concepts |
| `interactive-explainer` | `/interactive-explainer` | Self-contained interactive HTML visualisation of a process or logic |
| `mind-ensemble` | `/mind-ensemble` | Mental-model analysis — 11 personas, 20 frameworks, four modes |
| `session-handoff` | automatic | Per-topic session handoffs — wrap up into a resumable state file, pick any topic back up later |

### obsidian-tools

Obsidian vault integration. Requires the [Obsidian CLI](https://obsidian.md/help/cli) (early access, Obsidian 1.12+) with Obsidian running; command reference verified against Obsidian 1.13.

| Skill | Invocation | What it does |
|-------|------------|--------------|
| `obsidian-cli` | automatic | Vault-native operations via the Obsidian CLI: search, create, tasks, properties, daily notes — preferred over raw file I/O |

## Install (Claude Code)

```bash
claude plugin marketplace add allank/agent-skills
claude plugin install pm-craft@allank-skills
claude plugin install obsidian-tools@allank-skills
```

## Install (Antigravity)

```bash
git clone https://github.com/allank/agent-skills ~/code/agent-skills
~/code/agent-skills/scripts/deploy-antigravity.sh
```

## Credits

- `linear-walkthrough` and `interactive-explainer` are adapted from Simon Willison's agentic engineering patterns: [Linear walkthroughs](https://simonwillison.net/guides/agentic-engineering-patterns/linear-walkthroughs/) and [Interactive explanations](https://simonwillison.net/guides/agentic-engineering-patterns/interactive-explanations/)
- `product-grill` is inspired by Matt Pocock's [Grill with docs](https://www.aihero.dev/grill-with-docs)
- `product-debate` is adapted from [Rian van der Merwe](https://elezea.com/)'s [debate-product-idea prompt](https://github.com/rianvdm/product-ai-public/blob/main/02-prompts/pm/debate-product-idea.md)
- `session-handoff` is adapted from Matt Pocock's [handoff skill](https://github.com/mattpocock/skills/blob/main/skills/productivity/handoff/SKILL.md) and Rian van der Merwe's [session-end command](https://github.com/rianvdm/product-ai-public/blob/main/.opencode/command/session-end.md)

## Portable Core Rule

All skills in this repo follow the [Agent Skills standard](https://agentskills.io) with minimal frontmatter: `name`, `description`, and — on skills meant to be invoked by name rather than fired automatically — `disable-model-invocation`. Skills work in Claude Code, Claude Cowork, and Antigravity; harnesses that don't recognise the flag simply treat those skills as automatic, so their one-line descriptions still read sensibly.
