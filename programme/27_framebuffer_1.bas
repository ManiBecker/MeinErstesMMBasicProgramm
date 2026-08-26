REM ====================================================================
REM Repo:  https://github.com/ManiBecker/MeinErstesMMBasicProgramm
REM Datei: 27_framebuffer_1.bas
REM Titel: Kapitel 27: Flackerfreie Grafik mit Framebuffer
REM Buch:  Mein erstes MMBasic Programm
REM Autor: Manfred Becker
REM Datum: 15.08.2026
REM
REM Beschreibung: Framebuffer, flackerfreie Animationen
REM               10.000 Punkte
REM Hardware/Voraussetzungen: PicoMite/ColourMaxiMite
REM
REM ====================================================================

MODE 3

FRAMEBUFFER create
FRAMEBUFFER write f
For i=1 To 10
  pixelcolor=RGB(Int(Rnd*255),Int(Rnd*255),Int(Rnd*255))
  CLS RGB(BLACK)
  Print "Unser erstes Beispiel: 10.000 Punkte"
  For j=1 To 10000
    x=Int(Rnd*MM.HRES)
    y=Int(Rnd*MM.VRES)
    Pixel x,y,pixelcolor
  Next j
  FRAMEBUFFER copy f,n
Next i
FRAMEBUFFER close
