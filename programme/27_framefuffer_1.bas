MODE 3
FRAMEBUFFER create
FRAMEBUFFER write f
For i=1 To 10
pixelcolor=RGB(Int(Rnd*255),Int(Rnd*255),Int(Rnd*255))
CLS RGB(BLACK)
Print "unser erstes beispiel"
For j=1 To 30000
  x=Int(Rnd*MM.HRES)
  y=Int(Rnd*MM.VRES)
  Pixel x,y,pixelcolor
Next j
FRAMEBUFFER copy f,n
Next i
FRAMEBUFFER close
