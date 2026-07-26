REM ====================================================================
REM Repo:  https://github.com/ManiBecker/MeinErstesMMBasicProgramm
REM Datei: 10_strukturiertes_programm.bas
REM Titel: Kapitel 10: Programme strukturieren mit SUB und FUNCTION
REM Buch:  Mein erstes MMBasic Programm
REM Autor: Manfred Becker
REM Datum: 24.07.2026
REM
REM Beschreibung: Programme in kleinere Bausteine aufzuteilen
REM
REM Hardware/Voraussetzungen: keine
REM
REM ====================================================================

PRINT "3. Unsere erste SUB"
SUB Begruessung
  PRINT "Hallo Welt!"
END SUB
Begruessung

PRINT "4. Eine SUB mehrfach aufrufen"
Begruessung
Begruessung
Begruessung

PRINT "5. Eine SUB mit Parametern"
SUB Begruessung(NAME$)
  PRINT "Hallo ";NAME$
END SUB
Begruessung("Manfred")
Begruessung("Geoff")
Begruessung("Peter")

PRINT "7. Unsere erste FUNCTION"
FUNCTION Quadrat(X)
  Quadrat=X*X
END FUNCTION
PRINT Quadrat(5)

PRINT "8. Weitere Funktionen"
FUNCTION Verdoppeln(X)
  Verdoppeln=X*2
END FUNCTION
PRINT Verdoppeln(10)

PRINT "9. Funktionen in Berechnungen verwenden"
PRINT Quadrat(5)+Quadrat(3)

PRINT "10. Eine Würfelfunktion"
FUNCTION Wuerfel()
  Wuerfel=INT(RND*6)+1
END FUNCTION
PRINT Wuerfel()
PRINT Wuerfel()
PRINT Wuerfel()

PRINT "11. Eine mathematische Funktion"
FUNCTION F(X)
  F=0.5*X^2+X+0.5
END FUNCTION
FOR X=0 TO 10
  PRINT X;" ";F(X)
NEXT X

PRINT "12. Das Zahlenratespiel verbessern"
FUNCTION NeueZahl()
  NeueZahl=INT(RND*100)+1
END FUNCTION
GEHEIM=NeueZahl()
PRINT GEHEIM

PRINT "15. Experimentiere!"
PRINT "Probiere folgende Änderungen aus:"
PRINT "- Schreibe eine Funktion zur Berechnung des Dreifachen einer Zahl."
PRINT "- Schreibe eine Funktion für die Berechnung eines Kreises."
PRINT "- Erweitere die Würfelfunktion."
PRINT "- Erstelle eine SUB für eine persönliche Begrüßung."

PRINT "10.16. Probier’s selbst!"
PRINT "Versuche folgende Aufgaben:"
PRINT "1. Schreibe eine Funktion zur Berechnung des Würfels einer Zahl."
PRINT "2. Schreibe eine Funktion zur Berechnung des Umfangs eines Quadrats."
PRINT "3. Erstelle eine SUB, die fünfmal ""MMBasic"" ausgibt."
PRINT "4. Verwende eine Funktion innerhalb einer FOR-Schleife."
PRINT "5. Baue die Funktion NeueZahl() in dein Zahlenratespiel ein."


