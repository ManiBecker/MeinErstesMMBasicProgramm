REM ====================================================================
REM Repo:  https://github.com/ManiBecker/MeinErstesMMBasicProgramm
REM Datei: 36_kleine_melodie.bas
REM Titel: Kapitel 36: Toene und Piezo-Summer
REM Buch:  Mein erstes MMBasic Programm
REM Autor: Manfred Becker
REM Datum: 31.08.2026
REM
REM Beschreibung: Unterschied zwischen aktiven und passiven Summern
REM
REM Hardware/Voraussetzungen: PicoMite/ColourMaxiMite
REM
REM ====================================================================

Option Continuation Lines On
CLS RGB(BLACK)

Print "8. Der TONE-Befehl"
Print
Print "Zum Erzeugen von Toenen stellt MMBasic den Befehl TONE zur Verfuegung."
Print "Der allgemeine Aufbau lautet:"
Print "TONE Frequenz, Dauer"
Print "Die beiden Parameter haben folgende Bedeutung:"
Print "Parameter Bedeutung"
Print "Frequenz  Tonhoehe in Hertz (Hz)"
Print "Dauer     Spieldauer des Tons in Millisekunden (ms)"
Print "Je hoeher die Frequenz, desto hoeher klingt der Ton. Ueber die Dauer wird"
Print "festgelegt, wie lange der Ton ausgegeben wird."
Print 
Print "Press any key...": Do : Loop While Inkey$=""

CLS
Print "9. Der erste Ton"
Print
Print "Mit MMBasic lassen sich Toene sehr einfach erzeugen."
Print "TONE 1000,500"
Print "Das bedeutet:"
Print "Parameter Bedeutung"
Print "1000 Frequenz in Hertz"
Print "500 Dauer in Millisekunden"
Print 

TONE 1000,500

Print "Press any key...": Do : Loop While Inkey$=""

CLS
Print "10. Was ist eine Frequenz?"
Print
Print "Die Frequenz gibt an, wie oft ein Signal pro Sekunde schwingt."
Print "1000 Hz = 1000 Schwingungen pro Sekunde"
Print 
Print "Press any key...": Do : Loop While Inkey$=""

CLS
Print "11. Tiefe und hohe Toene"
Print
Print "Kleine Frequenz: 200 Hz ergibt einen tiefen Ton."
Print "Grosse Frequenz: 2000 Hz ergibt einen hohen Ton."
Print 
Print "Press any key...": Do : Loop While Inkey$=""

CLS
Print "12. Experimentiere!
Print
Print "Probiere verschiedene Frequenzen aus:"
Print "TONE 200,500"
Print "TONE 500,500"
Print "TONE 1000,500"
Print "TONE 2000,500"
Print "Wie veraendert sich der Klang?"
Print 

TONE 200,500
TONE 500,500
TONE 1000,500
TONE 2000,500

Print "Press any key...": Do : Loop While Inkey$=""

CLS
Print "13. Eine kleine Tonleiter"
Print
Print "Die folgenden Frequenzen entsprechen ungefaehr einer Tonleiter."
Print "TONE 262,500"
Print "TONE 294,500"
Print "TONE 330,500"
Print "TONE 349,500"
Print "TONE 392,500"
Print "TONE 440,500"
Print "TONE 494,500"
Print "TONE 523,500"
Print "Spiele das Programm ab."
Print "Du hoerst eine aufsteigende Tonfolge."
Print 

TONE 262,500
TONE 294,500
TONE 330,500
TONE 349,500
TONE 392,500
TONE 440,500
TONE 494,500

Print "Press any key...": Do : Loop While Inkey$=""

CLS
Print "14. Toene und LEDs kombinieren"
Print
Print "Wir koennen die LED aus Kapitel 31 mit einem Ton kombinieren."
Print "SETPIN GP0,DOUT"
Print "PIN(GP0)=1"
Print "TONE 1000,500"
Print "PIN(GP0)=0"
Print "LED und Ton werden gleichzeitig aktiviert."
Print 

SETPIN GP0,DOUT
PIN(GP0)=1
TONE 1000,500
PIN(GP0)=0

Print "Press any key...": Do : Loop While Inkey$=""

CLS
Print "15. Eine Sirene"
Print
Print "DO"
Print "  FOR F=500 TO 1500 STEP 20"
Print "    TONE F,10"
Print "  NEXT F"
Print "  FOR F=1500 TO 500 STEP -20"
Print "    TONE F,10"
Print "  NEXT F"
Print "LOOP"
Print "Die Tonhoehe steigt und faellt nun staendig."
Print 

DO
  FOR F=500 TO 1500 STEP 20
    TONE F,10
  NEXT F
  FOR F=1500 TO 500 STEP -20
    TONE F,10
  NEXT F
LOOP While Inkey$=""

Print "Press any key...": Do : Loop While Inkey$=""

CLS
Print "16. Eine einfache Klingel"
Print
Print "Viele Tuerklingeln verwenden zwei Toene."
Print "TONE 800,300"
Print "PAUSE 50"
Print "TONE 600,500"
Print "Das ergibt:"
Print "Ding-Dong"

TONE 800,300
PAUSE 50
TONE 600,500

Print 
Print "Press any key...": Do : Loop While Inkey$=""

CLS
Print "17. Wiederholte Signaltoene"
Print
Print "FOR I=1 TO 5"
Print "  TONE 1000,100"
Print "  PAUSE 100"
Print "NEXT I"
Print "Das Programm erzeugt fuenf kurze Signaltoene."
Print

FOR I=1 TO 5
  TONE 1000,100
  PAUSE 100
NEXT I

Print "Press any key...": Do : Loop While Inkey$=""

CLS
Print "18. Melodien programmieren"
Print
Print "Eine Melodie besteht aus vielen einzelnen Noten."
Print "Jede Note besitzt:"
Print "- eine Frequenz"
Print "- eine Dauer"
Print "Beispiel:"
Print "TONE 262,500"
Print "TONE 294,500"
Print "TONE 330,500"
Print 

TONE 262,500
TONE 294,500
TONE 330,500

Print "Press any key...": Do : Loop While Inkey$=""

CLS
Print "19. Arrays fuer Notenfolgen"
Print
Print "Mit Arrays lassen sich Melodien uebersichtlicher speichern."
Print "DIM NOTE(8)"
Print "Nun fuellen wir das Array:"
Print "NOTE(1)=262"
Print "NOTE(2)=294"
Print "NOTE(3)=330"
Print "NOTE(4)=349"
Print "NOTE(5)=392"
Print "NOTE(6)=440"
Print "NOTE(7)=494"
Print "NOTE(8)=523"
Print 

DIM NOTE(8)
NOTE(1)=262
NOTE(2)=294
NOTE(3)=330
NOTE(4)=349
NOTE(5)=392
NOTE(6)=440
NOTE(7)=494
NOTE(8)=523

Print "Press any key...": Do : Loop While Inkey$=""

CLS
Print "20. Die Tonleiter mit einem Array"
Print
Print "DIM NOTE(8)"
Print "NOTE(1)=262"
Print "NOTE(2)=294"
Print "NOTE(3)=330"
Print "NOTE(4)=349"
Print "NOTE(5)=392"
Print "NOTE(6)=440"
Print "NOTE(7)=494"
Print "NOTE(8)=523"
Print "FOR I=1 TO 8"
Print "  TONE NOTE(I),400"
Print "NEXT I"
Print "Das Ergebnis entspricht der vorherigen Tonleiter."
Print "Der Quelltext ist jedoch wesentlich uebersichtlicher."
Print 

DIM NOTE(8)
NOTE(1)=262
NOTE(2)=294
NOTE(3)=330
NOTE(4)=349
NOTE(5)=392
NOTE(6)=440
NOTE(7)=494
NOTE(8)=523
FOR I=1 TO 8
  TONE NOTE(I),400
NEXT I

Print "Press any key...": Do : Loop While Inkey$=""

CLS
Print "21. Melodien mit Notennamen"
Print
Print "Eine Melodie laesst sich noch uebersichtlicher schreiben, wenn die einzelnen Noten Namen erhalten."
Print "Dazu definieren wir zunaechst Konstanten fuer die Positionen im Noten-Array."
Print "CONST C1 = 1"
Print "CONST D1 = 2"
Print "CONST E1 = 3"
Print "CONST F1 = 4"
Print "CONST G1 = 5"
Print "CONST A1 = 6"
Print "CONST H1 = 7"
Print "Nun kann eine Melodie wesentlich leichter gelesen werden:"
Print "DATA C1,D1,E1,F1,G1,G1,H1,H1,G1"
Print "Der eigentliche Frequenzwert wird weiterhin aus dem Array NOTE() entnommen. Dadurch lassen"
Print "sich Melodien spaeter einfacher aendern oder sogar auf andere Tonlagen uebertragen."
Print 

CONST C1 = 1
CONST D1 = 2
CONST E1 = 3
CONST F1 = 4
CONST G1 = 5
CONST A1 = 6
CONST H1 = 7
DATA C1,D1,E1,F1,G1,G1,H1,H1,G1

Print "Press any key...": Do : Loop While Inkey$=""

CLS
Print "22. Praxisprojekt: Alle meine Entchen
Print
Print "Nun spielen wir die ersten Takte eines bekannten Kinderlieds."
Print "DIM NOTE(7)"
Print "NOTE(1)=262"
Print "NOTE(2)=294"
Print "NOTE(3)=330"
Print "NOTE(4)=349"
Print "NOTE(5)=392"
Print "NOTE(6)=440"
Print "NOTE(7)=494"
Print "TONE NOTE(1),400"
Print "TONE NOTE(2),400"
Print "TONE NOTE(3),400"
Print "TONE NOTE(4),400"
Print "TONE NOTE(5),800"
Print "TONE NOTE(5),800"
Print "Die Melodie ist noch nicht vollstaendig, aber bereits gut erkennbar."
Print

DIM NOTE(7)
NOTE(1)=262
NOTE(2)=294
NOTE(3)=330
NOTE(4)=349
NOTE(5)=392
NOTE(6)=440
NOTE(7)=494
TONE NOTE(1),400
TONE NOTE(2),400
TONE NOTE(3),400
TONE NOTE(4),400
TONE NOTE(5),800
TONE NOTE(5),800

Print "Press any key...": Do : Loop While Inkey$=""

CLS
Print "23. Praxisprojekt: Elektronische Tuerklingel"
Print
Print "DO"
Print "  PRINT "Taste ENTER""
Print "  INPUT A$"
Print "  TONE 800,300"
Print "  PAUSE 50"
Print "  TONE 600,500"
Print "LOOP"
Print "Jedes Druecken der ENTER-Taste loest die Klingel aus."
Print 

DO
  PRINT "Taste ENTER"
  INPUT A$
  TONE 800,300
  PAUSE 50
  TONE 600,500
LOOP

Print "Press any key...": Do : Loop While Inkey$=""

CLS
Print "24. Mehr als nur Pieptoene"
Print
Print "Die in diesem Kapitel gezeigten Beispiele funktionieren bereits mit einem einfachen PiezoLautsprecher."
Print "Viele MMBasic-Systeme bieten jedoch deutlich umfangreichere Audiofunktionen."
Print "Je nach Hardware koennen Musikdateien abgespielt, mehrere Stimmen gleichzeitig erzeugt oder"
Print "komplette Soundeffekte ausgegeben werden."
Print "Fuer erste Experimente genuegt ein einfacher Piezo-Summer vollkommen."
Print
Print "Einige MMBasic-Systeme besitzen zusaetzliche Audiomoeglichkeiten."
Print "Der Colour Maximite 2 verfuegt ueber spezielle Hardware fuer die Audioausgabe und"
Print "kann deutlich komplexere Klaenge erzeugen als ein einfacher Piezo-Lautsprecher."
Print "Auch verschiedene PicoMite-Varianten unterstuetzen erweiterte Audiofunktionen"
Print "ueber PWM, DACs oder externe Audiobausteine."
Print "Diese Themen wuerden den Rahmen dieses Kapitels sprengen und werden spaeter"
Print "separat behandelt."
Print 
Print "Press any key...": Do : Loop While Inkey$=""

CLS
Print "25. Wo werden Toene verwendet?"
Print
Print "Piezo-Lautsprecher findet man in vielen Projekten:"
Print "- Alarmanlagen"
Print "- Wecker"
Print "- Kuechen-Timer"
Print "- Tuerklingeln"
Print "- Messgeraete"
Print "- Spiele"
Print "Sie sind eine einfache Moeglichkeit, dem Benutzer Rueckmeldungen zu geben."
Print 
Print "Press any key...": Do : Loop While Inkey$=""

CLS
Print "26. Typische Fehler"
Print
Print "Wenn kein Ton hoerbar ist:"
Print "1. Ist der Piezo richtig angeschlossen?"
Print "2. Wird ein passiver Piezo verwendet?"
Print "3. Ist die Lautstaerke ausreichend?"
Print "4. Wird die richtige Frequenz verwendet?"
Print "5. Unterstuetzt das verwendete System den TONE-Befehl?"
Print 
Print "Press any key...": Do : Loop While Inkey$=""

CLS
Print "27. Experimentiere!"
Print
Print "Probiere folgende Aenderungen aus:"
Print "- andere Frequenzen"
Print "- andere Dauern"
Print "- eigene Tonfolgen"
Print "- verschiedene Sirenen"
Print 
Print "Press any key...": Do : Loop While Inkey$=""

CLS
Print "28. Probier’s selbst!"
Print
Print "Versuche folgende Aufgaben:"
Print "1. Spiele eine eigene Melodie."
Print "2. Erzeuge einen Alarmton."
Print "3. Programmiere einen Wecker."
Print "4. Erstelle eine Dreiklang-Folge."
Print "5. Ergaenze die fehlenden Takte von "Alle meine Entchen"."
Print
Print "Ready..."
