@echo off

echo.
echo === Normales PDF wird erstellt ===
asciidoctor-pdf -o book.pdf book.adoc

echo.
echo === Fertig ===