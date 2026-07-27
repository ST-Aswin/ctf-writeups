---
Platform: OverTheWire
Game: Bandit
Level: 2
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
    The password for the next level is saved inside of the file named '-'(dash) in the home directory.
    get the password from the file and log into the next level .

## Platform
  * OverTheWire

## Level
  * Level02

## Difficulty
  * Bandit - beginner
---

## Objective
  * Learn about Dashed files .
  * log into the next level of bandit.
---

## Skills Practiced
  * ssh 
  * Bash 
  * ls
  * cat
---

## Tools Used
  * ssh - to log into the remote host
  * terminal - to interact with the kernel
  * ls - to list the available contents 
  * cat - to print the contents of the file
---

## Ovservations
  * The file containing the password was left accessible in the home directory of the remote host.
  * it was not hidden . and there were few hidden files like .bashrc , .bash_logout and .profile .
---

## Commands Used

```bash
❯ ssh bandit1@bandit.labs.overthewire.org -p 2220
                         _                     _ _ _   
                        | |__   __ _ _ __   __| (_) |_ 
                        | '_ \ / _` | '_ \ / _` | | __|
                        | |_) | (_| | | | | (_| | | |_ 
                        |_.__/ \__,_|_| |_|\__,_|_|\__|
                                                       

                      This is an OverTheWire game server. 
            More information on http://www.overthewire.org/wargames

backend: gibson-1
bandit1@bandit.labs.overthewire.org's password: 

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

bandit1@bandit:~$ ls
-
bandit1@bandit:~$ cat ./-
PK8fYLZg2hnHSz83plBL1iEPKdD3QToB
bandit1@bandit:~$ ls -a
-  .  ..  .bash_logout  .bashrc  .profile
bandit1@bandit:~$
```
| PART | usage |
|-----|-------|
| ssh | open a ssh connection |
| bandit1 | uesrname |
| @ | used to separate hostname and the username |
| bandit.lab.overthewire.org | Remote Host |
| -p 2220 | -p is used to specifty the port and 2220 is the port we are connnecting to |
| ls | lists the contents of the current dir |
| ls -a | lists the contents including the hidden files |
| cat |  command used to read and display the contents of one or more files. |
|     |It can also concatenate multiple files and write the combined output to standard output. |
|     | used to print the contents of the file |
| ./ | dot and forward slash is used so the bash doesn't mistake the '-' file name for flags or options |
| - | the file containing the password |

---

## Solution Walkthrough
     since i know the password , username , port and the hostname for the level bandit1 
     i logged into the remote host using ssh .Then typed ls and entered to find the contents
     that are available . i saw the file named - sitting right there in the home dir .again i 
     ls -a to find, are there any more hidden files which could be useful for this level but i
     didn't find anyting useful . so first i tried to read the file - by using cat - but it didn't
     work so i googled about this and learnt about the dashed file .and i also learnt that we can't
     access that in a normal way we do . we have to use ./ to tell the bash that this isn't to 
     specify a option or flag but there is actually a file named - and print its content .
     Next i documented the password i find for the next level in my local machine .then i exited
     this ssh session by pressing ctrl + d.

---

## What I Learned
    I learned about Dashed file and a way to interact with it .
---

## References
  * website - OverTheWire
