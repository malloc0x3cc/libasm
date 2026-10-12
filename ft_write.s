; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_write.s                                         :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: madelwau <madelwau@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2026/10/08 01:05:19 by madelwau          #+#    #+#              ;
;    Updated: 2026/10/13 01:34:33 by madelwau         ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

global	ft_write
extern	__errno_location
section .text

ft_write:
	mov rax, 1
	syscall
	cmp rax, 0
	jl .error
	ret
.error:
	neg rax
	push rax
	call __errno_location wrt ..plt
	pop qword [rax]
	mov rax, -1
	ret
