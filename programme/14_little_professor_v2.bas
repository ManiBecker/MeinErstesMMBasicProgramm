REM ====================================================================
REM Repo:  https://github.com/ManiBecker/MeinErstesMMBasicProgramm
REM Datei: 14_little_professor_v2.bas
REM Titel: Kapitel 14: Little Professor Version 2
REM Buch:  Mein erstes MMBasic Programm
REM Autor: Manfred Becker
REM Datum: 27.07.2026
REM
REM Beschreibung: eigenen kleinen Mathematiktrainer programmieren
REM
REM Hardware/Voraussetzungen: keine
REM
REM ====================================================================

PRINT "3. Der Spielername"
INPUT "Wie heisst du ";NAME$
PRINT
PRINT "Hallo ";NAME$
PRINT

PRINT "4. Zufaellig eine Rechenart auswaehlen"
OP=INT(RND*4)
PRINT "Die Werte bedeuten:"
PRINT "0 = Addition"
PRINT "1 = Subtraktion"
PRINT "2 = Multiplikation"
PRINT "3 = Division"

PRINT "5. Eine Aufgabe erzeugen"
SUB NeueAufgabe
  OP=INT(RND*4)
END SUB

PRINT "6. Additionsaufgaben"
A=INT(RND*10)
B=INT(RND*10)
ERG=A+B
PRINT A;" + ";B;" = ?"

PRINT "7. Subtraktionsaufgaben
A=INT(RND*10)+10
B=INT(RND*10)
ERG=A-B
PRINT A;" - ";B;" = ?"

PRINT "8. Multiplikationsaufgaben
A=INT(RND*10)
B=INT(RND*10)
ERG=A*B
PRINT A;" * ";B;" = ?"

PRINT "9. Divisionsaufgaben"
ERG=INT(RND*10)+1
B=INT(RND*10)+1
A=ERG*B
PRINT A;" / ";B;" = ?"

PRINT "10. Die SUB vervollstaendigen
SUB NeueAufgabe
  OP=INT(RND*4)
  IF OP=0 THEN
    A=INT(RND*10)
    B=INT(RND*10)
    ERG=A+B
    PRINT A;" + ";B;" = ?"
  ELSEIF OP=1 THEN
    A=INT(RND*10)+10
    B=INT(RND*10)
    ERG=A-B
    PRINT A;" - ";B;" = ?"
  ELSEIF OP=2 THEN
    A=INT(RND*10)
    B=INT(RND*10)
    ERG=A*B
    PRINT A;" * ";B;" = ?"
  ELSE
    ERG=INT(RND*10)+1
    B=INT(RND*10)+1
    A=ERG*B
    PRINT A;" / ";B;" = ?"
  ENDIF
END SUB

PRINT "11. Das komplette Programm"
PRINT "Findest du in 14_little_professor_v2_final.bas"

PRINT "14. Experimentiere!"
PRINT "Probiere folgende Aenderungen aus:"
PRINT "- Verwende Zahlen bis 20."
PRINT "- Stelle 20 Aufgaben."
PRINT "- Verwende nur Multiplikationsaufgaben."
PRINT "- Verwende nur Divisionsaufgaben."
PRINT "- Aendere die Bewertung am Ende."

PRINT "15. Probier’s selbst!"
PRINT "Versuche folgende Aufgaben:"
PRINT "1. Fuege eine Schwierigkeitsstufe hinzu."
PRINT "2. Lasse den Spieler die Anzahl der Aufgaben waehlen."
PRINT "3. Vergib Bonuspunkte fuer besonders schnelle Loesungen."
PRINT "4. Speichere die Anzahl richtiger und falscher Antworten getrennt."
PRINT "5. Zeige am Ende die erreichte Prozentzahl an."