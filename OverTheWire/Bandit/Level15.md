---
Platform: OverTheWire 
Game: Bandit
Level: 15
Date: 2026-08-05
Difficulty: Beginner
Topics:
  - SSH
  - Linux
  - TCP , UDP .
  - Shell
  - ctf
---

# Challenge
  The password for the next level can be retrieved by submitting the password of 
  the current level to port 30000 on localhost . Acquire the password required
  for next lvl .

## Platform
 * OverTheWire 

## Level
 * level14 => level15

## Difficulty
 * bandit - beginner

---
## Objective
 * Acquire the password for the next level .
 * Learn how to use `nmap` and `nc` .

---

## Skills Practiced
 * SSH
 * Linux commands
 * nmap and nc 

---

## Tools Used
 * SSH .
 * Terminal .
 * nc .
 * nmap .
---

## Commands Used
<details>
<summary> Terminal output : ./next_lvl.sh bandit14 </summary>

```bash
❯ ./next_lvl.sh bandit14
                         _                     _ _ _
                        | |__   __ _ _ __   __| (_) |_
                        | '_ \ / _` | '_ \ / _` | | __|
                        | |_) | (_| | | | | (_| | | |_
                        |_.__/ \__,_|_| |_|\__,_|_|\__|


                      This is an OverTheWire game server.
            More information on http://www.overthewire.org/wargames

backend: gibson-1
bandit14@bandit.labs.overthewire.org's password:

      ,----..            ,----,          .---.

```
</details>
 
  * First I logged into the bandit14 by using the password i acquired in the
    previous level .Then i read the challenge once again cus i didn't understand
    what they mean by submitting the current password on the port 30000 via
    local host . so i thought i could use `scp` to send the password to the port
    30000 on local host .

<details>
<summary> Terminal Output : cd /etc/bandit_pass </summary>

```bash
bandit14@bandit:~$ cd /etc/bandit_pass/
bandit14@bandit:/etc/bandit_pass$
bandit14@bandit:/etc/bandit_pass$ scp -P 30000 ./bandit14 bandit14@localhost:
Connection closed by 127.0.0.1 port 30000
scp: Connection closed
bandit14@bandit:/etc/bandit_pass$
bandit14@bandit:/etc/bandit_pass$ scp -P 30000 ./bandit14 bandit15@localhost:
Connection closed by 127.0.0.1 port 30000
scp: Connection closed
bandit14@bandit:/etc/bandit_pass$ nmap localhost
Starting Nmap 7.98 ( https://nmap.org ) at 2026-08-09 12:23 +0000
Nmap scan report for localhost (127.0.0.1)
Host is up (0.00014s latency).
Other addresses for localhost (not scanned): ::1
Not shown: 993 closed tcp ports (conn-refused)
PORT      STATE SERVICE
22/tcp    open  ssh
1111/tcp  open  lmsocialserver
1840/tcp  open  netopia-vo2
4321/tcp  open  rwhois
8000/tcp  open  http-alt
30000/tcp open  ndmps
50001/tcp open  unknown

Nmap done: 1 IP address (1 host up) scanned in 0.06 seconds
bandit14@bandit:/etc/bandit_pass$
```
</details>

  * The password for the current level is sitting in the dir of `/etc/bandit_pass/bandit14` 
  so i used `cd` to change into that directory to send the password in 
  the file `bandit14` to port 30000 of the localhost .Then i used the `scp`
  to send the file but it says the connection is closed . then i used `nmap` to
  see the port is open or not but it says the port is open .May be i am not 
  getting it right so decided to google and read man pages of `nmap` and `nc`
  honestly i don't get it at my first read then i slowly began to understand what
  i should do to solve this level .

<details>
<summary> Terminal ouput : nc localhost 30000 </summary>

``` bash
bandit14@bandit:/etc/bandit_pass$ nc localhost 30000
aaWxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
Correct!
pbLxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

^C
bandit14@bandit:/etc/bandit_pass$
# alternate ways 
nc localhost 30000 < /etc/bandit_pass/bandit14
cat /etc/bandit_pass/bandit14 | nc localhost 30000
```
</details>

  * The port 30000 uses `TCP` **T**ransmission **C**ontrol **P**rotocol to 
  receive or send data (bytes).since everything is bytes including files i 
  thought i could send the file or by typing i could send the password to the
  port 30000 . First i needed a utility which could send data using tcp 
  although i already read the man pages of `nc` i didn't know it could do that
  cus there is no examples in that man pages .and it was very hard to understand .
  after some googling i found that `nc` could do that by specifying the ip
  and the port . and thats how i solved this level .sometimes the answer is
  very simple but the way to get there is not that simple .


| COMMANDS | USAGE |
|----------|-------|
| nmap | A utility used to scan the ports on a network or hostmachine |
| nc | A utility used to talk to another host or to itself using udp or TCP |
| localhost | localhost is a hostname that normally resolves to the loopback |
|           |  address 127.0.0.1 for IPv4 and ::1 for IPv6. It refers to the same|
|            | machine on which the command is running. |
| 30000 | The port number we want to submit the password |

---

## What I Learned
 
 * I learned the basics usage of nmap and nc . 
 * I learned about IP addresses and port numbers .

---

## References
  * website - https://overthewire.org/wargames/bandit/bandit15.html
              https://computer.howstuffworks.com/web-server5.htm
              https://en.wikipedia.org/wiki/IP_address
              https://computer.howstuffworks.com/web-server8.htm
              https://en.wikipedia.org/wiki/Port_(computer_networking)

---

## New Concepts
 * TCP and UDP .
 * LOCALHOST , nc and nmap .

---

## Notes
  Username : bandit14 
  Hostname : bandit.labs.overthewire.org

