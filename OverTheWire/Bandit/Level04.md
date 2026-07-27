---
Platform: OverTheWire
Game: Bandit
Level: 4
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
  The password for the next level is stored in a hidden file in the inhere directory.
  find the hidden file to acquire the password .

## Platform
 * OverTheWire

## Level
 * bandit04 

## Difficulty
 * bandit - beginner 
---

## Objective
 * Learn about relative paths .
 * Learn how to naviagate inside of terminal .
 * Acquire the password required for next level .
---

## Skills Practiced
 * ssh
 * Terminal navigation
 * ls 
 * cat
---

## Tools Used
 * ssh - to connect to the remote host
 * terminal - to interact with the kernel
 * ls - to list the contents of the directories
 * cat - to write out the contents of the file
 * cd - to change directory

---

## Observations
 * There was only a single folder sitting in the home dir of remote host .
 * The name of the folder(inhere) is like giving away the location of the file i am searching for .
 * The file containing the password was found inside of inhere folder and it was hidden .

---

## Commands Used

```bash
❯ ./next_lvl.sh bandit3
                         _                     _ _ _   
                        | |__   __ _ _ __   __| (_) |_ 
                        | '_ \ / _` | '_ \ / _` | | __|
                        | |_) | (_| | | | | (_| | | |_ 
                        |_.__/ \__,_|_| |_|\__,_|_|\__|
                                                       

                      This is an OverTheWire game server. 
            More information on http://www.overthewire.org/wargames

backend: gibson-1
bandit3@bandit.labs.overthewire.org's password: 

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

bandit3@bandit:~$ ls 
inhere
bandit3@bandit:~$ ls -a
.  ..  .bash_logout  .bashrc  .profile  inhere
bandit3@bandit:~$ tree
Command 'tree' not found, but can be installed with:
apt install tree
Please ask your administrator.
bandit3@bandit:~$ cd inhere
bandit3@bandit:~/inhere$ ls
bandit3@bandit:~/inhere$ ls -a
.  ..  ...Hiding-From-You
bandit3@bandit:~/inhere$ cat ..
../                 ...Hiding-From-You  
bandit3@bandit:~/inhere$ cat ...Hiding-From-You 
xzTXq1rDJQVVAzdv5cHq1TQytTWufAMq
bandit3@bandit:~/inhere$ 

```
| PART | usage |
|-----|-------|
| ssh | open a ssh connection |
| bandit3 | uesrname |
| @ | used to separate hostname and the username |
| bandit.lab.overthewire.org | Remote Host |
| -p 2220 | -p is used to specifty the port and 2220 is the port we are connnecting to |
| ls | lists the contents of the current dir |
| ls -a | lists the contents including the hidden files |
| cat |  command used to read and display the contents of one or more files. |
|     |It can also concatenate multiple files and write the combined output to standard output. |
|  ...Hiding-From-You | the file containing the password |
| cd | a useful command used to navigate inside of terminal and pronounced cd and stands for change directory |

---

## Solution Walkthrough
    I logged in to the next level (bandit3) remote host by using the password i aquired in the previous lvl.
    First i did ls and ls -a to find the available files and the hidden files .i found the fodler `inhere`
    sitting right there in the home folder . so i cd into it to find what files it has in it . Then i ls
    to find the files but it didn't show anything then i ls -a to show the hidden files if there is any and
    there was a hidden file named ...Hiding_from_you . Then i cat the file to see the password and copied it
    to my local machine . i noticed one thing that is eventhough '.' is a special symbol i don't need any different
    way to interact with it like i did with '-' .
---

## What I Learned
    I learned how to find the hidden files or directories by passing -a flag to the `ls` command .
    I Learned how to navigate inside of terminal .
    I learned that linux hides things if anything (file or folders) starts with dot (.).
    In Linux and other Unix-like operating systems, any file or directory whose name begins with a dot (`.`) 
    is considered hidden by convention. Most comm    ands, such as `ls`, do not display these entries unless 
    explicitly requested with options like `-a`.
---

## References
  * website - https://overthewire.org/wargames/bandit/bandit4.html
---

## New Concepts
* Hidden files .
* Directory navigation .
---

## Linux Concepts Learned

- Hidden files
- Relative paths
- Directory navigation
- Current working directory

## Notes
 hostname : bandit.labs.overthewire.org
 username : bandit3
