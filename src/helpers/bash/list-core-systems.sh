#!/bin/bash

# For each core command:
# Lists the unique system names by browsing the cores and appending names that have not been found.
loop='
echo "$systems" | grep --quiet "${core_systemname}"
found=$?

if [ $found = 1 ];then
    if [ "$systems" ];then
        systems=$systems\;
    fi
    export systems="$systems\"$core_systemname\""
fi
#echo $found $core_id 
'

# Pass to macro:
#   NOTE: Becuase the macro script uses eval(stdin), the modifcations to the variable are lost when the script completes.
#   The post hook echos the compiled variable and then this script captures the output into a variable of the same name
systems=$(echo -e "$loop" | source for-each-core.sh 'echo $systems')

#Parse the list of names into an array and strip them of wrapping quotes. 
IFS=";"; declare -a SYSTEMS=($systems)
for i in "${SYSTEMS[@]}"; do
    echo $i | tr -d "\""
done


