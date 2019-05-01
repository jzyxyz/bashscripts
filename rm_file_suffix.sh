#! /bin/bash


echo "Enter the desired directory"
[ $# -eq 0 ] && read dir || dir=$1
cd $dir
echo "All file suffixes are going to be removed in $PWD, are you sure? (y/n)"
echo "the folder consists following files" 
ls
read -n 1 ans
if [ $ans = "y" ] 
then
    files=$( ls )
    for file in $files
    do
    [ -f $file ] && mv $file ${file%.*}
    done
else 
    exit 1
fi 
