REM ====================================================================
REM Repo:  https://github.com/ManiBecker/MeinErstesMMBasicProgramm
REM Datei: 44_option_informationen.bas
REM Titel: Kapitel 44: Wichtige OPTION-Befehle
REM Buch:  Mein erstes MMBasic Programm
REM Autor: Manfred Becker
REM Datum: 27.07.2026
REM
REM Beschreibung: Dieses Programm verwendet nur programmbezogene OPTION-Befehle.
REM        Permanente Systemeinstellungen werden nicht veraendert.
REM Hardware/Voraussetzungen: keine/PicoMite/ColourMaxiMite
REM
REM ====================================================================

OPTION EXPLICIT
OPTION DEFAULT NONE
OPTION BASE 0

DIM i%
DIM werte%(4)
DIM summe%
DIM text$

CLS
PRINT "Kapitel 44 - Wichtige OPTION-Befehle"
PRINT STRING$(42, "-")
PRINT

PRINT "Dieses Programm verwendet:"
PRINT "  OPTION EXPLICIT"
PRINT "  OPTION DEFAULT NONE"
PRINT "  OPTION BASE 0"
PRINT

PRINT "OPTION EXPLICIT"
PRINT "Variablen muessen vor der Verwendung"
PRINT "deklariert werden."
PRINT

PRINT "OPTION DEFAULT NONE"
PRINT "Jede Variable benoetigt einen"
PRINT "ausdruecklich angegebenen Datentyp."
PRINT

PRINT "OPTION BASE 0"
PRINT "Arrays beginnen beim Index 0."
PRINT

PRINT "Beispielarray:"
FOR i% = 0 TO 4
  werte%(i%) = (i% + 1) * 10
  PRINT "werte%("; i%; ") = "; werte%(i%)
NEXT i%

PRINT
summe% = 0
FOR i% = 0 TO 4
  summe% = summe% + werte%(i%)
NEXT i%

PRINT "Summe = "; summe%
PRINT

PRINT "Systeminformation:"
PRINT "CPU-Takt: "; MM.INFO$(CPUSPEED); " Hz"
PRINT

text$ = "OPTION LIST"
PRINT "Hinweis:"
PRINT text$; " wird an der MMBasic-"
PRINT "Eingabeaufforderung eingegeben."
PRINT "Permanente Optionen werden von diesem"
PRINT "Beispielprogramm nicht veraendert."
PRINT
PRINT "Programm beendet." 
