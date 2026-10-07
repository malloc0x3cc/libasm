*This project has __NOT__ been created as part of the 42 curriculum by madelwau*

libasm
======
Description
-----------
LibASM is a small library written in pure 64-bit Assembly (Intel syntax).
The mandatory functions to recreate are `strlen`, `strcpy`, `strcmp`, `write`, `read` and `strdup`.

Instructions
------------
### Example test file
```c
#include <stdio.h>
#include <string.h>
#include <stddef.h>

size_t  ft_strlen(const char *s);
int     ft_strcmp(const char *s1, const char *s2);

int     main(int ac, char **av)
{
    if (ac >= 2)
    {
        printf("-- STRLEN --\nlibasm: av[1] = %ld, av[2] = %ld\nlibc: av[1] = %ld, av[2] = %ld\n",
            ft_strlen(av[1]), ft_strlen(av[2]), strlen(av[1]), strlen(av[2]));
        printf("-- STRCMP --\nlibasm: %d\nlibc: %d\n", ft_strcmp(av[1], av[2]), strcmp(av[1], av[2]));
    }
    return (0);
}
```
### Build / run
```sh
% make
% gcc -Wall -Werror -Wextra test.c -L. -lasm
% ./a.out "Hello, World" "The quick brown fox jumps over the lazy dog."
```
Ressources
----------
- [Books] Art Of Intel x86 Assembly (No Starch Press)
- [[YouTube] Mxy - Learn Assembly for Beginners](https://www.youtube.com/playlist?list=PL9o2C-4xGfjHl5PF-Xt-yWH2zc4wjJ3AW)
