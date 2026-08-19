---
Platform: OverTheWire 
Game: Bandit
Level: 18
Date: 2026-08-19
Difficulty: Beginner
Topics:
  - SSH
  - Linux
  - Shell
  - ctf
---
# Challenge
    There are 2 files in the homedirectory: passwords.old and passwords.new. The password for the next level is in passwords.new and is the 
    only line that has been changed between passwords.old and passwords.new

    NOTE: if you have solved this level and see ‘Byebye!’ when trying to log into bandit18, this is related to the next level, bandit19

## Platform
  
  * OverTheWire

## Level
 
  * level17 => Level18

## Difficulty
 
  * bandit - biginner
---

## Objective
   
  * Acquire the password required for next level .

---
## Tools Used
 
  * SSH
  * Terminal
  * diff
  * ls

---
## Commands Used

<details>
<summary> commands used : chmod 700 LEVEL17KEY.SSH , 
ssh -p 2220 -i LEVEL17KEY.SSH bandit17@bandit.labs.overthewire.org </summary>
</details>
 
  * Before logging in using the private key acquired in the previous level i first need the file containing the private key to be
    read only by me . The reason for that is because if anyone can read or write to that file they can access the remote host or
    make us not be able to connect to remote host .so that is why ssh want the private key to be read only by the us.
  * Afterwards , I logged into the remote host by specifying the file and the port for this level .

<details>
<summary> Terminal output : diff passwords.new passwords.old , cat /etc/bandit_pass/bandit17 </summary>

```bash
bandit17@bandit:~$ ls
passwords.new  passwords.old
bandit17@bandit:~$ diff passwords.old passwords.new
42c42
< icUh23IUytZLIYhcCaXL18agiSIqymBc
---
> OQxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
bandit17@bandit:~$ cat /etc/bandit_pass/bandit17
pWXxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
```
</details>

  * I First Ran the command `ls` to find the files they mentioned to be on the home dir .and The files required for this level is present 
    in the home dir as they mentioned .

  * They mentioned that the line differ between the files `passwords.new` and `passwords.old` is our password for next level .
    They have also mentioned that the `passwords.new` is the file that contains the password . so i used the command `diff`
    to find the line that differs between those two files . so , how do i know that i should use diff to find the password
    . I used diff because of my inituition said that might be the command i need to solve this level . I also read the
    man pages of diff to learn about its usages and i learned that the command diff compares files line by line and prints
    the lines thats different in those lines .


| COMMANDS | USAGE |
|----------|-------| 
| diff | A utility used to compare files line by line |
| | we can compare multiple files using this command |
---

## References

 * website - https://overthewire.org/wargames/bandit/bandit18.html

---

## Notes

 * Username - bandit17
   Hostname - bandit.labs.overthewire.org 

