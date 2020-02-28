#!/bin/bash

cert_path=/home/compton/workspace-mars/Pipeline/pipeline.service/docker-keys

curl -v -i "https://172.17.42.1:40000/images/json?all=0" --cert $cert_path/cert.pem --key $cert_path/key.pem --cacert $cert_path/ca.pem