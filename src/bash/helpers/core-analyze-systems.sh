#!/bin/bash

# for-each-core.sh command
#
# Generates lists of system information by core.
##

## Add to system list if not already present
echo "$systems" | grep --quiet -P "(?<=\")${core_systemname}"
found=$?

if [ $found = 1 ];then
    debug "\tNEW SYSTEM:$core_systemname"
    if [ "$systems" ];then
        systems=$systems\;
    fi
    systems="$systems\"$core_systemname\""
fi

## Deduce platforms
core_platforms=$(bash "$RETROARCH_HELPERS/platforms-for-system.sh" $core_systemname)

#Process platforms into 
IFS=";"; declare -a PLATFORMS=($core_platforms); unset IFS;
for i in "${PLATFORMS[@]}"; do
  
    echo "$platforms" | grep --quiet -P "(?<=^|;)$i"
    found=$?

    debug "\t $i | $found"

    if [ $found = 1 ];then
        if [ "$platforms" ];then
            platforms="$platforms;"
        fi
        platforms="$platforms$i"
        debug "\tPLATFORMS: $platforms"
    fi  
done

