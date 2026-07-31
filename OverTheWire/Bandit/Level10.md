---
Platform: OverTheWire 
Game: Bandit
Level: 10
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
 The password for the next level is stored in the file data.txt in one of the few human-readable strings, preceded by several ‘=’ characters.
 Acquire the password required for the next level .

## Platform
 * OverTheWire

## Level
 * Level09

## Difficulty
 * bandit - beginner 

---

## Objective
 * Acquire the password for the next level .
 * Learn new commands .Revise commands learned in the previous levels.

---

## Skills Practiced
 * SSH
 * Terminal
 * Patience
 * ls , cat , strings , grep , sed
 * Nvim and Tmux 

---

## Tools Used
 * SSH
 * Terminal
 * Nvim and Tmux
 * commands - ssh , ls , cat , strings , grep , sed 

---

## Observations
 * The file containing the password kept directly under the home dir .

---

## Commands Used
<details>
<summar> Terminal output: ./next_lvl.sh bandit9 </summary>

```bash
❯ ./next_lvl.sh bandit9
                         _                     _ _ _   
                        | |__   __ _ _ __   __| (_) |_ 
                        | '_ \ / _` | '_ \ / _` | | __|
                        | |_) | (_| | | | | (_| | | |_ 
                        |_.__/ \__,_|_| |_|\__,_|_|\__|
                                                       

                      This is an OverTheWire game server. 
            More information on http://www.overthewire.org/wargames

backend: gibson-1
bandit9@bandit.labs.overthewire.org's password: 
```
</details>
   
  * I Logged into the level bandit9 using the password i acquired in the previous level .

<details>
<summary> Terminal Output : `ls -la` </summary>

``` bash
bandit9@bandit:~$ ls -la
total 40
drwxr-xr-x   2 root     root     4096 Jun 24 14:58 .
drwxr-xr-x 150 root     root     4096 Jun 24 15:02 ..
-rw-r--r--   1 root     root      220 Feb 13 12:16 .bash_logout
-rw-r--r--   1 root     root     3851 Jun 24 14:50 .bashrc
-rw-r--r--   1 root     root      807 Feb 13 12:16 .profile
-rw-r-----   1 bandit10 bandit9 19382 Jun 24 14:58 data.txt
bandit9@bandit:~$ 
```
</details>
 
  *  I used the command `ls -la` to list all the files and folders including the hidden ones in the list format .
     I used This command before using the command ` find ` because the file i am looking for could be already
     in the `home` directory .Here the -a isn't necessary because the file i am looking for is not hidden .if it 
     were they would have mentioned it is `.data.txt.`
    
<details>
<summary> Terminal Output : cat data.txt </summary>

``` bash
bandit9@bandit:~$ cat data.txt 
4k�c�)��~(-�~ʅp�+w&$DNn@6^(��ٜ�c��?�QMԸ:Af��A|���oQ�Hz"(7�`>,	�>93�7	��JD[�K"�M:(v_ 'e",OiKW�@c�8E�����#7v/�m��h�W�;;\v��D_9�z�������?�i�d׸\C�iҪ�
?=�e.ȖBW��W��B5^X���KSb!b�`�D�1�Jߊ���f��99*h!vk-G�F"�ݡ~�⠿kI[�� %�v}}�+ a�{�<'��!=뢯��(9��I��a̾B                                                              sq"V.E�i8e�M3{ Z!�4�Hx�t�Z|�0}�ǂ:1x8k>3ɵ�&g���ίR-hDUJ/Bq�����oѼ{�TW15�,Xk<�:R�ӔB]~N�VE��߈sk���Z�v��x���                                                       6��/�f Ӓ�G֬)eW[���jG��|X�+r67d��~ѣDBFQՖ�k��oy��<q{qӼוZ���[�� �`l�fW���h�a WYXt�3�"��vI�)ME�b1"܋��e�1E
# note i didn't put the full output of the command cat data.txt because it is too large .

```
</details>

  * I displayed the contents of the file data.txt using the command ` cat data.txt ` . because i wanted to see what it contains eventhough
  they implied that it contains characters that can't be read by humans.

<details>
<summary> Terminal Output : strings data.txt </summary>

``` bash
bandit9@bandit:~$ strings data.txt
v 9m
~.[o
7cb'
?+APs
qDa%;
DpxVr^>
oEAcs
Klw)N
F~~T
N{BB1
>W{G

```
</details>

  * I used the command ` strings data.txt ` to display all the strings that can be read by human since our password is one of those strings
    Preceded by several '='.

<details>
<summary> Terminal Output : strings data.txt | grep '=' </summary>

``` bash
bandit9@bandit:~$ strings data.txt | grep '='
========== the
[==p+
=zW}
========== password
Y========== is
k8c=
yo=-
=A@.
.=O],
=l"C"m
j=9$
========== B0s2khmbT9u0geKuOoVGW3JZKhndE3BG
'=5G
bandit9@bandit:~$ 
```
</details>

  * I used ` grep ` to filter out the lines which contains the character `=` because the password is preceeded by several `=` characters.
    Here i found the password but i don't want to stop here because i noticed the strings `the , password , is `.if i removed the things
    inbetween them the output would obvious and pretty .

<details>
<summary> Terminal Ouput : strings data.txt -n 10 | grep '=' | sed 's/Y=/=/g' </summary>

``` bash
bandit9@bandit:~$ strings data.txt -n 10 | grep '=' | sed 's/Y=/=/g'
========== the
========== password
========== is
========== B0s2khmbT9u0geKuOoVGW3JZKhndE3BG
bandit9@bandit:~$ 

```
</details>

| commands | usage |
|----------|-------|
| strings | A utility used to print the printable characters in a file |
| -n | A option used to print the string with minimum lenght specified |

---

## What I Learned
  * I learned how to use the command `string` and its options `-n`

---

## References
 * website - https://overthewire.org/wargames/bandit/bandit10.html

---

## New Concepts


---

## Notes
 Hostname : bandit.labs.overthewire.org
 username : bandit9
