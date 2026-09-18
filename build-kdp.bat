@echo off

echo.
echo === KDP-PDF wird erstellt ===
asciidoctor-pdf -a kdp -a media=prepress -a pdf-theme=kdp-theme.yml -o MeinErstesMMBasicProgramm-v0.20-KDP.pdf book.adoc

echo.
echo === Fertig ===