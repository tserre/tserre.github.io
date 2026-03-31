---
layout: course-sidebar
title: Final Project
subtitle: <span class="course-code">CPSY 1950 -</span> Spring 2026<br><span class="course-name">Deep Learning in Brains, Minds & Machines</span>
---

## Overview

For the final project, you will run behavioral experiments on deep learning models, treating them as cognitive subjects — the same way cognitive psychologists run experiments on human participants. The goal is to assess whether these models show human-like behavioral signatures on well-established cognitive tasks, and to use those comparisons to illuminate something about the nature of their representations.

This is a group project (pairs of 2). Group assignments are finalized — check Ed for your partner. The written poster is a shared deliverable; both partners receive the same score. The oral presentation is graded individually — both partners must be able to present the work independently.

---

## Starting Point: The Centaur / Psych-101 Dataset

Your starting point is the Psych-101 dataset (Binz et al., 2025): trial-by-trial behavioral data from 160 cognitive psychology experiments across 60,000+ human participants, formatted as natural language transcripts. It was used to train Centaur, the foundation model of human cognition we discussed in class.

Psych-101 is a natural starting point: prompts and task structures are already formatted for LLM input, human behavioral data is built in, and the dataset spans a broad range of cognitive domains (decision-making, memory, learning, reasoning, perception). Dataset: [`marcelbinz/Psych-101`](https://huggingface.co/datasets/marcelbinz/Psych-101) on HuggingFace.

Even if you plan a different final experiment, start here to build and debug your pipeline. Running one task end-to-end lets you get the API calls, logprob extraction, and alignment computation right before worrying about your own experimental design.

You are not required to use Psych-101. Vision/VLM experiments or tasks outside Psych-101 are equally welcome — discuss with your TA during studio sessions. What matters: a principled experiment with at least two models compared to each other and to human data from the literature.

---

## Confounds in Model Behavioral Experiments

Running cognitive experiments on deep learning models is harder than it looks. The confounds below are the most common ways projects go wrong — all covered in class.

Given the time constraints, you are not expected to address every confound. You must explicitly tackle at least one with a concrete mitigation strategy (in your Methods slide). For the others, discuss how they might affect your conclusions in the Open Questions & Conclusions slide — acknowledging what you could not control for is a sign of scientific maturity.

### 1. Training data contamination and spurious cues

Classic cognitive psychology tasks appear extensively in published literature and internet text that LLMs were trained on. A model that "performs" like humans may simply have learned the expected pattern from training data rather than anything resembling the cognitive processes humans use. This applies to every model and dataset — including Psych-101, which is publicly available and may be in frontier model training sets.

The Winograd Schema Challenge appeared solved (≥90% accuracy) until Elazar et al. (2021) showed models were exploiting lexical shortcuts, not actual coreference reasoning. Controlling for those shortcuts dropped performance to 25–34%.

One approach: use counterfactual or adversarial variants — change surface features (cover stories, object labels, numerical values) while preserving the abstract structure. Compare behavior across models with different training sets.

### 2. Aggregate fit ≠ process fidelity

A model can match average human performance while having completely different trial-level dynamics. Centaur achieves impressive aggregate NLL scores yet fails to reproduce learning curves and sequential dependencies at the trial level. Matching performance does not mean matching process.

Where possible, report not just overall accuracy, but learning curves (how behavior changes over trials), sequential dependencies (does choice on trial N depend on trial N−1?), and error distributions.

### 3. Autoregressive artifacts

Autoregressive training leaves systematic behavioral fingerprints — left-to-right asymmetries, recency biases, sensitivity to prompt ordering — that have no analog in human cognition. When you observe a behavioral pattern, ask: could this be an artifact of how the model was trained?

Test sensitivity to prompt ordering, trial order, and framing. Include control conditions that vary surface features while keeping the task structure constant.

### 4. Chain-of-thought consistency

Chain-of-thought (CoT) prompting substantially changes LLM choice distributions. Be consistent: use CoT or no CoT across all models and conditions, and report which you used. If you vary CoT, treat it as an independent variable.

---

## Available Models

All experiments must use models accessible through the course API (CCV LiteLLM). You are not expected to set up or pay for your own model access.

Standard-access models (available from the start):

- `gpt-oss` — high-capability open-weight model; recommended for main runs
- `Llama-3.3-70B-Instruct` — different architecture; useful for model-to-model comparison
- `Mistral-Large-3` — another architecture variant for comparison
- `gemini-3-flash-preview` — fast and inexpensive; supports vision inputs — good for VLM piloting

Log probabilities are accessible for open-weight models — needed for NLL alignment scoring.

Frontier models (provided after TA sign-off in Studio II):

- `gpt-5.2`
- `gpt-5.4`
- `gemini-2.5-pro` — supports vision inputs (VLM)
- `claude-sonnet-4-5` — supports vision inputs (VLM)

Frontier models are gated — your TA must confirm your pilot experiment is working before you get access. If you plan a vision/VLM experiment, flag this to your TA during Studio I.

Your API key will be sent to your Brown email via Virtu (Brown's encrypted email service).

---

## Workflow & Timeline

- **Tue Mar 31 — Studio I:** Project jumpstart: walk through Tekin's demo notebook, pick a task from Psych-101, and begin running your replication pipeline on open-weight models.
- **Thu Apr 2 — Studio II:** Working replication of a Centaur experiment; clear follow-up plan. Complete open-weight runs; get TA sign-off to access frontier models.
- **Sat Apr 5, 2:00 pm — Draft poster due** on Canvas (intermediate checkpoint).
- **Tue Apr 7, 2:00 pm — Final poster due** on Canvas.
- **Tue Apr 7 — Poster session A:** Presentations during class (2:30–3:50 pm). Session (A or B) randomly assigned and announced in class on Apr 7 — prepare for both days.
- **Thu Apr 9 — Poster session B:** Presentations during class (2:30–3:50 pm).
- **Thu Apr 9, 11:59 pm — Peer feedback due** on Gradescope.

The studio sessions are your primary working time. You've already been introduced to the Psych-101/Centaur dataset through your prior reflection — Studio I is where you put it into practice. Studio II is the checkpoint.

---

## Deliverables

### Submission

Submit your poster as a PDF on Canvas before class on April 7 (2:00 pm). Your submission will be graded across two separate Canvas assignments — Research Quality (50 pts) and Written Poster (25 pts) — both sourced from the same PDF. Oral Presentation (25 pts) is entered by instructors and TAs after your presentation. Peer feedback (20 pts) is submitted separately on Gradescope by end of day April 9.

### Poster: 4 letter-sized slides

Produce four letter-sized slides in a format suitable for a mini-conference poster. One clear idea per slide; figures preferred over text walls.

1. **Motivation.** What cognitive phenomenon are you studying? Why is it interesting to test on this model? What is your hypothesis? Connect to at least one course theme.
2. **Methods.** Task design, models tested, number of trials, prompting approach. Be specific — we should be able to replicate your experiment from this slide alone. Describe how you controlled for confounds.
3. **Results.** Main findings: performance curves or choice distributions, comparison to human data from the literature, model-to-model comparison. All figures must have labeled axes and a caption.
4. **Open Questions & Conclusions.** What do your results tell us? How do they connect to course themes (Marr's levels, aggregate vs. trial-level, prediction vs. understanding)? Key limitations and what you would do next.

You may include one optional appendix slide for supplementary figures or methodological details. It will not be presented but may be referenced during Q&A.

Formatting: font ≥ 16pt body text, clean layout, good contrast.

---

## Poster Presentations

Presentations take place on Tuesday April 7 and Thursday April 9 during class (2:30–3:50 pm), approximately 13–14 groups per session. All groups attend both sessions.

Your presentation day (A or B) is randomly assigned and announced in class on April 7 — prepare for both days.

Each session (80 min) is split into two rounds of ~35 minutes. Half the groups present while the other half tours; then they switch. The session closes with a short synthesis discussion.

If you are presenting: stand by your laptop for the full 35 minutes. Give a 3-minute walk-through when visitors arrive, then take questions. You will present multiple times to different visitors. Three minutes goes fast — roughly 45 seconds per slide. Practice out loud. Do not read from the slides.

If you are touring: visit as many groups as you can in 35 minutes and complete a Gradescope entry for each (see Peer Feedback below). Think comparatively — are there patterns across experiments? Do different groups converge on similar conclusions or tell different stories?

On April 9, we close with the question we have been building toward all semester: after neural alignment, behavioral alignment, and now your own experiments — have we answered Crick's challenge?

---

## Peer Feedback (20 points)

Due end of day Thursday April 9, submitted on Gradescope (link shared on Ed before class).

While touring, complete one Gradescope entry for each group you visit — minimum 5 groups across both presentation days combined. For each group, rate three components on a 1–5 scale and write 1–2 sentences explaining your score:

1. Research quality (hypothesis, experiment design, results)
2. Written poster (scientific narrative, conclusions, visual clarity)
3. Oral presentation (walk-through clarity, depth of answers)

Also answer: one thing that surprised you, or a question you'd want them to pursue.

Peer feedback is graded on quality, not just completion. Generic comments will not earn full credit.

---

## Grading (100 points + 20 pts peer feedback)

All project assignments count toward the weekly work category.

### Research quality — 50 points

- Hypothesis & framing (10 pts): Specific, testable hypothesis with a predicted direction; explicit connection to at least one course theme (Marr's levels, aggregate vs. trial-level, divergence problem, autoregressive artifacts, etc.)
- Experiment design (15 pts): Reproducible protocol; explicit treatment of at least one confound with a mitigation strategy; both open-weight and frontier model runs; appropriate number of trials.
- Results & analysis (25 pts): At least one comparison to human data from the literature; trial-level analysis (learning curves, error patterns, or sequential dependencies) beyond aggregate accuracy; model-to-model comparison.

### Written poster — 25 points

- Conclusions & scientific narrative (15 pts): Findings synthesized into a coherent story; identifies what Marr level the experiment speaks to; honest acknowledgment of limitations; genuine follow-up questions.
- Visual design & clarity (10 pts): Figures with labeled axes and captions; layout readable at a glance; one clear idea per slide.

### Oral presentation — 25 points

Both partners are expected to be able to present the work independently.

- Clarity and delivery (15 pts): Walk-through covers all 4 slides in ~3 min; narrative is clear to someone unfamiliar with the task; visuals support the explanation.
- Depth and Q&A (10 pts): Responses show genuine understanding of the experiment, the confounds, and the course themes; uncertainty acknowledged where appropriate.

### Peer feedback — 20 points

Graded on quality of written feedback submitted on Gradescope (see above).

---

## Resources

- Demo notebook: [github.com/TekinGunasar/CPSY-1950-Project-Demo](https://github.com/TekinGunasar/CPSY-1950-Project-Demo) — complete example with NLL alignment scoring and open-environment simulation.
- Psych-101 dataset: [`marcelbinz/Psych-101`](https://huggingface.co/datasets/marcelbinz/Psych-101) on HuggingFace — 160 experiments, 60,092 participants, trial-by-trial natural language transcripts.
- API access: CCV LiteLLM endpoint + API key sent to your Brown email via Virtu.
- Questions: Post on Ed Discussion — this is the primary channel for all project questions. Office hours: Wednesdays 1:00–2:00 pm, Carney Innovation Hub Room 402.
