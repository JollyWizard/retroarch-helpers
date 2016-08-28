#!/bin/bash

echo '\echo -e "\
$core_id \n\t \
systemname:\t$core_systemname \n\t \
corename:\t$core_corename \n\t \
displayname:\t$core_display_name\
" ; echo ' \
| source for-each-core.sh
