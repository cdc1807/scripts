#!/bin/bash

_container_ids=$(docker ps -a | tr -s ' ' | cut -d ' ' -f 1)
docker rm -f $_container_ids
echo "$_container_ids"