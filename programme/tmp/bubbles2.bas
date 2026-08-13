MODE 5 'change to suit your monitor/hardware and MMB version
CLS RGB(black)
m=100
n=115'255
r=(2*Pi)/235
x=0
'y=0
v=0
t=0
sz=200
s=0
scrw=MM.HRES
scrh=MM.VRES
sw=scrw/sz
sh=scrh/sz
offset=scrh/4.5
FRAMEBUFFER create
Do
  'page write 1
  FRAMEBUFFER write f
  CLS
  For i=m To n
    For j=m To n
      u=Sin(i+v)+Sin(r*i+x)
      v=Cos(i+v)+Cos(r*i+x)
      x=u+t
      Pixel scrw/2+u*offset,scrh/2+v*offset,RGB(Rnd*255,Rnd*255,100)
    Next j
  Next i
  t=t+.0125'.025
  If t Mod 100 = 10 Then
    m=Int(Rnd*200)
    n=m+15
  EndIf
  'page copy 1 To 0,B
  FRAMEBUFFER copy f,n
Loop While Inkey$=""
FRAMEBUFFER close
Print "Ready..."
