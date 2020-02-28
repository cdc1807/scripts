#!/bin/bash

DOCKER_CERT_PATH=/home/compton/workspace-mars/Pipeline/pipeline.service/docker-keys

_docker_ip=10.120.208.8
_iterations=$1
if [ -z $_iterations ]; then
    _iterations=20;
fi
echo "Containers testing with $_iterations starting ..."

until [ $_iterations == 0 ]; do
    _container_name=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)
    
    # create container
    curl -sS --insecure --cert $DOCKER_CERT_PATH/cert.pem --key $DOCKER_CERT_PATH/key.pem -X POST -H "Content-Type: application/json" --data-binary @body.json "https://$_docker_ip:40000/containers/create?name=$_container_name" > tmp.json
    _container_id=$(grep -Po '"Id":.*?[^\\]",' tmp.json | cut -d\" -f4)
    echo "container created: $_container_id"
    
    # poll the container till up
    json=""
    while [ -z "$json" ]; do
        echo "making call to get json ..."
        json=$(curl -sS --insecure --cert $DOCKER_CERT_PATH/cert.pem --key $DOCKER_CERT_PATH/key.pem -H "Accept: application/json" "https://$_docker_ip:40000/containers/$_container_id/json")
        #sleep 1
    done
    echo "json found: $json"
    
    # start container
    echo "starting the container ..."
    curl -sS --insecure --cert $DOCKER_CERT_PATH/cert.pem --key $DOCKER_CERT_PATH/key.pem -X POST "https://$_docker_ip:40000/containers/$_container_id/start"
    
    let _iterations-=1
done


#DELETE - http://$_docker_ip:40000/containers/$_container_id?v=true&force=true

#_container_ids=$(docker ps -a | tr -s ' ' | cut -d ' ' -f 1)
#docker rm -f $_container_ids