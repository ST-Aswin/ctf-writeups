---
Platform: OverTheWire 
Game: Bandit
Level: 17
Date: 2026-08-17
Difficulty: Beginner
Topics:
  - SSH
  - Linux
  - TCP , UDP .
  - Shell
  - ctf
  - SSL/TLS
---
# Challenge
    The credentials for the next level can be retrieved by submitting the password of the current level 
    to a port on localhost in the range 31000 to 32000. First find out which of these ports have a server
    listening on them. Then find out which of those speak SSL/TLS and which don’t. There is only 1 server 
    that will give the next credentials, the others will simply send back to you whatever you send to it.

## Platform
 
 * OverTheWire

## Level
 
 * Level16 => Level17

## Difficulty

 * bandit - beginner 

---

## Objective

 * Acquire the password required for the next level .
 * Find which port is speaking SSL/TLS in the range of 31000 and 32000.

---

## Tools Used

 * SSH
 * Terminal
 * nmap 
 * openssl

---

## Commands Used
<details>
<summary> Terminal commands : ./next_lvl.sh bandit16 </summary>

  * First i Logged into the remote host using the password i aquired in the previous level .
    Then i checked for any useful files in the home dir using the command `ls -la` but i found
    nothing .But i noticed one thing which is there was a file named .bandit15.password .my
    First thought was, what is the password file of level15 is doing at the home dir of level16
    I thought may be it was to check against when i submitted the password of of level15 to
    acquire the password of this current level .and then i didn't pay much attention do it .

</details>
<details>
<summary> Terminal output : nmap -p31000-32000 localhost </summary>

```bash
bandit16@bandit:~$ nmap -p31000-32000 localhost
Starting Nmap 7.98 ( https://nmap.org ) at 2026-08-17 10:03 +0000
Nmap scan report for localhost (127.0.0.1)
Host is up (0.00016s latency).
Other addresses for localhost (not scanned): ::1
Not shown: 996 closed tcp ports (conn-refused)
PORT      STATE SERVICE
31046/tcp open  unknown
31518/tcp open  unknown
31691/tcp open  unknown
31790/tcp open  unknown
31960/tcp open  unknown

Nmap done: 1 IP address (1 host up) scanned in 0.07 seconds
bandit16@bandit:~$ nmap -T4 -sV -p31000-32000 localhost
Starting Nmap 7.98 ( https://nmap.org ) at 2026-08-17 10:20 +0000
Nmap scan report for localhost (127.0.0.1)
Host is up (0.00014s latency).
Other addresses for localhost (not scanned): ::1
Not shown: 996 closed tcp ports (conn-refused)
PORT      STATE SERVICE     VERSION
31046/tcp open  echo
31518/tcp open  ssl/echo
31691/tcp open  echo
31790/tcp open  ssl/unknown
31960/tcp open  echo
1 service unrecognized despite returning data. If you know the service/version, please submit the following fingerprint at https://nmap.org/cgi-bin/submit.cgi?new-service :
SF-Port31790-TCP:V=7.98%T=SSL%I=7%D=8/17%Time=6A82E074%P=x86_64-pc-linux-g
SF:nu%r(GenericLines,32,"Wrong!\x20Please\x20enter\x20the\x20correct\x20cu # Note i didn't put full output here .
```
</details>

  * As The challenge mentioned that i have to submit the password of this current level to the correct port in the range of 31000 to 32000.
    I begin by scanning the ports in those range using the utility `nmap` .There were 5 ports in those range were listening but i don't know
    what service they serve . so i ran the `nmap` utility once again with `-sV` flag to find out what kind of service those 5 ports offer .
    After waiting for 2 whole minutes i got an output but now the unknown is replaced with some useful information .out of the 5 ports only
    2 ports are speaking ssl so the port which contains the credentials for the next level must be one of those 2 ports which are 31518 and 31790
    . i chose port 31790 to check first because in the output the service field of 31790 said `ssl/unknown` which is kind of suspicious plus
    the port 31518 serves echo like the other three ports (31046,31691,31960) but with ssl encryption so i decided to check port 31790 first
    before checking 31518 .

<details>
<summary> Terminal output : cat bandit16 | openssl s_clinet -connect localhost:31790 </summary>

```bash
bandit16@bandit:/etc/bandit_pass$ cat bandit16 | openssl s_client -connect localhost:31790
Connecting to 127.0.0.1
CONNECTED(00000003)
Can't use SSL_get_servername
depth=0 CN=SnakeOil
verify error:num=18:self-signed certificate
verify return:1
depth=0 CN=SnakeOil
verify return:1
read R BLOCK
KEYUPDATE
DONE # NOTE i didn't put the full output here .
bandit16@bandit:/etc/bandit_pass$ openssl s_client -connect localhost:31790
Connecting to 127.0.0.1
CONNECTED(00000003)
Can't use SSL_get_servername
depth=0 CN=SnakeOil
verify error:num=18:self-signed certificate
verify return:1
depth=0 CN=SnakeOil
verify return:1
--- #Note I didn't put the full output here .
read R BLOCK
kS0Hxxxxxxxxxxxxxxxxxxxxxxxxxxxx
KEYUPDATE
kkS0xxxxxxxxxxxxxxxxxxxxxxxxxxxxx
KEYUPDATE
kkSxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
KEYUPDATE
bandit16@bandit:/etc/bandit_pass$ cat bandit16 | openssl s_client  -connect localhost:31518
Connecting to 127.0.0.1
CONNECTED(00000003)
Can't use SSL_get_servername
depth=0 CN=SnakeOil
verify error:num=18:self-signed certificate
verify return:1
depth=0 CN=SnakeOil
verify return:1
---
KEYUPDATE
DONE
bandit16@bandit:/etc/bandit_pass$
```
</details>

 * First i changed into the dir of `/ect/bandi_pass` because the password of the every level is stored there with the name of the level
  the password belong to so i can use the command `cat` and the `|` to send the password to the port instead of typing or copy pasting it
  everytime . The command `cat bandit16 | openssl s_client -connect localhost:31790` sequence didn't give me the credentials for the next
  level . i thought it should be working but it didn't so i carefully examined the output and the last three lines from `KEYUPDATE` got my
  attention because in the challenge they mentioned that if you get `DONE` `RENEGOTIATING` or `KEYUPDATE` message read the section 
  'connected commands' . before i read the man pages or googling i wanted to try it one more time but without piping the password so
  that i can directly type it myself or copy paste it . This time also it didn't work .The password is correct because that is what i used
  to log into this level then how come i get the message 'wrong password and KEYUPDATE' . so i instantly opened up the new terminal to read
  the man pages of openssl . To be honest it is very dense and it was hard to find the section i looking for so i googled 'connected commands
  openssl s_client' . in the serach result i found the website and in the website i learned that anything starts with `k` or `K` is interpreted
  as KEYUPDATE command so i thought about enclosing the password with quotes but didn't work because it also takes quotes into account .
  so what can i do ? i thought about it for while and then i read the website once again more carefully . and i found out that i can pass
  the flag `-quiet` to `s_client` to disable this interactive feature .
 
 * The password starts with the letter `k` for this level and that is why it was interpreted as command . It took a long time to figureout
 what am i doing wrong but it was fun .

<details>
<summary> Terminal Output : cat bandit16 | openssl s_client -quiet -connect localhost:31790 </summary>

```
bash
bandit16@bandit:/etc/bandit_pass$ cat bandit16 | openssl s_client -quiet -connect localhost:31790
Connecting to 127.0.0.1
Can't use SSL_get_servername
depth=0 CN=SnakeOil
verify error:num=18:self-signed certificate
verify return:1
depth=0 CN=SnakeOil
verify return:1
Correct!
-----BEGIN OPENSSH PRIVATE KEY-----
b3BlbnNzaC1raaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
-----END OPENSSH PRIVATE KEY-----

bandit16@bandit:/etc/bandit_pass$
```
</details>

  * Since I have found out that i can pass the flag `-quiet` to disable that feature i immediately tried it .
    and i have acquired the credentials for the next level .Then i copied the private key to my local machine .
    and exited the remote machine by presing `ctrl + d`.

---

## What I Learned

 * I learned about --quiet flag of s_client .

---

## References

 * website - https://overthewire.org/wargames/bandit/bandit17.html

---

## Notes

 * Username - bandit16
 * Hostname - bandit.labs.overthewire.org

