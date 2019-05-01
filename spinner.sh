#! /bin/bash

chars=1
spinner="\|/-"
delay=.1
prompt="press any key"

until read -sn1 -p "$prompt" -t $delay var
do
    printf "%.${chars}s\r" "$spinner"
    temp=${spinner#?}
    spinner=$temp${spinner%"$temp"}
done 
