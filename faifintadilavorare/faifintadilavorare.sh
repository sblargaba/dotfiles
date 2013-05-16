#!/bin/bash

path="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
outfile=${path}/compilazione
linee=`wc -l $outfile | awk '{print $1}'`
divider=200

clear
echo "[`whoami`@`hostname` build]$ make"
while :
do
  numeroriga=`expr $numeroriga + 1`
  sed -n -e "${numeroriga}p" $outfile
  if [ $numeroriga -gt $linee ]
  then numeroriga=0
  fi
  sleep `python ${path}/gauss.py`
done
