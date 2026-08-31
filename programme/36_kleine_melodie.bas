Rem ====================================================================
Rem Repo:  https://github.com/ManiBecker/MeinErstesMMBasicProgramm
Rem Datei: 36_kleine_melodie.bas
Rem Titel: Kapitel 36: Toene und Piezo-Summer
Rem Buch:  Mein erstes MMBasic Programm
Rem Autor: Manfred Becker
Rem Datum: 31.08.2026
Rem
Rem Beschreibung: Unterschied zwischen aktiven und passiven Summern
Rem
Rem Hardware/Voraussetzungen: PicoMite/ColourMaxiMite
Rem
Rem ====================================================================

Option Continuation Lines On
CLS RGB(BLACK)

Print "8. Der Play TONE-Befehl"
Print
Print "Zum Erzeugen von Toenen stellt MMBasic den Befehl Play TONE zur Verfuegung."
Print "Der allgemeine Aufbau lautet:"
Print "Play TONE FrequenzLinks [, FrequenzRechts [, Dauer [, Interrupt]]]"
Print "Die vier Parameter haben folgende Bedeutung:"
Print "Parameter      Bedeutung"
Print "FrequenzLinks  Tonhoehe in Hertz (Hz) linker Kanal"
Print "FrequenzRechts Tonhoehe in Hertz (Hz) rechter Kanal"
Print "Dauer          Spieldauer des Tons in Millisekunden (ms)"
Print "Interrupt      Subroutine, die nach der Spieldauer aufgerufen wird"
Print "Je hoeher die Frequenz, desto hoeher klingt der Ton. Ueber die Dauer wird"
Print "festgelegt, wie lange der Ton ausgegeben wird. Der Ton wird im Hintergrund"
Print "abgespielt. Wenn keine Dauer angegeben wird, spielt er Ton weiter, solange"
Print "er gestoppt wird (Play TONE 0,0,0), oder das Programm beendet wird."
Print
Print "Press any key...": Do : Loop While Inkey$=""

CLS
Print "9. Der erste Ton"
Print
Print "Mit MMBasic lassen sich Toene sehr einfach erzeugen."
Print "Play TONE 1000,1000,500"
Print "Das bedeutet:"
Print "Parameter Bedeutung"
Print "1000 Frequenz in Hertz des linken Kanals"
Print "1000 Frequenz in Hertz des rechten Kanals"
Print "500 Dauer in Millisekunden"
Print

Play TONE 1000,1000,500

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
Print "12. Experimentiere!"
Print
Print "Probiere verschiedene Frequenzen aus:"
Print "Play TONE 200,200,500 : Pause 500"
Print "Play TONE 500,500,500 : Pause 500"
Print "Play TONE 1000,1000,500 : Pause 500"
Print "Play TONE 2000,2000,500 : Pause 500"
Print "Wie veraendert sich der Klang?"
Print

Play TONE 200,200,500 : Pause 500
Play TONE 500,500,500 : Pause 500
Play TONE 1000,1000,500 : Pause 500
Play TONE 2000,2000,500 : Pause 500

Print "Press any key...": Do : Loop While Inkey$=""

CLS
Print "13. Eine kleine Tonleiter"
Print
Print "Die folgenden Frequenzen entsprechen ungefaehr einer Tonleiter."
Print "Play TONE 262,262,500 : Pause 500"
Print "Play TONE 294,294,500 : Pause 500"
Print "Play TONE 330,330,500 : Pause 500"
Print "Play TONE 349,349,500 : Pause 500"
Print "Play TONE 392,392,500 : Pause 500"
Print "Play TONE 440,440,500 : Pause 500"
Print "Play TONE 494,494,500 : Pause 500"
Print "Play TONE 523,523,500 : Pause 500"
Print "Spiele das Programm ab."
Print "Du hoerst eine aufsteigende Tonfolge."
Print

Play TONE 262,262,500 : Pause 500
Play TONE 294,294,500 : Pause 500
Play TONE 330,330,500 : Pause 500
Play TONE 349,349,500 : Pause 500
Play TONE 392,392,500 : Pause 500
Play TONE 440,440,500 : Pause 500
Play TONE 494,494,500 : Pause 500
Play TONE 523,523,500 : Pause 500

Print "Press any key...": Do : Loop While Inkey$=""

CLS
Print "14. Toene und LEDs kombinieren"
Print
Print "Wir koennen die LED aus Kapitel 31 mit einem Ton kombinieren."
Print "SETPIN GP0,DOUT"
Print "PIN(GP0)=1"
Print "Play TONE 1000,1000,500 : Pause 500"
Print "PIN(GP0)=0"
Print "LED und Ton werden gleichzeitig aktiviert."
Print

SetPin GP0,DOUT
Pin(GP0)=1
Play TONE 1000,1000,500 : Pause 500
Pin(GP0)=0

Print "Press any key...": Do : Loop While Inkey$=""

CLS
Print "15. Eine Sirene"
Print
Print "DO"
Print "  FOR F=500 TO 1500 STEP 20"
Print "    Play TONE F,F,10 : Pause 10"
Print "  NEXT F"
Print "  FOR F=1500 TO 500 STEP -20"
Print "    Play TONE F,F,10 : Pause 10"
Print "  NEXT F"
Print "LOOP"
Print "Die Tonhoehe steigt und faellt nun staendig."
Print

Do
  For F=500 To 1500 Step 20
    Play TONE F,F,10 : Pause 10
  Next F
  For F=1500 To 500 Step -20
    Play TONE F,F,10 : Pause 10
  Next F
Loop While Inkey$=""

Print "Press any key...": Do : Loop While Inkey$=""

CLS
Print "16. Eine einfache Klingel"
Print
Print "Viele Tuerklingeln verwenden zwei Toene."
Print "Play TONE 800,800,300 : Pause 300"
Print "PAUSE 50"
Print "Play TONE 600,600,500 : Pause 500"
Print "Das ergibt:"
Print "Ding-Dong"

Play TONE 800,800,300 : Pause 300
Pause 50
Play TONE 600,600,500 : Pause 500

Print
Print "Press any key...": Do : Loop While Inkey$=""

CLS
Print "17. Wiederholte Signaltoene"
Print
Print "FOR I=1 TO 5"
Print "  Play TONE 1000,1000,100 : Pause 100"
Print "  PAUSE 100"
Print "NEXT I"
Print "Das Programm erzeugt fuenf kurze Signaltoene."
Print

For I=1 To 5
  Play TONE 1000,1000,100 : Pause 100
  Pause 100
Next I

Print "Press any key...": Do : Loop While Inkey$=""

CLS
Print "18. Melodien programmieren"
Print
Print "Eine Melodie besteht aus vielen einzelnen Noten."
Print "Jede Note besitzt:"
Print "- eine Frequenz"
Print "- eine Dauer"
Print "Beispiel:"
Print "Play TONE 262,262,500 : Pause 500"
Print "Play TONE 294,294,500 : Pause 500"
Print "Play TONE 330,330,500 : Pause 500"
Print

Play TONE 262,262,500 : Pause 500
Play TONE 294,294,500 : Pause 500
Play TONE 330,330,500 : Pause 500

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

Dim NOTE(8)
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
Print "  Play TONE NOTE(I),NOTE(I),400 : Pause 400"
Print "NEXT I"
Print "Das Ergebnis entspricht der vorherigen Tonleiter."
Print "Der Quelltext ist jedoch wesentlich uebersichtlicher."
Print

'Dim NOTE(8)
NOTE(1)=262
NOTE(2)=294
NOTE(3)=330
NOTE(4)=349
NOTE(5)=392
NOTE(6)=440
NOTE(7)=494
NOTE(8)=523
For I=1 To 8
  Play TONE NOTE(I),NOTE(I),400 : Pause 400
Next I

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

Const C1 = 1
Const D1 = 2
Const E1 = 3
Const F1 = 4
Const G1 = 5
Const A1 = 6
Const H1 = 7
Data C1,D1,E1,F1,G1,G1,H1,H1,G1

Print "Press any key...": Do : Loop While Inkey$=""

CLS
Print "22. Praxisprojekt: Alle meine Entchen"
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
Print "Play TONE NOTE(1),NOTE(1),400 : Pause 400"
Print "Play TONE NOTE(2),NOTE(2),400 : Pause 400"
Print "Play TONE NOTE(3),NOTE(3),400 : Pause 400"
Print "Play TONE NOTE(4),NOTE(4),400 : Pause 400"
Print "Play TONE NOTE(5),NOTE(5),800 : Pause 800"
Print "Play TONE NOTE(5),NOTE(5),800 : Pause 800"
Print "Die Melodie ist noch nicht vollstaendig, aber bereits gut erkennbar."
Print

'Dim NOTE(7)
NOTE(1)=262
NOTE(2)=294
NOTE(3)=330
NOTE(4)=349
NOTE(5)=392
NOTE(6)=440
NOTE(7)=494
Play TONE NOTE(1),NOTE(1),400 : Pause 400
Play TONE NOTE(2),NOTE(2),400 : Pause 400
Play TONE NOTE(3),NOTE(3),400 : Pause 400
Play TONE NOTE(4),NOTE(4),400 : Pause 400
Play TONE NOTE(5),NOTE(5),800 : Pause 800
Play TONE NOTE(5),NOTE(5),800 : Pause 800

Print "Press any key...": Do : Loop While Inkey$=""

CLS
Print "23. Praxisprojekt: Elektronische Tuerklingel"
Print
Print "DO"
Print "  PRINT ""Taste ENTER"""
Print "  INPUT A$"
Print "  Play TONE 800,800,300 : Pause 300"
Print "  PAUSE 50"
Print "  Play TONE 600,600,500 : Pause 500"
Print "LOOP"
Print "Jedes Druecken der ENTER-Taste loest die Klingel aus."
Print

Do
  Print "Taste ENTER"
  Input A$
  Play TONE 800,800,300 : Pause 300
  Pause 50
  Play TONE 600,600,500 : Pause 500
Loop While A$=Chr$(13)

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
Print "28. Probier's selbst!"
Print
Print "Versuche folgende Aufgaben:"
Print "1. Spiele eine eigene Melodie."
Print "2. Erzeuge einen Alarmton."
Print "3. Programmiere einen Wecker."
Print "4. Erstelle eine Dreiklang-Folge."
Print "5. Ergaenze die fehlenden Takte von "Alle meine Entchen"."
Print
Print "Ready..."
