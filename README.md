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

int ft_strlen(const char *s);

int main(int ac, char **av)
{
    if (ac >= 2)
    {
        printf("ft: %d\nstd: %ld\n", ft_strlen(av[1]), strlen(av[1]));
    }
    return 0;
}
```
### Build / run
```sh
% make
% gcc -Wall -Werror -Wextra test.c -L. -lasm
% ./a.out "asdf"
```
Ressources
----------
