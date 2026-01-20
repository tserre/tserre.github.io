---
layout: course-sidebar
title: CPSY 1950 - Deep Learning in Brains, Minds & Machines
subtitle: Spring 2026 • Advanced Undergraduate/Graduate
---

A seminar-style exploration of cutting-edge research at the intersection of natural and artificial intelligence. Students engage with recent papers and develop critical perspectives on how biological and artificial systems process information.

**Format:** Tuesday lectures + Thursday lightning mini-conferences • Project posters • Guest lectures

---

## Course Information

**Instructor:** Thomas Serre  
**Email:** [thomas_serre@brown.edu](mailto:thomas_serre@brown.edu)  
**Semester:** Spring 2026  
**Time:** Tuesday & Thursday, 2:30pm-3:50pm  
**Location:** Friedman Hall 108  
**Office Hours:** Wednesdays, 1:00-2:00pm @ Carney Innovation Hub (Room 402)  
**Communication:** [Ed Discussion](https://edstem.org/us/courses/93110/discussion)

**[📄 View Full Syllabus](/cpsy1950/syllabus)**

---

> **Course Updates (Spring 2026):** This course has been substantially revamped for Spring 2026 to reflect rapid changes in NeuroAI. As a result, the schedule and specific activities may be adjusted during the semester. Updates will be posted on the course website. Thank you in advance for your flexibility and patience.

---

## Overview {#overview}

This course uses a lecture + lightning talk (conference style) format:

- **Tuesdays (80 min):** Instructor lecture introducing the week's theme (figure-first, conceptual approach)
- **Thursdays (80 min):** Student lightning talks (~15 presentations, 2 minutes each) + synthesis discussion

Students work in rotating small groups throughout the semester, culminating in project poster presentations. The course covers modern AI capabilities, explainable AI, the AI-neuroscience bridge, and cognitive alignment.

### Key Dates
- **First Class:** Thursday, January 22, 2026
- **Bootcamp:** Week 2 (async, conditional requirements)
- **Lightning Talks:** Weeks 3-9
- **Spring Break:** Week 10 (March 24-26)
- **Project Posters:** Weeks 11-12 (April 7-9)
- **Guest Lectures:** Weeks 13-14
- **Final Exam:** Tuesday, May 12, 2026, 9:00am

### Group & Presentation Plan (for up to 103 students)
- Lightning talks are prepared in small groups (typically 3, occasionally 4).
- Groups are not fixed: students will form new groups for each lightning week (rotating teams over the semester).
- Posters are reserved for student projects (after spring break).
- Equity: presentation turns are tracked at the individual student level so that each student presents the same number of times across the semester (lightning talks + the project poster).

---

## Schedule {#schedule}

### Quick Reference

{% assign schedule = site.data.cpsy1950.schedule %}
{% if schedule %}
<table style="width: 100%; border-collapse: collapse; margin-top: 1em;">
  <thead>
    <tr style="border-bottom: 2px solid #0366d6;">
      <th style="text-align: left; padding: 0.5em;">Date</th>
      <th style="text-align: left; padding: 0.5em;">Topic</th>
      <th style="text-align: left; padding: 0.5em;">Readings</th>
    </tr>
  </thead>
  <tbody>
{% for item in schedule %}
    <tr style="border-bottom: 1px solid #ddd;">
      <td style="padding: 0.5em;">{{ item.date }}</td>
      <td style="padding: 0.5em;">{{ item.topic }}</td>
      <td style="padding: 0.5em;">
        {% if item.readings %}
          {% for reading in item.readings %}
            <a href="{{ reading.url | default: '#' }}">{{ reading.title }}</a>{% unless forloop.last %}, {% endunless %}
          {% endfor %}
        {% else %}
          <em>TBD</em>
        {% endif %}
      </td>
    </tr>
{% endfor %}
  </tbody>
</table>
{% else %}
<p><em>Course schedule will be updated here.</em></p>
{% endif %}

### Detailed Week-by-Week Schedule

## Week 1 — Course kickoff
<details>
<summary><strong>Thu 1/22 — Course Kickoff</strong></summary>
<p>NeuroAI goals, course structure, and how we will simulate scientific conferences (lightning talks and posters).</p>
<p><em>No readings or pre-class activities for Week 1—this is the introductory session.</em></p>
</details>

## Week 2 — Async Bootcamp (no in-person class this week)

**Goal:** Put everyone on a leveled playing field for Week 3. Complete the **Required Core** first (mandatory for all), then the **conditional tracks** that match your background. You do *not* need to do every track.

**Note on access to papers:** For any *paper* link below, please use the Brown Library proxy links (you may be prompted to log in with Brown credentials off campus).

---

### Required Core — MANDATORY FOR ALL STUDENTS (~90 min total)

**⚠️ Complete both items below before moving on to any conditional tracks. Students with a strong background in cognitive neuroscience may skim, but should still review to ensure familiarity with the course's framing and terminology.**

1) **Marr's Levels of Analysis (video)**
Nancy Kanwisher: “How Can We Study the Human Mind and Brain? Marr’s Levels of Analysis”  
https://nancysbraintalks.mit.edu/video_page/12-how-can-we-study-human-mind-and-brain-marrs-levels-analysis/

2) **Coarse brain organization (video; focus on gross organization + functions)**
MIT OCW 9.13 (Spring 2019) Lecture 2: “Neuroanatomy”  
https://ocw.mit.edu/courses/9-13-the-human-brain-spring-2019/resources/lecture-2-neuroanatomy/  
**Viewing guidance:** Watch for the high-level tour of major brain divisions/structures and what they do. **Pay particular attention to concepts of receptive fields, neural tuning, and cortical maps** — these are fundamental for understanding how neural networks relate to biological systems. You do **not** need to know fine anatomical details.

---

### Conditional Track A — Cognitive neuroscience foundations
**Complete this track if you have not taken at least 1–2 courses in neuroscience or cognitive neuroscience.**  
Target time: up to ~180 min.

A1) **Neurons, spikes, firing rate (high-level; no ion-channel deep dive)**
BrainFacts: “How Neurons Communicate”  
https://www.brainfacts.org/core-concepts/how-neurons-communicate

A2) **Quick map of structures + functions**
NIH/NINDS: “Brain Basics — Know Your Brain”  
  https://www.ninds.nih.gov/health-information/public-education/brain-basics/brain-basics-know-your-brain

A3) **Methods lectures (videos)**
- MIT OCW 9.13 Lecture 4: "Cognitive Neuroscience Methods I"  
  https://ocw.mit.edu/courses/9-13-the-human-brain-spring-2019/resources/lecture-4-cognitive-neuroscience-methods-i/
- MIT OCW 9.13 Lecture 5: "Cognitive Neuroscience Methods II"  
  https://ocw.mit.edu/courses/9-13-the-human-brain-spring-2019/resources/lecture-5-cognitive-neuroscience-methods-ii/

**Note:** Don't worry if the jargon feels overwhelming — you don't need to memorize all the details right now, and you can always come back to these videos later when these concepts become needed. These lectures include a section on Marr's levels of analysis; you can skip it if redundant with the required core, though reviewing it twice may be helpful if you haven't taken cognitive science courses.

A4) **Optional “what measures what?” cheat-sheets (short skims)**
- BrainFacts: “Measuring Neural Physiology”  
  https://www.brainfacts.org/in-the-lab/tools-and-techniques/2023/tools-for-physiology-022723
- BrainFacts: “Viewing the Human Brain Through Noninvasive Tools”  
  https://www.brainfacts.org/in-the-lab/tools-and-techniques/2023/tools-used-for-human-research-030923

---

### Conditional Track B — Linear algebra intuition (refresher)
**Complete this track if vectors/matrices feel rusty.**  
Target time: ~60 min total.

- 3Blue1Brown: “Vectors, what even are they?”  
  https://www.3blue1brown.com/lessons/vectors
- 3Blue1Brown: “Linear combinations, span, and basis vectors”  
  https://www.3blue1brown.com/lessons/span
- 3Blue1Brown: “Linear transformations and matrices”  
  https://www.3blue1brown.com/lessons/linear-transformations
- 3Blue1Brown: “Matrix multiplication as composition”  
  https://www.3blue1brown.com/lessons/matrix-multiplication

---

### Conditional Track C — Deep learning intuition (refresher)
**Complete this track if backprop/gradient descent are unfamiliar.**  
Target time: ~60 min total.

- 3Blue1Brown: “What is a neural network?”  
  https://www.3blue1brown.com/lessons/neural-networks
- 3Blue1Brown: “Gradient descent”  
  https://www.3blue1brown.com/lessons/gradient-descent
- 3Blue1Brown: “Backpropagation”  
  https://www.youtube.com/watch?v=Ilg3gGewQ5U

---

## Bootcamp Checkpoint (all students; due Sunday 2:00pm)

**Purpose:** Make sure everyone can (i) separate Marr levels, (ii) describe a simple ANN learning setup in plain language, and (iii) connect claims to what neuroscience measurements could test.

### Assigned paper (skim; focus on the main question + 1–2 key figures)
Zipser & Andersen (1988) — Nature (Brown Library proxy link)  
https://www-nature-com.revproxy.brown.edu/articles/331679a0

### Submit responses (short; ~60 minutes total)
1) **Marr tagging (3 bullets):** State the computational-level question, the algorithmic-level proposal, and what (if anything) is claimed about implementation.
2) **Model essentials (2–3 sentences):** What are the inputs? What is the target output? What learning rule is used?
3) **Evidence (2 sentences):** Pick one figure/result. What does it support? What does it *not* establish?
4) **Neuroscience evaluation (3–5 sentences):** Choose **two** measurement methods from the Methods lectures (Lecture 4/5). For each: what would it measure, and would it actually test the paper’s claim?
5) **Limitation (1–2 sentences):** Name one key assumption/limitation and why it matters.

---

## Optional background papers (only if you want extra framing)
Cichy & Kaiser (2019) — Trends in Cognitive Sciences (Brown Library proxy link)  
https://www-sciencedirect-com.revproxy.brown.edu/science/article/pii/S1364661319300348

Doerig et al. (2023) — Nature Reviews Neuroscience (Brown Library proxy link)  
https://www-nature-com.revproxy.brown.edu/articles/s41583-023-00705-w</details>

## Week 3 — The three levers of deep learning
<details>
<summary><strong>Tue 2/3 — Lecture: The Three Levers of Deep Learning</strong></summary>
<p>Details TBD</p>
</details>

<details>
<summary><strong>Thu 2/5 — Lightning Mini-Conf 1: Three Levers of DL</strong></summary>
<p>Details TBD</p>
</details>

## Week 4 — Scaling and emerging capabilities
<details>
<summary><strong>Tue 2/10 — Lecture: Scaling and Emerging Capabilities</strong></summary>
<p>Details TBD</p>
</details>

<details>
<summary><strong>Thu 2/12 — Lightning Mini-Conf 2: Scaling & Emergence</strong></summary>
<p>Details TBD</p>
</details>

## Week 5 — Representation-level interpretability
<details>
<summary><strong>Tue 2/17 — Lecture: Representation-Level Interpretability</strong></summary>
<p>Details TBD</p>
</details>

<details>
<summary><strong>Thu 2/19 — Lightning Mini-Conf 3: Representation Interpretability</strong></summary>
<p>Details TBD</p>
</details>

## Week 6 — Mechanistic interpretability
<details>
<summary><strong>Tue 2/24 — Lecture: Mechanistic Interpretability</strong></summary>
<p>Details TBD</p>
</details>

<details>
<summary><strong>Thu 2/26 — Lightning Mini-Conf 4: Mechanistic Interpretability</strong></summary>
<p>Details TBD</p>
</details>

## Week 7 — Neural alignment
<details>
<summary><strong>Tue 3/3 — Lecture: Neural Alignment and Model-to-Brain Mapping</strong></summary>
<p>Details TBD</p>
</details>

<details>
<summary><strong>Thu 3/5 — Lightning Mini-Conf 5: Neural Alignment</strong></summary>
<p>Details TBD</p>
</details>

## Week 8 — Behavioral and cognitive alignment
<details>
<summary><strong>Tue 3/10 — Lecture: Behavioral and Cognitive Alignment</strong></summary>
<p>Details TBD</p>
</details>

<details>
<summary><strong>Thu 3/12 — Lightning Mini-Conf 6: Behavioral Alignment</strong></summary>
<p>Details TBD</p>
</details>

## Week 9 — Toward Brain-Like AI
<details>
<summary><strong>Tue 3/17 — Lecture: Toward Brain-Like AI (Project Launch)</strong></summary>
<p>Details TBD</p>
</details>

<details>
<summary><strong>Thu 3/19 — Lightning Mini-Conf 7: Brain-Like AI + Project Launch</strong></summary>
<p>Details TBD</p>
</details>

## Week 10 — Spring Break
<details>
<summary><strong>Tue 3/24 — Spring Break</strong></summary>
<p>No class</p>
</details>

<details>
<summary><strong>Thu 3/26 — Spring Break</strong></summary>
<p>No class</p>
</details>

## Week 11 — Project studio
<details>
<summary><strong>Tue 3/31 — Project Studio I</strong></summary>
<p>Project launch and evaluation design; in-class time for groups to plan, run pilot tests, and produce first results/figures.</p>
</details>

<details>
<summary><strong>Thu 4/2 — Project Studio II</strong></summary>
<p>Continue project work: complete runs and draft poster.</p>
</details>

## Week 12 — Project poster presentations
<details>
<summary><strong>Tue 4/7 — Project Poster Mini-Conf A</strong></summary>
<p>Students present project findings in posters (17 posters); structured peer feedback and synthesis discussion.</p>
</details>

<details>
<summary><strong>Thu 4/9 — Project Poster Mini-Conf B</strong></summary>
<p>Students present project findings in posters (17 posters); structured peer feedback and synthesis discussion.</p>
</details>

## Week 13 — Guest lecture series
<details>
<summary><strong>Tue 4/14 — Guest Lecture Series I (TBD)</strong></summary>
<p>Details TBD</p>
</details>

<details>
<summary><strong>Thu 4/16 — Guest Lecture Series I (TBD)</strong></summary>
<p>Details TBD</p>
</details>

## Week 14 — Guest lecture series (continued)
<details>
<summary><strong>Tue 4/21 — Guest Lecture Series II: Rufin VanRullen</strong></summary>
<p>Frontier topics in NeuroAI: global workspace / consciousness & deep learning.</p>
</details>

<details>
<summary><strong>Thu 4/23 — Guest Lecture Series II: Victor Boutin + Course Wrap-Up</strong></summary>
<p>Frontier topics in NeuroAI: generative models, EBMs, cognitive science. Plus course wrap-up and final exam briefing.</p>
</details>

## Week 15 — Final exam
<details>
<summary><strong>Tue 5/12 — Final Exam</strong></summary>
<p>Final exam, 9:00am</p>
</details>

---

## Reading Lists {#reading-lists}

{% assign readings = site.data.cpsy1950.readings %}
{% if readings %}
{% for week in readings %}
### Week {{ week.week }}: {{ week.topic }}

{% if week.description %}
<p>{{ week.description }}</p>
{% endif %}

<ul>
{% for reading in week.papers %}
  <li>
    <strong>{{ reading.title }}</strong>
    {% if reading.authors %}<br><i>{{ reading.authors }}</i>{% endif %}
    {% if reading.journal %}<br>{{ reading.journal }}{% endif %}
    {% if reading.year %}<span style="color: #888;"> • {{ reading.year }}</span>{% endif %}
    {% if reading.pdf %}
      <br><a href="{{ reading.pdf }}" target="_blank">📄 PDF</a>
    {% endif %}
    {% if reading.url %}
      <br><a href="{{ reading.url }}" target="_blank">🔗 Link</a>
    {% endif %}
    {% if reading.notes %}
      <br><small style="color: #666;">{{ reading.notes }}</small>
    {% endif %}
  </li>
{% endfor %}
</ul>
{% endfor %}
{% else %}
<p><em>Reading list will be updated throughout the semester.</em></p>
{% endif %}

---

## Additional Materials

### Videos & Lectures

{% assign videos = site.data.cpsy1950.videos %}
{% if videos %}
{% for video in videos %}
<div style="margin-bottom: 2em;">
  <h3>{{ video.title }}</h3>
  {% if video.description %}<p>{{ video.description }}</p>{% endif %}
  {% if video.youtube_id %}
  <div style="position: relative; padding-bottom: 56.25%; height: 0; overflow: hidden; max-width: 100%; margin-top: 1em;">
    <iframe src="https://www.youtube.com/embed/{{ video.youtube_id }}" style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; border: 0;" allowfullscreen allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"></iframe>
  </div>
  {% endif %}
  {% if video.url %}
  <p><a href="{{ video.url }}" target="_blank">🔗 Watch Video</a></p>
  {% endif %}
</div>
{% endfor %}
{% else %}
<p><em>Videos and lecture materials will be added here.</em></p>
{% endif %}

### Additional Resources

{% assign resources = site.data.cpsy1950.resources %}
{% if resources %}
<ul>
{% for resource in resources %}
  <li>
    <strong>{{ resource.title }}</strong>
    {% if resource.description %}<br><small>{{ resource.description }}</small>{% endif %}
    {% if resource.url %}<br><a href="{{ resource.url }}" target="_blank">🔗 Link</a>{% endif %}
  </li>
{% endfor %}
</ul>
{% else %}
<p><em>Additional resources will be added here.</em></p>
{% endif %}

---

## Assignments {#assignments}

{% assign assignments = site.data.cpsy1950.assignments %}
{% if assignments %}
{% for assignment in assignments %}
### {{ assignment.title }}

{% if assignment.due_date %}<p><strong>Due:</strong> {{ assignment.due_date }}</p>{% endif %}
{% if assignment.description %}<p>{{ assignment.description }}</p>{% endif %}
{% if assignment.materials %}
<ul>
{% for material in assignment.materials %}
  <li>
    {% if material.type == 'pdf' %}
      <a href="{{ material.url }}" target="_blank">📄 {{ material.name }}</a>
    {% elsif material.type == 'link' %}
      <a href="{{ material.url }}" target="_blank">🔗 {{ material.name }}</a>
    {% else %}
      <a href="{{ material.url }}" target="_blank">{{ material.name }}</a>
    {% endif %}
  </li>
{% endfor %}
</ul>
{% endif %}
{% endfor %}
{% else %}
<p><em>Assignment information will be posted here.</em></p>
{% endif %}

---

## Contact

For questions about the course, please contact [your email] or attend office hours.
