#!/bin/bash

if [[ "$1" == "" ]]; then
    echo "Need to pass in an image"
    exit 1
fi

docker inspect --format='{{index .RepoDigests 0}}' $1