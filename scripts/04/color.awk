
BEGIN {

    tmp_f_1 = f_1
    tmp_b_1 = b_1
    tmp_f_2 = f_2
    tmp_b_2 = b_2

    flag_f_1 = 0
    flag_f_2 = 0 
    flag_b_1 = 0 
    flag_b_2 = 0 

    if((tmp_f_1 == 0) && (tmp_b_1 != 6)) {
        tmp_f_1 = 6 #def
        flag_f_1 = 1 
    } else if ((tmp_b_1 == 6) && (tmp_f_1 == 0)) {
        tmp_f_1 = 3
        flag_f_1 = 1 
    }


    if((tmp_b_1 == 0) && (tmp_f_1 != 3)) {
        tmp_b_1 = 3 #def
        flag_b_1 = 1 
    } else if ((tmp_f_1 ==3) && (tmp_b_1 == 0)) {
        tmp_b_1 = 6
        flag_b_1 = 1 
    }


    if((tmp_f_2 == 0) && (tmp_b_2 != 6)) {
        tmp_f_2 = 6 #def
        flag_f_2 = 1 
    } else if(tmp_b_2 == 6) {
        tmp_f_2 = 5
        flag_f_2 = 1 
    }


    if((tmp_b_2 == 0) && (tmp_f_2 != 5)) {
        tmp_b_2 = 5 #def
        flag_b_2 = 1 
    } else if (tmp_f_2 == 5) {
        tmp_b_2 = 6
        flag_b_2 = 1 
    }


}

function color(f1 , b1, f2, b2) {

    font[1] = "\033[97m" #white
    font[2] ="\033[91m" #red
    font[3] ="\033[92m" #green
    font[4] ="\033[94m" #blue
    font[5] ="\033[95m" #purple
    font[6] ="\033[30m" #black

    backgroud[1] ="\033[107m" #white
    backgroud[2] ="\033[101m" #red
    backgroud[3] ="\033[102m" #green
    backgroud[4] ="\033[104m" #blure
    backgroud[5] ="\033[105m" #purple
    backgroud[6] ="\033[40m" #black

    reset_color ="\033[0m"


    printf"%s%s%s=%s%s%s%s\n", font[f_1], backgroud[b_1], $1, font[f_2], backgroud[b_2], $2, reset_color
}

{

    color(tmp_f_1, tmp_b_1, tmp_f_2, tmp_b_2)

}

END {


    #colors_arr=(white red green blue purple black)
    colors_arr[1] = "white"
    colors_arr[2] = "red" 
    colors_arr[3] = "green" 
    colors_arr[4] = "blue" 
    colors_arr[5] = "purple"
    colors_arr[6] = "black" 

    printf("\n")


    
    if(flag_b_1 == 1)
        printf("column1_background = default (%s)\n", colors_arr[tmp_b_1])
    else
        printf("column1_background = %d (%s)\n", tmp_b_1, colors_arr[tmp_b_1])
        
    if(flag_f_1 == 1)
        printf("column1_font_color = default (%s)\n", colors_arr[tmp_f_1])
    else
        printf("column1_font_color = %d (%s)\n", tmp_f_1, colors_arr[tmp_f_1])

    if(flag_b_2 == 1)
        printf("column2_background = default (%s)\n", colors_arr[tmp_b_2])
    else
        printf("column2_background= %d (%s)\n", tmp_b_2, colors_arr[tmp_b_2])

    if(flag_f_2 == 1)
        printf("column2_font_color = default (%s)\n", colors_arr[tmp_f_2])
    else
        printf("column2_font_color = %d (%s)\n", tmp_f_2, colors_arr[tmp_f_2])

}



