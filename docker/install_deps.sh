#!/bin/bash

manifest_file=$1

deps=$(grep -Po '"importpath":.*?[^\\]",' $manifest_file | cut -d\" -f4)
revs=$(grep -Po '"revision":.*?[^\\]",' $manifest_file | cut -d\" -f4)

#echo "deps: $deps"
#echo "revs: $revs"

count=0
readarray -t deps_array <<< "$deps"
readarray -t revs_array <<< "$revs"
for i in "${deps_array[@]}"
do
    #echo "dep: $i:${revs_array[$count]}"
    echo "fetching $i revision ${revs_array[$count]}"
    gvt fetch -tag ${revs_array[$count]} $i
    #exit
    ((count++))
done