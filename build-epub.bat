
@echo off
setlocal
chcp 65001 >nul

REM ============================================================
REM build-epub.bat
REM Mein erstes MMBasic Programm
REM EPUB3-Ausgabe fuer Amazon Kindle
REM ============================================================

cd /d "%~dp0"

REM ------------------------------------------------------------
REM Einstellungen
REM ------------------------------------------------------------

set "VERSION=0.23"
set "SOURCE=book.adoc"
set "OUTPUT=MeinErstesMMBasicProgramm-v%VERSION%-CSS-Test.epub"
set "STYLESDIR=epub-styles"

REM ------------------------------------------------------------
REM Pruefen, ob Asciidoctor EPUB3 installiert ist
REM ------------------------------------------------------------

where asciidoctor-epub3 >nul 2>&1

if errorlevel 1 (
    echo FEHLER: asciidoctor-epub3 wurde nicht gefunden.
    pause
    exit /b 1
)

REM ------------------------------------------------------------
REM Pruefen, ob die Stylesheets vorhanden sind
REM ------------------------------------------------------------

if not exist "%STYLESDIR%\epub3.scss" (
    echo FEHLER: epub3.scss wurde nicht gefunden.
    pause
    exit /b 1
)

if not exist "%STYLESDIR%\epub3-css3-only.scss" (
    echo FEHLER: epub3-css3-only.scss wurde nicht gefunden.
    pause
    exit /b 1
)

if not exist "%STYLESDIR%\_kindle.scss" (
    echo FEHLER: _kindle.scss wurde nicht gefunden.
    pause
    exit /b 1
)

REM ------------------------------------------------------------
REM EPUB3 erzeugen
REM ------------------------------------------------------------

echo.
echo Erzeuge EPUB3 fuer Kindle...
echo Eingabe: %SOURCE%
echo Styles:  %STYLESDIR%
echo Ausgabe: %OUTPUT%
echo.

asciidoctor-epub3 ^
    -a ebook ^
    -a ebook-format=epub3 ^
    -a epub3-stylesdir=%STYLESDIR% ^
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
