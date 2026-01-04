#!/usr/bin/env bash
set -euo pipefail

filename="JamesHartResume_$(date +%Y%m%d).pdf"
tempfile="temp.md"

command_exists() { command -v "$1" >/dev/null 2>&1; }

# Try to detect wkhtmltopdf; on Windows try some common install locations
if ! command_exists wkhtmltopdf; then
    if [ -n "${WINDIR-}" ] || uname 2>/dev/null | grep -qi "mingw\|msys\|cygwin"; then
        for p in "/c/Program Files/wkhtmltopdf/bin/wkhtmltopdf.exe" "/c/Program Files (x86)/wkhtmltopdf/bin/wkhtmltopdf.exe" "C:/Program Files/wkhtmltopdf/bin/wkhtmltopdf.exe"; do
            if [ -x "$p" ]; then
                PATH="$(dirname "$p"):$PATH"
                break
            fi
        done
    fi
fi

if ! command_exists wkhtmltopdf; then
    cat >&2 <<'EOF'
wkhtmltopdf not found. Please install wkhtmltopdf or choose a different pandoc PDF engine.

Windows installation options:
    - Download an installer from: https://wkhtmltopdf.org/downloads.html and install.
        Make sure the wkhtmltopdf `bin` folder is on your PATH (or reinstall with the "Add to PATH" option).
    - Or install via Chocolatey (requires Chocolatey): open an elevated PowerShell and run:
            choco install wkhtmltopdf

Alternatives:
    - Use `--pdf-engine=xelatex` (requires a TeX distribution like MiKTeX or TeX Live).
    - Use `--pdf-engine=weasyprint` (requires Python and WeasyPrint installed).

After installing, re-run this script (in Git Bash/WSL or a POSIX shell).
EOF
    exit 1
fi

sed "s/{{FILENAME}}/$filename/g" JamesHartResume.md > "$tempfile"
pandoc "$tempfile" --pdf-engine=wkhtmltopdf \
        --pdf-engine-opt=--margin-top --pdf-engine-opt=10 \
        --pdf-engine-opt=--margin-left --pdf-engine-opt=20 \
        --pdf-engine-opt=--margin-right --pdf-engine-opt=20 \
        --pdf-engine-opt=--margin-bottom --pdf-engine-opt=10 \
        --pdf-engine-opt=--page-width --pdf-engine-opt=210 \
        --pdf-engine-opt=--page-height --pdf-engine-opt=297 \
        -o "pdf/$filename"

rm "$tempfile"