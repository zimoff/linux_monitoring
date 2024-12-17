#!/bin/bash

. ./info.sh

get_info


echo -n "write file? "
read ANSWER 

if [ $ANSWER = "y" ] || [ $ANSWER = "Y" ]
then
    get_info > $(date +"%d_%m_%y_%H_%M_%S").status
else
    echo "data not saved"
fi
