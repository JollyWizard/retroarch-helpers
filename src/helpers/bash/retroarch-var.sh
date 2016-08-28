
config=$1
varname=$2
target=$3

export $target="$(cat $config | grep -o -P "(?<=$varname = \").*(?=\")")"

#echo \$$target = ${!target}
