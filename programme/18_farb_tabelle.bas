Rem ====================================================================
Rem Repo:  https://github.com/ManiBecker/MeinErstesMMBasicProgramm
Rem Datei: 18_farb_tabelle.bas
Rem Titel: Kapitel 18: Farb- und Schriftmustertafel
Rem Buch:  Mein erstes MMBasic Programm
Rem Autor: Manfred Becker
Rem Datum: 21.09.2026
Rem
Rem Beschreibung:
Rem Zeigt vordefinierte und selbst gemischte Farben sowie verschiedene
Rem Schriftarten von MMBasic auf dem Bildschirm an.
Rem Die Farbbeispiele werden platzsparend in zwei Spalten ausgegeben.
Rem
Rem Hardware/Voraussetzungen: Grafikausgabe
Rem ====================================================================

CLS RGB(BLACK)
Font 1
Colour RGB(WHITE),RGB(BLACK)

Print "MMBasic Farb- und Schriftmustertafel"
Print

' ------------------------------------------------------------
' Positionen fuer die beiden Spalten berechnen
' ------------------------------------------------------------

Y=MM.Info(FONTHEIGHT)*3
DY=MM.Info(FONTHEIGHT)

' ------------------------------------------------------------
' Ueberschriften
' ------------------------------------------------------------

Colour RGB(WHITE),RGB(BLACK)

PrintLeft(Y,"Vordefinierte Farben:")
PrintRight(Y,"Eigene RGB-Farben:")

Y=Y+DY*2

' ------------------------------------------------------------
' Vordefinierte Farben - linke Spalte
' ------------------------------------------------------------

Colour RGB(WHITE),RGB(BLACK)
PrintLeft(Y, "WHITE")

Colour RGB(RED),RGB(BLACK)
PrintLeft(Y+DY, "RED")

Colour RGB(GREEN),RGB(BLACK)
PrintLeft(Y+DY*2, "GREEN")

Colour RGB(BLUE),RGB(BLACK)
PrintLeft(Y+DY*3, "BLUE")

Colour RGB(YELLOW),RGB(BLACK)
PrintLeft(Y+DY*4, "YELLOW")

Colour RGB(CYAN),RGB(BLACK)
PrintLeft(Y+DY*5, "CYAN")

Colour RGB(MAGENTA),RGB(BLACK)
PrintLeft(Y+DY*6, "MAGENTA")

' ------------------------------------------------------------
' Selbst gemischte Farben - rechte Spalte
' ------------------------------------------------------------

Colour RGB(255,128,0),RGB(BLACK)
PrintRight(Y, "ORANGE RGB(255,128,0)")

Colour RGB(128,255,0),RGB(BLACK)
PrintRight(Y+DY, "HELLGRUEN RGB(128,255,0)")

Colour RGB(255,128,192),RGB(BLACK)
PrintRight(Y+DY*2, "ROSA RGB(255,128,192)")

Colour RGB(128,128,255),RGB(BLACK)
PrintRight(Y+DY*3, "HELLBLAU RGB(128,128,255)")

Colour RGB(128,128,128),RGB(BLACK)
PrintRight(Y+DY*4, "GRAU RGB(128,128,128)")

' ------------------------------------------------------------
' Verschiedene Schriftarten
' ------------------------------------------------------------

Y=Y+DY*8

Colour RGB(WHITE),RGB(BLACK)

Font 1
PrintLeft(Y, "Schriftarten:")

Y=Y+MM.Info(FONTHEIGHT)*2

Font 1
PrintLeft(Y, "Font 1 - Standardschrift")

Y=Y+MM.Info(FONTHEIGHT)

Font 2
PrintLeft(Y, "Font 2")

Y=Y+MM.Info(FONTHEIGHT)

Font 3
PrintLeft(Y, "Font 3")

' Standardschrift und Farben wiederherstellen
Font 1
Colour RGB(WHITE),RGB(BLACK)

End

Sub PrintLeft(ypos, txt$)
  Print @(0,ypos) txt$
End Sub

Sub PrintRight(ypos, txt$)
  Print @(MM.HRES-Len(txt$)*MM.Info(FONTWIDTH),ypos) txt$
End Sub
