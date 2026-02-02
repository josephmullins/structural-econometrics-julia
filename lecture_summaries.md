# Creating summary notes for each chapter

I would like to create a set of pdfs that summarize each chapter of this book for the purpose of delivering "chalk and talk" lectures.

## Content requirements

These summaries should:

1. Include every point that is made in the lecture
2. Introduce all mathematical notation and concepts
3. Organize written content into bullet points so that each thing I want to say is clear
4. Follow the structure of the original chapter (sections, subsections)
5. Skip code blocks and exercises (but include key results they demonstrate)

One way to think about this would be: imagine how you would create a slide deck for each chapter (slides/why_models.qmd provides an example). But now imagine that instead of showing those slides to the student, they are simply prompts for the lecturer to remind them what they are doing and what points they want to hit.

## Format

Use Quarto with this YAML header:

```yaml
---
title: "[Chapter Title]"
subtitle: "Lecture Notes"
format:
  pdf:
    documentclass: article
    geometry:
      - margin=1in
    fontsize: 11pt
    toc: false
---
```

## Output

- Save to `notes/[lecture_name].qmd` (same base name as the source lecture)
- Render to PDF with: `quarto render notes/[lecture_name].qmd --to pdf`

## Prompt

To create notes for a lecture, just say:

> Create lecture notes for `lectures/[filename].qmd`
