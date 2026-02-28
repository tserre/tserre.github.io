---
layout: course-sidebar
title: Reading Lists
subtitle: Course Resources
---

## Reading Lists by Week

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
    {% if reading.year %}<span style="color: #6b7280;"> • {{ reading.year }}</span>{% endif %}
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
