#!/bin/bash

source init-retroarch-helpers.sh

# Parse the list of names into an array and strip them of wrapping quotes. 
IFS=";"; declare -a ARRAY=($RETROARCH_PLATFORMS); unset IFS
for i in "${ARRAY[@]}"; do
    echo $i | tr -d "\""
done

