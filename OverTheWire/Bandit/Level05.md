---
Platform: OverTheWire
Game: Bandit
Level: 5
Date: 2026-07-27
Difficulty: Beginner
Topics:
  - SSH
  - Linux
  - Relative Paths
  - cat
  - Shell
---

# Challenge
    The password for the next level is stored in the only human-readable file in the inhere directory. 
    Tip: if your terminal is messed up, try the “reset” command.Acquire the password stored in the only human readable file .

## Platform
 * OverTheWire

## Level
 * bandit05

## Difficulty
 * bandit - beginner 
---

## Objective
 * Acquire the password required for next level .
 * find the effective way to find the file containing the password .
---

## Skills Practiced
 * ssh
 * Terminal navigation
 * ls 
 * cat
 * Thinking about efficientcy
---

## Tools Used
  * ssh - to connect to the remote host
  * terminal - to interact with the kernel
  * ls - to list the contents of the directories
  * cat - to write out the contents of the file
  * cd - to change directory
  * find - to list all the files from the current directory
---

## Observations
 * The ssh connection to the bandit game host machine gets closed if i don't do anything in it for a while .
 * They have used similar name for files varing only in numbers at the end to consfuse the beginners .
 * They Inhere dir didn't have any hidden files .
---

## Commands Used

```bash
❯ cat next_lvl.sh
#! /usr/bin/env bash

ssh -p 2220 "$1"@bandit.labs.overthewire.org
❯ ./next_lvl.sh bandit4
                         _                     _ _ _   
                        | |__   __ _ _ __   __| (_) |_ 
                        | '_ \ / _` | '_ \ / _` | | __|
                        | |_) | (_| | | | | (_| | | |_ 
                        |_.__/ \__,_|_| |_|\__,_|_|\__|
                                                       

                      This is an OverTheWire game server. 
            More information on http://www.overthewire.org/wargames

backend: gibson-1
bandit4@bandit.labs.overthewire.org's password: 

      ,----..            ,----,          .---.
     /   /   \         ,/   .`|         /. ./|
    /   .     :      ,`   .'  :     .--'.  ' ;
   .   /   ;.  \   ;    ;     /    /__./ \ : |
  .   ;   /  ` ; .'___,/    ,' .--'.  '   \' .
  ;   |  ; \ ; | |    :     | /___/ \ |    ' '
  |   :  | ; | ' ;    |.';  ; ;   \  \;      :
  .   |  ' ' ' : `----'  |  |  \   ;  `      |
  '   ;  \; /  |     '   :  ;   .   \    .\  ;
   \   \  ',  /      |   |  '    \   \   ' \ |
    ;   :    /       '   :  |     :   '  |--"
     \   \ .'        ;   |.'       \   \ ;
  www. `---` ver     '---' he       '---" ire.org


Welcome to OverTheWire!

If you find any problems, please report them to the #wargames channel on
discord or IRC.

--[ Playing the games ]--

  This machine might hold several wargames.
  If you are playing "somegame", then:

    * USERNAMES are somegame0, somegame1, ...
    * Most LEVELS are stored in /somegame/.
    * PASSWORDS for each level are stored in /etc/somegame_pass/.

  Write-access to homedirectories is disabled. It is advised to create a
  working directory with a hard-to-guess name in /tmp/.  You can use the
  command "mktemp -d" in order to generate a random and hard to guess
  directory in /tmp/.  Read-access to both /tmp/ is disabled and to /proc
  restricted so that users cannot snoop on eachother. Files and directories
  with easily guessable or short names will be periodically deleted! The /tmp
  directory is regularly wiped.
  Please play nice:

    * don't leave orphan processes running
    * don't leave exploit-files laying around
    * don't annoy other players
    * don't post passwords or spoilers
    * again, DONT POST SPOILERS!
      This includes writeups of your solution on your blog or website!

--[ Tips ]--

  This machine has a 64bit processor and many security-features enabled
  by default, although ASLR has been switched off.  The following
  compiler flags might be interesting:

    -m32                    compile for 32bit
    -fno-stack-protector    disable ProPolice
    -Wl,-z,norelro          disable relro

  In addition, the execstack tool can be used to flag the stack as
  executable on ELF binaries.

  Finally, network-access is limited for most levels by a local
  firewall.

--[ Tools ]--

 For your convenience we have installed a few useful tools which you can find
 in the following locations:

    * gef (https://github.com/hugsy/gef) in /opt/gef/
    * pwndbg (https://github.com/pwndbg/pwndbg) in /opt/pwndbg/
    * gdbinit (https://github.com/gdbinit/Gdbinit) in /opt/gdbinit/
    * pwntools (https://github.com/Gallopsled/pwntools)
    * radare2 (http://www.radare.org/)

--[ More information ]--

  For more information regarding individual wargames, visit
  http://www.overthewire.org/wargames/

  For support, questions or comments, contact us on discord or IRC.

  Enjoy your stay!

bandit4@bandit:~$
bandit4@bandit:~$ find
.
./inhere
./inhere/-file06
./inhere/-file09
./inhere/-file01
./inhere/-file08
./inhere/-file00
./inhere/-file03
./inhere/-file07
./inhere/-file02
./inhere/-file05
./inhere/-file04
./.bash_logout
./.profile
./.bashrc
bandit4@bandit:~$ ls
inhere
bandit4@bandit:~$ cd inhere
bandit4@bandit:~/inhere$ ls
-file00  -file01  -file02  -file03  -file04  -file05  -file06  -file07  -file08  -file09
bandit4@bandit:~/inhere$ file ./file[0-9]
./file[0-9]: cannot open `./file[0-9]' (No such file or directory)
bandit4@bandit:~/inhere$ file ./-file[0-9]
./-file[0-9]: cannot open `./-file[0-9]' (No such file or directory)
bandit4@bandit:~/inhere$ file ./-file0[0-9]
./-file00: data
./-file01: data
./-file02: OpenPGP Secret Key
./-file03: data
./-file04: data
./-file05: data
./-file06: Non-ISO extended-ASCII text, with NEL line terminators
./-file07: ASCII text
./-file08: data
./-file09: data
bandit4@bandit:~/inhere$
bandit4@bandit:~/inhere$ head ./-file0[0-9]
==> ./-file00 <==
��C
   ��t!g���Ǔ|0a�E>d
==> ./-file01 <==
X&v{����M=�&.���q ƖpG�
==> ./-file02 <==
etE�XQ7�[8s_"،WW+��b�1

==> ./-file03 <==
���MB�}ȼ%�8j���Ji�CHL
==> ./-file04 <==
EiE�`�Ykq3S/���9
==> ./-file05 <==
�P@Kk��HJ�͡��<M�J2ϸ�
==> ./-file06 <==
{g�>���-{�
          !
           0A���F$\X
==> ./-file07 <==
6C7h9GD8M6ai5nr7wo1RonrzFjj9yIrG

==> ./-file08 <==
$�.Rz`!�km�fN	OoC=
==> ./-file09 <==
G
wSm;�vCTGiYsF]bandit4@bandit:~/inhere$ 
bandit4@bandit:~/inhere$ cat ./-file07 
6C7h9GD8M6ai5nr7wo1RonrzFjj9yIrG
bandit4@bandit:~/inhere$
```
| PART | usage |
|-----|-------|
| ssh | open a ssh connection |
| bandit4 | uesrname |
| @ | used to separate hostname and the username |
| bandit.lab.overthewire.org | Remote Host |
| -p 2220 | -p is used to specifty the port and 2220 is the port we are connnecting to |
| ls | lists the contents of the current dir |
| ls -a | lists the contents including the hidden files |
| cat |  command used to read and display the contents of one or more files. |
|     |It can also concatenate multiple files and write the combined output to standard output. |
|  -file07 | the file containing the password |
| cd | a useful command used to navigate inside of terminal and pronounced cd and stands for change directory |
| file | A useful command used to find what type the file is |
| find | Another useful command used to list all the files from the current directory . it only goes down in hierarchy |
| head | command used to output the first part of files as the name suggest |


---

## Solution Walkthrough
    First I logged into the level 4 by using the password i acquired for it in the previous level .
    This time i wanted to use different command to find what is in the current directory and below it .
    so i used the command `find` without specifying anything so that it would print all the files available
    to me including the hidden ones . and then i noticed that bunch of files are located inside the inhere
    directory .so i moved to that dir by using the cmd `cd` .Then i used the cmd `ls` to list the files 
    in that directory .and i found bunch of files with similar name with sequentially varying number at the end
    of each file name .since i know that the password is human readable i tried to find which file is human 
    readable by using the tool file . and i found that -file07 is ASCII text which can read by human so
    cat that file and it really contains the password for the next level . then i copied the password to my
    local machine and thein i closed the connection by prssing ctrl + d .
---
## Alternate Solution
   * I could have written a small script to cat each files content in the terminal by using loops .
   * I could have manually cat each files but that would take lot of work and time .
   * I could have only used the head command which would be more efficient .

## What I Learned
    I learned how to use the commands efficently by learning lot of other ways to do the same thing .
    I learned about file command and find command . Their usages . And i also learned about File types.
---

## References
  * Website - https://overthewire.org/wargames/bandit/bandit5.html

---

## Linux concetps Learned
 * File Navigation .
 * find , file .
 * File types .

## New Concepts
 * cmds = find, file
 * File types 
 * Pattern matching 
---

## Notes
 hostname : bandit.labs.overthewire.org
 username : bandit4
