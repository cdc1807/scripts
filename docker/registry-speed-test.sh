#!/bin/bash

bx_registry=registry.ng.bluemix.net/mdelder
dh_registry=comptonious
# hb_registry=ma1dock1.platformlab.ibm.com/library

registries=(
"registry.ng.bluemix.net/mdelder"
"comptonious"
)

images=(
"kubernetes:v1.6.1-ee"
"ucarp:1.5.2"
"etcd:v3.1.5"
"calico-cni:v1.8.3"
"elasticsearch:2.4.1"
)

test_images=()

# set -x

# initial pull of images to test
echo "Setting up images for test"
for i in ${images[@]}; do
    docker pull registry.ng.bluemix.net/mdelder/$i | grep $i
    for r in ${registries[@]}; do
        test_image=${i/:*/:deleteme}
        docker tag registry.ng.bluemix.net/mdelder/$i $r/$test_image
    done
    test_images+=("$test_image")
done
echo ""


for r in ${registries[@]}; do
    echo "Testing registry: $r"
    for i in ${test_images[@]}; do
        start=$(date +%s)
        docker push $r/$i 2>&1 1>/dev/null
        docker rmi $r/$i 2>&1 1>/dev/null
        docker pull $r/$i 2>&1 1>/dev/null
        end=$(date +%s)
        diff=$(echo "$end - $start" | bc)
        echo "Image: $i took $diff seconds"
    done
    echo ""
done


# cleanup bx images, looks like dockerhub and harbor have to be done manually
for i in ${test_images[@]}; do
    bx cr image-rm $bx_registry/$i
    for j in ${registries[@]}; do
        docker rmi $j/$i
    done
done
