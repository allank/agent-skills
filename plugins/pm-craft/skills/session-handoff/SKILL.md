---
name: session-handoff
description: Write a per-topic handoff file and log it in a single index at the end of a working session, so any topic can be resumed later in a fresh session. Use when the user wants to wrap up or park a session ("handoff", "wrap up", "park this"), or to resume or pick up a previous topic. Also suggest it proactively when a substantive session is clearly winding down.
---

# Session Handoff

<!-- Adapted from: Matt Pocock's handoff skill (https://github.com/mattpocock/skills/blob/main/skills/productivity/handoff/SKILL.md) and Rian van der Merwe's session-end command (https://github.com/rianvdm/product-ai-public/blob/main/.opencode/command/session-end.md) -->

Preserve session context per topic. Each topic gets one handoff file holding its
**current resumption state** (not a diary). A single index is the log and the
menu of what can be picked up.

## Layout

```
handoffs/
├── INDEX.md            # active-topics table + reverse-chron session log
├── <topic-slug>.md     # one file per topic, rewritten each session end
└── archive/            # completed topics
```

`handoffs/` lives at the **project root** (the git root, or wherever the
project's CLAUDE.md sits). If the root is genuinely ambiguous, ask once and
record the chosen location in INDEX.md so future sessions don't re-ask.

If `handoffs/` doesn't exist, create it (and INDEX.md from the format below).

## Ending a session

**1. Gate.** If the session produced nothing novel, actionable, or durable
(quick lookups, trivial edits), say so and stop. No empty handoffs.

**2. Resolve the topic.** Read INDEX.md. Match this session to an existing
topic or mint a new kebab-case slug (specific: `zaru-order-book`, not
`liquidity`). If a session genuinely spans two topics, write two handoffs.
If the match is ambiguous, ask.

**3. Rewrite the handoff file** from scratch using the template below. It must
let a fresh session (or a colleague) resume with zero other context. Keep it
under ~60 lines. Reference artifacts by path/URL — never duplicate their
content. Apply the gate per item.

**4. Prepend one line to the session log** in INDEX.md and update the
active-topics table (status + date).

**5. Flag promotions — don't apply them.** If a durable learning belongs in a
skill, CLAUDE.md, or other shared infrastructure, list it under "Suggested
promotions" in the handoff and tell the user. Never edit shared files yourself.

**6. Confirm.** Report: topic, file path, one-line status, any promotions
flagged.

## Handoff file template

```markdown
# <Topic title>

**Status:** <one sentence — where this stands right now>
**Updated:** YYYY-MM-DD

## Goal
<Why this topic exists, 1–2 sentences.>

## Current state
<What's done and what's true now. Bullets.>

## Decisions
<Decisions made and why, so they aren't relitigated.>

## Open threads
<Unresolved questions, risks, things being waited on.>

## Next steps
<Concrete first actions for the next session, most important first.>

## Artifacts
<Paths / URLs / doc links. Pointers only.>

## Suggested promotions
<Optional: learnings that belong in shared infrastructure, for human review.>
```

## INDEX.md format

```markdown
# Handoffs

## Active topics
| Topic | Status | Updated |
|---|---|---|
| [zaru-order-book](zaru-order-book.md) | Awaiting risk review | 2026-07-02 |

## Session log
- 2026-07-02 — [zaru-order-book](zaru-order-book.md) — drafted unified book proposal; open: custody question
```

New log entries go at the top. One line per topic per session end.

## Resuming

When asked to resume ("pick up X", "where were we on X", "what's open"):
- Named topic → read its handoff file, confirm the next steps, continue.
- No topic named → show the active-topics table and ask which one.
- Only read the artifacts the task at hand requires, not everything listed.

## Completing a topic

When the user says a topic is done: move its file to `handoffs/archive/`,
append a ✅ Done line to the session log, and remove it from the active table.
