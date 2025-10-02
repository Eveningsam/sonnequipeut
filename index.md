---
layout: default
title: "Accueil"
permalink: /
---
Bienvenue sur mon blog !

Voici les articles :
{% for post in site.posts %}
  <article>
    <h2><a href="{{ post.url | relative_url }}">{{ post.title }}</a></h2>
    <p><small>Publié le {{ post.date | date: "%Y-%m-%d" }}</small></p>
  </article>
{% endfor %}

