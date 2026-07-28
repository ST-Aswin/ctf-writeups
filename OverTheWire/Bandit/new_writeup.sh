#! /usr/bin/bash

if [[ -z "$1" ]] then
	echo "Error!,Pls Give The name for the New Writeup"
	exit
fi

cp ~/Github_cybersecurity/ctf-writeups/ctf_write.template ./"$1.md"

foot nvim "$1.md" &
