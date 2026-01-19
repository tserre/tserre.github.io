---
layout: course-sidebar
title: Lesson 1: Introduction to NeuroAI
subtitle: Part 1
---

## Overview

This lesson provides an introduction to the intersection between neuroscience and artificial intelligence.

## Learning Objectives

- Understand the fundamental questions in NeuroAI
- Explore how biological and artificial systems process information
- Identify key research directions in the field

## Readings

{% assign readings = site.data.cpsy1950.readings %}
{% if readings %}
{% for week in readings %}
{% if week.week == 1 %}
{% for reading in week.papers %}
- **{{ reading.title }}**
  {% if reading.authors %}<br>  <i>{{ reading.authors }}</i>{% endif %}
  {% if reading.journal %}<br>  {{ reading.journal }}{% endif %}
  {% if reading.year %}<span style="color: #888;"> • {{ reading.year }}</span>{% endif %}
  {% if reading.pdf %}
    <br>  <a href="{{ reading.pdf }}" target="_blank">📄 PDF</a>
  {% endif %}
  {% if reading.url %}
    <br>  <a href="{{ reading.url }}" target="_blank">🔗 Link</a>
  {% endif %}
{% endfor %}
{% endif %}
{% endfor %}
{% endif %}

## Lecture Materials

{% assign videos = site.data.cpsy1950.videos %}
{% if videos %}
{% for video in videos %}
{% if video.lesson == 1 %}
<div style="margin-bottom: 2em;">
  <h3>{{ video.title }}</h3>
  {% if video.description %}<p>{{ video.description }}</p>{% endif %}
  {% if video.youtube_id %}
  <div style="position: relative; padding-bottom: 56.25%; height: 0; overflow: hidden; max-width: 100%; margin-top: 1em;">
    <iframe src="https://www.youtube.com/embed/{{ video.youtube_id }}" style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; border: 0;" allowfullscreen allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"></iframe>
  </div>
  {% endif %}
</div>
{% endif %}
{% endfor %}
{% endif %}

## Additional Resources

Additional materials and resources will be posted here.
