#!/bin/bash
#(1 - white, 2 - red, 3 - green, 4 - blue, 5 – purple, 6 - black)

. ./info.sh


arr=($(awk -f sort_color.awk color.cfg))

colors_arr=(white red green blue purple black)


tmp_arr=$arr

get_info | awk -F = -v f_1=${arr[0]} -v b_1=${arr[1]} -v f_2=${arr[2]} -v b_2=${arr[3]} -f color.awk

