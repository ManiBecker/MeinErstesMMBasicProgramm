REM ====================================================================
REM Repo:  https://github.com/ManiBecker/MeinErstesMMBasicProgramm
REM Datei: 27_framebuffer_3.bas
REM Titel: Kapitel 27: Flackerfreie Grafik mit Framebuffer
REM Buch:  Mein erstes MMBasic Programm
REM Autor: Manfred Becker
REM Datum: 15.08.2026
REM
REM Beschreibung: Framebuffer, flackerfreie Animationen
REM               
REM Hardware/Voraussetzungen: PicoMite/ColourMaxiMite
REM
REM ====================================================================

MODE 4
FRAMEBUFFER create
x=Int(MM.HRES/2)
y=Int(MM.VRES/2)
dx=2:dy=2:rx=1:ry=1:r=10
Print "Animation eines Balles"
setcolor
For i=1 To 30000
  FRAMEBUFFER write f
  CLS RGB(BLUE)
  Circle x,y,r,,,fcolor,bcolor
  FRAMEBUFFER copy f,n
  Pause 10
  x=x+dx*rx
  If x>MM.HRES-r Then x=MM.HRES-r:setrxdx
  If x<r Then x=r:setrxdx
  y=y+dy*ry
  If y>MM.VRES-r Then y=MM.VRES-r:setrydy
  If y<r Then y=r:setrydy
Next i
FRAMEBUFFER close
End

Sub setcolor
  bcolor=RGB(Int(Rnd*255),Int(Rnd*255),Int(Rnd*255))
  fcolor=RGB(Int(Rnd*255),Int(Rnd*255),Int(Rnd*255))
End Sub

Sub setrxdx
  rx=rx*-1:dx=Int(Rnd*5)+1
  setcolor
  CLS RGB(YELLOW)
  FRAMEBUFFER copy f,n
  Pause 10
End Sub

Sub setrydy
  ry=ry*-1:dy=Int(Rnd*5)+1
  setcolor
  CLS RGB(YELLOW)
  FRAMEBUFFER copy f,n
  Pause 10
End Sub
