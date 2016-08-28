#!/bin/bash


source build-system-lists.sh

#Parse the list of names into an array and strip them of wrapping quotes. 
IFS=";"; declare -a SYSTEMS=($RETROARCH_SYSTEMS); unset IFS
for i in "${SYSTEMS[@]}"; do
    echo $i | tr -d "\""
done


