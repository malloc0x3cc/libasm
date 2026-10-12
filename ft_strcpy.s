; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strcpy.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: madelwau <madelwau@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2026/10/13 00:43:36 by madelwau          #+#    #+#              ;
;    Updated: 2026/10/13 00:52:20 by madelwau         ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

global ft_strcpy
section .text

ft_strcpy:
	mov rax, rdi
.loop:
	mov dl, byte [rsi]
	mov byte [rdi], dl
	test dl, dl
	jz .end
	inc rsi
	inc rdi
	jmp .loop
.end:
	ret
