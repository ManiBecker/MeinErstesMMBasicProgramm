'
' MMBasic Testprogramm 2 - Manfred Becker - 03.01.2025
'
dim xarray%(5), yarray%(5)
c = RGB(RND * 255, RND * 255, RND * 255)
bc = RGB(RND * 255, RND * 255, RND * 255)
fill = RGB(RND * 255, RND * 255, RND * 255)
DO
  i=i+1
  if(i > 1000) then
    i = 0
    c = RGB(RND * 255, RND * 255, RND * 255)
    bc = RGB(RND * 255, RND * 255, RND * 255)
    fill = RGB(RND * 255, RND * 255, RND * 255)
  endif
  x = RND * MM.HRes '800
  y = RND * MM.VRes '600
  PIXEL x, y, c

  x1 = RND * MM.HRes: x2 = RND * MM.HRes
  y1 = RND * MM.VRes: y2 = RND * MM.VRes
  lw = 1
  LINE x1, y1, x2, y2, lw, c

  w = RND * 100
  h = RND * 100
  lw = RND * 3 + 1
  BOX X, Y, W, H, LW, C, FILL

  r = RND * 100
  RBOX X, Y, W, H, R, C, FILL

  a = rnd * 5
  CIRCLE X, Y, R, LW, A, C, FILL
  
  r1 = RND * 100
  r2 = r1 + RND * 10
  a1 = 90
  a2 = 180
  ARC x, y, r1, r2, a1, a2, c

  n = 5
  xarray%(0) = RND * MM.HRes: yarray%(0) = RND * MM.VRes
  xarray%(1) = RND * MM.HRes: yarray%(1) = RND * MM.VRes
  xarray%(2) = RND * MM.HRes: yarray%(2) = RND * MM.VRes
  xarray%(3) = RND * MM.HRes: yarray%(3) = RND * MM.VRes
  xarray%(4) = RND * MM.HRes: yarray%(4) = RND * MM.VRes
  POLYGON n, xarray%(), yarray%(), C , FILL

  s$ = "Hallo!"
  alignment$ = "CM"
  f = 1 + rnd * 6
  sc = 1 + rdn * 14
  TEXT X, Y, S$, ALIGNMENT$, F, SC, C, BC
  PAUSE 10
LOOP
