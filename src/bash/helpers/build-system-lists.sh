#!/bin/bash

source init-retroarch-helpers.sh

unique_systems=$RETROARCH_HELPERS/core-unique-systems.sh

# Compile system list to session variables
##
export RETROARCH_SYSTEMS=$(cat $unique_systems | source for-each-core.sh 'echo $systems')



