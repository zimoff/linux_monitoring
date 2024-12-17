



function color(f_1 , b_1, f_2, b_2) {

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

    text = "hello its test text"
    #print $1 text $2
    
    printf"%s%s%s=%s%s%s%s\n", font[f_1], backgroud[b_1], $1, font[f_2], backgroud[b_2], $2, reset_color
}
{

color(f_1, b_1, f_2, b_2)

}
