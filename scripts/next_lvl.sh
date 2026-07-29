#! /usr/bin/env bash

if [[ -z "$1" ]] 
then
	echo "Pls, Provide the User name "
	echo "Example . ./next_lvl.sh bandit0"
	exit
fi

ssh -p 2220 "$1"@bandit.labs.overthewire.org
