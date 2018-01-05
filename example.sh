#!/bin/bash

# This function demonstrates simple waiting with progress bar
function simple_wait {
    MESSAGE=$1
    if [ -z "$2"  ]; then TIMEOUT=10; else TIMEOUT=$2; fi
    printf "\n$MESSAGE"
    I=0
    while [ $I -lt ${TIMEOUT} ]; do
         printf "."
         let I=I+1
         sleep 1
    done
    echo
}

# This function demonstrates simple circle waiting
function circle_wait {
    MESSAGE=$1
    if [ -z "$2"  ]; then TIMEOUT=10; else TIMEOUT=$2; fi
    printf "\n${MESSAGE}"
    I=0
    C=""
    while [ $I -lt ${TIMEOUT} ]; do
         let I=I+1
         printf "\b|"
         sleep 1
         let I=I+1
         printf "\b/"
         sleep 1
         let I=I+1
         printf "\b-"
         sleep 1
         let I=I+1
         printf "\b\\"
         sleep 1
         let I=I+1
    done
    printf "\b "
    echo
}

trap "setterm -cursor on" EXIT
setterm -cursor off
simple_wait " Simple wait demonstration..." 10

echo " Executing command #1"

sleep 1

circle_wait " Circle wait demonstration... " 10

echo " Executing command #2"

echo