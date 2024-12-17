function get_ext(){


    arr_length = split($2, arr, "/")

    if(match(arr[arr_length], "\.")) {
        arr_length = split(arr[arr_length], arr, "\.")
        res = arr[arr_length]
    } else 
    res = "no type"

    return res

}


{

    if(NR <= 10) {
       printf"%2d - %s, %s, %s\n", $1, $2, $3, get_ext()
   }
       

}
