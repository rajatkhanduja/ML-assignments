#!/usr/bin/python
# Author : Rajat Khanduja
# Program to modify the CSV to remove the columns that correspond to if class A exists or not.

import sys

sourceFile = open (sys.argv[1])
outputFile1 = open (sys.argv[2], 'w')
outputFile2 = open (sys.argv[3], 'w')

lines = sourceFile.readlines()

for line in lines:
  features = line.split (',')
  tmp = ""
  for i in range (10, 31):
    tmp += features[i] + ","

  outputFile1.write (tmp + features[43] + "\n")
  outputFile2.write (tmp + features[45] + "\n")
