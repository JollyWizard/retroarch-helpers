#!/bin/bash

##
## Using the list of platform support by installed cores, list cores (by id) that support it.
##

source init-retroarch-helper.sh

source 'list-core-platforms.sh' \
| while read platform
do
    echo $platform
    source 'list-platform-cores.sh' $platform \
    | while read core
    do 
        echo -e "\t$core"
    done
done
