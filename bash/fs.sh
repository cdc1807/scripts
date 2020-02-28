#!/bin/bash

set -e
# set -x

arg1=$1

function main() {
    # dir_size
    dir_empty $arg1
}

function dir_size() {
    a=$(du -sm .)
    echo $a
    b=$(du -sm . | tr -s ' ')
    echo $b
    c=$(du -sm . | tr -s ' ' | cut -d ' ' -f 1)
    echo $c
    d=$(du -sm . | cut -d ' ' -f 1)
    echo $d

    size=$(du -sm | tr -s [:space:] ' ' | cut -d ' ' -f 1)
    echo $size
}

function dir_empty() {
    dir=$1
    # find "$dir" -mindepth 1 -print -quit
    if ! find "$dir" -mindepth 1 -print -quit 2>/dev/null | grep -q .; then
        echo "$dir is empty or not a directory"
    else
        echo "$dir is not empty"
    fi
}

main
