Rem ====================================================================
Rem Repo:  https://github.com/ManiBecker/MeinErstesMMBasicProgramm
Rem Datei: 27_framebuffer_demo.bas
Rem Titel: Kapitel 27: Flackerfreie Grafik mit Framebuffer
Rem Buch:  Mein erstes MMBasic Programm
Rem Autor: Manfred Becker
Rem Datum: 31.07.2026
Rem
Rem Beschreibung: Framebuffer, flackerfreie Animationen
Rem
Rem Hardware/Voraussetzungen: PicoMite/ColourMaxiMite
Rem
Rem ====================================================================

CLS RGB(BLACK)
Print "7. Unser erstes Beispiel"
FRAMEBUFFER CREATE
FRAMEBUFFER WRITE F
For I=1 To 1000
  X=Int(Rnd*MM.HRES)
  Y=Int(Rnd*MM.VRES)
  Pixel X,Y,RGB(YELLOW)
Next I
FRAMEBUFFER CLOSE

Print "Press any key...": Do : Loop While Inkey$=""

CLS RGB(BLACK)
Print "9. Das Bild anzeigen"
FRAMEBUFFER CREATE
FRAMEBUFFER WRITE F
For I=1 To 1000
  X=Int(Rnd*MM.HRES)
  Y=Int(Rnd*MM.VRES)
  Pixel X,Y,RGB(YELLOW)
Next I
FRAMEBUFFER COPY F,N
FRAMEBUFFER CLOSE

Print "Press any key...": Do : Loop While Inkey$=""

CLS RGB(BLACK)
Print "11. Ein komplettes Bild vorbereiten"
FRAMEBUFFER CREATE
FRAMEBUFFER WRITE F
For I=1 To 100
  X=Int(Rnd*MM.HRES)
  Y=Int(Rnd*MM.VRES)
  Circle X,Y,10,,,RGB(CYAN)
Next I
Text MM.HRES/2,20,  "Framebuffer Demo",  "CT"
FRAMEBUFFER COPY F,N
FRAMEBUFFER CLOSE

Print "Press any key...": Do : Loop While Inkey$=""

CLS RGB(BLACK)

Print "12. Die Bahnhofsuhr verbessern"

mitteX=MM.HRES/2
mitteY=MM.VRES/2
radius=MM.HRES/2-10

If MM.VRES/2-10<radius Then
  radius=MM.VRES/2-10
EndIf

FRAMEBUFFER CREATE
FRAMEBUFFER WRITE F

Do
  If alteZeit$<>Time$ Then
    alteZeit$=Time$
    Berechne Time$
    ZeichneZifferblatt mitteX,mitteY,radius
    ZeichneText mitteX,mitteY,radius
    ZeichneStundenzeiger mitteX,mitteY,radius,stundenWinkel
    ZeichneMinutenzeiger mitteX,mitteY,radius,minutenWinkel
    ZeichneSekundenzeiger mitteX,mitteY,radius,sekundenWinkel
    FRAMEBUFFER COPY F,N
  EndIf
Loop While Inkey$=""

FRAMEBUFFER CLOSE

Print
Print "Ready..."
End
