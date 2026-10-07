; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strcmp.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: madelwau <madelwau@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2026/10/07 02:28:18 by madelwau          #+#    #+#              ;
;    Updated: 2026/10/07 02:37:37 by madelwau         ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

global ft_strcmp
section .text

ft_strcmp:
.loop:
	movzx eax, byte [rdi]	; eax = (unsigned char)*s1
	movzx edx, byte [rsi]	; edx = (unsigned char)*s2
	cmp al, dl				; if (*s1 != *s2)
	jne .done				; break
	test al, al				; cmp al, 0
	jz .done
	inc rdi
	inc rsi
	jmp .loop
.done:
	sub eax, edx
	ret
