#! /usr/bin/bash

cp ~/Github_cybersecurity/ctf-writeups/ctf_write.template ./"$1.md"

foot nvim "$1.md" &
