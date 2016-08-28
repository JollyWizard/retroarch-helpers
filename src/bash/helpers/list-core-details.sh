#!/bin/bash

echo '\echo -e "\
$core_id 
\t systemname:\t$core_systemname 
\t corename:\t$core_corename 
\t displayname:\t$core_display_name
"' \
| source for-each-core.sh
