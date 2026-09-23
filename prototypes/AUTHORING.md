# Editing your site — proposed workflow

The goal: **keep writing in Markdown** (like your current `index.md`,
`publications.md`, `awards.md`), but gain clean ways to embed richer content —
YouTube, captioned figures, PDFs, publication entries — without touching HTML.

This works on **GitHub Pages with no plugins**, so nothing about your hosting
changes.

---

## 1. Ordinary content is just Markdown

Exactly like today. A page is front-matter + Markdown:

```markdown
---
layout: page
title: About
---

# About Me

Hi, I am **Anthony Tong**, a third-year undergraduate ...

## News and Updates
- I will be a head tutor for *CSE 151B* in Spring 2026!
```

## 2. Rich embeds use Jekyll *includes* (the shortcodes)

GitHub Pages does not allow custom `{% youtube %}` plugin tags, so the
portable, zero-config equivalent is a Jekyll **include**. You drop these
one-liners right inside your Markdown:

| You want…            | You write…                                                       |
|----------------------|------------------------------------------------------------------|
| A YouTube video      | `{% include youtube.html id="aqz-KE-bpKQ" %}`                    |
| …with a caption      | `{% include youtube.html id="aqz-KE-bpKQ" caption="My talk" %}`  |
| A captioned image    | `{% include figure.html src="cat.JPG" caption="My cat" %}`      |
| …at a set width      | `{% include figure.html src="teams/teams.jpg" width="60%" %}`   |
| A publication        | `{% include pub.html title="…" url="…" authors="…" venue="…" %}` |

> The prototype pages show these as a friendlier `{% youtube "id" %}` for
> readability — that shorter form needs the `jekyll-youtube`-style plugin and
> only works if you move off GitHub Pages to a custom build. The `include`
> form above is the recommendation: identical result, no build changes.

The three ready-to-use include files are in **`_includes-proposed/`** in this
folder:
- `youtube.html` — responsive 16:9, privacy-friendly `youtube-nocookie` domain, lazy-loaded
- `figure.html` — captioned, centered, optional width
- `pub.html` — one publication, with your name bolded via `**Anthony Tong**`

To adopt them: copy those files into the site's real `_includes/` directory and
add the matching CSS (comes with whichever design system you pick).

## 3. A full example page

```markdown
---
layout: page
title: About
---

# About Me

Hi, I am **Anthony Tong** ...

## Selected work

{% include pub.html
   title="SPECTRE: A Multimodal Spectral Transformer for Small Molecule Annotation"
   url="https://pubs.acs.org/doi/10.1021/acs.jcim.5c02444"
   authors="W. Xu†, B. Ryu†, **Anthony Tong**, ..., G. W. Cottrell~"
   venue="J. Chem. Inf. Model. · 2025" %}

## A talk

{% include youtube.html id="aqz-KE-bpKQ" caption="Presenting SPECTRE" %}
```

## 4. Optional niceties (can add later)

- **Blog posts**: drop a file in `_posts/2026-09-22-title.md`; it auto-lists on
  the Blog page — the theme already supports this.
- **Live preview**: `bundle exec jekyll serve` renders the site locally at
  `localhost:4000` so you see edits instantly before pushing.
- **More shortcodes** are trivial to add the same way (e.g. `tweet.html`,
  `arxiv.html`, `slides.html`).

---

## What I recommend

1. Pick a design system (`editorial`, `swiss`, or `soft`) from the prototypes.
2. I wire its CSS into the Jekyll `_layouts` / `_includes`, replacing the old
   LESS bundle.
3. Copy in the three includes above + their styles.
4. Your `.md` files stay as-is; you just start using the shortcodes when you
   want an embed.
