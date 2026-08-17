---
Platform: OverTheWire 
Game: Bandit
Level: 16
Date: 2026-08-16
Difficulty: Beginner
Topics:
  - SSH
  - Linux
  - TCP , UDP .
  - Shell
  - ctf
---

# Challenge
    The password for the next level can be retrieved by submitting the password of the current level to port 30001 on localhost using SSL/TLS encryption.
    Helpful note: Getting “DONE”, “RENEGOTIATING” or “KEYUPDATE”? Read the “CONNECTED COMMANDS” section in the manpage.

## Platform

 * OverTheWire

## Level

 * Level15 => Level16

## Difficulty

 * bandit - begginer .

---

## Objective

 * Learn about ssl/tls encryption and protocols.
 * Acquire the password required for next level .

---

## Skills Practiced

 * SSH
 * Terminal navigation

---

## Tools Used
 
 * SSH
 * Terminal
 * openssl , cat 

---

## Commands Used
<details>
<summary> commands : ./next_lvl.sh bandit15 , ls , cat </summary>
</details>

  * First i used the script i wrote in the previous level to log into the bandit level15 . 
   Instead of typing a long sequence of text every time to connect to a same remote host
   with a different username i can just specify the username i want to use to connect to 
   a certain level using the script i wrote. I first always inspect the home dir to find
   any useful hidden files using the command `ls` but i couldn't find any .Then i change 
   into the dir of the `/etc/band_pass` because that is where the password of everylevel
   of bandit is stored and only the user of the level can access the file containing the
   password of that level . and the file is named with the name of the level like lvl 
   `bandit15` for bandit15 password file name .

<details>
<summary> Terminal output : openssl s_client -connect localhost -port 30001 </summary> 

```bash
bandit15@bandit:/etc/bandit_pass$ openssl s_client -connect localhost -port 30001
Connecting to 127.0.0.1
CONNECTED(00000003)
Post-Handshake New Session Ticket arrived:
SSL-Session:
    Protocol  : TLSv1.3
    Cipher    : TLS_AES_256_GCM_SHA384
    Session-ID: E03F0F8D26692C283092FEF646D22CD2617C20162CAF560D7E4E45FA40B81632
    Session-ID-ctx:
    Resumption PSK: EB3FBA516EBC3708971C25B1E9FD972B9E541A7F80E6382B27A6694DBB21BF897D6AACB3A515BF4213357E91BF161943
    PSK identity: None
    PSK identity hint: None
    SRP username: None
    TLS session ticket lifetime hint: 300 (seconds)
    TLS session ticket:
    0000 - 03 d7 e4 75 c5 91 9e 48-f8 43 79 37 ab 78 7d 9c   ...u...H.Cy7.x}.
    0010 - cf c3 5a 0b 22 e4 63 b5-1d 6f 93 5a 05 49 20 a2   ..Z.".c..o.Z.I .
    0020 - 76 4d c2 29 f4 ae a3 0c-5d bf 3a 2e e0 0e 77 e0   vM.)....].:...w.
    0030 - 85 da 97 87 26 2e 31 a0-cb d4 66 f9 0f 86 ae b0   ....&.1...f.....
    0040 - 1a 7d cd 9e a9 7e c2 0b-d6 90 6e 42 c8 34 f2 58   .}...~....nB.4.X
    0050 - bc 02 b4 c6 f4 85 02 b9-ee 1b ca 83 ab 60 5e 35   .............`^5
    0060 - a5 37 be ea d7 52 be cb-af 0e 43 2a 61 56 52 35   .7...R....C*aVR5
    0070 - f9 33 79 03 34 75 75 a4-4b 69 72 8d 79 e3 e6 82   .3y.4uu.Kir.y...
    0080 - 50 3b 6d b8 50 71 dc 24-91 52 08 6f b3 63 41 d5   P;m.Pq.$.R.o.cA.
    0090 - 27 84 dd 32 0d 74 03 73-ef 17 7c 5b ad e3 b7 b6   '..2.t.s..|[....
    00a0 - 43 52 38 0d f9 68 df ab-a0 b5 d4 64 14 15 b7 cd   CR8..h.....d....
    00b0 - 8a 2f 8c f7 ad 0c 60 9f-5a de bd ff b0 ba 6b 12   ./....`.Z.....k.
    00c0 - d7 be 9a f6 23 21 03 e1-3b b2 ac f3 3a 07 79 12   ....#!..;...:.y.
    00d0 - b8 3c 06 e4 79 a9 50 e4-d3 ee 01 c5 96 88 7b cd   .<..y.P.......{.

    Start Time: 1786860206
    Timeout   : 7200 (sec)
    Verify return code: 18 (self-signed certificate)
    Extended master secret: no
    Max Early Data: 0
---
read R BLOCK
pbLxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
Correct!
kS0$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

closed
bandit15@bandit:/etc/bandit_pass$ # Note i didn't put the full output here .

```
</details>

  * The challenge of this level is to submit the password of the current level to
    the port `30001` on `localhost` using ssl/tls encryption . My first thought was
    to use the command `nc` i learned in the previous level to submit the password 
    as i did in previous level . But i learned that `nc` doesn't implement ssl or tls
    so i need to use a command which implements ssl or tls protocols . The challenge
    gave as a reference about openssl , ssl and tls under the heading `Helpful reading
    material` . so i began to reference them to learn openssl command . After i learned
    just enough to get my hands dirty using openssl cmd i immedietly tried it out .
    and i succeeded on my first try . so Basically it establishes a TCP/UDP connection
    using security protocols like SSL or TLS encryption. After it is done establishing
    a connection using SSL or TLS we can send or receive data . I sent the password of
    the Current level and I received the password of the next level and then i copied it
    to my local machine . and i exited to remote host my pressing `ctrl + d` .

| COMMANDS | USAGE |
|----------|-------|
| Openssl | A cryptographic toolkit that implements ssl or tls network protocols |
| s_client | A subcommand of openssl which implements SSL/TLS client |
| -connect | A option of s_client to specifty the host |
| localhost | the hostname used to speak to the host itself |
| -port | A port on which we want to send or receive data for this level |

---

## What I Learned
 
 * I learned about SSL/TLS protocols basics and lot more there to learn .
---

## References

 * website -  https://overthewire.org/wargames/bandit/bandit16.html ,
              https://www.feistyduck.com/library/openssl-cookbook/online/openssl-command-line/index.html 

---

## New Concepts
 
 * SSL / TLS Encryption .

---

## Notes

  * Username : bandit15
  * Hostname : bandit.labs.overthewire.org
