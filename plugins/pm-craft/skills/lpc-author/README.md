# lpc-author — Lean Product Canvas skill

A Claude skill that coaches a product manager through writing a sharp Lean Product Canvas (LPC). It guides you Socratically through Problem, Customer, Outcomes, JTBD, Solutions, Hypotheses, Riskiest Assumption, Experiments, and Cost, then outputs the final canvas as structured Markdown you can take wherever you want it to live.

## Scope

This skill is **authoring-only**. It produces a single deliverable: the canvas in Markdown.

Publishing — saving locally, pasting into Google Docs / Confluence / Notion, converting to a Word doc, sharing on Slack — is out of scope and left to the user. The intent is to keep the skill focused on the bit that actually matters: pressure-testing your thinking.

## What's in the box

```
lpc-author/
├── SKILL.md                       # The skill prompt Claude follows
├── README.md                      # This file
├── assets/
│   └── canvas-template.md         # Fixed Markdown structure for the canvas
└── references/
    └── quality-standards.md       # "Good" vs "bad" inputs per section
```

No scripts, no Python, no Word templates. The skill runs entirely on Claude's reasoning + the quality-standards reference.

## Install — Cowork (primary)

1. Unzip `lpc-author.skill` (it's just a zip; rename to `.zip` if your OS won't open it).
2. Open your Cowork workspace folder (the one you mounted in the Cowork desktop app). Inside, find or create a `.claude/skills/` directory.
3. Copy the unzipped `lpc-author` folder into `.claude/skills/`, so you end up with:
   ```
   <your-workspace>/.claude/skills/lpc-author/SKILL.md
   ```
4. Restart your Cowork session (or start a new conversation). The skill will appear in the available-skills list.
5. Invoke the skill by name — type `/lpc-author` (the skill is user-invoked; Claude won't fire it automatically from a plain request).

## Install — Claude Code CLI (optional)

1. Unzip `lpc-author.skill`.
2. Drop the `lpc-author` folder into either `~/.claude/skills/lpc-author/` (user-level) or `<repo>/.claude/skills/lpc-author/` (project-level).
3. The skill is picked up on the next Claude Code session.

## How it works

1. Claude runs you through three phases — Problem/Customer/Outcomes → JTBD/Solutions/Hypotheses → Risk/Experiment/Cost — critiquing each input against the quality standards.
2. When all three phases are solid, Claude reads `assets/canvas-template.md` and produces the final canvas as `##`-headed Markdown sections with YAML frontmatter.
3. You take it from there.

## Notes

- **Why Markdown?** It travels everywhere — Google Docs, Confluence, Notion, Obsidian, GitHub all paste it cleanly. It also keeps the skill portable: no platform-specific dependencies.
- **Review mode?** This skill is authoring-only. If you want a review-mode variant for reviewing other PMs' canvases, extend SKILL.md with a second mode — or ask the skill author.

## Feedback

Thumbs-down any Claude response in Cowork to send feedback to Anthropic, or raise issues with the skill author directly.
