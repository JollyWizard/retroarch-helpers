#!/bin/bash

#TODO fix the hacky inability to locate command (maybe install is mandatory)

LIST_COMMAND=`pwd`/list-core-ids.sh
INFO_COMMAND=`pwd`/read-core-vars.sh

LOOP_COMMAND="$(cat)"

for core_id in $( bash $LIST_COMMAND ); do
    source $INFO_COMMAND $core_id

    eval "$LOOP_COMMAND"
done

#execute post
eval "$1"
