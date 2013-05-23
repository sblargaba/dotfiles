#!/bin/bash

function echoUsage {
echo "Usage: todo [add text|del #]"
echo "Have a good day :)"
exit -1
    }

    if [ "$#" -eq "0" ]
    then
      echo "Todo list:"
      cat -n ~/.todolist
      exit 0
    elif [ "$#" -lt 2 ]
    then
      echoUsage
    fi

    if [ "$1" = "add" ]
    then
      echo "$2" >> ~/.todolist
      echo "Added \"$2\" to the todo list."
      exit 0
    elif [ "$1" = "del" ]
    then
      #Check if is a number
      [[ "$2" =~ ^[0-9]+$ ]] || echoUsage
      if [ $2 -le `wc -l ~/.todolist|awk '{print $1}'` ]
      then
        sed -i -e "$2d" ~/.todolist
        echo "Deleted todo #$2"
        exit 0
      else
        echo "Index isn't into the todolist"
        exit -1
      fi
    else
      echoUsage
    fi
