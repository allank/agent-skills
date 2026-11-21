# Worktree files and local review materials

Use this guide while implementing presentation changes. All invocation
output stays inside the task worktree, including a proposal-only gallery
when the user explicitly requested that narrower mode.

## What belongs in the commit

Follow the repository's locations and conventions for the README, artwork,
editable sources, exports and durable generation instructions. Add only
files needed for the maintained presentation. Do not impose an `assets/`
layout or move an existing README solely to match this skill.

Keep private metadata captures, baselines, browser screenshots, local
galleries, temporary patches and external-setting commands/payloads in a
local ignored directory within the worktree. Use an existing convention
or create a scoped local exclude when needed; do not overwrite ignore
rules. Verify exclusion with `git check-ignore` and inspect staged paths
before committing. Machine-specific paths can appear in a local handoff,
not in committed generation tools or documentation.

A useful local review directory can contain:

| Artifact | Purpose |
| --- | --- |
| `index.html` | Gallery of actual changed files and intended hosting metadata |
| `settings.json` | Observations and explicit setting decisions |
| `commands.sh` and payload files | Ready-to-run external commands, not executed by default |
| `baseline/` | Minimal original files/revisions needed to assess preservation |
| `evidence/` | Scoped checks, screenshots and review notes |

Adapt names and structure. Avoid copying complete proposed repository
files into a parallel pack when the real implementation already exists in
the worktree. A generator should read recorded inputs and write only its
intended files; it must not silently change hosting settings. Document
reproduction commands and dependencies where they add lasting value.

## Setting decisions

Separate observations from planned actions. A useful record is:

```json
{
  "repository": "resolved repository identifier",
  "source_revision": "recorded revision",
  "observed_at": "timestamp",
  "fields": {
    "description": {
      "current": {"known": true, "value": "Existing description"},
      "action": "set",
      "value": "Intended description"
    },
    "packages_sidebar": {
      "current": {"known": false, "reason": "Not observed"},
      "action": "preserve"
    }
  }
}
```

This is a decision record, not an API payload. `set`, `clear` and `preserve`
are distinct; null, empty strings or missing observations must not become
accidental deletions. Record visibility preservation explicitly. Include
only deliberately changed fields in request bodies. Preserve existing
topics by default; any replacement payload contains the complete intended
list, including retained topics.

When offering description alternatives, record their exact text and the
recommendation separately from the user's selection. An unresolved choice
is not a selected write. Show each choice and its command in the gallery
or handoff; keep alternative writes out of a shared executable sequence.

External commands must contain the actual resolved host/repository,
intended values and usable file paths, not example placeholders. Write
JSON using a serializer or structured file tool; do not interpolate prose
into shell command text. Shell-quote every generated argument. Validate
JSON and shell syntax locally without executing mutation commands.

## Baselines and artifact checks

Capture original bytes and revisions before edits. If local and hosted
revisions differ, compare the relevant files themselves. For an additive
logo, prove the existing README bytes remain intact around the insertion.
For intended copy changes, review the exact diff and unchanged content.
Optional patches should apply to their recorded baseline; later execution
must not overwrite a newer README from an old snapshot.

- Verify current host image requirements. Inspect actual PNG dimensions,
  color mode, transparency and size; use intended upload exports in the
  gallery, not approximate mockups.
- For SVGs, check XML, accessible labels, expected geometry and absence of
  scripts, event handlers or external references. Prefer font-independent
  logos. Document any preview SVG/font rendering differences from its PNG.
- Inspect intended README and smaller logo sizes on light/dark backgrounds
  for contrast, clipping and recognizability.
- Check gallery links, image alternatives, desktop/narrow layouts, overflow,
  loading, visible keyboard focus and navigation. Use a disposable local
  browser profile; do not expose private review materials publicly merely
  to obtain screenshots.
- Verify reproducibility where claimed and match asset copies to sources.
  Hashes identify versions but do not prove correctness. After fixes,
  refresh screenshots/hashes for the changed outputs.
- Record reviewed scope and unresolved findings. Separate artifact checks,
  repository checks, hosted state and human visual approval. Run required
  repository checks for the actual committed changes; avoid unrelated
  suites beyond those requirements.

Before handoff, inspect the final diff and staged paths, confirm private
review materials remain ignored, and report the reviewed head and worktree.
For a repository without a remote, keep the same local implementation and
review evidence; explain that hosting commands need a future target rather
than inventing one or creating hosting resources.
