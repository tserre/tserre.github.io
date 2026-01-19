---
layout: course-sidebar
title: Assignments
subtitle: Course Resources
---

## Course Assignments

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
