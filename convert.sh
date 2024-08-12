filename="JamesHartResume_$(date +%Y%m%d).pdf"
tempfile="temp.md"

sed "s/{{FILENAME}}/$filename/g" JamesHartResume.md > $tempfile
pandoc $tempfile --pdf-engine=wkhtmltopdf -o "pdf/$filename" -V margin-top=10 -V margin-left=20 -V margin-right=20 -V margin-bottom=10

rm $tempfile