# Helper Scripts

These scripts automate repetitive tasks while solving CTF challenges.

## new_writeup.sh

Creates a new markdown write-up from the template and opens it in Neovim.

### Usage

```bash
./new_writeup.sh Bandit6
```

This creates

```
Bandit6.md
```

using `ctf_write.template`.

---

## next_lvl.sh

Connects to an OverTheWire Bandit level over SSH.

### Usage

```bash
./next_lvl.sh bandit5
```

This is equivalent to

```bash
ssh -p 2220 bandit5@bandit.labs.overthewire.org
```
