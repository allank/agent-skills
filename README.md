# agent-skills

Open-source PM, productivity and developer skills for Claude Code and Antigravity.

## Plugins

### pm-craft

PM craft skills — thinking, exploration, and communication. Two fire automatically from conversation; the rest you invoke by name (`/pm-craft` routes you if you forget which).

| Skill | Invocation | What it does |
|-------|------------|--------------|
| `pm-craft` | `/pm-craft` | Router — matches your need to the right skill below |
| `product-grill` | automatic | Stress-test a product idea by interview — six PM lenses → conviction brief |
| `thinking-partner` | automatic | Systems thinking coach — Cynefin, Three Horizons, Wardley Mapping, Idealised Design, Intuition Pumps |
| `lpc-author` | `/lpc-author` | Socratic coaching through writing a Lean Product Canvas |
| `product-debate` | `/product-debate` | Simulated Visionary-vs-Skeptic debate over an idea, then a synthesised path forward |
| `linear-walkthrough` | `/linear-walkthrough` | Narrative, step-by-step walkthrough of code, docs, or concepts |
| `interactive-explainer` | `/interactive-explainer` | Self-contained interactive HTML visualisation of a process or logic |
| `mind-ensemble` | `/mind-ensemble` | Mental-model analysis — 11 personas, 20 frameworks, four modes |
| `session-start` | `/session-start` | Load corrections, stable facts and recent session history from the project's context folder |
| `session-end` | `/session-end` | Promote learnings into skills and rules, prune stable facts, write the session log entry, commit |

### obsidian-tools

Obsidian vault integration. Requires the [Obsidian CLI](https://obsidian.md/help/cli) (early access, Obsidian 1.12+) with Obsidian running; command reference verified against Obsidian 1.13.

| Skill | Invocation | What it does |
|-------|------------|--------------|
| `obsidian-cli` | automatic | Vault-native operations via the Obsidian CLI: search, create, tasks, properties, daily notes — preferred over raw file I/O |

### dev-tools

Developer workflow skills. `public-face` generates raster artwork through the [Antigravity CLI](https://antigravity.google) (`agy`) and its built-in `image-generator` subagent; without `agy` it falls back to vector artwork.

| Skill | Invocation | What it does |
|-------|------------|--------------|
| `public-face` | automatic | Builds a repository's public presentation — logo, social preview, README branding, About-sidebar copy — on a branch in an isolated worktree, with a review gallery and ready-to-run hosting commands |

## Install (Claude Code)

Claude Code installs skills through the plugin marketplace — add the marketplace once, then install any plugin:

```bash
claude plugin marketplace add allank/agent-skills
claude plugin install pm-craft@allank-skills
claude plugin install obsidian-tools@allank-skills
claude plugin install dev-tools@allank-skills
```

## Install (skills.sh CLI)

The [skills CLI](https://skills.sh) installs skills into Claude Code and other agents (Cursor, Codex, etc.) without the plugin marketplace:

```bash
npx skills add allank/agent-skills
```

## Install (Claude AI / Cowork)

The Claude desktop and web apps don't use the plugin marketplace — each skill is uploaded individually as a `.skill` file.

1. Download the `.skill` files you want from the [latest release](https://github.com/allank/agent-skills/releases/latest) (published automatically for each version tag)
2. In Claude, open **Settings → Skills**
3. Click **Add**, then upload the `.skill` file
4. Repeat for each skill

To build the packages locally instead:

```bash
./scripts/build-skills.sh   # writes dist/<skill-name>.skill for every skill
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
- `session-start` and `session-end` are adapted from Rian van der Merwe's [session-start](https://github.com/rianvdm/product-ai-public/blob/main/.opencode/command/session-start.md) and [session-end](https://github.com/rianvdm/product-ai-public/blob/main/.opencode/command/session-end.md) commands, and Matt Pocock's [handoff skill](https://github.com/mattpocock/skills/blob/main/skills/productivity/handoff/SKILL.md)
- `public-face` is adapted from Jonathan Hitchcock's [public-face skill](https://github.com/vhata/claude-skills/tree/main/public-face), with image generation moved from Codex to Antigravity's `image-generator` subagent

## Portable Core Rule

All skills in this repo follow the [Agent Skills standard](https://agentskills.io) with minimal frontmatter: `name`, `description`, and — on skills meant to be invoked by name rather than fired automatically — `disable-model-invocation`. Skills work in Claude Code, Claude Cowork, and Antigravity; harnesses that don't recognise the flag simply treat those skills as automatic, so their one-line descriptions still read sensibly.
