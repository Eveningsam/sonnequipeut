---
layout: default
title: Accueil
---

<h1>Bienvenue sur mon blog</h1>
<p>Voici mes articles :</p>

<ul>
  {% for post in site.posts %}
    <li>
      <a href="{{ post.url | relative_url }}">{{ post.title }}</a>
      <span>({{ post.date | date: "%d %B %Y" }})</span>
    </li>
  {% endfor %}
</ul>
