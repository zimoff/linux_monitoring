BEGIN {
    c1_b = 0
    c1_f = 0

    c2_b = 0
    c2_f = 0
}
    
function color_sort() {


    if ($0 ~ /^column1_background=[1-6]$/){

        ind = index($0, "=")
        c1_b = substr($0, ind + 1)

    } else if ($0 ~ /^column1_font_color=[1-6]$/) {

        ind = index($0, "=")
        c1_f = substr($0, ind + 1)

    } else if ($0 ~ /^column2_background=[1-6]$/) {

        ind = index($0, "=")
        c2_b = substr($0, ind + 1)
    } else if ($0 ~ /^column2_font_color=[1-6]$/) {

        ind = index($0, "=")
        c2_f = substr($0, ind + 1)

    }

    
}

{
    if (NR <= 4)
        color_sort()
}


END {

    print(c1_f, c1_b, c2_f, c2_b)

}
