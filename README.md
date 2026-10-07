*This project has __NOT__ been created as part of the 42 curriculum by madelwau*

libasm
======
Description
-----------
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
        printf("-- STRLEN --\nft: av[1] = %ld, av[2] = %ld\nstd: av[1] = %ld, av[2] = %ld\n",
            ft_strlen(av[1]), ft_strlen(av[2]), strlen(av[1]), strlen(av[2]));
        printf("-- STRCMP --\nft: %d\nstd: %d\n", ft_strcmp(av[1], av[2]), strcmp(av[1], av[2]));
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
