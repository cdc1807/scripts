#!/bin/bash

# TODO add a way to force clean

regex=$1
if [[ "$regex" == "" ]]; then
    regex="<none>"
    docker rmi -f $(docker images | grep "$regex" | tr -s ' ' | cut -d ' ' -f 3)
    exit
fi

count=$(docker images | grep "$regex" | wc -l | tr -s ' ')
if [[ "$count" == "0" ]]; then
    echo "No imgaes found"
    exit
fi

echo "$(docker images | grep "$regex" | tr -s ' ' | cut -d ' ' -f 1)"
while true; do
    read -p "Delete these $count images? (Y/N) " input
    case $input in
        [Yy]* ) docker rmi -f $(docker images | grep "$regex" | tr -s ' ' | cut -d ' ' -f 3); break;;
        [Nn]* ) exit;;
        * ) echo "whaaaaat??";;
    esac
done
