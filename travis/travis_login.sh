#!/bin/bash

travis login -I -t $TRAVIS_TOKEN -e https://travis.ibm.com/api --github-token=$GH_TRAVIS_TOKEN && travis endpoint --set-default -e https://travis.ibm.com/api