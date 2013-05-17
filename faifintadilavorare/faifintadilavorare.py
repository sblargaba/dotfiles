#!/usr/bin/env python
from random import gauss
from os import getcwd
from time import sleep, time

speed = 0.1
sigma = 0.05
fname = "compilazione"  # path relative to script

start = time()
with open(getcwd() + "/" + fname, encoding='utf-8') as fin:
  try:
    while (True):
      for line in fin:
        print(line.rstrip())
        sleep(abs(gauss(0, sigma)/speed))
      fin.seek(0)
  except KeyboardInterrupt:
    total = int(time() - start)
    print("\nTotal run time: {0} hours, {1} minutes and {2} seconds".format(
      total//3600, total//60, int(total)))
