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
Print
Print "FRAMEBUFFER CREATE"
Print "FRAMEBUFFER WRITE F"
Print "Do"
Print "  If alteZeit$<>Time$ Then"
Print "    alteZeit$=Time$"
Print "    Berechne Time$"
Print "    ZeichneZifferblatt mitteX,mitteY,radius"
Print "    ZeichneText mitteX,mitteY,radius"
Print "    ZeichneStundenzeiger mitteX,mitteY,radius,stundenWinkel"
Print "    ZeichneMinutenzeiger mitteX,mitteY,radius,minutenWinkel"
Print "    ZeichneSekundenzeiger mitteX,mitteY,radius,sekundenWinkel"
Print "    FRAMEBUFFER COPY F,N"
Print "  EndIf"
Print "Loop While Inkey$="""
Print "FRAMEBUFFER CLOSE"
Print
Print "Das komplette Programm zur verbesserten Bahnhofsuhr befindet sich hier:"
Print "- 27_framebuffer_5.bas"
Print

Print "Press any key...": Do : Loop While Inkey$=""

CLS RGB(BLACK)

Print "Weitere Programme zum FRAMEBUFFER sind:"
Print "- 27_framebuffer_1.bas"
Print "- 27_framebuffer_2.bas"
Print "- 27_framebuffer_3.bas"
Print "- 27_framebuffer_4.bas"

Print
Print "Ready..."
End
