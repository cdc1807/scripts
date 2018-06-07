#!/bin/bash

docker rm $(docker ps -a -q)
# docker ps -a | grep Exit | cut -d ' ' -f 1 | xargs docker rm
