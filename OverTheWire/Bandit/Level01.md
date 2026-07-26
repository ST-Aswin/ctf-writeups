# Challenge
  * The password required for the next level bandit1 is stored in readme in the home directory of 
  level0 bandit0 . i should find the password of bandit1 and use it to log into bandit1 using ssh
  port 2220 .

## Platform
  * OverTheWire

## Level
  * Level01 

## Difficulty
  * Bandit
---

## Objective
  * Log into the next level of bandit .
  * Get Used to the way of doing things in terminal .
---

## Skills Practiced
  * Terminal Navigation
  * SSH
  * Searching in Terminal
---

## Tools Used
  * `ssh , ls , cat , file , du , find `
  * terminal
---

## Commands Used

```bash
    bandit0@bandit:~$ ls
    readme
    bandit0@bandit:~$ cat readme
    Congratulations on your first steps into the bandit game!!
    Please make sure you have read the rules at https://overthewire.org/rules/
    If you are following a course, workshop, walkthrough or other educational activity,
    please inform the instructor about the rules as well and encourage them to
    contribute to the OverTheWire community so we can keep these games free!

    The password you are looking for is: 6y2kwnwK6grgvwvpvLaa2T1cpFEKOhNR

    bandit0@bandit:~$ exit
    ❯ ssh -p 2220 bandit1@bandit.labs.overthewire.org
                         _                     _ _ _   
                        | |__   __ _ _ __   __| (_) |_ 
                        | '_ \ / _` | '_ \ / _` | | __|
                        | |_) | (_| | | | | (_| | | |_ 
                        |_.__/ \__,_|_| |_|\__,_|_|\__|
                                                       

                      This is an OverTheWire game server. 
            More information on http://www.overthewire.org/wargames

backend: gibson-0
bandit1@bandit.labs.overthewire.org's password: 

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

```

---

## Solution Walkthrough
    first i wanted to know what are the files is available to me at
    the remote machine i logged into .so i ls to find it .fortunately
    i found the readme file as the mentioned at the home dir itself .
    then i cat the file and copied the password from the remote machine
    to my local machine .Then i exit the level0 to log into level1.
    then i logged successfully into level1 .
---

## What I Learned
  * SSH 
  * Basic Terminal commands ls , cat , exit
---

## References
  * OverTheWire

## Notes
Level1
  Hostname: bandit.labs.overthewire.org
  username: bandit1
  password: 6y2kwnwK6grgvwvpvLaa2T1cpFEKOhNR
