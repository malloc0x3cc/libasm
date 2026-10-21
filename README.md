*This project has __NOT__ been created as part of the 42 curriculum by madelwau*

libasm
======
Description
-----------
LibASM is a small library written in pure 64-bit Assembly (Intel syntax). The goal of this project is to get familiar with assembly language (`x86_64`), the System V AMD64 ABI calling convention, CPU registers, stack frame alignment, and direct Linux system calls (`syscall`).
The mandatory functions to recreate are `strlen`, `strcpy`, `strcmp`, `write`, `read` and `strdup`.

### Mandatory part
Recreation of standard C library functions:
- `ft_strlen` — Calculates the length of a null-terminated string (`man 3 strlen`).
- `ft_strcpy` — Copies a string from source to destination (`man 3 strcpy`).
- `ft_strcmp` — Compares two strings lexicographically (`man 3 strcmp`).
- `ft_write` — Writes data to a file descriptor and sets `errno` on failure (`man 2 write`).
- `ft_read` — Reads data from a file descriptor and sets `errno` on failure (`man 2 read`).
- `ft_strdup` — Duplicates a string using heap allocation (`man 3 strdup`).

### Bonus Part
Utilities for base conversion and linked lists (`t_list`):
- `ft_atoi_base` — Converts a string to an integer according to a custom base.
- `ft_list_push_front` — Adds a new element at the beginning of a linked list.
- `ft_list_size` — Returns the total count of elements in a linked list.
- `ft_list_sort` — Sorts a linked list using a comparison function pointer.
- `ft_list_remove_if` — Removes all matching elements from a linked list using comparison and free function pointers.

### Technical Notes

#### Calling Convention (System V AMD64 ABI)
- **Integer/Pointer Arguments**:
  1. `RDI`
  2. `RSI`
  3. `RDX`
  4. `RCX`
  5. `R8`
  6. `R9`
- **Return Value**: `RAX` (and `RDX` for 128-bit values).
- **Callee-Saved Registers** (must be preserved across calls): `RBX`, `RSP`, `RBP`, `R12`, `R13`, `R14`, `R15`.
- **Caller-Saved Registers** (can be overwritten by calls): `RAX`, `RCX`, `RDX`, `RSI`, `RDI`, `R8`, `R9`, `R10`, `R11`.
- **Stack Alignment**: The stack pointer (`RSP`) must be aligned to a 16-byte boundary before issuing any `call` instruction.

#### Error Handling & `errno`
Linux system calls return an error code between `-1` and `-4095` directly in `RAX` on failure (representing `-errno`).
To match libc behavior:
1. Detect negative return values (`rax < 0`).
2. Negate `RAX` to get the positive error code.
3. Call `__errno_location wrt ..plt` to obtain the memory address of `errno`.
4. Store the error code at `[rax]`.
5. Return `-1`.

Instructions
------------
### Prerequisites
- `nasm` (Netwide Assembler)
- `gcc` / `clang`
- `make`
### Building the library
```sh
% make
```
### Usage exemple
```sh
% gcc -Wall -Werror -Wextra -no-pie test.c -L. -lasm
% ./a.out
```
Ressources
----------
- [Books] Art Of Intel x86 Assembly (No Starch Press)
- [[YouTube] Mxy - Learn Assembly for Beginners](https://www.youtube.com/playlist?list=PL9o2C-4xGfjHl5PF-Xt-yWH2zc4wjJ3AW)

AI Usage
--------
AI was used for documentation, debug and to generate tests.
