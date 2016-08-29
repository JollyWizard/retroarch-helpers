#!/bin/bash

core_platforms=$(bash "platforms-for-system.sh" $core_systemname)

echo $core_platforms | grep --quiet -P "(?<=^|;)$filter_platform"
found=$?

debug "FILTER-PLATFORM: $filter_platform => $core_platforms ($found)"

if [ $found = 0 ]; then 
    if [ "$core_id" ]; then echo "$core_id"; fi;
fi;

