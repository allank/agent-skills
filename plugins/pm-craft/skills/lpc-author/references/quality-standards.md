# Lean Product Canvas — Quality Standards

Use these standards to critique user inputs ruthlessly. For each section: "good" vs "bad" examples, and a check the PM can apply themselves.

## 1. Problem
- **Gold standard:** A specific pain point, ideally backed by data, that explains *why* the user is struggling.
- **Good:** "Inventory managers lose 4 hours/week manually reconciling stock because the export format doesn't match the ERP import." *(Specific, measurable pain.)*
- **Bad:** "The inventory system lacks an auto-reconcile button." *(A feature disguised as a problem.)*
- **Bad:** "Inventory management is inefficient." *(Vague.)*
- **Check:** Ask "Why is that a problem?" Can you go one layer deeper? If not, you haven't reached the root.

## 2. Customer
- **Gold standard:** A narrow, specific persona with shared behaviours and needs.
- **Good:** "Junior Compliance Officers at mid-sized fintechs (Series B–C)."
- **Bad:** "Fintech companies." *(Too broad — the CEO has different problems than the intern.)*
- **Bad:** "Everyone who uses the internet." *(Fatal.)*
- **Check:** Could you picture one person? Could you find them on LinkedIn?

## 3. Outcomes
- **Gold standard:** A behavioural change in the customer or a measurable business result. Format: *"Who does what by how much."*
- **Good:** "Reduce 'time to reconcile' for inventory managers from 4 hours to 15 minutes."
- **Bad:** "Launch the auto-reconcile feature." *(That's an output, not an outcome.)*
- **Bad:** "Increase customer satisfaction." *(Vanity metric.)*

## 4. Jobs To Be Done (JTBD)
- **Gold standard:** Christensen/Ulwick format. Covers functional, emotional, and social jobs.
- **Format:** *"When **[situation]**, I want to **[motivation]**, so that I can **[expected outcome]**."*
- **Good:** "When I'm closing the month-end books, I want to trust the data matches the warehouse instantly, so I can go home on time without anxiety about audits."
- **Bad:** "I want to use the software to count stock." *(Purely functional — misses the emotional "why".)*

## 5. Solution
- **Gold standard:** A conceptual description of *how* we solve the problem. Not a spec list, not UI details.
- **Good:** "Automated middleware that maps CSV exports to ERP schemas with one-click validation."
- **Bad:** "A blue button on the top right." *(Too detailed.)*
- **Bad:** "AI blockchain integration." *(Buzzwords.)*
- **Check:** Does this directly solve the problem in section 1?

## 6. Hypotheses
- **Gold standard:** A falsifiable statement linking Solution to Outcome.
- **Format:** *"We believe that **[outcome]** will be achieved if **[customer]** attains **[benefit]** with **[solution]**."*
- **Check:** If this fails, would we kill the project? If not, it's not the core hypothesis.

## 7. Riskiest Assumption
- **Gold standard:** The single thing that, if false, destroys the business case.
- **Good:** "Users are willing to trust an automated system with financial data." *(Value risk.)*
- **Bad:** "We might not be able to build it in React." *(Technical risk — usually solvable.)*
- **Bad:** "A competitor might launch a similar feature." *(External risk — focus on what you can validate internally first.)*
