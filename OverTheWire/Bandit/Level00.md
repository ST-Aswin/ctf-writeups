# Challenge
  The goal of this level is for you to log into the game using SSH. 
  The host to which you need to connect is bandit.labs.overthewire.org, 
  on port 2220. The username is bandit0 and the password is bandit0. 
  Once logged in, go to the Level 1 page to find out how to beat Level 1.

## Platform
  * OverTheWire

## Level
  * Level 0

## Difficulty
  * Bandit
---

## Objective
  * Learn The Basic usages of SSH .
  * Log into game using SSH .using the Host bandit.labs.overthewire.org:2220  
---

## Skills Practiced
  * SSH
---

## Tools Used
  * Terminal
  * SSH cli
---

## Commands Used

```bash
ssh -p 2220 bandit0@bandit.labs.overthewire.org

```
| Part | Meaning |
|------|---------|
| ssh | Open an SSH connection |
| -p 2220 | Connect using port 2220 |
| bandit0 | Username |
| @ | Separates username and host |
| bandit.labs.overthewire.org | Remote host  |

---

## Solution Walkthrough
    Before I started Solving this problem i went on to learn the basics of SSH .
    I learnt its basic usage and syntax .
    then i came back to this problem and started thinking what i need to do to 
    complete this task . 
    since i have learnt the basic usage of ssh i started solving it by typing the 
    cmd SSH then specifying the port because in the problem they have mentioned to 
    use the port 2220 which i did .
    Then i typed the username and the hostname i want to log into and then i pressed
    enter . it asked for the password and i gave it the password and I have successfully
    logged into the bandit.labs.overthewire.org using ssh .

---

## What I Learned
  * I learned the basics of ssh .
  * I learned about dns and the defualt port of ssh can be changed to different port .
  * The default port of ssh is 22 .
---

## References
  * websites
    1. https://en.wikipedia.org/wiki/Secure_Shell
    2. https://itsfoss.com/ssh-to-port
    3. https://www.wikihow.com/Use-SSH

  * OverTheWire Bandit
  * `man ssh`

## New Concepts

- SSH
- Remote Host
- Port
- DNS
- Authentication

## Notes
- Platform - OverTheWire
- Difficulty - Bandit
- Level0 
    Hostname: bandit.labs.overthewire.org
    username: bandit0
    password: bandit0
