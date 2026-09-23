---
layout: default
nav: blog
permalink: /blogs/index.html
title: Blog
---

<div class="row">
  <span class="k">Blog</span>
  <div class="prose">
    {% if site.posts.size > 0 %}
    <ul>
      {% for post in site.posts %}
      <li class="t"><span class="d">{{ post.date | date: "%b %Y" }}</span><span><a href="{{ post.url }}">{{ post.title }}</a></span></li>
      {% endfor %}
    </ul>
    {% else %}
    <p class="muted">Nothing here yet — writing coming soon.</p>
    {% endif %}
  </div>
</div>
