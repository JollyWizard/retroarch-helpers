#!/bin/bash

source init-retroarch-helpers.sh

system_name="$@"

cat $RETROARCH_HELPERS/platform.aliases \
| grep --color=never -P "=$system_name\$" \
| grep --color=never -o -P ".*(?=[=#])"

