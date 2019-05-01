#! /bin/bash

open_clip () {
    if [[ -f $1 ]]
    then 
        cat $1  | xclip -selection c
        [[ $verbose -gt 0 ]] && cat $1 
        echo "password for $1 is now clipped!"
    else 
        echo "file not found!"
        exit 2
    fi
}

handle_match() {
    if [ $# -eq 1 ] 
    then
        open_clip $1
    else
        a=( $@ )
        while true
        do
            read filenameIndex
            [ $filenameIndex -ge 1 ] && [ $filenameIndex -le ${#a[@]} ] || continue 
            filenameIndex=$(( $filenameIndex - 1 )) 
            break  
        done
        open_clip ${a[$filenameIndex]}
    fi  
}

optstr=v
verbose=0
while getopts $optstr opt
do
    case $opt in 
    v) verbose=$(( $verbose + 1 )) ;;
    *) exit
    esac 
done

## Remove options from the command line
## $OPTIND points to the next, unparsed argument
#Rename the positional parameters $N+1,$N+2 ... to $1,$2 ...  If N is
#not given, it is assumed to be 1.
    

shift "$(( $OPTIND - 1 ))"

cd ~/.pws
matches=$(ls -a | grep $1) 
if [[ -z $matches ]]
then 
    echo "no matches found!"
    exit 1
else
    echo "which one to read?, enter the index!"
    echo  "$matches" | tr ' ' '\n' | nl
    handle_match $matches
fi

