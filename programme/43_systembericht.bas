REM ====================================================================
REM Repo:  https://github.com/ManiBecker/MeinErstesMMBasicProgramm
REM Datei: 43_systembericht.bas
REM Titel: Kapitel 43: Nuetzliche Systeminformationen
REM Buch:  Mein erstes MMBasic Programm
REM Autor: Manfred Becker
REM Datum: 08.09.2026
REM
REM Beschreibung: Beispielprogramm zu Kapitel 43
REM
REM Hardware/Voraussetzungen: keine/PicoMite/ColourMaxiMite
REM
REM ====================================================================

CLS

PRINT "Systeminformationen"
PRINT "-------------------"
PRINT

PRINT "Bildschirmbreite : "; MM.HRES
PRINT "Bildschirmhoehe  : "; MM.VRES
PRINT

PRINT "CPU-Speed        : "; MM.INFO$(CPUSPEED)
PRINT "Firmwareversion  : "; MM.INFO(VERSION)
PRINT "Boot-Ursache     : "; MM.INFO$(BOOT)
PRINT "Uptime           : "; MM.INFO(UPTIME); " s"
PRINT

PRINT "MMBasic-Heap frei: "; MM.INFO(HEAP); " Byte"
PRINT

PRINT "Aktives Laufwerk : "; MM.INFO$(DRIVE)
PRINT "Arbeitsverzeichnis: "; CWD$
PRINT "Programm         : "; MM.INFO$(CURRENT)
PRINT "Programmpfad     : "; MM.INFO$(PATH)
PRINT

PRINT "Laufwerksgroesse : "; MM.INFO(DISK SIZE); " Byte"
PRINT "Freier Speicher  : "; MM.INFO(FREE SPACE); " Byte" 
