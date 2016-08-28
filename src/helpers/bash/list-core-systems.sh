#!/bin/bash

loop='
echo "$systems" | grep --quiet "${core_systemname}"
found=$?

if [ $found = 1 ];then
    if [ "$systems" ];then
        systems=$systems\;
    fi
    export systems="$systems\"$core_systemname\""
fi
#echo $found $core_id 
'

systems=$(echo -e "$loop" | source for-each-core.sh 'echo $systems')

IFS=";"; declare -a SYSTEMS=($systems)
for i in "${SYSTEMS[@]}"; do
    echo $i | tr -d "\""
done


