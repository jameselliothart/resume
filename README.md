# Resume

This repository contains my resume in Markdown format. The resume can be easily updated, customized, and converted to a PDF using Pandoc.

## Table of Contents

- [Resume](#resume)
  - [Table of Contents](#table-of-contents)
  - [Overview](#overview)
  - [Structure](#structure)
  - [Dependencies](#dependencies)

## Overview

The resume is written in Markdown for simplicity and flexibility. By using Pandoc, you can convert the Markdown file to a PDF, HTML, or other formats with a consistent and professional appearance.

## Structure

- `JamesHartResume.md`: The main resume file written in Markdown.
- `convert.sh`: A simple shell script which uses Pandoc to convert the resume to a PDF.
- `README.md`: This readme file explaining the repository's usage.

## Dependencies

To convert the Markdown resume to a PDF, you'll need the following tools installed:

- [Pandoc](https://pandoc.org/): A universal document converter.
- [wkhtmltopdf](https://wkhtmltopdf.org/): A tool to render HTML into PDF using Webkit (used as the PDF engine).

You can install Pandoc and wkhtmltopdf via package managers:

```bash
# On Ubuntu
sudo apt install pandoc wkhtmltopdf

# On macOS using Homebrew
brew install pandoc wkhtmltopdf
```
