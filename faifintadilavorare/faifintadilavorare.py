#!/usr/bin/env python
from random import gauss
from os import getcwd
from time import sleep

speed = 0.1
sigma = 0.05
fname = "compilazione"  # path relative to script


with open(getcwd() + "/" + fname, encoding='utf-8') as fin:
  for line in fin:
   print(line.rstrip())
   #print(abs(gauss(0, 0.5))/speed)
   sleep(abs(gauss(0, sigma)/speed))

