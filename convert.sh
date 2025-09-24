filename="JamesHartResume_$(date +%Y%m%d).pdf"
tempfile="temp.md"

sed "s/{{FILENAME}}/$filename/g" JamesHartResume.md > $tempfile
pandoc $tempfile --pdf-engine=wkhtmltopdf \
    --pdf-engine-opt=--margin-top --pdf-engine-opt=10 \
    --pdf-engine-opt=--margin-left --pdf-engine-opt=20 \
    --pdf-engine-opt=--margin-right --pdf-engine-opt=20 \
    --pdf-engine-opt=--margin-bottom --pdf-engine-opt=10 \
    --pdf-engine-opt=--page-width --pdf-engine-opt=210 \
    --pdf-engine-opt=--page-height --pdf-engine-opt=297 \
    -o "pdf/$filename"

rm $tempfile