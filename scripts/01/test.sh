#!/bin/bash

function test {

        echo "args $#"
        if ! [[ $1 =~ ^[0-9]+$ ]] && [[ $# -eq 1 ]]
        then
                echo "$1"
        else
                echo ">> wrong arg <<"
        fi

}
