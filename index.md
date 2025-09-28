---
layout: default
title: "Accueil"
---

# Bienvenue sur mon blog

Voici mes articles :

<ul>
{% for page in site.pages %}
  {% if page.path contains "articles/" and page.name == "index.md" %}
    <li><a href="{{ page.url | relative_url }}">{{ page.title }}</a> – {{ page.date | date: "%Y-%m-%d" }}</li>
  {% endif %}
{% endfor %}
</ul>
