#!/bin/bash

#TODO fix the hacky inability to locate command (maybe install is mandatory)

LIST_COMMAND=`pwd`/list-core-ids.sh
INFO_COMMAND=`pwd`/read-core-vars.sh

unset systems

for id in $( bash $LIST_COMMAND ); do
    source $INFO_COMMAND $id
    echo -e "$id \n\t $core_systemname | $core_corename "

    #TODO: Map systemnames to unique ideas and build list per system

    #add new systems to list
    echo "$systems" | grep --quiet "${core_systemname}"

    if [ $? = 1 ];then
        if [ "$systems" ];then
            systems=$systems\;
        fi
        systems="$systems\"$core_systemname\""
    fi

done

#echo SYSTEMS: $systems

IFS=';'; declare -a SYSTEMS=($systems)
for i in "${SYSTEMS[@]}"; do
    echo $i | tr -d '"'
done
