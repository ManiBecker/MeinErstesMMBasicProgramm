REM ====================================================================
REM Repo:  https://github.com/ManiBecker/MeinErstesMMBasicProgramm
REM Datei: 19_grafikdemo.bas
REM Titel: Kapitel 19: Die ersten Grafikbefehle
REM Buch:  Mein erstes MMBasic Programm
REM Autor: Manfred Becker
REM Datum: 28.07.2026
REM
REM Beschreibung: Pixel und Linien zeichnen
REM
REM Hardware/Voraussetzungen: PicoMite/ColourMaxiMite
REM
REM ====================================================================

PRINT "3. Den Bildschirm löschen"
CLS

PRINT "4. Ein einzelner Pixel"
PIXEL 100,100

PRINT "5. Ein farbiger Pixel"
PIXEL 100,100,RGB(RED)

PRINT "6. Unser erstes Grafikprogramm"
CLS RGB(BLACK)
PIXEL 100,100,RGB(RED)

PRINT "7. Mehrere Pixel zeichnen"
CLS RGB(BLACK)
PIXEL 100,100,RGB(RED)
PIXEL 101,100,RGB(RED)
PIXEL 102,100,RGB(RED)
PIXEL 103,100,RGB(RED)
PIXEL 104,100,RGB(RED)

PRINT "8. Linien zeichnen"
LINE 10,10,200,10

PRINT "9. Horizontale Linien"
CLS
LINE 10,50,200,50

PRINT "10. Vertikale Linien"
CLS
LINE 100,20,100,200

PRINT "11. Diagonale Linien"
CLS
LINE 10,10,200,150

PRINT "12. Linienfarben"
LINE 10,10,200,100,,RGB(RED)

PRINT "13. Mehrere Linien kombinieren"
CLS
LINE 50,100,250,100
LINE 150,20,150,180

PRINT "14. Ein Dreieck zeichnen"
CLS
LINE 100,50,50,150
LINE 50,150,150,150
LINE 150,150,100,50

PRINT "15. Ein Haus zeichnen"
CLS
LINE 50,150,150,150
LINE 150,150,150,80
LINE 150,80,50,80
LINE 50,80,50,150
LINE 50,80,100,30
LINE 100,30,150,80

PRINT "16. Das Haus vom Nikolaus"
PRINT "Eine bekannte Zeichenübung ist das Haus vom Nikolaus."
PRINT "Versuche, es selbst mit LINE zu zeichnen."

PRINT "17. Bildschirmmitte berechnen"
MITTEX=MM.HRES/2
MITTEY=MM.VRES/2
PIXEL MITTEX,MITTEY,RGB(RED)

PRINT "18. Ein Fadenkreuz zeichnen"
CLS
LINE MM.HRES/2,0,MM.HRES/2,MM.VRES
LINE 0,MM.VRES/2,MM.HRES,MM.VRES/2

PRINT "19. Ein kleines Grafik-Testprogramm"
PRINT "Lade 19_grafikdemo_test_1.bas"

PRINT "21. Probier’s selbst!"
PRINT "Versuche folgende Aufgaben:"
PRINT "1. Zeichne ein Quadrat aus vier Linien."
PRINT "2. Zeichne einen Stern."
PRINT "3. Zeichne ein eigenes Haus."
PRINT "4. Zeichne ein Spielfeld für Tic-Tac-Toe."
PRINT "5. Zeichne die Umrisse eines Briefumschlags."

PRINT "22. Experimentiere!"
PRINT "Probiere folgende Änderungen aus:"
PRINT "- Verwende andere Farben."
PRINT "- Zeichne ein größeres Haus."
PRINT "- Zeichne mehrere Dreiecke."
PRINT "- Zeichne ein Gitter aus Linien."


