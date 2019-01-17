#! /bin/bash

print_dir_name () {
	case $1 in 
	*/*) printf "the dir name is %s \n" "${1%/*}" ;;
	*) [ -e "$1" ] && printf "%s\n" "$PWD" || echo "file does not exit" 
	esac
}

print_dir_name $1