#!/bin/bash

###
# Initialize resources common to all helpers
#
# USAGE:
#   source init-retroarch-helpers.sh
###

debug() {
    if [ "$DEBUG" ]; then
        DEBUG_COLOR='\033[0;33m' #Yellow
        RESET_COLOR='\033[0m' # No Color
        (>&2 echo -e "${DEBUG_COLOR}$@${RESET_COLOR}"); 
    fi;
}

debug_eval() {
    if [ "$DEBUG" ]; then
        eval "$@"; 
    fi;
}
    

if [ -z "$RETROARCH_HELPERS" ]; then

    export RETROARCH_HELPERS=1

    source find-retroarch-dirs.sh

    debug SETUP: Retroarch-Helpers

fi


# CITATIONS:
# http://stackoverflow.com/questions/5947742/how-to-change-the-output-color-of-echo-in-linux
