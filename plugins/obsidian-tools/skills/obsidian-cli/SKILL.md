---
name: obsidian-cli
description: Use the Obsidian CLI to interact with the vault natively—search, read, create, manage tasks, properties, and daily notes. Prefer CLI over raw file I/O for vault-aware operations.
---

# Obsidian CLI

The Obsidian CLI lets you interact with the vault through Obsidian itself, meaning operations respect plugins, templates, properties, wikilinks, and vault settings.

> [!IMPORTANT]
> **Obsidian must be running** for the CLI to work. If it isn't, the first command will launch it (which takes a few seconds).

## When to Use CLI vs Raw File I/O

| Use CLI when… | Use raw file I/O when… |
|---|---|
| Creating files that should use Obsidian templates | Bulk-editing file content with precise line targeting |
| Reading/writing daily notes (respects daily note settings) | Viewing file outlines or code structure |
| Searching vault content (respects excludes, understands links) | Programmatic multi-file transformations |
| Managing properties/frontmatter | Reading files you'll immediately edit with replace tools |
| Listing/querying tasks across the vault | Operations on non-markdown files |
| Appending/prepending to files (respects frontmatter) | When Obsidian isn't running and you don't want to launch it |
| Getting file metadata (size, dates, links) | |

**Rule of thumb:** If the operation is *about the vault* (search, tasks, properties, daily notes), use CLI. If it's *about the file content* (editing specific lines), use file tools. Fall back to shell tools (`ls`, `find`, `grep`) only if the CLI fails — e.g. Obsidian is not running.

## Syntax

```
obsidian [vault=<name>] <command> [parameter=value] [flags]
```

- **Parameters**: `key=value` — quote values with spaces: `name="My Note"`
- **Flags**: Boolean switches, no value needed (e.g., `overwrite`, `newtab`). Commands are silent by default; add `open` where supported to open the result in Obsidian.
- **Vault targeting**: If the terminal's working directory is inside a vault, it's used automatically. Otherwise specify `vault=<name>`.
- **File targeting**:
  - `file=<name>` — matches by filename (like a wikilink, no extension needed)
  - `path=<path>` — exact path from vault root (e.g., `Projects/Initiative/README.md`)
- **Output**: Add `--copy` to any command to copy output to clipboard.

## Command Reference

### Files and Folders

| Command | Purpose | Key Parameters |
|---------|---------|----------------|
| `open` | Open a file in Obsidian | `file`, `path`, `newtab` |
| `create` | Create or overwrite a file | `name`, `path`, `content`, `template`, `overwrite`, `open`, `newtab` |
| `read` | Read file contents | `file`, `path` |
| `append` | Append content to a file | `file`, `path`, `content`, `inline` |
| `prepend` | Prepend content after frontmatter | `file`, `path`, `content`, `inline` |
| `move` | Move a file to another folder | `file`, `path`, `to` |
| `rename` | Rename a file in place | `file`, `path`, `name` |
| `delete` | Delete a file (trash by default) | `file`, `path`, `permanent` |
| `file` | Show file info (size, dates, links) | `file`, `path` |
| `files` | List files in vault | `folder`, `ext`, `total` |
| `folder` | Show folder info | `path`, `info=files\|folders\|size` |
| `folders` | List folders | `folder`, `total` |

### Daily Notes

> [!IMPORTANT]
> Requires the **Daily Notes core plugin**. Check with `obsidian plugins:enabled filter=core`; enable with `obsidian plugin:enable id=daily-notes filter=core`.

| Command | Purpose | Key Parameters |
|---------|---------|----------------|
| `daily` | Open today's daily note | `paneType=tab\|split\|window` |
| `daily:read` | Read today's daily note | — |
| `daily:append` | Append to today's daily note | `content`, `inline`, `open` |
| `daily:prepend` | Prepend to today's daily note | `content`, `inline`, `open` |

### Search

| Command | Purpose | Key Parameters |
|---------|---------|----------------|
| `search` | Search vault content (returns files) | `query`, `path`, `limit`, `total`, `case`, `format=text\|json` |
| `search:context` | Search with matching lines in context | `query`, `path`, `limit`, `case`, `format=text\|json` |

### Tasks

| Command | Purpose | Key Parameters |
|---------|---------|----------------|
| `tasks` | List tasks (vault-wide by default) | `file`, `path`, `daily`, `done`, `todo`, `status="char"`, `verbose`, `total` |
| `task` | Show or update a specific task | `ref=path:line`, `toggle`, `done`, `todo`, `status="char"` |

### Properties and Metadata

| Command | Purpose | Key Parameters |
|---------|---------|----------------|
| `properties` | List properties for a file or vault | `file`, `path`, `counts`, `sort=count`, `format=yaml\|json\|tsv` |
| `property:read` | Read a specific property value | `file`, `path`, `name` |
| `property:set` | Set a property value | `file`, `path`, `name`, `value`, `type` |
| `property:remove` | Remove a property | `file`, `path`, `name` |
| `tags` | List tags | `file`, `path`, `counts`, `sort=count`, `total` |
| `aliases` | List aliases | `file`, `path`, `total`, `verbose` |

### Bases

| Command | Purpose | Key Parameters |
|---------|---------|----------------|
| `bases` | List base files in vault | — |
| `base:query` | Query a base and return results | `file`, `path`, `view`, `format=json\|csv\|tsv\|md\|paths` |
| `base:views` | List views in a base file | `file`, `path` |

### Plugins

| Command | Purpose | Key Parameters |
|---------|---------|----------------|
| `plugins` | List installed plugins | `filter=core\|community`, `versions` |
| `plugins:enabled` | List enabled plugins | `filter=core\|community` |
| `plugin:install` | Install a community plugin | `id`, `enable` |
| `plugin:enable` | Enable a plugin | `id`, `filter=core\|community` |
| `plugin:disable` | Disable a plugin | `id`, `filter=core\|community` |

### Command Palette (escape hatch)

When no dedicated CLI command exists, any Obsidian command can be executed by ID:

| Command | Purpose | Key Parameters |
|---------|---------|----------------|
| `commands` | List available Obsidian commands | `filter=<prefix>` |
| `command` | Execute an Obsidian command by ID | `id=<command-id>` |

### Links and Graph

| Command | Purpose | Key Parameters |
|---------|---------|----------------|
| `links` | List outgoing links from a file | `file`, `path`, `total` |
| `backlinks` | List backlinks to a file | `file`, `path`, `counts`, `total` |
| `orphans` | List files with no incoming links | `total`, `all` |
| `deadends` | List files with no outgoing links | `total`, `all` |
| `unresolved` | List unresolved (broken) links | `total`, `counts`, `verbose` |

### History and Versions

| Command | Purpose | Key Parameters |
|---------|---------|----------------|
| `history` | List file history versions | `file`, `path` |
| `history:read` | Read a specific history version | `file`, `path`, `version=<n>` |
| `history:restore` | Restore a previous version | `file`, `path`, `version=<n>` |
| `diff` | Compare file versions | `file`, `path`, `from=<n>`, `to=<n>` |

### Vault Utilities

| Command | Purpose | Key Parameters |
|---------|---------|----------------|
| `vault` | Show vault info | `info=name\|path\|files\|folders\|size` |
| `vaults` | List known vaults | `verbose`, `total` |
| `wordcount` | Count words and characters | `file`, `path`, `words`, `characters` |
| `bookmarks` | List bookmarks | `total`, `verbose` |
| `recents` | List recently opened files | `total` |
| `random:read` | Read a random note | `folder` |
| `version` | Show Obsidian version | — |

More command families exist (sync, themes, snippets, tabs, hotkeys) — run `obsidian help` for the full list.

## Practical Examples

### Daily workflow
```bash
# Read today's daily note (requires Daily Notes plugin)
obsidian daily:read

# Add a task to today's note
obsidian daily:append content="- [ ] Review the pricing proposal"

# Check open tasks across the vault
obsidian tasks todo

# Check tasks in today's daily note only
obsidian tasks todo daily
```

### File operations
```bash
# Create a doc with frontmatter
obsidian create path="Projects/New Initiative/README.md" content="---\ntags: [project, active]\nstatus: discovery\n---\n\n# New Initiative\n\n## Problem Statement\n"

# Create from a template
obsidian create name="Sprint Retro" template="Meeting Notes"

# Read a file by name (wikilink-style, no extension)
obsidian read file="Discovery"

# Append a decision to a log
obsidian append path="Projects/New Initiative/decisions.md" content="\n## 2026-07-05: Pricing model\n- **Decision**: ...\n- **Rationale**: ...\n"
```

### Search and discovery
```bash
# Find all mentions of a topic
obsidian search query="pricing logic" limit=10

# See the matching lines in context
obsidian search:context query="pricing logic" limit=10

# Find a file by name
obsidian search query="file:README.md"

# Search within a folder, JSON output for structured processing
obsidian search query="risk" path="Projects" format=json
```

### Properties and metadata
```bash
# Set status on a document
obsidian property:set path="Projects/New Initiative/README.md" name=status value=active

# Add tags
obsidian property:set file="Discovery" name=tags value="[discovery, h2]" type=list

# List all tags in the vault with counts
obsidian tags counts sort=count
```

> [!NOTE]
> Command reference verified against **Obsidian 1.13**. The CLI is still evolving: if a command errors unexpectedly, run `obsidian help <command>` to check current syntax before falling back to shell tools.
