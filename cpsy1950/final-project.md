---
layout: course-sidebar
title: Final Project
subtitle: <span class="course-code">CPSY 1950 -</span> Spring 2026<br><span class="course-name">Deep Learning in Brains, Minds & Machines</span>
---

## Overview

For the final project, you will run **behavioral experiments** on deep learning models, treating them as cognitive subjects — exactly the way cognitive psychologists run experiments on human participants. The goal is to assess whether these models show human-like behavioral signatures on well-established cognitive tasks, and to use those comparisons to illuminate something about the nature of the computations and associated representations these models have learned.

**This is a group project.** Groups of 2 students. Group assignments are finalized — check Ed for your partner.

**Grades are individual.** The written poster is a shared deliverable and both partners receive the same poster score. The oral presentation is graded individually — both partners are expected to be present and able to present the work independently during the poster session.

---

## Starting Point: The Centaur / Psych-101 Dataset

Your starting point is the **Psych-101 dataset** (Binz et al., 2025). Psych-101 is a publicly available collection of trial-by-trial behavioral data from **160 cognitive psychology experiments** across 60,000+ human participants, formatted as natural language transcripts. It was used to train Centaur, the foundation model of human cognition you read about in Week 9.

**Why start here?**
- The prompts, stimuli, and task structures are already formatted for LLM input.
- Human behavioral data is built in — you have ground truth to compare against.
- The dataset spans a broad range of cognitive domains (decision-making, memory, learning, reasoning, perception), so you can find something relevant to a question you care about.
- You already understand the conceptual framing from the W9 reading and lightning talks.

The dataset is publicly available on HuggingFace: [`marcelbinz/Psych-101`](https://huggingface.co/datasets/marcelbinz/Psych-101).

**Start with Psych-101 to build and debug your pipeline.** Even if you end up running a different experiment for your final project, loading Psych-101 and replicating one task from the dataset is the fastest way to get your NLL scoring pipeline working end-to-end. Human trial data and prompt formatting are already provided, so you can focus on getting the API calls, logprob extraction, and alignment computation right before worrying about experimental design. Once the pipeline runs cleanly on a Psych-101 task, adapting it to your own experiment is straightforward.

**You are not required to use Psych-101.** If you have a different experiment in mind — including vision/VLM experiments, or a task not covered in Psych-101 — that is equally welcome. Discuss your proposal with an instructor during studio sessions. What matters in either case: a principled experiment, at least two models compared to each other and to human data from the literature.

---

## A Critical Warning: Confounds in Model Behavioral Experiments

Running cognitive experiments on deep learning models is harder than it looks. The confounds below are the most common ways projects go wrong — all of them were covered in the W8 and W9 lectures and lightning talks.

Given the time constraints of this project, you are not expected to fully address every confound. **You must explicitly tackle at least one** with a concrete mitigation strategy (described in your Methods slide). For the others, you should be aware of them and discuss how they might affect your conclusions in the **Open Questions & Conclusions slide** — acknowledging what you could not control for and what you would do differently with more time is itself a sign of scientific maturity.

### 1. Training data contamination and spurious cues

Classic cognitive psychology tasks appear extensively in the published literature, textbooks, and internet text that LLMs were trained on. **A model that "performs" like humans on a task may simply have learned the expected pattern from training data, not from anything resembling the cognitive processes humans use.**

This concern applies to *every* model and *every* dataset — including Psych-101. Psych-101 is publicly available on HuggingFace; frontier models and large open-weight models may well have been trained on it. A model that achieves low NLL on Psych-101 tasks could be reproducing memorized patterns rather than exhibiting genuine cognitive alignment.

This was a central theme of the **W9 lecture**: the Winograd Schema Challenge appeared solved (≥90% accuracy on RoBERTa-large) until Elazar et al. (2021) showed that models were exploiting lexical shortcuts that predict the correct answer without any actual coreference reasoning. Controlling for these shortcuts dropped performance to 25–34%. The same dynamic appeared with NLI benchmarks (Du et al., 2022, W9 lecture) and analogical reasoning (Lewis & Mitchell, 2024, W9 lightning talk).

Ideally you will try your best to control for models succeeding via memorization/shortcut learning. As discussed in class, you can use **counterfactual or adversarial variants** of the task — change surface features (cover stories, object labels, numerical values) while preserving the abstract structure. Lewis & Mitchell (2024) showed that models which pass standard letter-string analogies fail systematically when the alphabet or transformation direction is changed. If your model's behavior changes dramatically with surface-level modifications, that is a sign of pattern matching. Also compare behavior across models with different training sets — systematic differences are informative.

### 2. Aggregate fit ≠ process fidelity

A model can match average human performance while having completely different trial-level dynamics. Centaur achieves NLL = 0.44 vs. 0.56 for domain-specific models — impressive at the aggregate level — yet Namazova et al. showed it fails to reproduce learning curves and sequential dependencies at the trial level. This is the behavioral analog of the W8 lesson from Storrs et al. (2021): diverse architectures can all predict IT cortex equally well after linear fitting, even though they represent the world very differently. The W9 lecture showed the same thing for vision: Geirhos et al. (2020, NeurIPS) found that DNNs match human *accuracy* but make completely different *errors* — measured via error consistency (Cohen's κ near zero). Matching performance does not mean matching process.

Ideally, you should report not just overall accuracy or mean choices, but **learning curves** (how behavior changes over trials), **sequential dependencies** (does choice on trial N depend on trial N−1?), and **error distributions** (which items does the model get wrong, and do those match human confusion patterns?).

### 3. Autoregressive artifacts

McCoy et al. (2024, W9 lightning talk #96) showed that autoregressive training leaves systematic behavioral fingerprints — left-to-right processing asymmetries, recency biases, sensitivity to prompt ordering — that have no analog in human cognition. When you observe a behavioral pattern, ask: **could this be an artifact of how the model was trained rather than the cognitive process you're trying to study?**

This connects directly to the W9 lecture discussion of the WSC: models appeared to reason correctly, but were actually exploiting statistical regularities baked in by autoregressive pretraining on web text.

*Mitigation:* Test sensitivity to prompt ordering, trial order, and framing. Include control conditions that vary surface features of the prompt while keeping the task structure constant.

### 4. Chain-of-thought consistency

Whether you use chain-of-thought (CoT) prompting has a large effect on LLM behavior. As Brady et al. (2025, W9 reflection reading) discuss in the dual-process framework, CoT shifts the model toward a more deliberative mode — analogous to System 2 reasoning — which can substantially change choice distributions. **Be consistent**: use either CoT or no CoT across all models and all conditions, and report which you used. If you vary CoT, treat it as an independent variable and report results for both conditions.

---

## Available Models

All experiments must use models accessible through the course API (CCV LiteLLM). You are **not** expected to set up or pay for your own model access.

**Standard-access models (available from the start):**

| Model | Notes |
|-------|-------|
| `gpt-oss` | High-capability open-weight model; recommended for main runs |
| `Llama-3.3-70B-Instruct` | Different architecture; useful for model-to-model comparison |
| `Mistral-Large-3` | Another architecture variant for comparison |
| `gemini-3-flash-preview` | Fast and inexpensive; supports vision inputs — good for VLM piloting |

Log probabilities are accessible for open-weight models — this is important if you want to compute NLL alignment scores (as in Tekin's demo and the Centaur paper).

**Frontier models (provided after TA sign-off in Studio II):**

| Model | Notes |
|-------|-------|
| `gpt-5.2` | |
| `gpt-5.4` | |
| `gemini-2.5-pro` | Supports vision inputs (VLM) |
| `claude-sonnet-4-5` | Supports vision inputs (VLM) |

Frontier models are gated — your TA must confirm your pilot experiment is working before you get access. If you are planning a **vision/VLM experiment**, flag this to your TA during Studio I so they can prioritize your access.

Your API key and endpoint details will be shared at the start of project week. See Tekin's demo notebook for a working setup example.

---

## Workflow & Timeline

| Date | Milestone |
|------|-----------|
| **Tue Mar 31 — Studio I** | Project launch: explore the Psych-101 dataset, pick a task, begin running the replication experiment on open-weight models. |
| **Thu Apr 2 — Studio II** | By this session you should have a working replication of a Centaur experiment and a clear plan for your follow-up. Complete open-weight runs; get TA sign-off to access frontier model. |
| **Tue Apr 7, 2:00 pm** | **Final poster due** (submit PDF on Canvas before class). |
| **Tue Apr 7 — Poster session A** | Presentations during class (2:30–3:50 pm). |
| **Thu Apr 9 — Poster session B** | Presentations during class (2:30–3:50 pm). |
| **Thu Apr 9, 11:59 pm** | **Peer feedback due** on Gradescope. |

**The studio sessions are your primary working time.** Come to Studio I having already explored the Psych-101 dataset and looked through Tekin's demo notebook — so you can start running code immediately. Studio II is the checkpoint: by then you should have a working replication and a clear follow-up direction.

---

## Deliverables

### Submission

Submit your poster as a **PDF on Canvas** before class on April 7 (2:00 pm deadline). Your submission will be graded across two separate Canvas assignments — *Research Quality* (50 pts) and *Written Poster* (25 pts) — both sourced from the same PDF. *Oral Presentation* (25 pts) is entered by instructors and TAs after your presentation; no Canvas submission required for that component. Peer feedback (20 pts) is submitted separately on Gradescope by end of day April 9 — see the Peer Feedback section below.

### Poster: 4 letter-sized slides

Produce **four letter-sized slides** in a format suitable for a mini-conference poster. One clear idea per slide; figures preferred over text walls.

| Slide | Content |
|-------|---------|
| **1 — Motivation** | What cognitive phenomenon are you studying? Why is it interesting to test on this model? What is your hypothesis and why? Connect to at least one course theme. |
| **2 — Methods** | Task design, models tested, number of trials, prompting approach. Be specific — we should be able to replicate your experiment from this slide alone. Describe how you controlled for confounds. |
| **3 — Results** | Main findings: performance curves or choice distributions, comparison to human data from the literature, model-to-model comparison. All figures must have labeled axes and a brief caption. |
| **4 — Open Questions & Conclusions** | What do your results tell us? How do they connect to course themes (Marr's levels, aggregate vs. trial-level, prediction vs. understanding)? What are the key limitations and what would you do next? |

You may include one optional **appendix slide** for supplementary figures or methodological details. The appendix slide will not be presented but may be referenced during Q&A.

**Formatting:** Font ≥ 16pt body text, clean layout, good contrast.

---

## Poster Presentations

Presentations take place on **Tuesday April 7** and **Thursday April 9** during class (2:30–3:50 pm). There will be approximately **13–14 groups per session**. **All groups attend both sessions.**

**Your presentation day is announced in class on April 7** — random assignment, not disclosed in advance. Prepare fully for both days.

### Session format

Each session (80 min) is split into two rounds of ~35 minutes with a brief break in between. Half the groups present in round 1 while the other half tours; then they switch. The session closes with a short synthesis discussion.

**If you are presenting (your round):** stand by your laptop/poster for the full 35 minutes. Visitors will come to you — give a brief 3-minute walk-through when someone arrives, then take questions. You will present multiple times to different visitors. **3 minutes goes fast**: roughly 45 seconds per slide. Practice out loud and know exactly what you will say. Do not read from the slides.

**If you are touring (your round):** visit as many groups as you can in 35 minutes. For each group you visit, complete one entry in the **peer feedback form on Gradescope** (see below).

Think comparatively as you tour: are there patterns across experiments? Do different groups converge on similar conclusions about model cognition, or tell different stories?

**Synthesis discussion (final ~3 min):** brief cross-cutting takeaways. On April 9, we close with the question we have been building toward all semester: after neural alignment, behavioral alignment, and now your own experiments — have we answered Crick's challenge?

---

## Peer Feedback (20 points)

**Due:** end of day Thursday April 9  
**Submitted:** Gradescope (link shared on Ed before class)

While touring, complete one Gradescope entry for each group you visit — **minimum 5 groups** across both presentation days combined. In each 35-minute touring round, roughly 6–7 groups are presenting, so 5 is feasible in a single round.

For each group, rate the following three components on a 1–5 scale and write 1–2 sentences explaining your score. These match the same criteria you are being graded on.

**1. Research quality** (hypothesis, experiment design, results)
**2. Written poster** (scientific narrative, conclusions, visual clarity)
**3. Oral presentation** (walk-through clarity, depth of answers)

Also answer: *One thing that surprised you, or a question you'd want them to pursue.*

Your scores are for your own reflection — they do not go into the group's official grade. Feedback is graded on **quality**: generic comments will not earn full credit. The goal is to practice giving and receiving scientific feedback.

---

## Grading

All project assignments count toward the weekly work category.

### Research quality — 50 points

| Component | Points | What we are looking for |
|-----------|--------|------------------------|
| **Hypothesis & framing** | 10 | Specific, testable hypothesis with a predicted direction; explicit connection to at least one course theme (Marr's levels, aggregate vs. trial-level, divergence problem, autoregressive artifacts, etc.) |
| **Experiment design** | 15 | Reproducible protocol; explicit treatment of at least one confound with a mitigation strategy; both open-weight and frontier model runs; appropriate number of trials |
| **Results & analysis** | 25 | At least one comparison to human data from the literature; trial-level analysis (learning curves, error patterns, or sequential dependencies) beyond aggregate accuracy; model-to-model comparison |

### Written poster — 25 points

| Component | Points | What we are looking for |
|-----------|--------|------------------------|
| **Conclusions & scientific narrative** | 15 | Findings synthesized into a coherent story; identifies what Marr level the experiment speaks to; honest acknowledgment of limitations; genuine follow-up questions |
| **Visual design & clarity** | 10 | Figures with labeled axes and captions; layout readable at a glance; one clear idea per slide; appropriate use of space for a poster format |

### Oral presentation — 25 points *(individual)*

| Component | Points | What we are looking for |
|-----------|--------|------------------------|
| **Clarity and delivery** | 15 | Walk-through covers all 4 slides in ~3 min; narrative is clear to someone unfamiliar with the task; visuals support rather than replace the explanation |
| **Depth and Q&A** | 10 | Responses to visitor questions show genuine understanding of the experiment, the confounds, and the course themes; uncertainty acknowledged where appropriate |

### Peer feedback — 20 points *(individual)*

Graded on quality of written feedback submitted on Gradescope (see above).

---

## Resources

**Demo notebook:** Tekin's demo walks through a complete example using the two-step task — NLL alignment scoring against human trial data, and open-environment simulation. Start here before Studio I: [github.com/TekinGunasar/CPSY-1950-Project-Demo](https://github.com/TekinGunasar/CPSY-1950-Project-Demo)

**Psych-101 dataset:** [`marcelbinz/Psych-101`](https://huggingface.co/datasets/marcelbinz/Psych-101) on HuggingFace. 160 experiments, 60,092 participants, trial-by-trial natural language transcripts.

**API access:** CCV LiteLLM endpoint + API key shared via Ed at the start of project week.

**Questions?** Post on Ed Discussion — this is the primary channel for all project-related questions. Reach out to the instructors and TAs there; do not email directly. Office hours: Wednesdays 1:00–2:00 pm, Carney Innovation Hub Room 402.
