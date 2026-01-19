---
layout: course-sidebar
title: Course Schedule
subtitle: Course Resources
---

## Course Schedule

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
