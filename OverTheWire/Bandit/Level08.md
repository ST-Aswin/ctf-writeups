---
Platform: OverTheWire 
Game: Bandit
Level: 8
Date: 2026-07-30
Difficulty: Beginner
Topics:
  - SSH
  - Linux
  - Relative Paths
  - cat
  - Shell
  - ctf
---

# Challenge
 The password for the next level is stored in the file data.txt next to the word millionth. 
 Acquire the password required for the next level.

## Platform
 * OverTheWire

## Level
 * bandit7

## Difficulty
 * bandit - beginner
 
---

## Objective
 * Acquire the password required for the next lvl .
 * review the commands learned in the past levels .

---

## Skills Practiced
 * SSH
 * Terminal 
 * commands : ls , grep , cat
 
---

## Tools Used
 * ssh 
 * Terminal
 * ls
 * grep 
 * cat

---

## Key Takeaways

- grep searches lines matching a pattern.
- ls -la is usually the first command to inspect a directory.
- Read the challenge carefully before searching the filesystem.

## Observations

 * The file containing the password required for the next level is sitting right there in the home directory . 
 * The file has lots of lines .
 * The game has given me the hint that the password is next to the word ` millionth `. 

---

## Commands Used

<details>
<summary> Terminal Output :  cat ./next_lvl.sh  </summary>

```bash
if [[ -z "$1" ]] 
then
	echo "Pls, Provide the User name "
	echo "Example . ./next_lvl.sh bandit0"
	exit
fi

ssh -p 2220 "$1"@bandit.labs.overthewire.org
```

</details>

  * I cat the next_lvl.sh script to show what it does .

<details>
<summary> Terminal Output : ./next_lvl.sh bandit7
</summary>

``` bash 

❯ ./next_lvl.sh bandit7
                         _                     _ _ _   
                        | |__   __ _ _ __   __| (_) |_ 
                        | '_ \ / _` | '_ \ / _` | | __|
                        | |_) | (_| | | | | (_| | | |_ 
                        |_.__/ \__,_|_| |_|\__,_|_|\__|
                                                       

                      This is an OverTheWire game server. 
            More information on http://www.overthewire.org/wargames

backend: gibson-0
bandit7@bandit.labs.overthewire.org's password: 


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

bandit7@bandit:~$
```
</details>

 * I logged into the remote host using the password i acquired in the last level of bandit .

<details>
<summary> Terminal Output : ls -la </summary>

``` bash 
bandit7@bandit:~$ ls -la
total 4108
drwxr-xr-x   2 root    root       4096 Jun 24 14:59 .
drwxr-xr-x 150 root    root       4096 Jun 24 15:02 ..
-rw-r--r--   1 root    root        220 Feb 13 12:16 .bash_logout
-rw-r--r--   1 root    root       3851 Jun 24 14:50 .bashrc
-rw-r--r--   1 root    root        807 Feb 13 12:16 .profile
-rw-r-----   1 bandit8 bandit7 4184396 Jun 24 14:59 data.txt
bandit7@bandit:~$ 
```

</details>
 
  * The game said the password is in the file named data.txt . so first i wanted know where it is located .
    so before trying `find / -name data.txt` this command i used ls -la to list the files and folders including 
    the hidden ones on the home dir . the 'data.txt' was sitting right in the home folder so no need for 
    complex searching .

<details> 
<summary> Terminal Output : grep -e "millionth" data.txt </summary>

``` bash 
bandit7@bandit:~$ grep -e "millionth" data.txt 
millionth	VR1ljMayciFxbnUokuQmJFw6QC9VKtub
bandit7@bandit:~$
```
</details>
 
  * The data.txt contains lots of lines . and in one of those lines is the password i am looking for . and The
    game also mentioned that the password is next to word ` millionth ` .so i used grep to grab the line which
    have the word ` millionth ` .and that's how i find the password for the next level . Then i exit the remote
    host by pressing `ctrl + d `. 


| PART | usage |
|-----|-------|
| ssh | open a ssh connection |
| bandit7 | username |
| @ | used to separate hostname and the username |
| bandit.lab.overthewire.org | Remote Host |
| -p 2220 | -p is used to specifty the port and 2220 is the port we are connnecting to |
| ls | lists the contents of the current dir |
| ls -a | lists the contents including the hidden files |
| ls -l | lists the contesnts of the current folder in a list format along with useful info |
| cat |  command used to read and display the contents of one or more files. |
|     |It can also concatenate multiple files and write the combined output to standard output. |
|  data.txt | the file containing the password |
| grep | global regular expression , a command that grabs the lines that have the pattern you specified |
| -e | option used to specify the pattern |


 ---

## What I Learned

 * I learned how to use the command ` grep ` .

---

## References
 
 * website - https://overthewire.org/wargames/bandit/bandit8.html

---

## Notes

 username : bandit7
 hostname : bandit.labs.overthewire.org
 
--- 

## Lesson Learned

 * consistency matters more than anything in computer world because sometimes you will feel like you don't make 
   progress even if you are making progress .

 * I should review the commands i learned here and there .or else i would forget it .
