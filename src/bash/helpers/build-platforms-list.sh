#!/bin/bash

source init-retroarch-helpers.sh

analyze_systems=$RETROARCH_HELPERS/core-analyze-systems.sh

# Compile system list to session variables
##
export RETROARCH_PLATFORMS=$(cat $analyze_systems | source for-each-core.sh 'echo $platforms')



