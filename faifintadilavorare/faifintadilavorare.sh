#!/bin/bash

path="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
path+=/compilazione
linee=`wc -l $path | awk '{print $1}'`
divider=200

clear
echo "[`whoami`@`hostname` build]$ make"
while :
do numeroriga=`expr $numeroriga + 1`
  sed -n -e "${numeroriga}p" $path
  if [ $numeroriga -gt $linee ]
  then numeroriga=0
  fi
  sleep `echo "c=$RANDOM % 100; scale=2; c / $divider" | bc`
done
