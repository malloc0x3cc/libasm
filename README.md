*This project has __NOT__ been created as part of the 42 curriculum by madelwau*

libasm
======
Description
-----------
LibASM is a small library written in pure 64-bit Assembly (Intel syntax).
The mandatory functions to recreate are `strlen`, `strcpy`, `strcmp`, `write`, `read` and `strdup`.

Instructions
------------
### Build / run
```sh
% make
% gcc -Wall -Werror -Wextra -no-pie test.c -L. -lasm
% ./a.out "Hello, World" "The quick brown fox jumps over the lazy dog."
```
Ressources
----------
- [Books] Art Of Intel x86 Assembly (No Starch Press)
- [[YouTube] Mxy - Learn Assembly for Beginners](https://www.youtube.com/playlist?list=PL9o2C-4xGfjHl5PF-Xt-yWH2zc4wjJ3AW)
