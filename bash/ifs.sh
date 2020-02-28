#!/bin/bash

#export DEBUG_MODE=false

function main {
    lineExists
    # cmdExists $1
    # envExists
}

function lineExists {
    term="nothing"

    echo "testing testing testing" > tmp.txt
    isFound=$(grep "$term" tmp.txt)
    if [ ! -z "$isFound" ]; then
        echo "found"
    else
        echo "not found"
    fi

    echo "something nothing something" >> tmp.txt
    isFound=$(grep "$term" tmp.txt)
    if [ ! -z "$isFound" ]; then
        echo "found"
    else
        echo "not found"
    fi

    rm tmp.txt
}

function cmdExists {
    if hash $1 2>/dev/null; then
        echo "found $1"
    else
        echo "didn't find $1"
    fi
}

function envExists {
    if [ "$DEBUG_MODE" == "true" ]; then
        echo "debugging"
    else
        echo "normal"
    fi

    file_size=25

    if [ $file_size -gt 50 ]; then
        echo "greater than"
    else
        echo "not greater than"
    fi

    if [ "1" == "true" ] || [ "true" == "true" ]; then
        echo "help"
    else
        echo "ok"
    fi
}

main $1
