REM ====================================================================
REM Repo:  https://github.com/ManiBecker/MeinErstesMMBasicProgramm
REM Datei: 20_formen_demo.bas
REM Titel: Kapitel 20: Rechtecke, Kreise und Texte
REM Buch:  Mein erstes MMBasic Programm
REM Autor: Manfred Becker
REM Datum: 28.07.2026
REM
REM Beschreibung: BOX, RBOX, CIRCLE, ARC und TEXT
REM
REM Hardware/Voraussetzungen: PicoMite/ColourMaxiMite
REM
REM ====================================================================

PRINT "3. Ein Rechteck zeichnen"
CLS RGB(BLACK)
BOX 50,40,200,100

PRINT "4. Die Parameter von BOX"
PRINT "BOX X,Y,BREITE,HOEHE,LINIENBREITE,FARBE,FUELLFARBE"

PRINT "5. Ein farbiges Rechteck"
CLS RGB(BLACK)
BOX 50,40,200,100,3,RGB(YELLOW),RGB(BLUE)

PRINT "6. Ein Rechteck ohne Fuellung"
BOX 50,40,200,100,3,RGB(YELLOW)

PRINT "7. Mehrere Rechtecke zeichnen"
CLS RGB(BLACK)
BOX 20,20,100,60,2,RGB(RED)
BOX 50,50,100,60,2,RGB(GREEN)
BOX 80,80,100,60,2,RGB(BLUE)

PRINT "8. Abgerundete Rechtecke"
PRINT "RBOX X,Y,BREITE,HOEHE,RADIUS,FARBE,FUELLFARBE"
CLS RGB(BLACK)
RBOX 50,50,220,80,15,RGB(WHITE),RGB(BLUE)

PRINT "9. Ein grafischer Schalter"
CLS RGB(BLACK)
RBOX 100,80,200,70,12,RGB(WHITE),RGB(GREEN)
TEXT 200,115,"START","CM"

PRINT "10. Einen Kreis zeichnen"
PRINT "CIRCLE X,Y,RADIUS,LINIENBREITE,SEITENVERHAELTNIS,FARBE,FUELLFARBE"
CLS RGB(BLACK)
CIRCLE 160,120,50

PRINT "11. Einen farbigen Kreis zeichnen"
CLS RGB(BLACK)
CIRCLE 160,120,50,3,1,RGB(YELLOW),RGB(BLUE)

PRINT "12. Ellipsen zeichnen"
CIRCLE 160,120,60,2,0.5,RGB(YELLOW)

PRINT "13. Ein einfaches Ziel"
CLS RGB(BLACK)
X=MM.HRES/2
Y=MM.VRES/2
CIRCLE X,Y,100,2,1,RGB(WHITE)
CIRCLE X,Y,75,2,1,RGB(YELLOW)
CIRCLE X,Y,50,2,1,RGB(RED)
CIRCLE X,Y,25,2,1,RGB(GREEN)

PRINT "14. Kreisboegen zeichnen"
PRINT "ARC X,Y,INNENRADIUS,AUSSENRADIUS,STARTWINKEL,ENDWINKEL,FARBE"
CLS RGB(BLACK)
ARC 160,120,45,55,0,180,RGB(YELLOW)

PRINT "15. Mehrere Kreisboegen kombinieren"
CLS RGB(BLACK)
X=MM.HRES/2
Y=MM.VRES/2
ARC X,Y,40,50,0,90,RGB(RED)
ARC X,Y,40,50,90,180,RGB(GREEN)
ARC X,Y,40,50,180,270,RGB(BLUE)
ARC X,Y,40,50,270,360,RGB(YELLOW)

PRINT "16. Texte frei positionieren"
PRINT "TEXT X,Y,""Text"""
CLS RGB(BLACK)
TEXT 50,40,"Hallo MMBasic"

PRINT "17. Text ausrichten"
PRINT "TEXT X,Y,""Text"",""AUSRICHTUNG"""
PRINT "Fuer die horizontale Ausrichtung stehen zur Verfuegung:"
PRINT "Buchstabe Bedeutung"
PRINT "L Linksbuendig"
PRINT "C Zentriert"
PRINT "R Rechtsbuendig"
PRINT "Fuer die vertikale Ausrichtung stehen zur Verfuegung:"
PRINT "Buchstabe Bedeutung"
PRINT "T Oben"
PRINT "M Mittig"
PRINT "B Unten"

PRINT "18. Text in der Bildschirmmitte"
CLS RGB(BLACK)
TEXT MM.HRES/2,MM.VRES/2,"Hallo MMBasic","CM"

PRINT "19. Schriftart und Skalierung"
PRINT "Schriftart 2, Skalierungsfaktor 2"
TEXT 100,80,"MMBasic","LT",2,2

PRINT "20. Farbiger Text"
CLS RGB(BLACK)
TEXT 100,80,"MMBasic","LT",2,2,RGB(YELLOW),RGB(BLUE)

PRINT "21. Transparenter Hintergrund"
TEXT 100,80,"MMBasic","LT",2,2,RGB(YELLOW),-1

PRINT "22. Text drehen
PRINT "Ein dritter Buchstabe in der Ausrichtung legt die Orientierung des Textes fest.
PRINT "Buchstabe Ausrichtung
PRINT "N Normal
PRINT "V Buchstaben senkrecht untereinander
PRINT "I Um 180 Grad gedreht
PRINT "U Um 90 Grad gegen den Uhrzeigersinn gedreht
PRINT "D Um 90 Grad im Uhrzeigersinn gedreht
CLS RGB(BLACK)
TEXT 20,MM.VRES/2,"MMBasic","LMV",2

PRINT "23. Eine einfache Informationskarte"
CLS RGB(BLACK)
X=MM.HRES/2-150
Y=MM.VRES/2-70
RBOX X,Y,300,140,15,RGB(WHITE),RGB(BLUE)
TEXT MM.HRES/2,Y+35,"MMBasic","CM",2,1,RGB(YELLOW),RGB(BLUE)
TEXT MM.HRES/2,Y+75,DATE$,"CM",1,1,RGB(WHITE),RGB(BLUE)
TEXT MM.HRES/2,Y+105,TIME$,"CM",1,1,RGB(CYAN),RGB(BLUE)

PRINT "24. Ein einfaches Gesicht"
CLS RGB(BLACK)
X=MM.HRES/2
Y=MM.VRES/2
CIRCLE X,Y,100,3,1,RGB(YELLOW)
CIRCLE X-35,Y-30,10,1,1,RGB(WHITE),RGB(WHITE)
CIRCLE X+35,Y-30,10,1,1,RGB(WHITE),RGB(WHITE)
ARC X,Y+10,45,50,120,240,RGB(YELLOW)

PRINT "25. Experimentiere!"
PRINT "Probiere folgende Aenderungen aus:"
PRINT "- Zeichne Rechtecke mit verschiedenen Rahmenbreiten."
PRINT "- Verwende unterschiedliche Fuellfarben."
PRINT "- Erzeuge Kreise mit verschiedenen Radien."
PRINT "- Zeichne Ellipsen mit unterschiedlichen Seitenverhaeltnissen."
PRINT "- Positioniere Texte an verschiedenen Bildschirmraendern."
PRINT "- Drehe einen Text in alle verfuegbaren Richtungen."

PRINT "26. Probier’s selbst!"
PRINT "Versuche folgende Aufgaben:"
PRINT "1. Zeichne eine Ampel aus einem Rechteck und drei Kreisen."
PRINT "2. Gestalte eine Schaltflaeche mit RBOX und TEXT."
PRINT "3. Zeichne eine Zielscheibe."
PRINT "4. Erzeuge eine digitale Uhr mit Rahmen."
PRINT "5. Zeichne ein einfaches Gesicht."
PRINT "6. Erstelle eine kleine Visitenkarte mit deinem Namen."
