#!/bin/bash

. ./research.sh

START_TIME=$(date +%s)

if [ $# != 1 ] 
then
    echo "type only one parametr."
else
    if [[ !(-d $1) || ${1: -1} != "/" ]]
    then
        echo "the parameter must end with "/" and be a directory."
    else
        export FILE_PATH=$1
        research
    fi
fi


END_TIME=$(date +%s)

SCRIPT_TIME=$(( $END_TIME - $START_TIME ))

echo "Script execution time (in seconds) = $SCRIPT_TIME"

