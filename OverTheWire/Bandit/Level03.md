---
Platform: OverTheWire
Game: Bandit
Level: 3
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
    The password for the next level is stored in a file called --spaces in this filename-- located in the home directory
    get The password from the file and log into the next level.

## Platform
  * OverTheWire

## Level
  * bandit03

## Difficulty
  * bandit - beginnger 
---

## Objective
 * Learn how to interact with the files containing spaces in its name .
 * Acquire the password needed to log into the next level .

---

## Skills Practiced
 * terminal
 * ssh
 * ls
 * cat

---

## Tools Used
 * terminal
 * ssh
 * ls
 * cat

---

## Observations

- The filename begins with `--`, which many Unix programs interpret as a long option.
- Wrapping the filename in quotes preserves spaces but does not prevent option parsing.
- Using an explicit relative path (`./`) allows the file to be accessed correctly.

---

## Commands Used

```bash
❯ cat next_lvl.sh
#! /usr/bin/bash

ssh -p 2220 $1@bandit.labs.overthewire.org
❯ ./next_lvl.sh bandit2
                         _                     _ _ _   
                        | |__   __ _ _ __   __| (_) |_ 
                        | '_ \ / _` | '_ \ / _` | | __|
                        | |_) | (_| | | | | (_| | | |_ 
                        |_.__/ \__,_|_| |_|\__,_|_|\__|
                                                       

                      This is an OverTheWire game server. 
            More information on http://www.overthewire.org/wargames

backend: gibson-1
bandit2@bandit.labs.overthewire.org's password: 

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

bandit2@bandit:~$ 
bandit2@bandit:~$ ls
--spaces in this filename--
bandit2@bandit:~$ cat --spaces in this filename--
error: unexpected argument '--spaces' found

  tip: to pass '--spaces' as a value, use '-- --spaces'

Usage: cat [OPTION]... [FILE]...

For more information, try '--help'.
bandit2@bandit:~$ cat "--spaces in this filename--"
error: unexpected argument '--spaces in this filename--' found

  tip: to pass '--spaces in this filename--' as a value, use '-- --spaces in this filename--'

Usage: cat [OPTION]... [FILE]...

For more information, try '--help'.
bandit2@bandit:~$ cat "./--spaces in this filename--"
7ZZ2LFrykP2zEyvBl4m3clcL7tGYJPME
bandit2@bandit:~$ ls -a
--spaces in this filename--  .  ..  .bash_logout  .bashrc  .profile
bandit2@bandit:~$  

```
| PART | usage |
|-----|-------|
| ssh | open a ssh connection |
| bandit2 | uesrname |
| @ | used to separate hostname and the username |
| bandit.lab.overthewire.org | Remote Host |
| -p 2220 | -p is used to specifty the port and 2220 is the port we are connnecting to |
| ls | lists the contents of the current dir |
| ls -a | lists the contents including the hidden files |
| cat |  command used to read and display the contents of one or more files. |
|     |It can also concatenate multiple files and write the combined output to standard output. |
| ./ | dot and forward slash is used so the bash doesn't mistake the '-' file name for flags or options |
| --spaces in this filename--  | the file containing the password |

---

## Solution Walkthrough
    
    Before i started solving this level i did one thing which is to shorten the length of the cmd
    i have to type for everylvl to log in .
    I did it by writing a small script so that everytime i only have to give it a username(ex. ./next_lvl.sh bandit0) and it 
    will automatically connect me to the remote host then it will asks me for the password . This idea came to me because i 
    noticed that for every lvl only the user name changes but the port and the host name remains as it is .
    after i logged into the remote host i type the commands ls and ls -a to find the available files and hidden files which
    might be useful .but in this case there is no hidden useful files . i noticed the file named "--spaces in this filename--"
    .so this time i didn't go to the google because i want to tryout somethings i have learned in the previos lvls and the past 
    before i go to google . first i tried to cat the file by encapsulation it in quotes but it didn't work . then i tried it
    with ./ dot forward slash this time it works .but why ? Because the file name starts with the - the systems mistakes it for
    options so by explictly mentioning the path we are telling the systems that it is a file .it would have worked in the first
    try if it didn't start with a --.so after i acquired the password i documented the password in my local machine to log into
    the next lvl .

---

## What I Learned
  * File names in linux
        i learned that file names in linux can start with special symbols and can contain space inbetween and
        to Interact with them i have to use a different way becuase normal way won't work .
  * I learned to work with files containing spaces in it and the files starting with - .
---

## References
  * website - https://overthewire.org/wargames/bandit/bandit3.html

---

## New Concepts
 * scripting
 * Automation
 * bash variables
 * sha bang
 * file with spaces in its name

---

## Notes
 hostname : bandit.labs.overthewire.org
 username : bandit2

