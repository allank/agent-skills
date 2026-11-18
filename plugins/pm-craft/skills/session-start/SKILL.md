---
name: session-start
description: Load corrections, stable facts and recent session history from the project's context folder at the start of a working session.
disable-model-invocation: true
---

# Session Start

<!-- Adapted from Rian van der Merwe's session-start command (https://github.com/rianvdm/product-ai-public/blob/main/.opencode/command/session-start.md) -->

Load cross-session memory so this session picks up where earlier ones left off. Anything the user passed with the command names the topic they want to work on; use it to focus steps 3 to 5.

## 1. Find the context folder

The project root is the git root, or the folder holding `AGENTS.md` / `CLAUDE.md`. The root instruction file names the context folder in a section headed **Context**, with the files listed below.

If no context folder is named, say so in one line, suggest running `/session-end` once to set one up, and stop.

## 2. Load corrections

Read `corrections.md` in full and apply every entry for the rest of the session. Keep them to yourself unless asked.

## 3. Load stable facts

Read `stable-facts.md`. It is the primary orientation: active work, recent decisions, blockers, environment. Each active-work entry is a **pointer** to where the detail lives.

## 4. Load recent sessions

List the entry headings in `session-log.md` with `grep -n '^## '`. Each entry is an H2 (date and topic), newest first, running to the line before the next H2. Choose 3 entries and read only their line ranges:

- **Topic given:** the 3 newest entries whose heading matches it loosely; fill any remaining slots with the newest entries.
- **No topic:** the 3 newest entries.

## 5. Load the topic's own context

When a topic is given and a stable-facts pointer or log entry names where its detail lives (a project note, a repo's `AGENTS.md`), read that. Read only what the topic needs; pointers you don't follow stay unread.

## 6. Report

```
**Current state:**
* [2–3 active-work items most relevant to the topic, or the most recent]

**Recent sessions:**
* [Date] — [Topic]: [one line]

**Open threads not in stable facts:**
* [threads from the log entries that stable facts doesn't already track]
```

Omit a section that would be empty. If the recent sessions cluster on one area and no topic was given, offer once to load that area's context. End with one line saying you're ready.
