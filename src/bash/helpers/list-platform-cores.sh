#!/bin/bash

source init-retroarch-helpers.sh

platform=$1
shift

export filter_platform=$platform
cat 'core-filter-platform.sh' | source "for-each-core.sh" 

