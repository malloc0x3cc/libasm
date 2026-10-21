; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strdup.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: madelwau <madelwau@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2026/10/21 19:20:57 by madelwau          #+#    #+#              ;
;    Updated: 2026/10/21 19:24:07 by madelwau         ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

global ft_strdup
extern malloc
extern __errno_location
extern ft_strlen
extern ft_strcpy

section .text
ft_strdup:
	test rdi, rdi
	jz .error_null
	push rbx
	mov rbx, rdi
	call ft_strlen
	inc rax
	mov rdi, rax
	call malloc wrt ..plt
	test rax, rax
	jz .malloc_error
	mov rdi, rax
	mov rsi, rbx
	call ft_strcpy
.malloc_error:
	pop rbx
	ret
.error_null:
	xor rax, rax
	ret
