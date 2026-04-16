# Week 14 — Prompts & Rubrics (instructor / TA use)

**CPSY 1950 · Spring 2026 · Deep Learning in Brains, Minds & Machines**

*Private — do not post to the course website.*

## Overview

Week 14 has two deliverables:

1. **Tuesday reading response** — due **Tue 4/21, 2:00pm** (before lecture).
   Based on the two ICLR 2020 papers from the Serre Lab on recurrence and feedback in vision.
2. **Course-wrapping reflection** — due **Sun 4/26, 2:00pm** (after Thursday's guest lecture).
   A synthesis piece looking back across the semester. *No new reading.*

Both are graded on the standard course principle: **engagement, specificity, and honest critical thinking** matter more than polished prose. You will not be graded on writing style. Please keep each submission concise — roughly **500–800 words** total per deliverable is plenty.

Don't forget the **AI use statement** at the end of each submission (per syllabus).

---

## Tuesday 4/21 — Reading response

### Readings

1. Kim, Linsley, Thakkar & Serre (2020). *Disentangling neural mechanisms for perceptual grouping.* ICLR. [arxiv](https://arxiv.org/abs/1906.01558)
2. Linsley, Kim, Ashok & Serre (2020). *Recurrent neural circuits for contour detection* (γ-net). ICLR. [arxiv](https://arxiv.org/abs/2010.15314)

*Read Kim et al. first (the conceptual scaffolding), then Linsley et al. (the concrete model).*

### Prompt (answer all five, numbered)

1. In 2–3 sentences, summarize the distinct computational roles that Kim et al. attribute to **bottom-up, horizontal, and top-down** connections. Which of these roles most surprised you, and why?
2. Kim et al. use synthetic tasks; Linsley et al. use natural contour detection. **What is gained and what is lost** by moving from synthetic → natural stimuli when testing claims about recurrent computation?
3. The γ-net exhibits a **tilt illusion that was not designed in**. Why do the authors treat this as evidence for the model — and what alternative interpretation should we keep on the table?
4. **Propose one experiment** (behavioral, neural, or computational) that would further test the account these two papers put forward. Be concrete about the prediction it would make and what outcome would falsify it.
5. Pick one claim from either paper that you think is **under-supported**. State it precisely and say what evidence would convince you.

### Rubric

Each item is scored individually on the scale below; the final grade is the overall pattern across items.

| Mark | Meaning | What it looks like |
|---|---|---|
| **✓+** (full + bonus) | Exceeds expectations | Engages substantively with the paper's actual argument, references specific figures / experiments / claims, raises a non-obvious observation or critique. |
| **✓** (full credit) | Meets expectations | Addresses the question directly, shows clear evidence of having read the relevant section, makes a specific and reasonable point. |
| **✓−** (partial credit) | Below expectations | Answer is vague, generic, or could have been written without reading the paper. |
| **0** | Not attempted / missing | Question not addressed, or answer is off-topic. |

**Dimensions considered (across the whole submission, not per-item):**

- **Completeness.** All five items addressed; not skipped or combined.
- **Engagement with the papers.** Evidence of having actually read them — specific references to figures, datasets, connection types, results, or the γ-net mechanism (not just restating the abstract).
- **Specificity.** Claims are concrete (e.g., *"Figure 3 shows X on task Y"*), not generic (*"the model performed well"*).
- **Critical thinking.** Goes beyond summary: identifies assumptions, alternative interpretations, or concrete predictions. Items 3–5 in particular are about this.

**Common pitfalls to avoid:**

- Restating the abstract in your own words without engaging with the design.
- Treating Item 4 ("propose one experiment") as a wishlist — we want a specific prediction with a falsifiable outcome.
- Being vague about the *critique* in Item 5. "This could be better" is not a critique; "claim C isn't supported because the control X is missing" is.

**AI use:** permitted per syllabus — clarifying terminology, brainstorming critiques, suggesting related papers. Not permitted: having AI write or substantially rewrite your response. Disclose at the end.

---

## Sunday 4/26 — Course-wrapping reflection

### Prompt

Looking back on the semester, pick **one** of the big tensions the course has surfaced:

- *Prediction vs. understanding* (Week 5 — Serre & Pavlick; Marcus / LeCun talks)
- *Neural alignment as evidence for model-as-mechanism* (Week 8 — Kriegeskorte & Douglas; Doerig et al.; Linsley, Feng & Serre)
- *Emergence — real phenomenon or metric artifact?* (Week 4 — Firestone)
- *Interpretability: science vs. engineering* (Weeks 6–7 — Olah et al.; Thorpe; nostalgebraist; Anthropic)
- *Can models fine-tuned on human behavior (e.g., Centaur) count as models of human cognition, or only as predictors of it?* (Week 9 — Binz et al.; Brady et al.)

**State your current position in 1–2 sentences.** Then:

1. Give the **single strongest paper or result** from the course that supports your position, and explain why it's the strongest.
2. Give the **single strongest paper or result that pushes back** on your position, and say honestly whether you've fully accounted for it.
3. Describe **one concrete experiment** — behavioral, neural, or model-internal — whose outcome would move you off your position. Be specific about the prediction and the falsifying outcome.

**Finish with one sentence:** *what would you most want to work on if you had a lab?*

### Rubric

This piece is graded holistically on a 4-point scale.

| Mark | Meaning | What it looks like |
|---|---|---|
| **✓+** | Exceeds expectations | Clear, committed position; strongest-support and strongest-opposing citations are well-chosen and specific; the proposed experiment has a precise prediction and falsifying outcome; last sentence reads as a real research interest, not a throwaway. |
| **✓** | Meets expectations | Takes a position; supports and opposes it with specific papers from the course; experiment is concrete enough to be evaluated; all required parts addressed. |
| **✓−** | Below expectations | Position is hedged to the point of saying nothing; citations are generic ("as we discussed in class"); experiment is a wishlist rather than a test. |
| **0** | Missing / off-prompt | Did not pick a tension, or essay is a generic summary of the course. |

**Dimensions considered:**

- **Commitment.** You took a real position, not a diplomatic non-answer. It's fine — encouraged — to take a position you don't fully believe, as long as you argue it.
- **Use of course materials.** Your support and opposing citations come from readings, lectures, or lightning talks we've actually done. Cite them specifically (paper, week, or lecture).
- **Intellectual honesty.** The "pushing back" section is the most important. We want to see you genuinely grapple with the strongest counter-evidence, not knock down a strawman.
- **Falsifiability.** Your experiment should have a real risk of failing. If every outcome confirms your position, it's not a test.

**Common pitfalls to avoid:**

- Writing a course summary instead of a position piece. We are not asking *"what did you learn?"* — we are asking *"what do you now believe, and why should we believe you?"*
- Picking the opposing paper to be an easy win. Find the strongest counter-argument you can.
- Last-sentence throwaway. "I'd want to work on AI safety" is fine if specific; "something with brains and AI" is not.

**Length.** 500–800 words is ideal. Shorter is fine if you're crisp; longer is rarely better.

**AI use:** permitted for brainstorming which tension to pick and for clarifying what a paper actually claimed. Not permitted for drafting the reflection itself — the whole point is *your* position. Disclose at the end.

---

## Submission

Both deliverables are submitted on Canvas (links on the course schedule page). Late-work policy applies per syllabus (20% / day). Extensions require advance notice.

Questions? Post on Ed Discussion or come to office hours (W 1–2pm, Carney 402).
