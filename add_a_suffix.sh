#! /bin/bash



for file in ./*
do
    if [[ $file =~ .*$1 ]]
    then 
        break
    else
    mv $file $file.$1
    echo "added suffix for $file"
    fi
done