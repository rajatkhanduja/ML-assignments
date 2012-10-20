#!/usr/bin/python

fp = open ("auto-mpg.data")
lines = fp.readlines()
for line in lines:
  cols = line.split()
  l = ""
  t = 1
  for i in range (0, 8):
    if cols[i] != "?":
      if i != 0:
        l += "\t"
      l += cols[i]
    else:
      t = 0
      break

  if t == 1:
    print l
