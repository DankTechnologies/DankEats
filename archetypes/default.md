---
title: "{{ replace .Name "-" " " | title }}"
date: {{ .Date }}
draft: true
summary: shown on recipe page at top
description: shown on latest page, SEO
cuisine:
tags: []
tools: []
yield:
credit:
---

## Ingredients

{{< startcolumns >}}
{{< column >}}

### Thing 1

* **420 g** whatever{{< super-notes "1" >}}

{{< /column >}}
{{< column >}}

### Thing 2

* **28 oz** things

{{< /column >}}
{{< endcolumns >}}

## Notes

1. **Important Note** => the deets

## Gallery

{{< gallery match="images/*" sortOrder="asc" rowHeight="150" margins="5" thumbnailResizeOptions="600x600 q90 Lanczos" imageResizeOptions="1920x1920 q90 Lanczos" showExif=false previewType="blur" embedPreview=true loadJQuery=true >}}
