t = timer

for many = 1 to 1000
10 S=0
20 FOR N=1 TO 100
30 A=N
40 FOR I=1 TO 10
50 A=SQR(A)
60 NEXT I
70 FOR I=1 TO 10
80 A=A*A
90 NEXT I
100 S=S+A
110 NEXT N
120 PRINT @(100,200) ABS(1010-S/5)
next many
? "time:" timer - t

130 END
