---
layout: course-sidebar
title: CPSY 1950 - Deep Learning in Brains, Minds & Machines
subtitle: Spring 2026 
---

A seminar-style exploration of cutting-edge research at the intersection of natural and artificial intelligence. Students engage with recent papers and develop critical perspectives on how biological and artificial systems process information.

**Format:** Tuesday lectures + Thursday lightning mini-conferences • Project posters • Guest lectures

---

## Course Information

**Instructor:** Thomas Serre  
**Semester:** Spring 2026  
**Time:** Tuesday & Thursday, 2:30pm-3:50pm  
**Location:** Friedman Hall 108  
**Office Hours:** TBD

---

## Overview

This course uses an innovative **lecture + lightning mini-conference** format:

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

---

## Reading Lists

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
    {% if resource.url %}<br><a href="{{ resource.url }}" target="_blank">🔗 {{ resource.url }}</a>{% endif %}
  </li>
{% endfor %}
</ul>
{% else %}
<p><em>Additional resources will be added here.</em></p>
{% endif %}

---

## Schedule

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

---

## Assignments

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
