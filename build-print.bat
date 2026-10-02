@echo off

echo.
echo === Druckfreundliches PDF wird erstellt ===
asciidoctor-pdf -a media=prepress -a pdf-theme=print-theme.yml -o MeinErstesMMBasicProgramm-v0.22-Print.pdf book.adoc

echo.
echo === Fertig ===
