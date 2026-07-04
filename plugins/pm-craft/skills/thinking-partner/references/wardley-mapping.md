# Wardley Mapping

A strategic mapping technique by Simon Wardley for visualising the structure of a business or service, showing the components needed to serve user needs and how evolved (commoditised) each component is.

## Core Concepts

### The Map Axes
- **Y-Axis (Visibility)**: How visible is the component to the user?
  - Top: User-facing needs
  - Bottom: Hidden infrastructure/dependencies
- **X-Axis (Evolution)**: How evolved/commoditised is the component?
  - Genesis → Custom-built → Product → Commodity/Utility

### Evolution Stages

| Stage | Characteristics | Approach |
|-------|-----------------|----------|
| **Genesis** | Novel, uncertain, requires experimentation | Explore, tolerate failure |
| **Custom-built** | Understood but bespoke, built for purpose | Differentiate, learn |
| **Product** | Increasingly standardised, multiple suppliers | Compete on features |
| **Commodity/Utility** | Standardised, interchangeable, pay-per-use | Outsource, automate, race to efficiency |

### The Value Chain
Components at the top of the map depend on components below them. A user need (top) might require an application, which requires a platform, which requires compute, which requires power.

## Strategic Patterns

### Build vs Buy Decision
- **Build** when in Genesis/Custom (competitive advantage, learning)
- **Buy/Rent** when in Product/Commodity (efficiency, focus elsewhere)
- **Warning**: Building commodity components is waste; buying genesis components is often impossible

### Inertia
Organisations resist moving components along the evolution axis due to:
- Past success ("this is how we've always done it")
- Sunk costs in custom solutions
- Political capital tied to existing approaches

### Gameplay
- **Exploit inertia**: Move faster than competitors stuck on old models
- **Commoditise complements**: Make what you depend on cheaper (e.g., open-source it)
- **Create constraints**: While others are stuck, build new capabilities

## Archetypes: Pioneers, Settlers, Town Planners

Different types of work require different mindsets. Wardley identifies three archetypes:

| Archetype | Focus | Characteristics | Failure Mode |
|-----------|-------|-----------------|--------------|
| **Pioneers** | Genesis/exploration | Thrive in uncertainty, prototype rapidly, comfortable with failure | Bored by stability; may move on before work is productised |
| **Settlers** | Custom → Product | Take pioneer ideas and make them real products; bridge chaos and order | Frustrated by both pure exploration and pure efficiency |
| **Town Planners** | Product → Commodity | Industrialise, optimise, scale; drive efficiency and reliability | May resist innovation; can stifle pioneers |

### Applying the Archetypes
- **Team composition**: Match work to people. Don't put a Town Planner on a Genesis project, or a Pioneer on commodity optimisation.
- **Handoff points**: Recognise when work needs to move between archetypes (e.g., pioneer prototype → settler productisation).
- **Organisational friction**: Tension between archetypes is natural—they see value differently. Design for healthy handoffs.
- **Self-awareness**: "Am I the right archetype for this work, or should I hand it off?"

## Key Moves for the Thinking Partner

- **Map dependencies**: "What does this capability depend on? How evolved are those dependencies?"
- **Challenge evolution assumptions**: "Are we treating this as custom when it's actually becoming a commodity?"
- **Identify inertia**: "What's stopping this component from evolving? Is that a real constraint or organisational resistance?"
- **Strategic positioning**: "Where on this map should we be investing vs outsourcing?"
- **Anticipate movement**: "This component is moving toward commodity—what's our plan when it does?"

## When to Use

- **Build vs buy decisions**: Clarify which components are strategic vs table stakes
- **Technical debt discussions**: Understand whether a custom solution is justified or inertia
- **Competitive strategy**: Visualise where you have advantage and where you're exposed
- **Communication**: Align teams on where to invest and why

## Source
Simon Wardley. See: [Learn Wardley Mapping](https://learnwardleymapping.com/) and the [Wardley Maps book](https://medium.com/wardleymaps) (free on Medium).
