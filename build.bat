@echo off

echo.
echo === Normales PDF wird erstellt ===
asciidoctor-pdf -a pdf-theme=theme.yml -o book.pdf book.adoc

echo.
echo === Fertig ===
