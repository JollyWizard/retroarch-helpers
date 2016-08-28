#!/bin/bash

source init-retroarch-helpers.sh

#TODO fix the hacky inability to locate command (maybe install is mandatory)

LIST_COMMAND=`pwd`/list-core-ids.sh
INFO_COMMAND=`pwd`/read-core-vars.sh

LOOP_COMMAND="$(cat)"

debug LIST: $LOOP_COMMAND
debug INFO: $INFO_COMMAND
debug COMMAND: $LOOP_COMMAND

eval "$LOOP_COMMAND"

source $INFO_COMMAND snes9x

for core_id in $( source $LIST_COMMAND ); do
    source $INFO_COMMAND $core_id

    eval "$LOOP_COMMAND"
done

#execute post
eval "$1"
