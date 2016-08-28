#!/bin/bash

# for-each-core.sh command
#
# Lists the unique system names by browsing the cores and appending names that have not been found.
##

echo "$systems" | grep --quiet -P "(?<=\")${core_systemname}"
found=$?

if [ $found = 1 ];then
    if [ "$systems" ];then
        systems=$systems\;
    fi
    systems="$systems\"$core_systemname\""
fi
