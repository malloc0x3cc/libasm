; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strlen.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: madelwau <madelwau@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2026/10/05 20:58:05 by madelwau          #+#    #+#              ;
;    Updated: 2026/10/06 19:13:14 by madelwau         ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

global ft_strlen
section .text

ft_strlen:
	xor rax, rax			; int rax = 0;
.loop:						; while (1) {
	cmp byte [rdi + rax], 0	; 	if (*s++ == '\0')
	je .end					; 		break;
	inc rax					; 	rax++;
	jmp .loop				;	continue ;
.end:						; }
	ret						; return rax;
