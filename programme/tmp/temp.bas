10 print "prime test"
20 timer=0
30 np = 1000
40 dim primes(np)
50 count = 1 : primes(count) = 2
60 print primes(count),;
70 n = 3
80 do
90   p = 1 : fact =1
100  do while p and fact <= count and primes(fact) <= sqr(n)
110    ndiv = n/primes(fact)
120    if abs(ndiv - int(ndiv)) < 0.00001 then p = 0
130    fact = fact +1
140  loop
150  if p then
160    count = count +1
170    primes(count) = n
180    print primes(count),;
190    if count mod 6 = 0 then print
200  endif
210  n = n+1
220 loop until count = np
230 print : print : print "Time=",timer,"ms"
240 end

