REM ====================================================================
REM Repo:  https://github.com/ManiBecker/MeinErstesMMBasicProgramm
REM Datei: 03_variablen.bas
REM Titel: Kapitel 3: Variablen
REM Buch:  Mein erstes MMBasic Programm
REM Autor: Manfred Becker
REM Datum: 24.07.2026
REM
REM Beschreibung: Variablen
REM
REM Hardware/Voraussetzungen: keine
REM
REM ====================================================================

PRINT "3. Unsere erste Variable"
A=10
PRINT A

PRINT "Press any key...": Do: Loop While Inkey$=""

PRINT "4. Mehrere Variablen verwenden"
A=10
B=20
PRINT A
PRINT B

PRINT "Press any key...": Do: Loop While Inkey$=""

PRINT "5. Mit Variablen rechnen"
A=10
B=20
PRINT A+B

PRINT "Press any key...": Do: Loop While Inkey$=""

PRINT "6. Variablen veraendern"
A=10
PRINT A
A=25
PRINT A

PRINT "Press any key...": Do: Loop While Inkey$=""

PRINT "7. Der Inhalt einer Variablen kann berechnet werden"
A=10
A=A+1
PRINT A

PRINT "Press any key...": Do: Loop While Inkey$=""

PRINT "8. Zaehler erstellen"
A=0
A=A+1
PRINT A
A=A+1
PRINT A
A=A+1
PRINT A

PRINT "Press any key...": Do: Loop While Inkey$=""

PRINT "9. Experimentiere!"
A=100
B=50
PRINT A+B
PRINT A-B
PRINT A*B