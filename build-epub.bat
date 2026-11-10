
@echo off
setlocal
chcp 65001 >nul

REM ============================================================
REM build-epub.bat
REM Mein erstes MMBasic Programm
REM EPUB3-Ausgabe fuer Kindle
REM ============================================================

cd /d "%~dp0"

REM ------------------------------------------------------------
REM Einstellungen
REM ------------------------------------------------------------

set "VERSION=0.23"
set "SOURCE=book.adoc"
set "OUTPUT=MeinErstesMMBasicProgramm-v%VERSION%.epub"

REM ------------------------------------------------------------
REM Pruefen, ob Asciidoctor EPUB3 installiert ist
REM ------------------------------------------------------------

where asciidoctor-epub3 >nul 2>&1

if errorlevel 1 (
    echo FEHLER: asciidoctor-epub3 wurde nicht gefunden.
    echo.
    echo Installation:
    echo gem install asciidoctor-epub3
    pause
    exit /b 1
)

REM ------------------------------------------------------------
REM EPUB3 erzeugen
REM ------------------------------------------------------------

echo.
echo Erzeuge EPUB3 fuer Kindle...
echo Eingabe: %SOURCE%
echo Ausgabe: %OUTPUT%
echo.

asciidoctor-epub3 ^
    -a ebook ^
    -a ebook-format=epub3 ^
    -o "%OUTPUT%" ^
    "%SOURCE%"

if errorlevel 1 (
    echo.
    echo FEHLER: EPUB-Erzeugung fehlgeschlagen.
    pause
    exit /b 1
)

REM ------------------------------------------------------------
REM Fertig
REM ------------------------------------------------------------

echo.
echo ============================================================
echo EPUB erfolgreich erstellt:
echo %OUTPUT%
echo ============================================================
echo.

pause
endlocal
