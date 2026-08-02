---
Platform: OverTheWire 
Game: Bandit
Level: 10
Date: 2026-08-02
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
  The password for the next level is stored in the file data.txt, which contains base64 encoded data.
  Acquire the password required for the next level .

## Platform
  * OverTheWire

## Level
  * Level10

## Difficulty
  * bandit - beginner
---

## Objective
  * Learn about the command base64 .
  * Acquire the password for the next level .

---

## Skills Practiced
  * SSH
  * Terminal 
  * Nvim and Tmux
  * patience

---

## Tools Used
  * SSH
  * Terminal
  * Nvim and Tmux

---

## Commands Used
<details>
<summary> Terminal Output : ./next_lvl.sh bandit10 </summary>

```bash
 ❯ ./next_lvl.sh bandit10
                         _                     _ _ _
                        | |__   __ _ _ __   __| (_) |_
                        | '_ \ / _` | '_ \ / _` | | __|
                        | |_) | (_| | | | | (_| | | |_
                        |_.__/ \__,_|_| |_|\__,_|_|\__|


                      This is an OverTheWire game server.
            More information on http://www.overthewire.org/wargames

backend: gibson-1
bandit10@bandit.labs.overthewire.org's password:
```
</details>
  
  * First I logged into the level bandit10 using the password i acquired in the previous level .

<details>
<summary> solution </summary>

```bash
bandit10@bandit:~$ ls
data.txt
bandit10@bandit:~$ ls -la
total 24
drwxr-xr-x   2 root     root     4096 Jun 24 14:58 .
drwxr-xr-x 150 root     root     4096 Jun 24 15:02 ..
-rw-r--r--   1 root     root      220 Feb 13 12:16 .bash_logout
-rw-r--r--   1 root     root     3851 Jun 24 14:50 .bashrc
-rw-r--r--   1 root     root      807 Feb 13 12:16 .profile
-rw-r-----   1 bandit11 bandit10   69 Jun 24 14:58 data.txt
bandit10@bandit:~$ base64 -d data.txt
The password is pYfOY6HwUsDj5rL9UvyhU7MCmv8vN5Ro
bandit10@bandit:~$ cat data.txt
VGhlIHBhc3N3b3JkIGlzIHBZZk9ZNkh3VXNEajVyTDlVdnloVTdNQ212OHZONVJvCg==
bandit10@bandit:~$
```
</details>
   
  * First i used the command `ls` to list the contents of the dir then i used it again with 
    The Flags `-la` to see if there anything that is hidden and i got nothing . Then i used the command
    `base64 -d data.txt` to decode the data in the file data.txt because the level mentioned that 
    the `data.txt` contains data that is encoded in base64 . an i found the password but i wanted to see
    what the encoded data looks like so i used cat to print the encoded data .
    Then i copied the password to my local machine and then i exited by pressing `ctrl + d`. 


| command | usage |
|---------|-------|
| base64 | A commmand line utility used to encode and decode data in base64 format |
| -d | A flag used to tell the base64 command what to do ecoding or decoding |

---

## What I Learned
   * I learned how Base64 encoding works.
   * I learned how to decode Base64 data using the `base64 -d` command.
   * I learned the difference between encoding and encryption.
---

## References
 * website - https://overthewire.org/wargames/bandit/bandit11.html
---

## New Concepts
 * Encoding and decoding .

---

## Notes
  * Username : bandit10
  * Hostname : bandit.labs.overthewire.org
