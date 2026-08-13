'
' Prime Test berechnet die ersten 1000 Primzahlen und stoppt die Zeit
'
' Manfred Becker - 19.12.2024
'
print "prime test"
timer = 0
np = 1000
dim primes(np)
count = 1 : primes(count) = 2
print primes(count),;
n = 3
do
  p = 1 : fact = 1
  do while p and fact <= count and primes(fact) <= sqr(n)
    ndiv = n/primes(fact)
    if abs(ndiv - int(ndiv)) < 0.00001 then p = 0
    fact = fact + 1
  loop
  if p then
    count = count + 1
    primes(count) = n
    print primes(count),;
    if count mod 16 = 0 then print
  endif
  n = n +1
loop until count = np
print : print : print "Time=",timer,"ms"
end
