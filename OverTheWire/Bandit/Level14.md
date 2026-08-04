---
Platform: OverTheWire 
Game: Bandit
Level: 14
Date: 2026-08-04
Difficulty: Beginner
Topics:
  - SSH
  - Linux
  - scp , ssh-rsa keys .
  - cat
  - Shell
  - ctf
---

# Challenge
The password for the next level is stored in /etc/bandit_pass/bandit14 and can only be 
read by user bandit14. For this level, you don’t get the next password, but you get a 
private SSH key that can be used to log into the next level. Look at the commands that
logged you into previous bandit levels, and find out how to use the key for this level.
If you need help with this level: a hint file can be found in the home directory.
Make sure to read the error messages as they are informative . Learn how to use ssh keys .

## Platform
 * OverTheWire

## Level
 * bandit13 => bandit14

## Difficulty
 * bandit - beginner .

---

## Objective
 * Learn how to use scp (secure shell copy) to transfer files in ssh .
 * And also acquire the password that is only read by bandit14 in the dir "/ect/bandit_pass/bandit14"

---

## Skills Practiced
 * SSH 
 * Terminal
 * Tmux , Nvim .
 * Linux commands .

---

## Tools Used
 * SSH
 * Terminal
 * Tmux , Nvim 
 * commands - ls , cat 
 * scp 

---

## Commands Used
<details>
<summary> Terminal Output : ./next_lvl.sh bandit13 </summary>

```bash
❯ ./next_lvl.sh bandit13
                         _                     _ _ _
                        | |__   __ _ _ __   __| (_) |_
                        | '_ \ / _` | '_ \ / _` | | __|
                        | |_) | (_| | | | | (_| | | |_
                        |_.__/ \__,_|_| |_|\__,_|_|\__|


                      This is an OverTheWire game server.
            More information on http://www.overthewire.org/wargames

backend: gibson-1
bandit13@bandit.labs.overthewire.org's password:
```
</details>

  * First I logged into the remote machine(bandit13) using the password i aquired in the previous level .

<details>
<summary> Terminal Output : ls -la </summary>

```bash
bandit13@bandit:~$ ls -la
total 28
drwxr-xr-x   2 root     root     4096 Jun 24 14:58 .
drwxr-xr-x 150 root     root     4096 Jun 24 15:02 ..
-rw-r--r--   1 root     root      220 Feb 13 12:16 .bash_logout
-rw-r--r--   1 root     root     3851 Jun 24 14:50 .bashrc
-rw-r--r--   1 root     root      807 Feb 13 12:16 .profile
-rw-r-----   1 bandit14 bandit13  467 Jun 24 14:58 HINT
-rw-r-----   1 bandit14 bandit13 2602 Jun 24 14:58 sshkey.private
bandit13@bandit:~$
```
</details>

 * Then i used the command `ls -la` to list the contents of the home directory .I see there is hidden files
   and files named HINT and another named sshkey.private .Those hidden files are not that useful in this case .
   so i figured that i have to do something with this sshkey.private since they mentioned that i don't get any
   password on this level .
   
<details>
<summary> Terminal Output : cat HINT sshkey.private </summary>

```bash
bandit13@bandit:~$ cat HINT sshkey.private
If you have trouble with this level, note the following:

1) As for all other levels, this level has a website with information:
   https://overthewire.org/wargames/bandit/bandit14.html
2) No, the level is not broken. To verify, see:
   https://status.overthewire.org/
3) The current version of OverTheWire prevents logging in from one
   level to another via localhost. Log out, and see 1)
4) If you get errors, read the error message on your screen.
   We mean it!
-----BEGIN OPENSSH PRIVATE KEY-----
b3BlbnNzaC1rZXktdjEAAAAABG5vbmUAAAAEbm9uZQAAAAAAAAABAAABlwAAAAdzc2gtcn
NhAAAAAwEAAQAAAYEAuCCoxSR6xDCnsm98kqan1x1JF3mfZ6kZa+BoAHetQ/91F4EKTfmE
E+Xs8yVgLhn1YL0TvyVswMzy33OeFJV/KEzef54V8yZo7jFcx+pQlOF6+BFRy+wsyLASV5
XxD/AtafdbVfLZFGTLC53kOFfT0VxokFmnTlIwRyxRJuNAWP9+fkAtbnfqkkixWqg0ZaLr
1fICYam6vb6ilmNfuiGHZyQNHeTkOKZgAaMnQW6bYlRjnkxsNNxk1pj0sT3MUQdLrPCdyh
# note i didn't put the full output here .
```
</details>

 * I wanted to know what the `HINT,sshkey.private` file contains so i used the command `cat` 
   to diplay the contents of both files .

<details>
<summary> Terminal output : cd /etc/bandit_pass </summary>

```bash
bandit13@bandit:~$ cd /etc/bandit_pass/ && cat bandit14
cat: bandit14: Permission denied
bandit13@bandit:/etc/bandit_pass$ 
bandit13@bandit:~$ cd /etc/bandit_pass/
bandit13@bandit:/etc/bandit_pass$ ls -la | grep "bandit14"
-r--------   1 bandit14 bandit14    33 Jun 24 14:58 bandit14
bandit13@bandit:/etc/bandit_pass$ chmod 740 bandit14
chmod: Operation not permitted (os error 1)
bandit13@bandit:/etc/bandit_pass$
```
</details>

 * They mentioned that the password for the next level is stored in the file `/etc/bandit_pass/bandit14`
   and is only read by bandit14 . so i used the command `cd` to change into that dir and used `cat` to
   display the contents of the file .but i got an error saying `permission denied` .so i used `chmod` to 
   make the file read by others . but i couldn't do that so i think i have to log in as a `bandit14` to read
   the file containing the password (i thought what is the use of password if i can already log into the machine ).

<details>
<summary> Terminal Output : scp -P 2220 bandit13@bandit.labs.overthewire.org:/home/bandit13/sshkey.private . </summary>

```bash
❯ scp bandit13@bandit.labs.overthewire.org:/home/bandit13/sshkey.private .

                      This is an OverTheWire game server.
            More information on http://www.overthewire.org/wargames

!!! You are trying to log into this SSH server on port 22, which is not intended.
!!! If you are trying to log in to an OverTheWire game, use the port mentioned in
!!! the "SSH Information" on that game's webpage (in the top left corner).

bandit13@bandit.labs.overthewire.org: Permission denied (publickey).
scp: Connection closed
❯ scp -P 2220 bandit13@bandit.labs.overthewire.org:/home/bandit13/sshkey.private .
                         _                     _ _ _
                        | |__   __ _ _ __   __| (_) |_
                        | '_ \ / _` | '_ \ / _` | | __|
                        | |_) | (_| | | | | (_| | | |_
                        |_.__/ \__,_|_| |_|\__,_|_|\__|


                      This is an OverTheWire game server.
            More information on http://www.overthewire.org/wargames

backend: gibson-1
bandit13@bandit.labs.overthewire.org's password:
sshkey.private                                                                                                                           100% 2602     4.2KB/s   00:00
```
</details>
  
 * First I logged out of the machine as they mentioned in the HINT file step 3 .and started reading the reference
   They have given for this level .and it was an interesting read .and after i started understanding the concepts 
   i wanted to tryout .There were lot of trials and errors so i couldn't inlucde that in here .First i tried to transer
   the files from the remote machine itself using (scp sshkey.private shadowheart@10.x.x.x:/home/shadowheart/.ssh(note .ssh 
   file exist on my machine) ) but that didn't work so i tried that from my local machine again i got an error but this time 
   it was because i am not communicating with the port that is used by the server to listen .after i specified the port on 
   which to connect to,The file was transfered from remote machine to my local machine successfully .

<details>
<summary> Terminal Output : ssh -i sshkey.private -p 2220 bandit14@bandit.labs.overthewire.org </summary>

```bash
❯ ssh -i sshkey.private -p 2220 bandit14@bandit.labs.overthewire.org
                         _                     _ _ _
                        | |__   __ _ _ __   __| (_) |_
                        | '_ \ / _` | '_ \ / _` | | __|
                        | |_) | (_| | | | | (_| | | |_
                        |_.__/ \__,_|_| |_|\__,_|_|\__|


                      This is an OverTheWire game server.
            More information on http://www.overthewire.org/wargames

backend: gibson-0
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@         WARNING: UNPROTECTED PRIVATE KEY FILE!          @
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
Permissions 0640 for 'sshkey.private' are too open.
It is required that your private key files are NOT accessible by others.
This private key will be ignored.
Load key "sshkey.private": bad permissions
bandit14@bandit.labs.overthewire.org's password:

❯ sudo chmod 700 sshkey.private
[sudo] password for shadowheart:
❯ ssh -i sshkey.private -p 2220 bandit14@bandit.labs.overthewire.org
                         _                     _ _ _
                        | |__   __ _ _ __   __| (_) |_
                        | '_ \ / _` | '_ \ / _` | | __|
                        | |_) | (_| | | | | (_| | | |_
                        |_.__/ \__,_|_| |_|\__,_|_|\__|


                      This is an OverTheWire game server.
            More information on http://www.overthewire.org/wargames

backend: gibson-0

      ,----..            ,----,          .---.
 
  For more information regarding individual wargames, visit
  http://www.overthewire.org/wargames/

  For support, questions or comments, contact us on discord or IRC.

  Enjoy your stay!

bandit14@bandit:~$
bandit14@bandit:~$ cd /etc/bandit_pass/
bandit14@bandit:/etc/bandit_pass$ cat bandit14
aaWecxxxxxxxxxxxxxxxxxxxxxxxxxxx
bandit14@bandit:/etc/bandit_pass$
```
</details>

 * First I used the `sshkey.private` without changing the permissions of the file and that is why i got an error on
   my first attempt .Then i changed the permissions of the file using the command `chmod` .Tried the command 
   `ssh -i sshkey.private -p 2220 bandit14@bandit.labs.overthewire.org` once again but this time it was successfull
   because i changed the permissions and i was logged into the bandit14 .Then i changed the dir to /etc/bandit_pass
   to read the password . and i used `cat` to display the contents of the file and i copied the password to my
   local machine .and The level14 is solved now is the time to move on to next lvl i will see you there .
 
| commands | usage |
|----------|-------|
| scp | (secure shell copy )a utility used to tranfer file using ssh connection |
| -P | a option used to specify the port number for the command scp |
| -i | a option used to tell ssh which private key to use |
| bandit14 | username of the user i am trying to log in as |
| @ | a delimeter used to separate the username and the hostname |
| bandit.labs.overthewire.org | hostname of the remote machine |
| : | a delimeter used to separate the path from the hostname |
| /home/bandit14/sshkey.private | path of the file we trying to copy using scp |
| chmod | used to change the permissions of the file |
| cd | change directory |

## Alternate solution

 * I could have displayed the contents of the file `sshkey.private` using the command `cat` and copied the output 
   to my local machine but that wouldn't be a effective way if the output is too large .
---

## What I Learned
 * I learned about transfering files using ssh connection .
 * I learned about ssh keys .
 * SSH key authentication uses asymmetric cryptography. The server stores the public key, 
   while the client keeps the private key secret. During authentication, the client proves 
   possession of the private key without sending it over the network.

---

## References
 * website - https://overthewire.org/wargames/bandit/bandit14.html
             https://help.ubuntu.com/community/SSH/OpenSSH/Keys
             https://help.ubuntu.com/community/SSH/TransferFiles          

---

## New Concepts
 * Transfering files using ssh connection .
 * SSH keys , cryptographic algorithm . 

---

## Notes

 * Username : bandit13
 * hostname : bandit.labs.overthewire.org
