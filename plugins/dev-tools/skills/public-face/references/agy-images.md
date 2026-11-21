# Generating images with agy

Claude Code cannot generate raster images itself. Antigravity can: its CLI,
`agy`, includes a built-in `image-generator` subagent that turns a written
brief into a PNG. This skill sends each raster image to that subagent and
treats the returned file like any other input: view it, check it and keep it
or regenerate it.

If this skill is running inside Antigravity, invoke `image-generator`
directly and skip the CLI call.

## Check availability

Run `command -v agy`. If it is missing or a call fails because no one is
signed in, do not install or sign in on the user's behalf. Fall back to
vector/code artwork, and report that raster art was skipped and why.
Missing image generation never blocks the rest of the work.

## Call it

Run one call per image from the task worktree. Give an absolute output path
inside the worktree's ignored local review directory, then copy the chosen
image into the repository's asset location after review:

```bash
agy -p "Invoke the built-in image-generator subagent with this brief:
<brief>
Save the final PNG as <absolute path>. If the subagent saves elsewhere,
copy the file to that path. Reply with only the absolute path of the
saved file." --print-timeout 300s
```

- The default mode writes the file without prompting. Do not add
  `--dangerously-skip-permissions`. `--mode auto` may be unavailable on the
  account; if so, agy warns and uses the default mode.
- Treat the reply as a claim. Confirm that the file exists at the path, then
  inspect it with `file` and by viewing the image.
- Run independent images as separate calls. They can run in parallel.

## Write the brief

The subagent only sees the brief, so make it self-contained:

- **Subject:** what the image shows, taken from the product's actual
  purpose rather than generic tech imagery.
- **Style and palette:** match existing branding where it exists. Name the
  colors.
- **Composition:** aspect and framing, such as a square icon with a centred
  mark, or a wide banner with empty space on one side for a title.
- **Exclusions:** no text or lettering (generators garble it, so add text
  later with vector tools), no logos or marks belonging to third parties,
  and nothing that looks like a real product screenshot.

## Know the output

A tested call returned a 1024 × 1024 RGB PNG of about 500 KB with no alpha
channel. Plan around that and re-check, since the output may change:

- **Transparency:** do not expect an alpha channel. Ask for a flat, solid
  background. For a logo that needs transparency, prefer vector artwork or
  a vector mark composed over the generated illustration.
- **Social preview size:** request a wide composition, then crop and resize
  to the host's current requirements with a tool that is already installed
  (on macOS, `sips`). Verify the final dimensions and file size.
- **Regeneration notes:** if regeneration guidance is committed, record the
  brief text and the fact that agy's `image-generator` produced the image.
  Leave out machine-specific paths.
