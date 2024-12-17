#!/bin/bash
#(1 - white, 2 - red, 3 - green, 4 - blue, 5 – purple, 6 - black)


. ./info.sh

if [[ $# -lt 4 ]] 
then
    echo "too few args, run script again."
    exit 1
elif [[ $# -gt 4 ]]
then
    echo "too much args, run script again."
    exit 1
fi

tmp=0

for var in $@
do
    if [[ $var -gt 6 ]] || [[ $var -lt 0 ]]
    then
        echo "wrong arg number, run script again."
        tmp=1
        exit 1
    fi
done


if [[ $1 -eq $2 ]] || [[ $3 -eq $4 ]] 
then
    echo "font and background has same color, run script again."
else
    get_info | awk -F = -v f_1=$1 -v b_1=$2 -v f_2=$3 -v b_2=$4 -f color.awk
fi

