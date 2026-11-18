---
name: session-end
description: Promote the session's learnings, update stable facts and the session log, then commit — so the next session starts where this one stopped.
disable-model-invocation: true
---

# Session End

<!-- Adapted from Rian van der Merwe's session-end command (https://github.com/rianvdm/product-ai-public/blob/main/.opencode/command/session-end.md) and Matt Pocock's handoff skill (https://github.com/mattpocock/skills/blob/main/skills/productivity/handoff/SKILL.md) -->

Close a working session so its lessons outlive it. The most important step is **promotion** (step 3): a lesson persists only when it lands in a file agents actually load.

## 1. Find the context folder

The project root is the git root, or the folder holding `AGENTS.md` / `CLAUDE.md`. The root instruction file names the context folder in a section headed **Context**.

**First run (no context folder named):** propose `00. Context/` for a PARA vault or `context/` otherwise, and confirm with the user. Create the folder from the templates in [`assets/`](assets/) (`stable-facts.md`, `corrections.md`, `session-log.md`, `decisions.md`), then add this section to the root instruction file:

```markdown
## Context
`<folder>/` holds what agents should know that belongs to no single project.

| File | Read when |
|------|-----------|
| `corrections.md` | Session start. Apply silently. |
| `stable-facts.md` | Session start: active work, recent decisions, blockers, environment |
| `session-log.md` | Resuming earlier work: the 3 most recent relevant entries |
| `decisions.md` | Changing structure or conventions |

Corrections go in `corrections.md`, not in any agent's private memory, so every agent sees them.
```

## 2. Assess the session

Write anything only if the session was **substantive**: decisions made, problems investigated, documents created, context built up. If it wasn't, say so; if it still edited files, go to step 7, otherwise stop.

Admit each item through three filters: **novel** (not already in a skill, rule or stable facts), **actionable** (a future session can use it), **durable** (still matters in two weeks).

## 3. Promote learnings

For each lesson, correction or workflow fix from the session, choose the best home and write it there:

| Target | When |
|---|---|
| A skill | Domain knowledge gained, a step missing, a default that should change |
| Root instruction file or rule files | A convention changed, or a new trigger for loading a file |
| The project's main note | Project status or decisions changed (see step 4) |
| `decisions.md` | A durable decision that applies across projects |
| `corrections.md` | A behaviour fix with no better home **yet** |

- Prefer the most specific home; `corrections.md` is temporary storage, not a destination.
- Read the target first, then **rewrite the paragraph that already covers the topic**. Keep the rule and the tell; drop the day's counts and names.
- When a correction moves into a skill or rule file, delete it from `corrections.md`.
- Shared lessons go in tracked files. An agent's private memory is for facts about that one machine or harness.

**Ask before writing** when the target is a skill, the root instruction file or a rule file *and* the fit is uncertain, or when the change would restructure a file rather than amend it. These load into every future session. Apply clear-fit edits to those files directly, and always apply directly to the context files and project notes.

If nothing needs promoting, say "No promotions from this session."

## 4. Update the project note

If the session centred on one project that has a main note (`README.md`, `CONTEXT.md`, or the note named after its folder), rewrite its `## Current state` section: status, next step, open threads, date. Create the section if missing. A repo the session worked in hands off through its own issues and docs.

## 5. Prune and update stable facts

Record the size of `stable-facts.md` (`wc -c`), then **prune** before adding:

- **Active Work:** remove items that shipped, were abandoned or moved to someone else; propose removing items with no activity in 4+ weeks and no open threads; remove items better captured in a project note. Every entry is a **pointer**: current state, next action, and where the detail lives, in about 400 characters.
- **Recent Decisions:** remove entries older than 6 weeks.
- **Blockers:** remove resolved ones.
- **Environment:** update or remove anything no longer true.

Then add or update what changed this session, and set `**Last updated:** YYYY-MM-DD` with nothing after the date. Budget: 15,000 bytes. Re-measure; while over, rewrite or cut the longest entries. More than ~12 active-work items means pruning isn't aggressive enough.

## 6. Write the session log entry

Prepend a new entry after the file header, before the first H2:

```markdown
## YYYY-MM-DD — [Brief topic]

**What happened:** [1–3 sentences: specific paths, projects, IDs]

**Decisions:** [and where they were recorded]

**Learned:** [only what persists; omit if nothing]

**Promoted:** [files changed in step 3 and what changed; omit if nothing]

**Open threads:** [unfinished work; omit if nothing]
```

Leave existing entries untouched. Count the H2 entries; past 50, tell the user it's time to archive older ones.

## 7. Commit

Skip this step, and say so, when the project root isn't a git repo.

1. **Settle open offers first.** If the session offered a file change the user hasn't answered, ask now; apply what they accept.
2. **List the session's files**: every file this session created or edited under the project root, built from your own edits rather than `git status` (which also shows other work). Leave out gitignored files.
3. **Stage by explicit path** (`git add -- <path> ...`) and confirm `git diff --cached --name-only` lists exactly those files.
4. **Commit** with a subject naming the session's main outcome and a short body saying what changed and why. End with the commit attribution lines the harness provides.
5. **Push** only when the branch has an upstream. If the remote has moved on, `git pull --rebase --autostash`, then push; stop and report on any conflict.

Edits in other repos follow that repo's own process: list them in the report and leave them uncommitted.

## 8. Report

Scannable in ten seconds, in this order:

- **Shared-file edits** (skills, root instruction file, rule files), flagged prominently: they load into every future session.
- **Stable facts:** entries removed and updated; size before and after in bytes.
- **Corrections:** added, and retired into other files.
- **Project note / decisions:** what changed.
- **Session log:** entry written; H2 count.
- **Commit:** short SHA, file count, whether it was pushed, and files left uncommitted on purpose. Revert with `git revert <sha>`.
