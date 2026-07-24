REM ====================================================================
REM Repo:  https://github.com/ManiBecker/MeinErstesMMBasicProgramm
REM Datei: 07_wuerfel.bas
REM Titel: Kapitel 7: Zufallszahlen
REM Buch:  Mein erstes MMBasic Programm
REM Autor: Manfred Becker
REM Datum: 24.07.2026
REM
REM Beschreibung: wie Zufallszahlen erzeugt werden
REM
REM Hardware/Voraussetzungen: keine
REM
REM ====================================================================

PRINT "3. Eine Zufallszahl erzeugen"
PRINT RND

PRINT "4. Zufallszahlen mehrfach erzeugen"
FOR I=1 TO 10
  PRINT RND
NEXT I

PRINT "5. Einen Würfel simulieren"
PRINT INT(RND*6)+1

PRINT "6. Mehrfach würfeln"
FOR I=1 TO 10
  PRINT INT(RND*6)+1
NEXT I

PRINT "6. Mehrfach würfeln"
FOR I=1 TO 10
  PRINT INT(RND*6)+1
NEXT I

PRINT "7. Münze werfen"
IF INT(RND*2)=0 THEN
  PRINT "Kopf"
ELSE
  PRINT "Zahl"
ENDIF

PRINT "8. Lottozahlen erzeugen"
FOR I=1 TO 6
  PRINT INT(RND*49)+1
NEXT I

PRINT "9. Ein Ratespiel"
GEHEIM=INT(RND*10)+1
PRINT "Rate eine Zahl von 1 bis 10"
INPUT TIPP
IF TIPP=GEHEIM THEN
  PRINT "Richtig!"
ELSE
  PRINT "Leider falsch."
ENDIF