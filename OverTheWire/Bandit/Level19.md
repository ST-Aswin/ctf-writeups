---
Platform: OverTheWire 
Game: Bandit
Level: 19
Date: 2026-08-20
Difficulty: Beginner
Topics:
  - SSH
  - Linux
  - Shell
  - ctf
---
# Challenge
      The password for the next level is stored in a file readme in the homedirectory. Unfortunately, someone 
      has modified .bashrc to log you out when you log in with SSH.  

## Platform

  * OverTheWire

## Level

  * Level18 => Level19 

## Difficulty
  
  * bandit - Beginner

---

## Objective

  * Acquire the password required for next level .
  * Learn how to execute commands on remote host without login in using ssh.

---

## Tools Used

  * SSH
  * Terminal
  * cat 

---

## Commands Used
<details>
<summary> Terminal output : ./next_lvl.sh bandit18 , ssh -p 2220 bandit18@bandit.labs.overthewire.org cat -n .bashrc </summary>

```bash
❯ ./next_lvl.sh bandit18
                         _                     _ _ _
                        | |__   __ _ _ __   __| (_) |_
                        | '_ \ / _` | '_ \ / _` | | __|
                        | |_) | (_| | | | | (_| | | |_
                        |_.__/ \__,_|_| |_|\__,_|_|\__|


                      This is an OverTheWire game server.
            More information on http://www.overthewire.org/wargames

backend: gibson-0
bandit18@bandit.labs.overthewire.org's password:
  Enjoy your stay!

Byebye !
Connection to bandit.labs.overthewire.org closed.
~/Github_cybersecurity/ctf-writeups/OverTheWire/Bandit main* 26s ❯                                  
❯ ssh -p 2220 bandit18@bandit.labs.overthewire.org cat -n .bashrc
                         _                     _ _ _
                        | |__   __ _ _ __   __| (_) |_
                        | '_ \ / _` | '_ \ / _` | | __|
                        | |_) | (_| | | | | (_| | | |_
                        |_.__/ \__,_|_| |_|\__,_|_|\__|


                      This is an OverTheWire game server.
            More information on http://www.overthewire.org/wargames

backend: gibson-0
bandit18@bandit.labs.overthewire.org's password:
   112  if ! shopt -oq posix; then
   113    if [ -f /usr/share/bash-completion/bash_completion ]; then
   114      . /usr/share/bash-completion/bash_completion
   115    elif [ -f /etc/bash_completion ]; then
   116      . /etc/bash_completion
   117    fi
   118  fi
   119  echo 'Byebye !'
   120  exit 0
~/Github_cybersecurity/ctf-writeups/OverTheWire/Bandit main* 6s ❯                                                                                                
 2220 bandit18@bandit.labs.overthewire.org cat -n readme
                         _                     _ _ _
                        | |__   __ _ _ __   __| (_) |_
                        | '_ \ / _` | '_ \ / _` | | __|
                        | |_) | (_| | | | | (_| | | |_
                        |_.__/ \__,_|_| |_|\__,_|_|\__|


                      This is an OverTheWire game server.
            More information on http://www.overthewire.org/wargames

backend: gibson-0
bandit18@bandit.labs.overthewire.org's password:
     1  Kxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
```
</details>

  * The First step is to log into remote server using the password we acquired in the previous level .
    But as they mentioned in the challenge i got logged out immediately upon logging in .
  * At first i don't know what to do to solve this level so i read the man pages of ssh to 
    see if there is any workaround and i found one .which is i can directly pass the commands and its arguments
    separated by spaces to the ssh and it will execute it without the loginshell into the remote host .
  * This time i typed out full command instead of using my script because i didn't implement my script to handle
    extra arugments . and i also passed the command `cat .bashrc` to ssh . because the challenge said that someone
    modified .bashrc to log me out so i wanted to see what logging me out upon logging in .look at The output of cat 
    .bashrc, we can see that `exit 0` the last line or 120th line in the file .bashrc is what making us log out
    up on logging in.
  * Initially i thought of removing the line `exit 0` so that i can log into the remote machine and aquire the password
    for next level .After spending some time thinking about finding a way to remove the line in .bashrc I remembered one
    thing which is the goal of this level is not to log in but is to acquire the password inside of `readme` file and
    second thing i(the user i logging in as) don't have a permission to modify the file . so instead of trying to modify
    .bashrc i can just display the password in the file 'readme' using the command `cat readme` by passing it to the ssh.
  * and that is how i solved this level and thanks for reading this write up .

---

## What I Learned
 
  * I learned that i can execute commands on remote machine even without logging in using ssh .
  * The exit 0 command causes the shell to terminate immediately after .bashrc is executed.

---

## References
 
  * website - https://overthewire.org/wargames/bandit/bandit19.html

---

## Notes

  * Username - bandit18
  * Hostname - bandit.labs.overthewire.org
