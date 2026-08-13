MODE 5 'change to suit your monitor/hardware and MMB version
CLS RGB(black)
n=255
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
Do
'page write 1
   CLS
   For i=50 To n
     For j=50 To n
      u=Sin(i+v)+Sin(r*i+x)
      v=Cos(i+v)+Cos(r*i+x)
      x=u+t
      Pixel scrw/2+u*offset,scrh/2+v*offset,RGB(i,j,100)
   Next j
   Next i
   t=t+.025
'page copy 1 To 0,B
Loop
