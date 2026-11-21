---
name: public-face
description: "Build a repository's public-facing presentation from its current checkout: artwork, README branding and review materials on a branch in an isolated worktree, plus ready-to-run commands for hosting metadata. Use for repository identity and presentation, including private repositories; not product UI redesigns or release-readiness audits."
---

# Public Face

Run this skill inside a repository to complete its local presentation work.
Resolve the repository from the current directory with
`git rev-parse --show-toplevel`; no repository argument is required. Honor
an explicit repository override. Adapt to its identity, language, hosting
service and documented workflow without requiring a companion tool.

**Default outcome:** actual repository changes on a task branch in an
isolated worktree, relevant checks and review, focused commits, a local
gallery, and concrete commands/manual steps for the remaining hosting
settings. Do not stop at a proposal or ask whether to implement. Honor an
explicit audit-only or proposal-only request instead of this default.

## Establish the task worktree

Read repository instructions and inspect status, branches, worktrees,
remotes and overlapping claims. Preserve the original checkout and any
unrelated edits; do not stash, reset or switch it to make room for this task.

Before creating files, use the repository's documented task/worktree tools
and base-selection rules. Reuse an existing task worktree only after
confirming its branch, ownership and lack of conflicting work. Otherwise
create a dedicated branch and isolated worktree. If no workflow is
specified, choose a clear task branch such as `task/public-face`, an
available worktree location and the current committed HEAD as base unless
the user or repository specifies another base. Use
`git worktree add -b "$task_branch" "$task_worktree" "$base_ref"` from the
repository. Do not overwrite an existing branch or worktree. A dirty
original checkout remains untouched; needed uncommitted input requires
explicit coordination rather than an implicit copy or stash.

All files created for this invocation belong inside the task worktree.
Place durable artwork, README changes and useful generation instructions
in the repository's actual locations. Keep galleries, private evidence,
settings payloads and command files in a local ignored subdirectory where
appropriate. Follow existing ignore conventions; verify the local
artifacts are excluded before staging. Never commit private evidence or
machine-specific absolute paths. See [worktree artifacts](references/worktree-artifacts.md).

## Audit and choose the presentation

Inspect the README, product documentation, existing artwork and relevant
package metadata. For hosted repositories, read the current description,
topics, homepage, visibility, license, releases, packages, sidebar settings
and preview image where available. Prefer connected tools or documented
CLI/API reads. For GitHub, use [the GitHub guide](references/github.md);
for another host, check its current official documentation. A repository
without a remote still receives local file changes and a gallery. Missing
hosting credentials never block independent local implementation.

Record revisions and observation dates. Distinguish local HEAD, hosted
HEAD and released artifacts. Unavailable fields mean unknown, not empty
or disabled. Inventory does not prove sidebar visibility; a current image
does not prove upload history. Keep captured evidence minimal and local.

- Describe the product's purpose plainly, grounded in its code and docs.
  Do not imply that planned or source-only features ship in a release.
  Keep setup detail and operational limits where README readers need them.
- Preserve useful existing branding, copy and discovery terms. Add specific
  relevant topics; remove existing topics only deliberately. Use a
  homepage only when its destination is verified.
- Preserve visibility and licensing unless explicitly asked to change
  them. Presentation work never implies making a private repository public
  or adopting a new license.
- Assess Releases and Packages separately. Keep useful distribution paths
  discoverable, preserve unobserved settings and distinguish hiding a
  sidebar section from deleting artifacts or disabling publication.
- Make README edits narrow. Preserve existing links, release distinctions,
  safety guidance and application icons unless their change is in scope.

For GitHub, include an explicit **About sidebar** proposal in the gallery
and handoff: a recommended description plus useful alternatives, a focused
topic set, and ready-to-run `gh` commands for each description choice and
the topic changes. Show what would be retained, added or removed. Follow
[the sidebar guidance](references/github.md#design-the-about-sidebar).
Keep implementing local files while wording choices remain open; present
description alternatives as choices, never as successive updates to run.

## Implement artwork and repository files

Inspect existing assets first. Extend a suitable identity or derive an
original visual idea from the product; do not impose a fixed theme or use
third-party marks that suggest affiliation. Use native vector/code tools
for geometric or existing vector systems. For raster illustration, delegate
to Antigravity's `image-generator` subagent through the `agy` CLI, as
described in [generating images with agy](references/agy-images.md); view
every result before using it. Do not silently install renderers, fonts or
other tools.

Create the logo, editable sources, raster exports and social preview that
the task warrants. Use transparency where useful, check contrast on target
backgrounds, and label conceptual art rather than presenting it as a real
product screenshot. Write these assets and the intended README changes
into the task worktree now. Include durable regeneration guidance when
needed, without committing local evidence or incidental tooling paths.

Build a self-contained local gallery from the actual changed files. Show
current versus intended copy/settings, artwork, small logos on light and
dark backgrounds, and a link to the real diff. Patches may supplement the
diff; they do not replace implementation in the default workflow.

## Check, review and commit

Run the repository's required checks and the artifact checks in
[worktree artifacts](references/worktree-artifacts.md). Inspect actual
rendered images and the gallery at desktop/narrow widths with keyboard
focus. Verify unaffected README content, links, asset properties and
reproducibility where claimed. Refresh affected evidence after fixes.

Use the independent review required by the session or repository. Give
reviewers actual changes, surrounding files and evidence; authors fix and
reviewers verify. Keep work pending while actionable findings remain.
Commit focused completed units on the task branch after their required
checks. A scoped audit-only request needs no implementation commits.

Follow existing push/PR authority and the repository's review process;
this skill grants neither extra publication rights nor merge permission.
Where authorized hosted review is required, open a draft while work is
incomplete and mark it ready after checks and independent review pass.
PR descriptions explain the final change and why for a future commit-log
reader; temporary status and review history belong in comments.

## Provide external commands and hand off

By default, **provide but do not execute hosting mutations**. Produce exact,
shell-safe commands and payload files for supported settings, scoped to
the resolved host and repository, with readback commands. Verify syntax
through local CLI help or current official documentation without testing
writes against live settings. Give precise manual steps, settings links
and asset paths for unsupported upload/sidebar actions. Do not invent
flags or broaden permissions to automate an unsupported operation.

If external mutations were explicitly authorized, retain that authority
without asking again. Recheck their baseline, change only approved fields
and verify by readback. On an ambiguous failure, inspect state and stop if
the outcome cannot be established rather than blindly retrying.

Report the branch, worktree, head commit, changed files/diff, gallery,
checks/review and exact remaining commands/manual steps. State what was
committed, pushed, applied or left for the user; local previews do not
establish hosted rendering or social-cache updates. Leave final review and
landing to the user unless explicitly delegated.

Do not provision, deploy or change visibility incidentally. Before any
billable resource change, explain what it provisions and that it is
billable, then obtain confirmation. Use non-interactive confirmation flags
only after confirmation.
