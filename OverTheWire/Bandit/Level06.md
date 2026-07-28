---
Platform: OverTheWire Game: Bandit
Level: 6
Date: 2026-07-28
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
  The password for the next level is stored in a file somewhere under the inhere directory and has all of the following properties:

   * human-readable
   * 1033 bytes in size
   * not executable
 Acquire the password for the next level .

## Platform
  * OverTheWire

## Level
  * Bandit6 

## Difficulty
  * bandit - beginner

---

## Objective
  * Acquire The password for the next level .
  * Learn about file permissions . 
---

## Skills Practiced
 * ssh
 * Terminal navigation
 * ls 
 * cat
 * Thinking about efficiency
 * File Permissions
---

## Tools Used
  * ssh - to connect to the remote host
  * terminal - to interact with the kernel
  * ls - to list the contents of the directories
  * cat - to write out the contents of the file
  * cd - to change directory
  * find - to list all the files from the current directory
  * file
  * du
---

## Observations
  * There was a dir named `inhere` sitting right there in the home dir and inside of that dir i saw 19 dir with similar names with varying numbers
    at the end ranging from 0 - 19
  * I couldn't create any file inside of the remote host becuse i don't have that privilege which was quite a pain .
  * The files in the sub dir are named similarly and only trained eye can see the difference at the first sight.
---

## Commands Used

```bash
❯ ./next_lvl.sh bandit5
                         _                     _ _ _   
                        | |__   __ _ _ __   __| (_) |_ 
                        | '_ \ / _` | '_ \ / _` | | __|
                        | |_) | (_| | | | | (_| | | |_ 
                        |_.__/ \__,_|_| |_|\__,_|_|\__|
                                                       

                      This is an OverTheWire game server. 
            More information on http://www.overthewire.org/wargames

backend: gibson-1
bandit5@bandit.labs.overthewire.org's password: 
Permission denied, please try again.
bandit5@bandit.labs.overthewire.org's password: 

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

bandit5@bandit:~$ ls -la
total 24
drwxr-xr-x   3 root root    4096 Jun 24 14:59 .
drwxr-xr-x 150 root root    4096 Jun 24 15:02 ..
-rw-r--r--   1 root root     220 Feb 13 12:16 .bash_logout
-rw-r--r--   1 root root    3851 Jun 24 14:50 .bashrc
-rw-r--r--   1 root root     807 Feb 13 12:16 .profile
drwxr-x---  22 root bandit5 4096 Jun 24 14:59 inhere
bandit5@bandit:~$ cd inhere
bandit5@bandit:~/inhere$ find
.
./maybehere11
./maybehere11/spaces file2
./maybehere11/-file3
./maybehere11/spaces file1
./maybehere11/.file3
./maybehere11/.file2
./maybehere11/.file1
./maybehere11/spaces file3
./maybehere11/-file2
./maybehere11/-file1
./maybehere08
./maybehere08/spaces file2
./maybehere08/-file3
./maybehere08/spaces file1
./maybehere08/.file3
./maybehere08/.file2
./maybehere08/.file1
./maybehere08/spaces file3
./maybehere08/-file2
./maybehere08/-file1
./maybehere19
./maybehere19/spaces file2
./maybehere19/-file3
./maybehere19/spaces file1
./maybehere19/.file3
./maybehere19/.file2
./maybehere19/.file1
./maybehere19/spaces file3
./maybehere19/-file2
./maybehere19/-file1
./maybehere17
./maybehere17/spaces file2
./maybehere17/-file3
./maybehere17/spaces file1
./maybehere17/.file3
./maybehere17/.file2
./maybehere17/.file1
./maybehere17/spaces file3
./maybehere17/-file2
./maybehere17/-file1
./maybehere12
./maybehere12/spaces file2
./maybehere12/-file3
./maybehere12/spaces file1
./maybehere12/.file3
./maybehere12/.file2
./maybehere12/.file1
./maybehere12/spaces file3
./maybehere12/-file2
./maybehere12/-file1
./maybehere10
./maybehere10/spaces file2
./maybehere10/-file3
./maybehere10/spaces file1
./maybehere10/.file3
./maybehere10/.file2
./maybehere10/.file1
./maybehere10/spaces file3
./maybehere10/-file2
./maybehere10/-file1
./maybehere05
./maybehere05/spaces file2
./maybehere05/-file3
./maybehere05/spaces file1
./maybehere05/.file3
./maybehere05/.file2
./maybehere05/.file1
./maybehere05/spaces file3
./maybehere05/-file2
./maybehere05/-file1
./maybehere03
./maybehere03/spaces file2
./maybehere03/-file3
./maybehere03/spaces file1
./maybehere03/.file3
./maybehere03/.file2
./maybehere03/.file1
./maybehere03/spaces file3
./maybehere03/-file2
./maybehere03/-file1
./maybehere13
./maybehere13/spaces file2
./maybehere13/-file3
./maybehere13/spaces file1
./maybehere13/.file3
./maybehere13/.file2
./maybehere13/.file1
./maybehere13/spaces file3
./maybehere13/-file2
./maybehere13/-file1
./maybehere07
./maybehere07/spaces file2
./maybehere07/-file3
./maybehere07/spaces file1
./maybehere07/.file3
./maybehere07/.file2
./maybehere07/.file1
./maybehere07/spaces file3
./maybehere07/-file2
./maybehere07/-file1
./maybehere02
./maybehere02/spaces file2
./maybehere02/-file3
./maybehere02/spaces file1
./maybehere02/.file3
./maybehere02/.file2
./maybehere02/.file1
./maybehere02/spaces file3
./maybehere02/-file2
./maybehere02/-file1
./maybehere15
./maybehere15/spaces file2
./maybehere15/-file3
./maybehere15/spaces file1
./maybehere15/.file3
./maybehere15/.file2
./maybehere15/.file1
./maybehere15/spaces file3
./maybehere15/-file2
./maybehere15/-file1
./maybehere06
./maybehere06/spaces file2
./maybehere06/-file3
./maybehere06/spaces file1
./maybehere06/.file3
./maybehere06/.file2
./maybehere06/.file1
./maybehere06/spaces file3
./maybehere06/-file2
./maybehere06/-file1
./maybehere14
./maybehere14/spaces file2
./maybehere14/-file3
./maybehere14/spaces file1
./maybehere14/.file3
./maybehere14/.file2
./maybehere14/.file1
./maybehere14/spaces file3
./maybehere14/-file2
./maybehere14/-file1
./maybehere01
./maybehere01/spaces file2
./maybehere01/-file3
./maybehere01/spaces file1
./maybehere01/.file3
./maybehere01/.file2
./maybehere01/.file1
./maybehere01/spaces file3
./maybehere01/-file2
./maybehere01/-file1
./maybehere00
./maybehere00/spaces file2
./maybehere00/-file3
./maybehere00/spaces file1
./maybehere00/.file3
./maybehere00/.file2
./maybehere00/.file1
./maybehere00/spaces file3
./maybehere00/-file2
./maybehere00/-file1
./maybehere18
./maybehere18/spaces file2
./maybehere18/-file3
./maybehere18/spaces file1
./maybehere18/.file3
./maybehere18/.file2
./maybehere18/.file1
./maybehere18/spaces file3
./maybehere18/-file2
./maybehere18/-file1
./maybehere04
./maybehere04/spaces file2
./maybehere04/-file3
./maybehere04/spaces file1
./maybehere04/.file3
./maybehere04/.file2
./maybehere04/.file1
./maybehere04/spaces file3
./maybehere04/-file2
./maybehere04/-file1
./maybehere16
./maybehere16/spaces file2
./maybehere16/-file3
./maybehere16/spaces file1
./maybehere16/.file3
./maybehere16/.file2
./maybehere16/.file1
./maybehere16/spaces file3
./maybehere16/-file2
./maybehere16/-file1
./maybehere09
./maybehere09/spaces file2
./maybehere09/-file3
./maybehere09/spaces file1
./maybehere09/.file3
./maybehere09/.file2
./maybehere09/.file1
./maybehere09/spaces file3
./maybehere09/-file2
./maybehere09/-file1
bandit5@bandit:~/inhere$ ls -la
total 88
drwxr-x--- 22 root bandit5 4096 Jun 24 14:59 .
drwxr-xr-x  3 root root    4096 Jun 24 14:59 ..
drwxr-x---  2 root bandit5 4096 Jun 24 14:59 maybehere00
drwxr-x---  2 root bandit5 4096 Jun 24 14:59 maybehere01
drwxr-x---  2 root bandit5 4096 Jun 24 14:59 maybehere02
drwxr-x---  2 root bandit5 4096 Jun 24 14:59 maybehere03
drwxr-x---  2 root bandit5 4096 Jun 24 14:59 maybehere04
drwxr-x---  2 root bandit5 4096 Jun 24 14:59 maybehere05
drwxr-x---  2 root bandit5 4096 Jun 24 14:59 maybehere06
drwxr-x---  2 root bandit5 4096 Jun 24 14:59 maybehere07
drwxr-x---  2 root bandit5 4096 Jun 24 14:59 maybehere08
drwxr-x---  2 root bandit5 4096 Jun 24 14:59 maybehere09
drwxr-x---  2 root bandit5 4096 Jun 24 14:59 maybehere10
drwxr-x---  2 root bandit5 4096 Jun 24 14:59 maybehere11
drwxr-x---  2 root bandit5 4096 Jun 24 14:59 maybehere12
drwxr-x---  2 root bandit5 4096 Jun 24 14:59 maybehere13
drwxr-x---  2 root bandit5 4096 Jun 24 14:59 maybehere14
drwxr-x---  2 root bandit5 4096 Jun 24 14:59 maybehere15
drwxr-x---  2 root bandit5 4096 Jun 24 14:59 maybehere16
drwxr-x---  2 root bandit5 4096 Jun 24 14:59 maybehere17
drwxr-x---  2 root bandit5 4096 Jun 24 14:59 maybehere18
drwxr-x---  2 root bandit5 4096 Jun 24 14:59 maybehere19
bandit5@bandit:~/inhere$
bandit5@bandit:~/inhere$ find | file -f -
.:                          directory
./maybehere11:              directory
./maybehere11/spaces file2: ASCII text, with very long lines (502)
./maybehere11/-file3:       data
./maybehere11/spaces file1: ASCII text, with very long lines (3146)
./maybehere11/.file3:       data
./maybehere11/.file2:       ASCII text, with very long lines (2500)
./maybehere11/.file1:       ASCII text, with very long lines (451)
./maybehere11/spaces file3: data
./maybehere11/-file2:       ASCII text, with very long lines (4558)
./maybehere11/-file1:       ASCII text, with very long lines (1210)
./maybehere08:              directory
./maybehere08/spaces file2: ASCII text, with very long lines (3692)
./maybehere08/-file3:       data
./maybehere08/spaces file1: ASCII text
./maybehere08/.file3:       data
./maybehere08/.file2:       ASCII text, with very long lines (746)
./maybehere08/.file1:       ASCII text, with very long lines (8168)
./maybehere08/spaces file3: data
./maybehere08/-file2:       ASCII text, with very long lines (3824)
./maybehere08/-file1:       ASCII text, with very long lines (1076)
./maybehere19:              directory
./maybehere19/spaces file2: ASCII text, with very long lines (8784)
./maybehere19/-file3:       data
./maybehere19/spaces file1: ASCII text, with very long lines (7185)
./maybehere19/.file3:       Dyalog APL version -115.21
./maybehere19/.file2:       ASCII text, with very long lines (4739)
./maybehere19/.file1:       ASCII text, with very long lines (7208)
./maybehere19/spaces file3: data
./maybehere19/-file2:       ASCII text, with very long lines (5593)
./maybehere19/-file1:       ASCII text, with very long lines (6301)
./maybehere17:              directory
./maybehere17/spaces file2: ASCII text, with very long lines (3386)
./maybehere17/-file3:       data
./maybehere17/spaces file1: ASCII text, with very long lines (8360)
./maybehere17/.file3:       data
./maybehere17/.file2:       ASCII text, with very long lines (8340)
./maybehere17/.file1:       ASCII text, with very long lines (894)
./maybehere17/spaces file3: data
./maybehere17/-file2:       ASCII text, with very long lines (1790)
./maybehere17/-file1:       ASCII text, with very long lines (1132)
./maybehere12:              directory
./maybehere12/spaces file2: ASCII text, with very long lines (2459)
./maybehere12/-file3:       data
./maybehere12/spaces file1: ASCII text, with very long lines (2156)
./maybehere12/.file3:       data
./maybehere12/.file2:       ASCII text, with very long lines (8243)
./maybehere12/.file1:       ASCII text, with very long lines (5814)
./maybehere12/spaces file3: data
./maybehere12/-file2:       ASCII text
./maybehere12/-file1:       ASCII text, with very long lines (9677)
./maybehere10:              directory
./maybehere10/spaces file2: ASCII text, with very long lines (3569)
./maybehere10/-file3:       data
./maybehere10/spaces file1: ASCII text, with very long lines (8268)
./maybehere10/.file3:       data
./maybehere10/.file2:       ASCII text
./maybehere10/.file1:       ASCII text, with very long lines (7091)
./maybehere10/spaces file3: data
./maybehere10/-file2:       ASCII text, with very long lines (1990)
./maybehere10/-file1:       ASCII text, with very long lines (1051)
./maybehere05:              directory
./maybehere05/spaces file2: ASCII text, with very long lines (2419)
./maybehere05/-file3:       OpenPGP Public Key
./maybehere05/spaces file1: ASCII text, with very long lines (879)
./maybehere05/.file3:       data
./maybehere05/.file2:       ASCII text, with very long lines (5916)
./maybehere05/.file1:       ASCII text, with very long lines (3200)
./maybehere05/spaces file3: data
./maybehere05/-file2:       ASCII text, with very long lines (5958)
./maybehere05/-file1:       ASCII text, with very long lines (2345)
./maybehere03:              directory
./maybehere03/spaces file2: ASCII text, with very long lines (3384)
./maybehere03/-file3:       data
./maybehere03/spaces file1: ASCII text, with very long lines (2189)
./maybehere03/.file3:       data
./maybehere03/.file2:       ASCII text, with very long lines (8879)
./maybehere03/.file1:       ASCII text, with very long lines (9768)
./maybehere03/spaces file3: data
./maybehere03/-file2:       ASCII text, with very long lines (6594)
./maybehere03/-file1:       ASCII text, with very long lines (314)
./maybehere13:              directory
./maybehere13/spaces file2: ASCII text, with very long lines (951)
./maybehere13/-file3:       data
./maybehere13/spaces file1: ASCII text, with very long lines (3951)
./maybehere13/.file3:       data
./maybehere13/.file2:       ASCII text, with very long lines (8951)
./maybehere13/.file1:       ASCII text, with very long lines (5257)
./maybehere13/spaces file3: data
./maybehere13/-file2:       ASCII text, with very long lines (1422)
./maybehere13/-file1:       ASCII text, with very long lines (1358)
./maybehere07:              directory
./maybehere07/spaces file2: ASCII text, with very long lines (9063)
./maybehere07/-file3:       data
./maybehere07/spaces file1: ASCII text, with very long lines (4129)
./maybehere07/.file3:       OpenPGP Public Key
./maybehere07/.file2:       ASCII text, with very long lines (1000)
./maybehere07/.file1:       ASCII text, with very long lines (3064)
./maybehere07/spaces file3: data
./maybehere07/-file2:       ASCII text, with very long lines (2487)
./maybehere07/-file1:       ASCII text, with very long lines (3662)
./maybehere02:              directory
./maybehere02/spaces file2: ASCII text, with very long lines (8487)
./maybehere02/-file3:       data
./maybehere02/spaces file1: ASCII text, with very long lines (6745)
./maybehere02/.file3:       data
./maybehere02/.file2:       ASCII text, with very long lines (2576)
./maybehere02/.file1:       ASCII text, with very long lines (6350)
./maybehere02/spaces file3: data
./maybehere02/-file2:       X1 archive data
./maybehere02/-file1:       ASCII text, with very long lines (3800)
./maybehere15:              directory
./maybehere15/spaces file2: ASCII text
./maybehere15/-file3:       data
./maybehere15/spaces file1: ASCII text, with very long lines (1622)
./maybehere15/.file3:       data
./maybehere15/.file2:       ASCII text
./maybehere15/.file1:       ASCII text, with very long lines (2158)
./maybehere15/spaces file3: data
./maybehere15/-file2:       ASCII text, with very long lines (9498)
./maybehere15/-file1:       ASCII text, with very long lines (8793)
./maybehere06:              directory
./maybehere06/spaces file2: ASCII text, with very long lines (4250)
./maybehere06/-file3:       data
./maybehere06/spaces file1: ASCII text, with very long lines (4072)
./maybehere06/.file3:       data
./maybehere06/.file2:       ASCII text, with very long lines (8975)
./maybehere06/.file1:       ASCII text, with very long lines (1270)
./maybehere06/spaces file3: data
./maybehere06/-file2:       ASCII text, with very long lines (1075)
./maybehere06/-file1:       ASCII text, with very long lines (5730)
./maybehere14:              directory
./maybehere14/spaces file2: ASCII text, with very long lines (870)
./maybehere14/-file3:       OpenPGP Secret Key
./maybehere14/spaces file1: ASCII text, with very long lines (1381)
./maybehere14/.file3:       data
./maybehere14/.file2:       ASCII text, with very long lines (1502)
./maybehere14/.file1:       ASCII text, with very long lines (3426)
./maybehere14/spaces file3: data
./maybehere14/-file2:       ASCII text, with very long lines (8350)
./maybehere14/-file1:       ASCII text, with very long lines (4281)
./maybehere01:              directory
./maybehere01/spaces file2: ASCII text, with very long lines (4542)
./maybehere01/-file3:       data
./maybehere01/spaces file1: ASCII text, with very long lines (4138)
./maybehere01/.file3:       data
./maybehere01/.file2:       ASCII text, with very long lines (3069)
./maybehere01/.file1:       Clarion Developer (v2 and above) memo data
./maybehere01/spaces file3: data
./maybehere01/-file2:       ASCII text
./maybehere01/-file1:       ASCII text, with very long lines (6027)
./maybehere00:              directory
./maybehere00/spaces file2: ASCII text, with very long lines (6849)
./maybehere00/-file3:       OpenPGP Secret Key
./maybehere00/spaces file1: ASCII text, with very long lines (6117)
./maybehere00/.file3:       data
./maybehere00/.file2:       ASCII text, with very long lines (7835)
./maybehere00/.file1:       ASCII text, with very long lines (550)
./maybehere00/spaces file3: data
./maybehere00/-file2:       ASCII text, with very long lines (9387)
./maybehere00/-file1:       ASCII text, with very long lines (1038)
./maybehere18:              directory
./maybehere18/spaces file2: ASCII text, with very long lines (6347)
./maybehere18/-file3:       data
./maybehere18/spaces file1: ASCII text, with very long lines (7333)
./maybehere18/.file3:       data
./maybehere18/.file2:       ASCII text, with very long lines (2083)
./maybehere18/.file1:       ASCII text, with very long lines (5701)
./maybehere18/spaces file3: data
./maybehere18/-file2:       ASCII text
./maybehere18/-file1:       ASCII text, with very long lines (9696)
./maybehere04:              directory
./maybehere04/spaces file2: ASCII text, with very long lines (2490)
./maybehere04/-file3:       data
./maybehere04/spaces file1: ASCII text, with very long lines (5531)
./maybehere04/.file3:       data
./maybehere04/.file2:       ASCII text, with very long lines (6143)
./maybehere04/.file1:       ASCII text, with very long lines (2439)
./maybehere04/spaces file3: data
./maybehere04/-file2:       ASCII text, with very long lines (2618)
./maybehere04/-file1:       ASCII text, with very long lines (4409)
./maybehere16:              directory
./maybehere16/spaces file2: ASCII text, with very long lines (3145)
./maybehere16/-file3:       data
./maybehere16/spaces file1: ASCII text, with very long lines (9772)
./maybehere16/.file3:       DOS executable (COM), start instruction 0x8cfa2314 44ee920f
./maybehere16/.file2:       ASCII text, with very long lines (8471)
./maybehere16/.file1:       ASCII text, with very long lines (5425)
./maybehere16/spaces file3: data
./maybehere16/-file2:       ASCII text, with very long lines (5300)
./maybehere16/-file1:       ASCII text, with very long lines (4276)
./maybehere09:              directory
./maybehere09/spaces file2: ASCII text, with very long lines (8715)
./maybehere09/-file3:       data
./maybehere09/spaces file1: ASCII text, with very long lines (5300)
./maybehere09/.file3:       data
./maybehere09/.file2:       ASCII text, with very long lines (8516)
./maybehere09/.file1:       ASCII text, with very long lines (6762)
./maybehere09/spaces file3: data
./maybehere09/-file2:       ASCII text, with very long lines (773)
./maybehere09/-file1:       ASCII text, with very long lines (3627)

bandit5@bandit:~/inhere$ find | file -f - | grep "ASCII"


./maybehere11/spaces file2: ASCII text, with very long lines (502)
./maybehere11/spaces file1: ASCII text, with very long lines (3146)
./maybehere11/.file2:       ASCII text, with very long lines (2500)
./maybehere11/.file1:       ASCII text, with very long lines (451)
./maybehere11/-file2:       ASCII text, with very long lines (4558)
./maybehere11/-file1:       ASCII text, with very long lines (1210)
./maybehere08/spaces file2: ASCII text, with very long lines (3692)
./maybehere08/spaces file1: ASCII text
./maybehere08/.file2:       ASCII text, with very long lines (746)
./maybehere08/.file1:       ASCII text, with very long lines (8168)
./maybehere08/-file2:       ASCII text, with very long lines (3824)
./maybehere08/-file1:       ASCII text, with very long lines (1076)
./maybehere19/spaces file2: ASCII text, with very long lines (8784)
./maybehere19/spaces file1: ASCII text, with very long lines (7185)
./maybehere19/.file2:       ASCII text, with very long lines (4739)
./maybehere19/.file1:       ASCII text, with very long lines (7208)
./maybehere19/-file2:       ASCII text, with very long lines (5593)
./maybehere19/-file1:       ASCII text, with very long lines (6301)
./maybehere17/spaces file2: ASCII text, with very long lines (3386)
./maybehere17/spaces file1: ASCII text, with very long lines (8360)
./maybehere17/.file2:       ASCII text, with very long lines (8340)
./maybehere17/.file1:       ASCII text, with very long lines (894)
./maybehere17/-file2:       ASCII text, with very long lines (1790)
./maybehere17/-file1:       ASCII text, with very long lines (1132)
./maybehere12/spaces file2: ASCII text, with very long lines (2459)
./maybehere12/spaces file1: ASCII text, with very long lines (2156)
./maybehere12/.file2:       ASCII text, with very long lines (8243)
./maybehere12/.file1:       ASCII text, with very long lines (5814)
./maybehere12/-file2:       ASCII text
./maybehere12/-file1:       ASCII text, with very long lines (9677)
./maybehere10/spaces file2: ASCII text, with very long lines (3569)
./maybehere10/spaces file1: ASCII text, with very long lines (8268)
./maybehere10/.file2:       ASCII text
./maybehere10/.file1:       ASCII text, with very long lines (7091)
./maybehere10/-file2:       ASCII text, with very long lines (1990)
./maybehere10/-file1:       ASCII text, with very long lines (1051)
./maybehere05/spaces file2: ASCII text, with very long lines (2419)
./maybehere05/spaces file1: ASCII text, with very long lines (879)
./maybehere05/.file2:       ASCII text, with very long lines (5916)
./maybehere05/.file1:       ASCII text, with very long lines (3200)
./maybehere05/-file2:       ASCII text, with very long lines (5958)
./maybehere05/-file1:       ASCII text, with very long lines (2345)
./maybehere03/spaces file2: ASCII text, with very long lines (3384)
./maybehere03/spaces file1: ASCII text, with very long lines (2189)
./maybehere03/.file2:       ASCII text, with very long lines (8879)
./maybehere03/.file1:       ASCII text, with very long lines (9768)
./maybehere03/-file2:       ASCII text, with very long lines (6594)
./maybehere03/-file1:       ASCII text, with very long lines (314)
./maybehere13/spaces file2: ASCII text, with very long lines (951)
./maybehere13/spaces file1: ASCII text, with very long lines (3951)
./maybehere13/.file2:       ASCII text, with very long lines (8951)
./maybehere13/.file1:       ASCII text, with very long lines (5257)
./maybehere13/-file2:       ASCII text, with very long lines (1422)
./maybehere13/-file1:       ASCII text, with very long lines (1358)
./maybehere07/spaces file2: ASCII text, with very long lines (9063)
./maybehere07/spaces file1: ASCII text, with very long lines (4129)
./maybehere07/.file2:       ASCII text, with very long lines (1000)
./maybehere07/.file1:       ASCII text, with very long lines (3064)
./maybehere07/-file2:       ASCII text, with very long lines (2487)
./maybehere07/-file1:       ASCII text, with very long lines (3662)
./maybehere02/spaces file2: ASCII text, with very long lines (8487)
./maybehere02/spaces file1: ASCII text, with very long lines (6745)
./maybehere02/.file2:       ASCII text, with very long lines (2576)
./maybehere02/.file1:       ASCII text, with very long lines (6350)
./maybehere02/-file1:       ASCII text, with very long lines (3800)
./maybehere15/spaces file2: ASCII text
./maybehere15/spaces file1: ASCII text, with very long lines (1622)
./maybehere15/.file2:       ASCII text
./maybehere15/.file1:       ASCII text, with very long lines (2158)
./maybehere15/-file2:       ASCII text, with very long lines (9498)
./maybehere15/-file1:       ASCII text, with very long lines (8793)
./maybehere06/spaces file2: ASCII text, with very long lines (4250)
./maybehere06/spaces file1: ASCII text, with very long lines (4072)
./maybehere06/.file2:       ASCII text, with very long lines (8975)
./maybehere06/.file1:       ASCII text, with very long lines (1270)
./maybehere06/-file2:       ASCII text, with very long lines (1075)
./maybehere06/-file1:       ASCII text, with very long lines (5730)
./maybehere14/spaces file2: ASCII text, with very long lines (870)
./maybehere14/spaces file1: ASCII text, with very long lines (1381)
./maybehere14/.file2:       ASCII text, with very long lines (1502)
./maybehere14/.file1:       ASCII text, with very long lines (3426)
./maybehere14/-file2:       ASCII text, with very long lines (8350)
./maybehere14/-file1:       ASCII text, with very long lines (4281)
./maybehere01/spaces file2: ASCII text, with very long lines (4542)
./maybehere01/spaces file1: ASCII text, with very long lines (4138)
./maybehere01/.file2:       ASCII text, with very long lines (3069)
./maybehere01/-file2:       ASCII text
./maybehere01/-file1:       ASCII text, with very long lines (6027)
./maybehere00/spaces file2: ASCII text, with very long lines (6849)
./maybehere00/spaces file1: ASCII text, with very long lines (6117)
./maybehere00/.file2:       ASCII text, with very long lines (7835)
./maybehere00/.file1:       ASCII text, with very long lines (550)
./maybehere00/-file2:       ASCII text, with very long lines (9387)
./maybehere00/-file1:       ASCII text, with very long lines (1038)
./maybehere18/spaces file2: ASCII text, with very long lines (6347)
./maybehere18/spaces file1: ASCII text, with very long lines (7333)
./maybehere18/.file2:       ASCII text, with very long lines (2083)
./maybehere18/.file1:       ASCII text, with very long lines (5701)
./maybehere18/-file2:       ASCII text
./maybehere18/-file1:       ASCII text, with very long lines (9696)
./maybehere04/spaces file2: ASCII text, with very long lines (2490)
./maybehere04/spaces file1: ASCII text, with very long lines (5531)
./maybehere04/.file2:       ASCII text, with very long lines (6143)
./maybehere04/.file1:       ASCII text, with very long lines (2439)
./maybehere04/-file2:       ASCII text, with very long lines (2618)
./maybehere04/-file1:       ASCII text, with very long lines (4409)
./maybehere16/spaces file2: ASCII text, with very long lines (3145)
./maybehere16/spaces file1: ASCII text, with very long lines (9772)
./maybehere16/.file2:       ASCII text, with very long lines (8471)
./maybehere16/.file1:       ASCII text, with very long lines (5425)
./maybehere16/-file2:       ASCII text, with very long lines (5300)
./maybehere16/-file1:       ASCII text, with very long lines (4276)
./maybehere09/spaces file2: ASCII text, with very long lines (8715)
./maybehere09/spaces file1: ASCII text, with very long lines (5300)
./maybehere09/.file2:       ASCII text, with very long lines (8516)
./maybehere09/.file1:       ASCII text, with very long lines (6762)
./maybehere09/-file2:       ASCII text, with very long lines (773)
./maybehere09/-file1:       ASCII text, with very long lines (3627)
bandit5@bandit:~/inhere$ find . -type f -print0 | xargs -0 file | grep "ASCII" | cut -d ":" -f 1 | tr '\n' '\0' | xargs -0 ls -l | grep -v -e "-rwx" -e "-x" 
-rw-r----- 1 root bandit5 9388 Jun 24 14:59 ./maybehere00/-file2
-rw-r----- 1 root bandit5 7836 Jun 24 14:59 ./maybehere00/.file2
-rw-r----- 1 root bandit5 6850 Jun 24 14:59 ./maybehere00/spaces file2
-rw-r----- 1 root bandit5  288 Jun 24 14:59 ./maybehere01/-file2
-rw-r----- 1 root bandit5 3070 Jun 24 14:59 ./maybehere01/.file2
-rw-r----- 1 root bandit5 4543 Jun 24 14:59 ./maybehere01/spaces file2
-rw-r----- 1 root bandit5 2577 Jun 24 14:59 ./maybehere02/.file2
-rw-r----- 1 root bandit5 8488 Jun 24 14:59 ./maybehere02/spaces file2
-rw-r----- 1 root bandit5 6595 Jun 24 14:59 ./maybehere03/-file2
-rw-r----- 1 root bandit5 8880 Jun 24 14:59 ./maybehere03/.file2
-rw-r----- 1 root bandit5 3385 Jun 24 14:59 ./maybehere03/spaces file2
-rw-r----- 1 root bandit5 2619 Jun 24 14:59 ./maybehere04/-file2
-rw-r----- 1 root bandit5 6144 Jun 24 14:59 ./maybehere04/.file2
-rw-r----- 1 root bandit5 2491 Jun 24 14:59 ./maybehere04/spaces file2
-rw-r----- 1 root bandit5 5959 Jun 24 14:59 ./maybehere05/-file2
-rw-r----- 1 root bandit5 5917 Jun 24 14:59 ./maybehere05/.file2
-rw-r----- 1 root bandit5 2420 Jun 24 14:59 ./maybehere05/spaces file2
-rw-r----- 1 root bandit5 1076 Jun 24 14:59 ./maybehere06/-file2
-rw-r----- 1 root bandit5 8976 Jun 24 14:59 ./maybehere06/.file2
-rw-r----- 1 root bandit5 4251 Jun 24 14:59 ./maybehere06/spaces file2
-rw-r----- 1 root bandit5 2488 Jun 24 14:59 ./maybehere07/-file2
-rw-r----- 1 root bandit5 1033 Jun 24 14:59 ./maybehere07/.file2
-rw-r----- 1 root bandit5 9064 Jun 24 14:59 ./maybehere07/spaces file2
-rw-r----- 1 root bandit5 3825 Jun 24 14:59 ./maybehere08/-file2
-rw-r----- 1 root bandit5  747 Jun 24 14:59 ./maybehere08/.file2
-rw-r----- 1 root bandit5 3693 Jun 24 14:59 ./maybehere08/spaces file2
-rw-r----- 1 root bandit5  774 Jun 24 14:59 ./maybehere09/-file2
-rw-r----- 1 root bandit5 8517 Jun 24 14:59 ./maybehere09/.file2
-rw-r----- 1 root bandit5 8716 Jun 24 14:59 ./maybehere09/spaces file2
-rw-r----- 1 root bandit5 1991 Jun 24 14:59 ./maybehere10/-file2
-rw-r----- 1 root bandit5   99 Jun 24 14:59 ./maybehere10/.file2
-rw-r----- 1 root bandit5 3570 Jun 24 14:59 ./maybehere10/spaces file2
-rw-r----- 1 root bandit5 4559 Jun 24 14:59 ./maybehere11/-file2
-rw-r----- 1 root bandit5 2501 Jun 24 14:59 ./maybehere11/.file2
-rw-r----- 1 root bandit5  503 Jun 24 14:59 ./maybehere11/spaces file2
-rw-r----- 1 root bandit5  251 Jun 24 14:59 ./maybehere12/-file2
-rw-r----- 1 root bandit5 8244 Jun 24 14:59 ./maybehere12/.file2
-rw-r----- 1 root bandit5 2460 Jun 24 14:59 ./maybehere12/spaces file2
-rw-r----- 1 root bandit5 1423 Jun 24 14:59 ./maybehere13/-file2
-rw-r----- 1 root bandit5 8952 Jun 24 14:59 ./maybehere13/.file2
-rw-r----- 1 root bandit5  952 Jun 24 14:59 ./maybehere13/spaces file2
-rw-r----- 1 root bandit5 8351 Jun 24 14:59 ./maybehere14/-file2
-rw-r----- 1 root bandit5 1503 Jun 24 14:59 ./maybehere14/.file2
-rw-r----- 1 root bandit5  871 Jun 24 14:59 ./maybehere14/spaces file2
-rw-r----- 1 root bandit5 9499 Jun 24 14:59 ./maybehere15/-file2
-rw-r----- 1 root bandit5  279 Jun 24 14:59 ./maybehere15/.file2
-rw-r----- 1 root bandit5   51 Jun 24 14:59 ./maybehere15/spaces file2
-rw-r----- 1 root bandit5 5301 Jun 24 14:59 ./maybehere16/-file2
-rw-r----- 1 root bandit5 8472 Jun 24 14:59 ./maybehere16/.file2
-rw-r----- 1 root bandit5 3146 Jun 24 14:59 ./maybehere16/spaces file2
-rw-r----- 1 root bandit5 1791 Jun 24 14:59 ./maybehere17/-file2
-rw-r----- 1 root bandit5 8341 Jun 24 14:59 ./maybehere17/.file2
-rw-r----- 1 root bandit5 3387 Jun 24 14:59 ./maybehere17/spaces file2
-rw-r----- 1 root bandit5   77 Jun 24 14:59 ./maybehere18/-file2
-rw-r----- 1 root bandit5 2084 Jun 24 14:59 ./maybehere18/.file2
-rw-r----- 1 root bandit5 6348 Jun 24 14:59 ./maybehere18/spaces file2
-rw-r----- 1 root bandit5 5594 Jun 24 14:59 ./maybehere19/-file2
-rw-r----- 1 root bandit5 4740 Jun 24 14:59 ./maybehere19/.file2
-rw-r----- 1 root bandit5 8785 Jun 24 14:59 ./maybehere19/spaces file2

bandit5@bandit:~/inhere$ cat ./maybehere15/spaces file2
cat: ./maybehere15/spaces: No such file or directory
cat: file2: No such file or directory
bandit5@bandit:~/inhere$ cat ./maybehere15/spaces\ file2
Q2z7VXYuHnMJ11Ks9drvakV3s0pADkcPDQl1TlRMMdSzzHJQzX
bandit5@bandit:~/inhere$ du ./maybehere15/spaces\ file2
4	./maybehere15/spaces file2
bandit5@bandit:~/inhere$ du -b ./maybehere15/spaces\ file2
51	./maybehere15/spaces file2
bandit5@bandit:~/inhere$ find . -type f -print0 | xargs -0 file | grep "ASCII" | cut -d ":" -f 1 | tr '\n' '\0' | xargs -0 ls -l | grep -v -e "-rwx" -e "-x" "1033"
grep: 1033: No such file or directory
xargs: ls: terminated by signal 13
bandit5@bandit:~/inhere$ find . -type f -print0 | xargs -0 file | grep "ASCII" | cut -d ":" -f 1 | tr '\n' '\0' | xargs -0 ls -l | grep -v -e "-rwx" -e "-x" |grep"1033"
grep1033: command not found
bandit5@bandit:~/inhere$ find . -type f -print0 | xargs -0 file | grep "ASCII" | cut -d ":" -f 1 | tr '\n' '\0' | xargs -0 ls -l | grep -v -e "-rwx" -e "-x" |grep "1033"
-rw-r----- 1 root bandit5 1033 Jun 24 14:59 ./maybehere07/.file2
bandit5@bandit:~/inhere$ cat ./maybehere07/.file2
pXa26xhMWaC2SvDotA4r9EgZkulOeSBW
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        bandit5@bandit:~/inhere$ cat ./maybehere07/.file2
pXa26xhMWaC2SvDotA4r9EgZkulOeSBW
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        bandit5@bandit:~/inhere$ exit
logout
Connection to bandit.labs.overthewire.org closed.

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
| ls -l | lists the contesnts of the current folder in a list format along with useful info |
| cat |  command used to read and display the contents of one or more files. |
|     |It can also concatenate multiple files and write the combined output to standard output. |
|  .file2 | the file containing the password |
| cd | a useful command used to navigate inside of terminal and pronounced cd and stands for change directory |
| file | A useful command used to find what type the file is |
| find | Another useful command used to list all the files from the current directory . it only goes down in hierarchy |
| xargs | a command that used to pass stdin to other commands |
| tr | used to translate or delete characters |
| grep | global regular expression , a command that grabs the lines that have the pattern you specified |
| grep -v -e | this sequence is used to omit or exclude the lines with the pattern you specify |
---

## Solution Walkthrough
    First i logged into the remote host by using the password i acquired in the previous level .
    after i logged in first i started off with using the command `find` to list the files in the 
    current dir as well as the subfolders. i was shocked because there was literally lots of files
    i couldn't even count . Next i started to how think about how to solve this level .becuase i genuinely
    felt this level is lot harder than the previos levels .But i have the idea in my mind about how
    to solve this level but i am not yet familiar with the commands required to solve using my idea .
    i was given a information that is the file is humand readable , 1033 bytes in size and its not executable .
    first i thought i could solve this level by finding the files which are can be readable by humans by using
    the comamnd file .so used find to list the files and piped that output to file command to see which files
    are ASCII text which means humans can read it . next i wanted find or list the files which or not executable +
    human readble .after a long time of trying our and googling and reading man pages . i came up with the sequence of
    commands which could achieve my idea . now the list is very short so tought about manually cat ing each file
    to find the flag but suddenly i remembered something that is the file is 1033 bytes and ls -l command also 
    gives us the file size in byte so why can't use grep again to grab the lines that contains '1033' pattern .
    and that is how i finally solved this problem . This took lot of time but i learned new things . and i know
    there are better ways . but this is what i came up with so i am proud of it .

---

## Alternative solution
 
    instead of spending lot of hours tring to learn new commands and their usages i could have done the samething in less time.. like
    first i could used the command `find . -type f` to list and know which dir contains files and i could have cd into each directory and used
    ls -l to list the files along with some useful information . we can solve one piece of the puzzle by using ls -l because it shows the file
    size in bytes and the platform have also mentioned that the file we are looking for is 1033 bytes in size .but we would have solved only one
    piece of the puzzle after severl typings of cd and ls into directories . next we need find is it executable or not and human readable or not .
    again we could use the ls to find whether it is executable or not or you could do this step in the first ls step too . next you could have
    used file command to find it is human readable or not or you could cat the file to find it is human readable or not .
---

## What I Learned
 * I learned the commands tr , grep , cut , xargs and their usages .
 * I learned how to read and understand the ouput of ls -la because it outputs something like rwx .

---

## References
 * website - https://overthewire.org/wargames/bandit/bandit6.html

---

## Linux Concepts Learned
 * File permissions
 * pipe
 * xargs

## New Concepts
 * File permissions - r w x.
 * pipe
 * xargs
---

## Notes
 * Hostname - bandit.labs.overthewire.org
 * username - bandit5
 
## Lesson Learned
 * Never feel shame to google about the things you don't know .
 * Never feel shame to learn from others eventhough they don't have enough experience or exposure like you have .
