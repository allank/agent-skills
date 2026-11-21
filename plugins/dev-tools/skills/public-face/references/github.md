# GitHub presentation notes

Read this only for GitHub repositories. Verify current API fields and
platform requirements before depending on them; these are decision points,
not a frozen copy of GitHub's documentation.

## Read the current state

Resolve owner, repository, host and default branch from the actual remote
or connected tool. Do not assume a personal owner, `github.com`, or `main`.
Read repository description, topics, homepage, visibility and detected
license. Inspect releases and relevant distribution links before proposing
sidebar changes. Check for overlapping presentation PRs where applicable.

Use read-only API/CLI calls for the audit. Typical REST resources include
the repository, its releases and file contents at a captured revision;
GraphQL exposes `usesCustomOpenGraphImage` and `openGraphImageUrl`. Use
tools already available and authorized, and account for pagination where
inventory affects a decision.

Keep these distinctions explicit:

- Release/package inventory is not sidebar visibility. A sidebar section
  may be enabled while empty, and useful artifacts may exist when hidden.
- Releases and Packages are independent. Do not hide both merely because
  there are no releases, or treat a package-permission error as no packages.
- When public repository HTML exposes structured sidebar state, inspect
  that state rather than searching page text for headings. This page data
  is not a stable API: if unavailable, record the setting as unverified.
- An unauthenticated page cannot establish the state of a private
  repository. Use already authorized authenticated reads or leave it unknown;
  do not request broader access solely to remove an uncertainty from a pack.
- `usesCustomOpenGraphImage: false` describes the current preview, not
  whether a custom image was ever uploaded and later removed.

Capture only the evidence needed for the proposal. Avoid storing complete
authenticated responses when a few selected metadata fields suffice.

## Design the About sidebar

For the full GitHub presentation workflow, address the repository's About
description and topics even when the artwork needs no changes. Honor a
narrower user scope. Show current values beside the proposed choices in
the gallery and handoff.

Normally offer two or three concise, meaningfully different descriptions,
such as a plain-language purpose, a user outcome or a technical emphasis.
Mark one recommended and briefly explain why. Ground every option in the
same verified product facts; do not invent features to make options differ.
If the current description is already strong, it can be the recommendation.
Honor supplied wording or a request for one description without padding
the result with unnecessary alternatives.

Propose a focused set of topics covering the product's purpose/domain and
useful ecosystem or implementation terms. Show known existing topics,
retained topics and proposed additions; justify any deliberate removal.
Check current naming/count limits using the linked topics documentation.
Avoid confidential identifiers in topic names: GitHub documents that topic
names themselves are public even when a repository is private.

Pair each description with its own exact, shell-safe `gh` command or JSON
payload command, and include the topic-addition commands and readback.
Label alternatives clearly as **choose one**. Do not place all description
updates in one executable sequence: only the last would remain. A
recommendation is not a user selection; while the choice is open, keep
description writes out of any shared runnable command file and provide
the separate choices in the handoff. Honor an already authorized choice
or delegated selection without asking again. Continue repository work.
Use the command patterns below with resolved values, not placeholders.

## Social previews and discovery

Consult [GitHub's social-preview documentation](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/customizing-your-repositorys-social-media-preview)
for current upload eligibility, supported formats and sizing. At the time
this workflow was developed, GitHub recommended 1280 × 640 pixels and a
PNG, JPG or GIF under 1 MB. Treat those as a useful starting point and
recheck before export or upload.

The same documentation distinguishes public repositories from private
repositories with a previous preview upload. If past uploads or present
eligibility are unverified, describe the image as prepared artwork; do
not claim that upload is available or impossible from current preview
metadata alone. Keeping a repository private is a supported outcome.

Check the current [topics guidance](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/classifying-your-repository-with-topics)
when choosing names and limits. Prefer product/domain topics and useful
implementation terms over a long list of loosely related keywords.

GitHub's detected license is evidence to compare with the tracked license
and package declarations, not permission to replace any of them. Leave a
homepage blank when no verified destination exists; do not invent a demo
URL or use a private deployment as a public landing page.

## Produce executable hosting commands

The default handoff provides commands without running mutations. Resolve
the actual host and owner/repository from the selected remote; use explicit
host/repository arguments instead of relying on the user's future current
directory or active account. Verify commands against installed `gh` help
or [the CLI manual](https://cli.github.com/manual/gh_repo_edit), and verify
payload fields against the host's current API documentation.

The patterns below use `forge_host`, `repo_slug`, `repo_url` and
`settings_dir` for clarity. In the delivered command file, assign actual,
shell-quoted values and make payload paths usable from its documented
working directory. `repo_url` is the full URL for that host/repository.
These examples are not instructions to execute writes during preparation.

### Description and homepage

For an About-sidebar choice, the concise form is:

```bash
gh repo edit "$repo_url" --description 'Exact description for this option'
```

Give a separate labeled block for each alternative, with its actual text
and explicit repository URL. Quote the text correctly; prefer the JSON
form below when that makes complex copy safer. For multiple JSON choices,
use distinct payload files and show one command per file. Once wording is
selected, include only that choice in the combined command file.

Prefer a JSON body file so quotes, dollar signs, backticks and newlines in
copy remain data. Create `repository.json` in the ignored settings directory
using a JSON serializer or structured file tool. Include only intended
changes, for example:

```json
{
  "description": "The exact intended description"
}
```

Add `homepage` only for a deliberate verified change. Omit preserved or
unknown fields entirely; use an empty string only for an intentional clear.
Do not include visibility, license, branch or unrelated feature settings.
Provide these commands with resolved variables:

```bash
gh api --hostname "$forge_host" --method GET "repos/$repo_slug" \
  --jq '{description,homepage,topics,visibility}'
gh api --hostname "$forge_host" --method PATCH "repos/$repo_slug" \
  --input "$settings_dir/repository.json" \
  --jq '{description,homepage}'
gh api --hostname "$forge_host" --method GET "repos/$repo_slug" \
  --jq '{description,homepage}'
```

For a simple homepage change, `gh repo edit "$repo_url" --homepage 'verified URL'`
is a supported alternative with correctly shell-quoted values. Do not
assume JSON string escaping is shell escaping. The API patterns deliberately
specify the method rather than depending on `gh api`'s method inference.

### Topics

Prefer additive changes when preserving existing topics, including when
existing topics could not be read. Generate one or more concrete commands:

```bash
gh repo edit "$repo_url" --add-topic 'intended-topic'
gh api --hostname "$forge_host" --method GET "repos/$repo_slug/topics" \
  --jq '.names'
```

Use `--remove-topic` only for explicitly intended removals. A PUT to the
[replace-all-topics endpoint](https://docs.github.com/en/rest/repos/repos#replace-all-repository-topics)
replaces the whole list. Use it only when replacement is deliberate and
the existing topics were read; `topics.json` must contain the complete
intended list, including retained values:

```json
{"names": ["retained-topic", "intended-topic"]}
```

```bash
gh api --hostname "$forge_host" --method PUT "repos/$repo_slug/topics" \
  --input "$settings_dir/topics.json" --jq '.names'
gh api --hostname "$forge_host" --method GET "repos/$repo_slug/topics" \
  --jq '.names'
```

If credentials are unavailable, finish local work and provide supported
commands with the access prerequisite stated. Do not replace an unknown
topic list with an assumed empty baseline. If there is no known remote,
report that hosted commands need a destination; do not invent one.

### Social preview and sidebar controls

Do not invent `gh` upload/sidebar flags or assume the repository PATCH
endpoint supports those settings. When the available tooling has no
supported command, provide precise manual steps with resolved links and
paths:

- Social preview: open the repository's settings URL, find **General →
  Social preview → Edit → Upload an image**, and choose the actual export
  inside the task worktree. Include its path and dimensions. If eligibility
  is unknown for a private repository, say to inspect availability; never
  suggest changing visibility merely to enable an upload.
- Sidebar: open the repository root URL, use the **About** gear, and change
  only the intended Releases/Packages checkboxes, then save. If current UI
  labels differ, verify the available controls instead of inventing steps.

Link the current [update-repository API documentation](https://docs.github.com/en/rest/repos/repos#update-a-repository)
when explaining supported metadata actions. Validate shell syntax and JSON
locally; do not test commands by changing live settings.

## If execution is explicitly authorized

Refresh the relevant current values before applying. Stop for unexpected
concurrent differences that invalidate the intended change. Modify only
authorized fields and read them back. For uploads, verify the rendered
preview metadata and intended image where accessible; distinguish GitHub
verification from third-party social-platform caches. Record unsupported,
failed or unverified actions instead of claiming success.
