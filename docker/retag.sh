#!/bin/bash

registry="master.cfc:8500"
namespace="icp"

images=(
"image1:v1"
"registry1/image2:v2"
"registry2/ns1/image3:v3"
)

# set -x
for i in ${images[@]}; do
    # full_name= $(echo "$i" | cut -d ':' -f1)
    full_name=${i%%:*}
    version=${i##*:}
    name=${full_name##*/}
    tagged_name="$registry/$namespace/$name:$version"
    echo "name: $full_name ---> $name --> $tagged_name"
done
