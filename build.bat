@echo off

echo.
echo === Normales PDF wird erstellt ===
asciidoctor-pdf -a pdf-theme=theme.yml -o MeinErstesMMBasicProgramm-v0.22.pdf book.adoc

echo.
echo === Fertig ===
