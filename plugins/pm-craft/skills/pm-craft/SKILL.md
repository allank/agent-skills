---
name: pm-craft
description: Router for the pm-craft plugin — matches your need to the right skill and tells you what to type.
disable-model-invocation: true
---

# pm-craft Router

Match the user's need to one skill below and tell them what to type. Most of these are user-invoked: you cannot fire them yourself — recommend the command, don't attempt the invocation. If the user passed their problem as an argument, recommend one skill with a sentence of rationale (two skills only if genuinely torn), then stop.

| The user wants to… | Skill | How it fires |
|---|---|---|
| Stress-test a product idea by being interviewed — six PM lenses, produces a conviction brief | product-grill | Fires on its own when you describe an idea to stress-test |
| Widen the lens on a strategic problem — Cynefin, Three Horizons, Wardley, Idealised Design | thinking-partner | Fires on its own ("think bigger", "sanity check", or name a framework) |
| Watch an idea attacked and defended — simulated Visionary-vs-Skeptic debate, then a synthesis | product-debate | Type `/product-debate` |
| Build a Lean Product Canvas, coached Socratically section by section | lpc-author | Type `/lpc-author` |
| A narrative, step-by-step walkthrough document of code, docs, or a system | linear-walkthrough | Type `/linear-walkthrough` |
| An interactive HTML visualisation of a process, algorithm, or decision logic | interactive-explainer | Type `/interactive-explainer` (best fed a walkthrough) |
| Analyse a problem through mental-model lenses — 11 personas, 20 frameworks, four modes | mind-ensemble | Type `/mind-ensemble` |

Disambiguation for the three that overlap: **product-grill** interviews *you* (your conviction is the subject); **product-debate** argues *at* you (the idea is the subject, you watch); **mind-ensemble** analyses through chosen lenses (the lens does the work, alone or composed).
