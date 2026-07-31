---
Platform: OverTheWire 
Game: Bandit
Level: 9
Date: 2026-07-31
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
   The password for the next level is stored in the file data.txt and is the only line of text that occurs only once
   Acquire the password required for the next level .


## Platform
   * OverTheWire

## Level
   * Level08 

## Difficulty
   * bandit - beginner 

---

## Objective
   * Learn new comamnds . revise old commands learned in the past level .
   * Acquire the password required for the next level .
   * Document the thought process of capturing the flag .

---

## Skills Practiced
   * SSH
   * Terminal
   * Patience 
   * Nvim and Tmux 

---

## Tools Used
   * ssh
   * terminal 
   * ls , cat , sort , uniq
   * nvim and tmux 
    
---

## Observations

---

## Commands Used

<details>

<summary> Terminal Output : ./next_lvl.sh bandit8 </summary>

``` bash 
❯ ./next_lvl.sh bandit8
                         _                     _ _ _   
                        | |__   __ _ _ __   __| (_) |_ 
                        | '_ \ / _` | '_ \ / _` | | __|
                        | |_) | (_| | | | | (_| | | |_ 
                        |_.__/ \__,_|_| |_|\__,_|_|\__|
                                                       

                      This is an OverTheWire game server. 
            More information on http://www.overthewire.org/wargames

backend: gibson-1
bandit8@bandit.labs.overthewire.org's password: 
```
</details>

  * First i Logged into the level bandit8 one the remote host using the password i acquired in the previous level .

<details> 
<summary> Terminal Output : ls -la </summary>

``` bash
bandit8@bandit:~$ ls -la
total 56
drwxr-xr-x   2 root    root     4096 Jun 24 14:59 .
drwxr-xr-x 150 root    root     4096 Jun 24 15:02 ..
-rw-r--r--   1 root    root      220 Feb 13 12:16 .bash_logout
-rw-r--r--   1 root    root     3851 Jun 24 14:50 .bashrc
-rw-r--r--   1 root    root      807 Feb 13 12:16 .profile
-rw-r-----   1 bandit9 bandit8 33033 Jun 24 14:59 data.txt
bandit8@bandit:~$ 
```

</details>
   
   * I used the command `ls -la` to list all the files and folders including the hidden ones in the list format .
     I used This command before using the command ` find ` because the file i am looking for could be already
     in the `home` directory .Here the -a isn't necessary because the file i am looking for is not hidden .if it 
     were they would have mentioned it is `.data.txt.`

<details>
<summary> Terminal Output : cat data.txt </summary>

``` bash
bandit8@bandit:~$ cat data.txt 
9E3UGT9z02VsqTV4nvnLWD5pOCYpeMpu
O5ffmD1gTxN6wqrVj7s4qCGjViq2Eqa6
I8fJN0v9oiPS7HFj6zQJK32Jyn7mYw2Y
U6fRtWGxxx2JgitTcRpI8Eni5yrBX5uN
vUvJ0fcRGiyPVnxkyQvYT0EPmlYIsUMQ
IbdwbkaNWVGPrvL1xQCatdfRxoDKUxma
1QDbI0z3b488UD7pbhxxzAscVKVGJIqi
vV6s2Yby5gSVRdjhpxtCxVCYgXAcxjaR
xmeI3qSdYRGdE1hnvHojftBAH34FmdVh
n9CPDhddWtI7LVGVnggcb5BFD3qUbGwL
pivhbnblpVTFpxkMDVkJp2atFy1ZVMxU
rU0tb1OjOkN0uXXlm2UXtzDMZJTzJRyu
RoYVWxxdTSysjT9AGs6oJc8Kl8zIRYr9
oILf8yUfdHCFFt9WNWZYaEwUoC0bReLx
atbufd245zR1E9L82eOHKY5v7scHZLLG
Ylnm1D5XD7gYpLrAt0lpBaFEPdc8rImO
qrRf9CQrKIAEN88BQZra13opLoQ6N49w
xZ7xRIvDhE8A5e3qlN2VkjJ6qbQOz2UQ
I8zNfAo6WbQfoDYlUuiXjOhridq2DwrC
vgMO06yomBjlpJWgy4iFZnJpTVmyLEE9
9E3UGT9z02VsqTV4nvnLWD5pOCYpeMpu
iPlLUedeh2azbvpbLmQSbGVmB8Yx2lX2
atbufd245zR1E9L82eOHKY5v7scHZLLG
zkMxeSKoehT6Vr91dmmcIruQuHAIl5Zf
jI0NhebQjeEXAGTRzfZ2OS9bCb9qoWjh
Wrjnd8eqif8WHgtfuXLagGMuduJCZZEH
qrRf9CQrKIAEN88BQZra13opLoQ6N49w
87xOVvUON2omm8aFP8p90bU5XDUgjUBH
9q013YSeArsZTSh6leJJE4OJKQ5BCdnQ
XVwR5HGsVlKyb9JbQLfQzv3UN285E9Ew
g05CCNIncRsLm0APYiwLoLyT1EZeS097 # note i didn't paste the full output here because it is too large ...
```
</details>

  * I displayed the contents of the file ` data.txt ` using the command ` cat ` . 
    before i do anything i wanted to know what kind of data it contains.
    i could have used the ` file data.txt ` to find what kind of data it contains.
    but it would only print the type of the file but i wanted see what is actually 
    in the file .

<details>
<summary> Terminal Output : uniq -u </summary>

```bash
bandit8@bandit:~$ uniq -u data.txt
9E3UGT9z02VsqTV4nvnLWD5pOCYpeMpu
O5ffmD1gTxN6wqrVj7s4qCGjViq2Eqa6
I8fJN0v9oiPS7HFj6zQJK32Jyn7mYw2Y
U6fRtWGxxx2JgitTcRpI8Eni5yrBX5uN
vUvJ0fcRGiyPVnxkyQvYT0EPmlYIsUMQ
IbdwbkaNWVGPrvL1xQCatdfRxoDKUxma
1QDbI0z3b488UD7pbhxxzAscVKVGJIqi
vV6s2Yby5gSVRdjhpxtCxVCYgXAcxjaR
xmeI3qSdYRGdE1hnvHojftBAH34FmdVh
n9CPDhddWtI7LVGVnggcb5BFD3qUbGwL
pivhbnblpVTFpxkMDVkJp2atFy1ZVMxU
```
</details>
   
  * Since they mentioned that the password we looking for is the only line that occurs once .
    I used the command ` uniq -u ` to print the uniq line but unexpectedly it prints all the lines
    in the file .
  * so before googling about it i read the man pages of uniq once again and i found that 
    uniq compares lines with its adjacent lines which tells me that i have to sort the file and
    pipe the output to uniq .
 
 <details>
 <summary> Terminal Output : surt -h -u data.txt </summary>

 ``` bash
bandit8@bandit:~$ sort -h -u data.txt 
O5ffmD1gTxN6wqrVj7s4qCGjViq2Eqa6
1s9qPOht8yUgFvAX0FkoGmIWLCTdDdvf
4a3khgRIuLuBCaxG9zKwL26NsWz1riwQ
7qGlWRGyh6mBia5MH2HTWKhBSVyoUA2F
8O9FvCQeGWInYiLUegyFV2wbb9NFhuqg
9q013YSeArsZTSh6leJJE4OJKQ5BCdnQ
23xwbwirY6MYQ74fPZF0nXiEP885Mq9v
70uHTuxrBXZLib5mpJcGI79JOaNfsg1l
87xOVvUON2omm8aFP8p90bU5XDUgjUBH
90xEyvXlstl8dRKPiszlDdrPb2zEsIxH
82kH7YDhcD0UJabl61bhYNKgcVytEF1W
1PesxCa7cihwvCvzBeKAcjKkjUwp7i2z
4PSZT0xXsJxz99aAVnAwxDxruDwXRVBF
4ErstEQiIHgE1VEeFIM52pldPybhoLNn
9E3UGT9z02VsqTV4nvnLWD5pOCYpeMpu
4Za0gJjjbHxvrFfBXzeLSCL3RkUIfZDt
1QDbI0z3b488UD7pbhxxzAscVKVGJIqi
bandit8@bandit:~$ 
 ```
 </details>
   
   * Before piping the `stdout` of ` sort ` to `uniq` . i wanted to see how the sorted file looks like so
     I print the output . Here the flag `-u` prints the line that has two or more occurences so that means
     the password we looking for isn't in this list of lines .

<details>
<summary> Terminal output : sort -h -u data.txt | uniq -u </summary>

``` bash
 bandit8@bandit:~$ sort -h -u data.txt | uniq -u
O5ffmD1gTxN6wqrVj7s4qCGjViq2Eqa6
1s9qPOht8yUgFvAX0FkoGmIWLCTdDdvf
4a3khgRIuLuBCaxG9zKwL26NsWz1riwQ
7qGlWRGyh6mBia5MH2HTWKhBSVyoUA2F
8O9FvCQeGWInYiLUegyFV2wbb9NFhuqg
9q013YSeArsZTSh6leJJE4OJKQ5BCdnQ
23xwbwirY6MYQ74fPZF0nXiEP885Mq9v
70uHTuxrBXZLib5mpJcGI79JOaNfsg1l
87xOVvUON2omm8aFP8p90bU5XDUgjUBH
90xEyvXlstl8dRKPiszlDdrPb2zEsIxH
82kH7YDhcD0UJabl61bhYNKgcVytEF1W
1PesxCa7cihwvCvzBeKAcjKkjUwp7i2z
4PSZT0xXsJxz99aAVnAwxDxruDwXRVBF
4ErstEQiIHgE1VEeFIM52pldPybhoLNn
9E3UGT9z02VsqTV4nvnLWD5pOCYpeMpu
4Za0gJjjbHxvrFfBXzeLSCL3RkUIfZDt
1QDbI0z3b488UD7pbhxxzAscVKVGJIqi
bandit8@bandit:~$ .
```
</details>

  * The command sequence above didn't work because the data in the `stdout` of `sort -h -u datat.txt` 
    is already unique so the command ` uniq ` sees all of the lines as unique lines because it didn't see
    the occurences of those lines . All we need to do to solve this level is to remove `-u` flag in the 
    `sort` command .


<details>
<summary> Terminal Output : sort -h data.txt | uniq </summary>

``` bash
bandit8@bandit:~$ sort -h data.txt | uniq -u
EjmOSvuAu7sGAHqHVcBDPirRe9T03kxl
bandit8@bandit:~$ 
```
</details>

  * I found the password for the next level and copied it to my local computer before exiting it by pressing ` ctrl + d ` . 


| Parts | Meaning |
|-------|---------|
| sort | A utility used to sort the data in stdout or File |
| -h | human readable sorting |
| -u | prints the lines with multiple occurences |
| uniq | A utility used to find the uniq line by comparing it with its adjacent lines |
| -u | a flag used to print the uniq line |

---

## What I Learned
  * I learned how to use the uniq and how it works .
  * I learned how to use sort and what the -u flag mean in sort .
---

## References
  * website - https://overthewire.org/wargames/bandit/bandit9.html
  * man - sort , uniq and ls

---

## New Concepts
  * sort , uniq .

---

## Notes
 username : bandit8
 hostname : bandit.labs.overthewire.org


