#!/bin/bash

set -e
# set -x

arg1=$1

function main() {
    split
}

function split() {
    _array="api1,api2,api3"
    IFS=',' read -ra arr <<< "$_array"
    echo "arr: ${arr[0]}"
}

main
