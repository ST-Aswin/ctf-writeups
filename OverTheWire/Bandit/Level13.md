---
Platform: OverTheWire 
Game: Bandit
Level: 13
Date: 2026-08-03
Difficulty: Beginner
Topics:
  - SSH
  - Linux
  - compression and decompression 
  - cat
  - Shell
  - ctf
---

# Challenge
The password for the next level is stored in the file data.txt, which is a hexdump of a 
file that has been repeatedly compressed. For this level it may be useful to create a 
directory under /tmp in which you can work. Use mkdir with a hard to guess directory name.
Or better, use the command “mktemp -d”. Then copy the datafile using cp, and rename it using
mv (read the manpages!)

## Platform
 * OverTheWire

## Level
 * bandit12 => bandit13

## Difficulty
 * Bandit - beginner
---

## Objective
 * Acquire the password required for the next level .
 * Learn about compression and decompression .

---

## Skills Practiced
 * SSH
 * Linux commands - ls , gzip , bzcat , bzip2 , file , xxd

---

## Tools Used
 * SSH
 * Linux commands - ls , gzip , bzcat, cp , bzip2 , file , xxd

---

## Commands Used
<details> 
<summary> Terminal Output : ./next_lvl.sh bandit12 </summary>

```bash
❯ ./next_lvl.sh bandit12
                         _                     _ _ _
                        | |__   __ _ _ __   __| (_) |_
                        | '_ \ / _` | '_ \ / _` | | __|
                        | |_) | (_| | | | | (_| | | |_
                        |_.__/ \__,_|_| |_|\__,_|_|\__|


                      This is an OverTheWire game server.
            More information on http://www.overthewire.org/wargames

backend: gibson-1
bandit12@bandit.labs.overthewire.org's password:

```
</details>

  * First i Logged into the bandit level 12 using the password i acquired in the previous levels .

<details>
<summary> Terminal Output : ls -la and mktemp -d </summary>

```bash
bandit12@bandit:~$ ls -la
total 24
drwxr-xr-x   2 root     root     4096 Jun 24 14:58 .
drwxr-xr-x 150 root     root     4096 Jun 24 15:02 ..
-rw-r--r--   1 root     root      220 Feb 13 12:16 .bash_logout
-rw-r--r--   1 root     root     3851 Jun 24 14:50 .bashrc
-rw-r--r--   1 root     root      807 Feb 13 12:16 .profile
-rw-r-----   1 bandit13 bandit12 2641 Jun 24 14:58 data.txt
bandit12@bandit:~$ mktemp -d
/tmp/tmp.hbRVvzzNjs
bandit12@bandit:~$cd /tmp/tmp.hbRVvzzNjs

```
</details>
  
  * I used the command `ls -la `  to list the contents of the home dir and some other useful informations .
    Then i used the command `mktemp -d` to make a directory under `/tmp` as they suggested in this level .
    Then i used `cd` to change into that directory .

<details>
<summary> Terminal output : cp ~/data.txt ./ and  cat data.txt </summary>

```bash
bandit12@bandit:/tmp/tmp.hbRVvzzNjs$ cp ~/data.txt ./
bandit12@bandit:/tmp/tmp.hbRVvzzNjs$ ls
data.txt
bandit12@bandit:/tmp/tmp.hbRVvzzNjs$ cat data.txt
00000000: 1f8b 0808 a6f0 3b6a 0203 6461 7461 322e  ......;j..data2.
00000010: 6269 6e00 0144 02bb fd42 5a68 3931 4159  bin..D...BZh91AY
00000020: 2653 5904 ab91 e100 001c 7fff fffb bebf  &SY.............
00000030: f1fb dfbb be7f f57d fef5 5f8f ffcd b7b6  .......}.._.....
00000040: 19ff f6df af7f feae fff6 7fff 3001 3b6d  ............0.;m
00000050: 5b10 0000 001a 341a 34f5 000d 0068 0000  [.....4.4....h..
00000060: 0000 0683 2068 1ea0 3400 0d1e a034 19a8  .... h..4....4..
00000070: 0680 3d4d 00d0 69ea 69a6 0f54 41a0 00d1  ..=M..i.i..TA...
00000080: a034 d0c8 f506 8c86 8068 1a32 01a0 c40c  .4.......h.2....
00000090: 8323 40c8 0681 8803 4d32 1a34 0320 0000  .#@.....M2.4. ..
000000a0: 0d19 00d0 1a7a 834d 0ca6 8343 4000 00d1  .....z.M...C@... # note i didn't put the full hex dump here 
```
</details>
 
 * Then copied the data.txt file to the temporary directory i created under the /tmp path .Then i wanted to see
 how the hex dump data looks like .so i used the command `cat` to display the contents of the file .
 i saw the memory addresses , bytes in hex and the rightmost is the actual data .

<details>
<summary> Terminal output : xxd -r data.txt password1.txt </summary>

```bash
bandit12@bandit:/tmp/tmp.hbRVvzzNjs$ xxd -r data.txt password1.txt
bandit12@bandit:/tmp/tmp.hbRVvzzNjs$ ls
data.txt  password1.txt
bandit12@bandit:/tmp/tmp.hbRVvzzNjs$ cat password1.txt
�4�=M�i�i�TA�Ѡ4���h2��Y&SY���������߻��}��_�ͷ���߯�����0;m[44�
�zM                   #@�M24
=CM �!�HdA�2!�4FZ>�6�����fc͸�c�ǚ�JȦ��%p셨�>�ďc�n�L��Y�'C]F���֜��-�L;Ee9�l�Kr��L����
                                                                                  �E�Т�=^!�V6�\�
�
R~�$FK!e!��
           �ӂ=l*J�lP�(�-�}G��=Ahb�a{�A�n���Jixt�
                                                S�
                                                  �!� �E!�g&��g�K��cr<�_��ʄ��@���e�p'&t�<�CaxeJ��m2�~G� 	;���<���F�$O��'�q�jk�T�N�tO�b�B3��	K	�T�-�	4z9cAO��S@R����mK�z $/K�@�]��B@�G��E�Dbandit12@bandit:/tmp/tmp.hbRVvzzNjs$

```
</details>

 * I read the challenge once again to make my understanding clearer . in the challenge they mentioned that the file was
   compressed several times and then they must have used some program to make a hex dump of the file . so i had a hunch that
   this has something to do with the command `xxd` so i started to read its man pages and found that the hex dump can be restored
   to how it was using the flag `-r or -revert ` . so i used the command `xxd -r data.txt password.txt` to restore and
   save the contents in the file `password.txt` .

<details>
<summary> Terminal output : gzip -d </summary>

```bash
bandit12@bandit:/tmp/tmp.hbRVvzzNjs$ ls
data.txt  password1.txt
bandit12@bandit:/tmp/tmp.hbRVvzzNjs$ gzip -d password1.txt
gzip: password1.txt: unknown suffix -- ignored
bandit12@bandit:/tmp/tmp.hbRVvzzNjs$ mv password1.txt password1.txt.gz
bandit12@bandit:/tmp/tmp.hbRVvzzNjs$ ls
data.txt  password1.txt.gz
bandit12@bandit:/tmp/tmp.hbRVvzzNjs$ gzip -d password1.txt.gz
bandit12@bandit:/tmp/tmp.hbRVvzzNjs$ ls
data.txt  password1.txt
bandit12@bandit:/tmp/tmp.hbRVvzzNjs$
bandit12@bandit:/tmp/tmp.hbRVvzzNjs$ cat password1.txt
�4�=M�i�i�TA�Ѡ4���h2��}��_�ͷ���߯�����0;m[44�
�zM                   #@�M24
=CM �!�HdA�2!�4FZ>�6�����fc͸�c�ǚ�JȦ��%p셨�>�ďc�n�L��Y�'C]F���֜��-�L;Ee9�l�Kr��L����
                                                                                  �E�Т�=^!�V6�\�
�
R~�$FK!e!��
           �ӂ=l*J�lP�(�-�}G��=Ahb�a{�A�n���Jixt�
                                                S�
                                                  �!� �E!�g&��g�K��cr<�_��ʄ��@���e�p'&t�<�CaxeJ��m2�~G� 	;���<���F�$O��'�q�jk�T�N�tO�b�B3��	K	�T�-�	4z9cAO��S@R����mK�z $/K�@�]��B@�Gbandit12@bandit:/tmp/tmp.hbRVvzzNjs$
bandit12@bandit:/tmp/tmp.hbRVvzzNjs$ cp password1.txt password2.txt.gz
bandit12@bandit:/tmp/tmp.hbRVvzzNjs$ ls
data.txt  password1.txt  password2.txt.gz
bandit12@bandit:/tmp/tmp.hbRVvzzNjs$ gzip -d password2.txt.gz

gzip: password2.txt.gz: not in gzip format
bandit12@bandit:/tmp/tmp.hbRVvzzNjs$
```
</details>

 * Since the file was compressed several times i figured out that i have to decompress it several times before i get my hands
   on the password for the next level . so i read the manpage of gzip to learn how to decompress a file . after i learned how
   to decompress a file i used it to decompress the password.txt . but i got an error saying unknown suffix .Then i thought adding
   `.gz` at the end of password.txt would solve the problem . And it did .and then i cat the password1.txt file to see if i already
   got the password or not .and i didn't get the password yet . so i thought i have to decompress it several times to get the password .
   before i decompress it i wanted to make a new copy of the file named password2.txt.gz so that i can distinguish it and the outputfile
   would be named password2.txt .and then i used `gzip -d` to decompress it again but i go an error saying the file is not in gzip format .

<details>
<summary> Terminal Output : File --mime-type password2.txt.gz </summary>

```bash
bandit12@bandit:/tmp/tmp.hbRVvzzNjs$ file --mime-type password2.txt.gz
password2.txt.gz: application/x-bzip2
bandit12@bandit:/tmp/tmp.hbRVvzzNjs$
bandit12@bandit:/tmp/tmp.L4vVnJJAMH$ bzip2 -d password2.txt.gz # note while i was reading the man pages of bzip2 the remote host logged out automatically
bzip2: Can't guess original name for password2.txt.gz -- using password2.txt.gz.out
bandit12@bandit:/tmp/tmp.L4vVnJJAMH$ ls
data.txt  password.txt  password2.txt.gz.out
bandit12@bandit:/tmp/tmp.L4vVnJJAMH$
bandit12@bandit:/tmp/tmp.L4vVnJJAMH$ cat password2.txt.gz.out
��;jdata4.bin��KHT��3*�
0� �{g�-|_ VBeL�P�*A�4h
                       �ʒHL"�)
"p�c�.��v�����9s6/=Eͭ����	���&�Qu��^����&&CTM�=�(��w"���H��-r��I�s*����������+��D��KZic~}���ɀ����MR���і��Z�В��"=b"Î�+���lp:t{�
                                                                                                                                    _��d�w�4��PK|9����~6�RM[�{>м���狏����n��컾��'3�g
�Yj{�Q��O7�3�}�X�r5�>:jO+�|2>�}���h�������wcՕ�(�{��!�?�c\nPbandit12@bandit:/tmp/tmp.L4vVnJJAMH$
bandit12@bandit:/tmp/tmp.L4vVnJJAMH$ file --mime-type password2.txt.gz.out
password2.txt.gz.out: application/gzip
bandit12@bandit:/tmp/tmp.L4vVnJJAMH$ cp password2.txt.gz.out password3.txt.gz
bandit12@bandit:/tmp/tmp.L4vVnJJAMH$ ls
data.txt  password.txt  password2.txt.gz.out  password3.txt.gz
bandit12@bandit:/tmp/tmp.L4vVnJJAMH$ gzip -d password3.txt.gz
bandit12@bandit:/tmp/tmp.L4vVnJJAMH$ ls
data.txt  password.txt  password2.txt.gz.out  password3.txt
bandit12@bandit:/tmp/tmp.L4vVnJJAMH$
bandit12@bandit:/tmp/tmp.L4vVnJJAMH$ cat password3.txt
data5.bin0000644000000000000000000002400015216770246011252 0ustar  rootrootdata6.bin0000644000000000000000000000033715216770246011262 0ustar  rootrootBZh91AY&SY%�`��\@�W��2�Mi�LF|�=M=@҃�FF �dh����$��F�F�`bƙD�������=l�"�3����1�� ����
ED�I��CI���ѽ)�U1唯͘rE8P%�`bandit12@bandit:/tmp/tmp.L4vVnJJAMH$
bandit12@bandit:/tmp/tmp.L4vVnJJAMH$ file --mime-type password3.txt
password3.txt: application/x-tar
bandit12@bandit:/tmp/tmp.L4vVnJJAMH$ tar -xvf password3.txt
data5.bin
bandit12@bandit:/tmp/tmp.L4vVnJJAMH$ ls
data.txt  data5.bin  password.txt  password2.txt.gz.out  password3.txt
bandit12@bandit:/tmp/tmp.L4vVnJJAMH$ cat data5.bin
2�Mi6.bi�=M=@҃�FF �dh����$��F�F�`bƙD�������=l�"�3����1�� ����ustar  rootrootBZh91AY&SY%�`��\@�W��P#t1�LF|
ED�I��CI���ѽ)�U1唯͘rE8P%�`bandit12@bandit:/tmp/tmp.L4vVnJJAMH$ file --mime-type data5.bin
data5.bin: application/x-tar
bandit12@bandit:/tmp/tmp.L4vVnJJAMH$ tar -xvf data5.bin
data6.bin
bandit12@bandit:/tmp/tmp.L4vVnJJAMH$ cat data6.bin
2�Mi1AY&�=M=@҃�FF �dh����$��F�F�`bƙD�������=l�"�3����1�� ����
ED�I��CI���ѽ)�U1唯͘rE8P%�`bandit12@bandit:/tmp/tmp.L4vVnJJAMH$ file --mime-type data6.bin
data6.bin: application/x-bzip2
bandit12@bandit:/tmp/tmp.L4vVnJJAMH$
bandit12@bandit:/tmp/tmp.L4vVnJJAMH$ bzip2 -d data6.bin
bzip2: Can't guess original name for data6.bin -- using data6.bin.out
bandit12@bandit:/tmp/tmp.L4vVnJJAMH$ cat data6.bin.out
data8.bin0000644000000000000000000000011715216770246011260 0ustar  rootro��;jdata9.bin
                                                                                      �HU(H,..�/JQ�,V(

                                                                                                      ���w
��
23,�,01-,-��p3*���qd�1bandit12@bandit:/tmp/tmp.L4vVnJJAMH$ file --mime-type data6.bin.out
data6.bin.out: application/x-tar
bandit12@bandit:/tmp/tmp.L4vVnJJAMH$ tar -xvf data6.bin.out
data8.bin
bandit12@bandit:/tmp/tmp.L4vVnJJAMH$ cat data8.bin
��;jdata9.bin
             �HU(H,..�/JQ�,V(

                             ���w
��
23,�,01-,-��p3*���qd�1bandit12@bandit:/tmp/tmp.L4vVnJJAMH$
bandit12@bandit:/tmp/tmp.L4vVnJJAMH$ file --mime-type data8.bin
data8.bin: application/gzip
bandit12@bandit:/tmp/tmp.L4vVnJJAMH$ gzip -d data8.bin
gzip: data8.bin: unknown suffix -- ignored
bandit12@bandit:/tmp/tmp.L4vVnJJAMH$ mv data8.bin data8.bin.gz
bandit12@bandit:/tmp/tmp.L4vVnJJAMH$ gzip -d data8.bin.gz
bandit12@bandit:/tmp/tmp.L4vVnJJAMH$ ls
data.txt  data5.bin  data6.bin.out  data8.bin  password.txt  password2.txt.gz.out  password3.txt
bandit12@bandit:/tmp/tmp.L4vVnJJAMH$ cat data8.bin
The password is qQYQiHOBPR8zR61qxYqX45quvihF2uzk
bandit12@bandit:/tmp/tmp.L4vVnJJAMH$

```
</details>

 * Since i got an error saying `not in gzip format` trying to decompress it once again . i used the command `file --mime-type password2.txt.gz`
   to find its format . and the output says that it is in the format of `bzip2` . and i figured that i have to use bzip2 to decompress this file
   again. so started reading man pages of bzip2 to learn how to use it to be honest it was hard to understand what they mean but somehow i figured
   it .it is as same as gzip but not everything . so then i used `bzip2` to decompress it again .Then i Used `cat` to see if i already go the
   password .but no i didn't get the password yet . so i guess i have to decompress it again . before i decompress it again i wanted know
   what format the file is in now . so i used `file --mime-type password2.txt.gz.out` to find the format .The file was again in `gzip` format .
   so before i use gzip to decompress it again i wanted to make a copy of password2.txt.gz.out named password3.txt.gz so the output file would be
   password3.txt .Then i used the command `gzip -d ` to decompress the file and `cat` to display the content of the decompressed file so that
   i can know that i got the password or not . and i didn't get the password yet .so i decided to continue the process until i get the password . 
   again i checked the format .now it was `tar` . so i used tar to extract the content of the file password3.txt.and i got the file named `data5.bin`.
   so i displayed the content using `cat` to check that whether it has a password or not .and i didn't get the password yet . so checked its
   format to continue the process. The format of data5.bin is tar so i used `tar -xvf` to extract the contents of the file and i got the file named
   data6.bin so cheked whether it has a password or not by displaying its contents using `cat` but it doesn'have the password so i checked its 
   format to continue the process .now it contains the format of bzip2 . Again i used `bzip2` to decompress the file data6.bin .then i used `cat` to
   check that whether the password is acquired or not .not the password is not acquired yet . so i continued the process by checking its format .
   The file `data6.bin.out` had the format of tar . so i used tar again to extract the contents of the file and i got the file named data8.bin and
   i used cat to display the contents of the file `data8.bin` to check for the password but the password is not acquired yet .so i checked its
   format again to continue the process (at this point i was tired of doing this process over and over ) .now it is in gzip format .so used `gzip -d`
   to decompress it once again .and i Finally got the password for next level . I copied the password to local machine . exited this level by pressin
   `ctrl + d`.

| commands | usage |
|----------|-------|
| bzip2 | a utility used for compression and decompression |
| -d | tell the bzip2 to decompress |
| gzip | a utility used for compressiona and decompression |
| -d | tells gzip to decompress the file |
| tar  | An archiving utility |
| xxd | used to make a hex dump of a file |
| -r | tells xxd to do restore the data |
| mktemp | used to create a temporary file or directory |
| -d | tells mktemp to create a directory |
---

## What I Learned
 * I learend about compression and decompression.
 * I learned about file extensions and file types .

---

## References
 * website - https://overthewire.org/wargames/bandit/bandit13.html
 * man - tar, gzip, bzip2 .

---

## New Concepts
 * temporary directory , compression and decompression.

---

## Notes

  * UserName - bandit12
  * hostname - bandit.labs.overthewire.org
