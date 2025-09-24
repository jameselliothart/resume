# AI Agent Instructions for Resume Repository

## Project Overview

This repository maintains a resume in Markdown format with automated PDF generation. The project emphasizes maintainability, consistent formatting, and automated document generation.

## Key Components

- `JamesHartResume.md`: Core resume content with embedded CSS styling
- `convert.sh`: Automated PDF generation script
- `pdf/`: Directory containing generated PDF versions with datestamped filenames

## Critical Workflows

### PDF Generation

The project uses Pandoc with wkhtmltopdf engine for PDF conversion:

```bash
./convert.sh  # Generates pdf/JamesHartResume_YYYYMMDD.pdf
```

### Document Structure Conventions

1. CSS is embedded at the top of `JamesHartResume.md`
2. Sections use semantic HTML classes (e.g., `<div class="experience">`)
3. Dynamic file linking uses `{{FILENAME}}` placeholder replaced during conversion

### Formatting Standards

- Margin settings: top/bottom=10mm, left/right=20mm
- Font: Arial/sans-serif, 12px base size
- Section headings: Uppercase, specific margin/padding rules
- Lists: Multiple nesting levels with distinct bullet styles

## Integration Points

- GitHub profile link formatting: `[GitHub Repos](https://github.com/username)`
- PDF versioning integrates with the current date
- Resume automatically links to its latest PDF version on GitHub

## Important Patterns

1. Contact info centrally aligned using `.contact-info` class
2. Project listing uses nested lists with specific styling:

   ```html
   <div class="projects">
     <ul>
       <!-- no bullets -->
       <li>
         <ul>
           <!-- disc bullets -->
           <li>
             <ul>
               <!-- circle bullets -->
             </ul>
           </li>
         </ul>
       </li>
     </ul>
   </div>
   ```

3. Job entries follow the pattern:
   ```html
   <div class="job-title">Role</div>
   <p style="text-align:left;">
     **Company** – Location
     <span style="float:right;">*Date Range*</span>
   </p>
   ```
