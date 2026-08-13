' https://github.com/pslabs-ps/CMM2-DeluxeEdition-GEN2/blob/main/Code/mouse.BAS

mode 3
channel = 0
gui cursor on
controller mouse open channel,leftclick,rightclick
settick 20, myint
do:loop
'
sub myint
  gui cursor mouse(x,channel),mouse(y,channel)
end sub
'
sub leftclick
  static integer n
  local integer x=mouse(x,channel),y=mouse(y,channel)
  gui cursor off
  gui cursor on 1,x,y,rgb(red)
  n=n+1
  print @(50,50)"left",n
  print @(50,60)"x",x;"  "
  print @(50,70)"y",y;"  "
  end sub
'
sub rightclick
  static integer n=0
  local integer x=mouse(x,channel),y=mouse(y,channel)
  gui cursor off
  gui cursor on 0,x,y
  n=n+1
  print @(200,50)"right",n
  print @(200,60)"x",x;"  "
  print @(200,70)"y",y;"  "
end sub
