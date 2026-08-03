---
Platform: OverTheWire 
Game: Bandit
Level: 12
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
  The password for the next level is stored in the file data.txt, where all lowercase (a-z) and 
  uppercase (A-Z) letters have been rotated by 13 positions .Acquire the password for the next
  level .

## Platform

 * OverTheWire

## Level
 * bandit11 => bandit12

## Difficulty
 * bandit - beginner 

---

## Objective
 * Acquire the password for the next level .

---

## Skills Practiced
 * SSh
 * Terminal
 * Linux commands

---

## Tools Used
  * SSH
  * Terminal
  * commands - ls , tr 

---

## Commands Used
<details>
<summary> Terminal ouput : ./next_lvl.sh </summary>

```bash
❯ ./next_lvl.sh bandit11
                         _                     _ _ _
                        | |__   __ _ _ __   __| (_) |_
                        | '_ \ / _` | '_ \ / _` | | __|
                        | |_) | (_| | | | | (_| | | |_
                        |_.__/ \__,_|_| |_|\__,_|_|\__|


                      This is an OverTheWire game server.
            More information on http://www.overthewire.org/wargames

backend: gibson-1
bandit11@bandit.labs.overthewire.org's password:
```
</details>

  * First I logged into the bandit level 12 using the password i aquired in the previous level .

<details>
<summary> Terminal output : ls -la </summary>

```bash
bandit11@bandit:~$ ls -la
total 24
drwxr-xr-x   2 root     root     4096 Jun 24 14:58 .
drwxr-xr-x 150 root     root     4096 Jun 24 15:02 ..
-rw-r--r--   1 root     root      220 Feb 13 12:16 .bash_logout
-rw-r--r--   1 root     root     3851 Jun 24 14:50 .bashrc
-rw-r--r--   1 root     root      807 Feb 13 12:16 .profile
-rw-r-----   1 bandit12 bandit11   49 Jun 24 14:58 data.txt
bandit11@bandit:~$

```
<details>
 
  * Then i used the command `ls` with `-la` flag to list the contents of the current dir along with some useful information.

<details>
<summary> Terminal Output : cat data.txt </summary>

```bash
bandit11@bandit:~$ cat data.txt
Gur cnffjbeq vf TEBbmJCB8DlA0zTewHxVQ0JPLxMvDkeA
bandit11@bandit:~$ touch newscript.sh
touch: cannot touch 'newscript.sh': Permission denied
bandit11@bandit:~$
```
</details>
  
  * I used the command `cat` to display the contents of the file `data.txt` . I noticed the pattern in the output of `data.txt` .
    I mean the first field is 3 charater long , 2 is 8 character long , 3 is 2 character long .which corresponds to the lengths of
    the words `The , password , is `. And in the challenge they mentioned that capital and small letters were rotated 13 positions .
    And i had a intuition that from G (the first letter of the first field) the T would be 13 positions apart . to check i took out
    my notebook and started writing alphabets in capital . then i started counting 13 positions from G to see where i land and if i
    ran out of characters then i would count from the start like if i am counting from X the Z would be 3 then A would be 4.I started 
    on G like G is 1 , H is 2 ... but i landed on `S` which is not our expectation then i leave out the G and started from `H` as 1 
    This time i landed on `T`. I checked with several the other charaters to see the if the pattern holds or not and it holds . 
    Now i know the pattern but i don't know which tool to use to rotate back the characters . so i started reading the reference they
    gave me on this challenge which is `13rot wikipedia` . In that site they used the command `tr` to rotate the character or i should
    say map the characters .before i went to the wiki i tought about writing a script which could rotate the characters but 
    the permission was denied .

<details>
<summary> Terminal Output : tr "A-MN-Za-mn-z" "N-ZN-Mn-za-m" </summary>

```bash
bandit11@bandit:~$ tr "A-MN-Za-mn-z" "N-ZA-Mn-za-m" < data.txt
The password is GROozWPO8QyN0mGrjUkID0WCYkZiQxrN
bandit11@bandit:~$
```
</details>

  * I used the command `tr` since i learned that the tr can be used for this purpose on the wiki website  .
    i gave it a three fields as a input . first two which are strings takes care of rotating the characters or mapping the
    character . the first set in string1 which is A-M is mapped to the first set of string2 which is N-Z and so on .
    so this is how i solved this level . and i copied the password to my local machine for the next level and then i exited using
    the command `exit`.

| commands | usage |
|----------|-------|
| tr | command used to translate or delete the characters |
|  "A-MN-Za-mn-z" "N-ZA-Mn-za-m" | These are the strings used for mapping the characters |
| < | redirecting the contents of data.txt to the stdin of tr |
| data.txt | the file containing the password |
---

## What I Learned
 * I learned new things and a new command . A different way of looking at things .

---

## References
  * website - https://overthewire.org/wargames/bandit/bandit12.html,
              https://en.wikipedia.org/wiki/ROT13

---

## New Concepts
  * Rot13

---

## Notes
  * username : bandit11
  * hostname : bandit.labs.overthewire.org

