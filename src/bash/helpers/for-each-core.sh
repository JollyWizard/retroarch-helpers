#!/bin/bash

## 
## Execute the content of stdin as a script inside a loop that exposes the core info
## file details as script variables
##
## @param $1 (optional)
##     A callback that relies on 

# NOTE: This relies on eval. Variables cannot be exported to the parent via 'source'.
#       Use the callback parameter output variables when loop is complete.

source init-retroarch-helpers.sh

INFO_COMMAND=$RETROARCH_HELPERS/read-core-vars.sh
LIST_COMMAND=$RETROARCH_HELPERS/list-core-ids.sh
LOOP_COMMAND="$(cat)"

CORE_IDS=$(bash $LIST_COMMAND)

for core_id in $(echo $CORE_IDS); do
    debug "FOR-EACH-CORE: $core_id"
    source $INFO_COMMAND $core_id

    eval "$LOOP_COMMAND"
done

#execute post
eval "$1"
