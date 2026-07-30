---
Platform: OverTheWire 
Game: Bandit
Level: 7
Date: 2026-07-29
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
The password for the next level is stored somewhere on the server and has all of the following properties:

    owned by user bandit7
    owned by group bandit6
    33 bytes in size
Acquire the password for the next level.

## Platform
 * OverTheWire .

## Level
 * Level07 .

## Difficulty
 * Bandit - beginner .
---

## Objective
 * Find the file that containing the password for next level.
 * Learn more about `find` and `grep`.
---

## Skills Practiced
 * SSH
 * Terminal Navigation
 * File Permissions

---

## Tools Used
 * ssh
 * terminal
 * ls , cd , find , grep .
---

## Observations

---

## Commands Used and why i used it .

```bash
❯ cat next_lvl.sh
#! /usr/bin/env bash

if [[ -z "$1" ]] 
then
	echo "Pls, Provide the User name "
	echo "Example . ./next_lvl.sh bandit0"
	exit
fi

ssh -p 2220 "$1"@bandit.labs.overthewire.org
❯ ./next_lvl.sh bandit6
                         _                     _ _ _   
                        | |__   __ _ _ __   __| (_) |_ 
                        | '_ \ / _` | '_ \ / _` | | __|
                        | |_) | (_| | | | | (_| | | |_ 
                        |_.__/ \__,_|_| |_|\__,_|_|\__|
                                                       

                      This is an OverTheWire game server. 
            More information on http://www.overthewire.org/wargames

backend: gibson-0
bandit6@bandit.labs.overthewire.org's password: 

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

bandit6@bandit:~$ 
```
   * First i logged into the remote host by using the password i acquired in the previous level .

``` bash 
bandit6@bandit:~$ ls -la
total 20
drwxr-xr-x   2 root root 4096 Jun 24 14:58 .
drwxr-xr-x 150 root root 4096 Jun 24 15:02 ..
-rw-r--r--   1 root root  220 Feb 13 12:16 .bash_logout
-rw-r--r--   1 root root 3851 Jun 24 14:50 .bashrc
-rw-r--r--   1 root root  807 Feb 13 12:16 .profile
bandit6@bandit:~$ 
```
   * After I logged in i wanted to know what i can get in the current directory which is the home directory of bandit6.
     but i couldn't see anything here .

``` bash 
bandit6@bandit:~$ cat .bash_logout .bashrc .profile
bandit6@bandit:~$ 
```
  * Then i cat the .bash_logout .bashrc .profile to see what i can get from them .
    Since i don't get anything useful i decided to move one directory up because there is no subdirectory in this folder.

``` bash 
  bandit6@bandit:~$ cd ..
bandit6@bandit:/home$ ls -a
.         bandit17  bandit27      bandit32   behemoth3  drifter14    formulaone1  krypton7    manpage2  maze5    narnia6  utumno6   vortex16  vortex3
..        bandit18  bandit27-git  bandit33   behemoth4  drifter15    formulaone2  leviathan0  manpage3  maze6    narnia7  utumno7   vortex17  vortex4
bandit0   bandit19  bandit28      bandit4    behemoth5  drifter2     formulaone3  leviathan1  manpage4  maze7    narnia8  utumno8   vortex18  vortex5
bandit1   bandit2   bandit28-git  bandit5    behemoth6  drifter3     formulaone5  leviathan2  manpage5  maze8    narnia9  vortex0   vortex19  vortex6
bandit10  bandit20  bandit29      bandit6    behemoth7  drifter4     formulaone6  leviathan3  manpage6  maze9    ubuntu   vortex1   vortex2   vortex7
bandit11  bandit21  bandit29-git  bandit7    behemoth8  drifter5     krypton1     leviathan4  manpage7  narnia0  utumno0  vortex10  vortex20  vortex8
bandit12  bandit22  bandit3       bandit8    drifter0   drifter6     krypton2     leviathan5  maze0     narnia1  utumno1  vortex11  vortex21  vortex9
bandit13  bandit23  bandit30      bandit9    drifter1   drifter7     krypton3     leviathan6  maze1     narnia2  utumno2  vortex12  vortex22
bandit14  bandit24  bandit30-git  behemoth0  drifter10  drifter8     krypton4     leviathan7  maze2     narnia3  utumno3  vortex13  vortex23
bandit15  bandit25  bandit31      behemoth1  drifter12  drifter9     krypton5     manpage0    maze3     narnia4  utumno4  vortex14  vortex24
bandit16  bandit26  bandit31-git  behemoth2  drifter13  formulaone0  krypton6     manpage1    maze4     narnia5  utumno5  vortex15  vortex25
bandit6@bandit:/home$
```
   * I moved one directory up and used ls -a to see all the files in the /home dir and i saw lots of dirs , at first i thought the 
     file i am looking for must be in one of this directories . so i spent lot of time here to find the file i am looking for .

``` bash
bandit6@bandit:/home$ find -type f -size 33c -group bandit6 -user bandit7 
find: ‘./ubuntu’: Permission denied
find: ‘./bandit5/inhere’: Permission denied
find: ‘./drifter8/chroot’: Permission denied
find: ‘./bandit28-git’: Permission denied
find: ‘./drifter6/data’: Permission denied
find: ‘./bandit29-git’: Permission denied
find: ‘./bandit30-git’: Permission denied
find: ‘./leviathan0/.backup’: Permission denied
find: ‘./bandit31-git’: Permission denied
find: ‘./leviathan4/.trash’: Permission denied
find: ‘./bandit27-git’: Permission denied
bandit6@bandit:/home$ 
```
  * I used the command find to filter out the file i looking for since i know few info about the file i am looking for,
    like its size its user name and its group name . I was hit with the error "Permission denied" .

``` bash
 bandit6@bandit:/home$ su root
Password: 
su: Authentication failure
bandit6@bandit:/home$ 
```
 * since i am getting the error "Permission Denied" .I thought changing my user from bandit6 to root would solve the problem
   so tried su root with the password root and tried few other common passwords .but it didn't work . and After sometimes
   i realized one very simple thing that is that every folder on /home is a personal files of other users .since i am not 
   a root or either i have a password for other users . i decided to move again one dir up which is / .

``` bash 
 
bandit6@bandit:/$ find -type f -size 33c -user bandit7 -group bandit6
ind: ‘./run/user/11012’: Permission denied
find: ‘./run/user/11005’: Permission denied
find: ‘./run/user/11000’: Permission denied
find: ‘./run/user/11001’: Permission denied
find: ‘./run/user/5010’: Permission denied
find: ‘./run/user/5018’: Permission denied
find: ‘./run/user/12002’: Permission denied
find: ‘./run/user/11014’: Permission denied
find: ‘./run/user/11006/systemd/inaccessible/dir’: Permission denied
find: ‘./run/user/11013’: Permission denied
find: ‘./run/user/5011’: Permission denied
find: ‘./run/user/11011’: Permission denied
find: ‘./run/user/5012’: Permission denied
ind: ‘./run/multipath’: Permission denied
find: ‘./run/cryptsetup’: Permission denied
find: ‘./run/lock/lvm’: Permission denied
find: ‘./run/lvm’: Permission denied
find: ‘./run/cloud-init/share’: Permission denied
find: ‘./run/credentials/serial-getty@ttyS0.service’: Permission denied
find: ‘./run/credentials/getty@tty1.service’: Permission denied
find: ‘./run/credentials/systemd-networkd.service’: Permission denied
find: ‘./run/credentials/systemd-resolved.service’: Permission denied
find: ‘./run/credentials/systemd-journald.service’: Permission denied
find: ‘./run/systemd/ask-password-block’: Permission denied
find: ‘./run/systemd/inaccessible/dir’: Permission denied
find: ‘./var/lib/chrony’: Permission denied
find: ‘./var/lib/update-notifier/package-data-downloads/partial’: Permission denied
find: ‘./var/lib/snapd/cookie’: Permission denied
find: ‘./var/lib/snapd/void’: Permission denied
find: ‘./var/lib/ubuntu-advantage/apt-esm/var/lib/apt/lists/partial’: Permission denied
find: ‘./var/lib/amazon’: Permission denied
find: ‘./var/lib/udisks2’: Permission denied
`./var/lib/dpkg/info/bandit7.password`
find: ‘./var/lib/apt/lists/partial’: Permission denied
find: ‘./var/lib/private’: Permission denied
find: ‘./var/cache/apparmor/147ee081.0’: Permission denied
find: ‘./var/cache/apparmor/ae1a4050.0’: Permission denied
find: ‘./var/cache/apt/archives/partial’: Permission denied
find: ‘./var/cache/pollinate’: Permission denied
find: ‘./var/cache/ldconfig’: Permission denied
find: ‘./var/cache/private’: Permission denied
find: ‘./var/spool/rsyslog’: Permission denied
find: ‘./var/spool/cron/crontabs’: Permission denied
ind: ‘./etc/credstore.encrypted’: Permission denied
find: ‘./etc/credstore’: Permission denied
find: ‘./etc/multipath’: Permission denied
find: ‘./etc/polkit-1/rules.d’: Permission denied
find: ‘./etc/stunnel’: Permission denied
find: ‘./etc/sudoers.d’: Permission denied
ind: ‘./sys/kernel/debug’: Permission denied
find: ‘./sys/fs/pstore’: Permission denied
find: ‘./sys/fs/bpf’: Permission denied
find: ‘./tmp’: Permission denied
bandit6@bandit:/$ # note i deleted few lines of output because it was too long ...
```
  * I moved to the root directory and once i again i used the find command with the options `-type f -size 33c -user bandit7 -group bandit6`.
    and i got a huge list of output and one thing got my attention that is the line without the word "Permission denied"
    `./var/lib/dpkg/info/bandit7.password` and i know that is file i am looking for . and i verified it with the command ls -l `./var/lib
    /dpkg/info/bandit7.password`.

``` bash
bandit6@bandit:/$ ls -l /var/lib/dpkg/info/bandit7.password
-rw-r----- 1 bandit7 bandit6 33 Jun 24 14:59 /var/lib/dpkg/info/bandit7.password
bandit6@bandit:/$
```
  * and then i cat the file and copied the password to my local machine . But this time i am not going to press ctrl + d and exit .
    because i am not satisfied with the way i found the password file .cus i found the password in middle of huge noise which is very
    easy to miss .it might be a luck that i spotted the file .so i wanted to find a more reliable way .so i thought piping this output
    to the grep and inverse matching would solve the problem .


``` bash 
bandit6@bandit:/$ find -type f -size 33c -user bandit6 -group bandit7 | grep -v -e "Permission denied"
find: ‘./snap’: Permission denied
find: ‘./lost+found’: Permission denied
find: ‘./manpage/manpage3-pw’: Permission denied
find: ‘./drifter/drifter14_src/axTLS’: Permission denied
find: ‘./run/pam_pidns’: Permission denied
find: ‘./run/udisks2’: Permission denied
find: ‘./run/chrony’: Permission denied
find: ‘./run/user/15000’: Permission denied
```
  * hmmm i didn't expect that . i thought grep would solve this problem but it didn't .i mean it should be working right . so i started
  googling and reading man pages of grep and still didn't find the solution . i was frustrated . but it was also fun at the same time .
  after some googling i learned that grep only reads from stdout but the output in my terminal is from stderr . and then i learned about
  redirecting buffer with 2>&1 . so i tried it .

``` bash
bandit6@bandit:/$ find -type f -size 33c -user bandit7 -group bandit6 2>&1 | grep -v -e "Permission denied" -e "find"
./var/lib/dpkg/info/bandit7.password
bandit6@bandit:/$
```
 * finally somehow i solved the problem and learned a lot along the way .

| PART | usage |
|-----|-------|
| ssh | open a ssh connection |
| bandit6 | username |
| @ | used to separate hostname and the username |
| bandit.lab.overthewire.org | Remote Host |
| -p 2220 | -p is used to specifty the port and 2220 is the port we are connnecting to |
| ls | lists the contents of the current dir |
| ls -a | lists the contents including the hidden files |
| ls -l | lists the contesnts of the current folder in a list format along with useful info |
| cat |  command used to read and display the contents of one or more files. |
|     |It can also concatenate multiple files and write the combined output to standard output. |
|  bandit7.password | the file containing the password |
| cd | a useful command used to navigate inside of terminal and pronounced cd and stands for change directory |
| file | A useful command used to find what type the file is |
| find | Another useful command used to list all the files from the current directory . it only goes down in hierarchy |
| grep | global regular expression , a command that grabs the lines that have the pattern you specified |
| grep -v -e | this sequence is used to omit or exclude the lines with the pattern you specify |
| -type | speciftying what type of thing we are looking for |
| -size | filters by the size of the file |
| 33c | 33 bytes |
| -user | specifying the user |
| bandit7 | username of the file we are looking for |
| -group | specifying the group |
| bandit6 | groupname of the file we are looking for |
| 2>&1 | redirecting stderr buf to stdou buf |
| 2 | in this context 2 is a file descriptor representing stderr |
| > | redirecting symbol |
| & | In this context `&` tells the shell that 1 isn't a file but it is file discriptor |
| 1 | in this context 1 is a file discriptor representing stdout |

 
---

## What I Learned
  * Patience
  * Learned more about piping
  * redirecting buffers
  * i learned why /dev/null exists .
---

## References
  * website - https://overthewire.org/wargames/bandit/bandit7.html

---

## Linux Concepts
  * Redirecting buffers eg.2>/dev/null , 2>&1 
  * Pipe only reads from stdout

## New Concepts
  * Redirecting buffers eg.2>/dev/null , 2>&1 .
  * pipe only reads from stdout .
  * patience about learning .
---

## Notes
   HostName : bandit.labs.overthewire.org
   username : bandit6

## Lesson Learned
    Patience is very important in all stages of learning and mastering anything .
    And don't you ever compare yourself with anyone else cus everybody is different
    and somebody have unfair advantage and that's okay . cus happiness should be
    coming from doing it not being better than everyone else .
