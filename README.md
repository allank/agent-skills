# agent-skills

Allan Kent's open-source PM and productivity skills for Claude Code and Antigravity.

## Plugins

### pm-craft

PM craft skills — thinking, exploration, and communication.

| Skill | Trigger | What it does |
|-------|---------|--------------|
| `thinking-partner` | `/thinking-partner` | Systems thinking via Cynefin, Three Horizons, Wardley Mapping, Idealized Design |
| `lpc-author` | `/lpc-author` | Socratically coach a PM through writing a Lean Product Canvas (use lean-product-canvas if installed) |
| `linear-walkthrough` | `/linear-walkthrough` | Narrative, step-by-step walkthrough of code, docs, or concepts |
| `interactive-explainer` | `/interactive-explainer` | Build a self-contained interactive HTML visualisation of a process or logic |
| `mind-ensemble` | `/mind-ensemble` | Mental model exploration through personas and frameworks |
| `product-debate` | `/product-debate` | Pressure-test ideas, expose assumptions, rigorous critique |
| `product-grill` | `/product-grill` | Stress-test a product idea across six PM lenses → conviction brief |

### obsidian-tools

Obsidian vault integration.

| Skill | Trigger | What it does |
|-------|---------|--------------|
| `obsidian-cli` | `/obsidian-cli` | Full CLI reference for vault-native operations: search, create, tasks, daily notes, properties |

## Install (Claude Code)

```bash
claude plugin marketplace add allank/agent-skills
claude plugin install pm-craft@agent-skills
claude plugin install obsidian-tools@agent-skills
```

## Install (Antigravity)

```bash
git clone https://github.com/allank/agent-skills ~/code/agent-skills
~/code/agent-skills/scripts/deploy-antigravity.sh
```

## Portable Core Rule

All skills in this repo follow the [Agent Skills standard](https://agentskills.io): only `name` and `description` in frontmatter. No Claude-specific extensions. Skills work in Claude Code, Claude Cowork, and Antigravity.
