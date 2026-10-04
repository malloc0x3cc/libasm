# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: madelwau <madelwau@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/11/05 21:13:28 by madelwau          #+#    #+#              #
#    Updated: 2026/05/06 13:30:22 by madelwau         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SHELL	:= /bin/sh

NAME	:= libasm.a

AS		:= nasm
ifeq ($(shell uname),Linux)
	ASFLAGS	:= -f elf64
else
	ASFLAGS	:= -f macho64
endif
CC		:= cc
CFLAGS	:= -Wall -Wextra -Werror -I. -MMD -MP
AR		:= ar
ARFLAGS	:= rcs

SRCS	:= ft_strlen.s

OBJS	:= $(addprefix $(OBJ_DIR), $(SRCS:.c=.o))
OBJ_DIR	:= .obj/
DEPS	:= $(OBJS:.o=.d)

ifeq ($(filter bonus,$(MAKECMDGOALS)),bonus)
	#SRCS	= 
	MODE	= bonus
else
	MODE    = mandatory
endif
bonus: all

all: $(NAME)

$(NAME): $(OBJS)
	@$(AR) $(ARFLAGS) $(NAME) $(OBJS)
	@printf "$(COL_Y)[DONE] $(NAME) ($(MODE))$(COL_0)\n"

$(OBJ_DIR)%.o: %.c
	@mkdir -p $(dir $@)
	@$(CC) $(CFLAGS) -c $< -o $@ \
		&& printf "$(COL_G)[OK]$(COL_0) %-42s -> %s\n" "$<" "$@"

clean:
	@rm -rf $(OBJ_DIR);
	@printf "$(COL_R)[RM]$(COL_0) $(OBJ_DIR)\n"

fclean: clean
	@rm -f $(NAME)
	@ printf "$(COL_R)[RM]$(COL_0) $(COL_B)$(NAME)$(COL_0)\n"

re: fclean all

.PHONY: all clean fclean re
-include $(DEPS)

# Colors
COL_R   = \033[1;31m
COL_G   = \033[1;32m
COL_B   = \033[1;34m
COL_Y   = \033[1;33m
COL_0   = \033[0m
