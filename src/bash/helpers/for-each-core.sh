#!/bin/bash

source init-retroarch-helpers.sh

# The for loop loses the directory context, so we need to cache the full path
LIST_COMMAND=$RETROARCH_HELPERS/list-core-ids.sh
INFO_COMMAND=$RETROARCH_HELPERS/read-core-vars.sh

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
