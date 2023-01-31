#!/bin/bash\

function echo_back(){
    echo "Give the word."
    read the_word
    echo $the_word
}

function testNum(){
    echo "Give a number"
    read num
   if [ $num -gt 0 ]; then
        echo "$num is greater than 0"
    elif [ $num -lt 0 ]; then
        echo "$num is less than 0"
    else
        echo "Number is 0"
    fi
}

function createFileFromGivenName(){
    touch "$1".txt
}

function find_dead_ends() {
  touch "Dir_$1.".txt
  local dir=$1
  for item in "$dir"/*; do
    if [ -d "$item" ]; then
      if [ -z "$(ls -A "$item")" ]; then
        echo "$item is a dead end"
      else
        find_dead_ends "$item"
      fi
    fi
  done
}


#echo_back 
#testNum 
#echo "give a word"
#read wordtoprint
#echo $wordtoprint >> words.txt
#echo "$(pwd)" >> words.txt
echo "Give a name to your file"
read fileName
createFileFromGivenName "$fileName"

find_dead_ends "$(pwd)"