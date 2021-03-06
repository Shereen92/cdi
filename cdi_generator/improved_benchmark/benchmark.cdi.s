	.file	"benchmark.c"
	.text
.Ltext0:
	.local	num
	.comm	num,16,16
	.local	count
	.comm	count,8,8
	.type	mov, @function
mov:
.globl	benchmark.s.mov
benchmark.s.mov:
.LFB0:
	.file 1 "benchmark.c"
	.loc 1 12 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	movl	%esi, -24(%rbp)
	movl	%edx, -28(%rbp)
	.loc 1 14 0
	cmpl	$1, -20(%rbp)
	jne	.L2
	.loc 1 16 0
	movl	-24(%rbp), %eax
	cltq
	movl	num(,%rax,4), %eax
	leal	-1(%rax), %edx
	movl	-24(%rbp), %eax
	cltq
	movl	%edx, num(,%rax,4)
	.loc 1 17 0
	movl	-28(%rbp), %eax
	cltq
	movl	num(,%rax,4), %eax
	leal	1(%rax), %edx
	movl	-28(%rbp), %eax
	cltq
	movl	%edx, num(,%rax,4)
	.loc 1 18 0
	movq	count(%rip), %rax
	addq	$1, %rax
	movq	%rax, count(%rip)
	.loc 1 19 0
	movl	$0, %eax
	jmp	.L3
.L2:
	.loc 1 21 0
	movl	-28(%rbp), %eax
	movl	-24(%rbp), %edx
	addl	%eax, %edx
	movl	$6, %eax
	subl	%edx, %eax
	movl	%eax, -4(%rbp)
	.loc 1 22 0
	movl	-20(%rbp), %eax
	leal	-1(%rax), %ecx
	movl	-4(%rbp), %edx
	movl	-24(%rbp), %eax
	movl	%eax, %esi
	movl	%ecx, %edi
	call	mov
_CDI_benchmark.s.mov_TO_benchmark.s.mov_1:
	.loc 1 23 0
	movl	-28(%rbp), %edx
	movl	-24(%rbp), %eax
	movl	%eax, %esi
	movl	$1, %edi
	call	mov
_CDI_benchmark.s.mov_TO_benchmark.s.mov_2:
	.loc 1 24 0
	movl	-20(%rbp), %eax
	leal	-1(%rax), %ecx
	movl	-28(%rbp), %edx
	movl	-4(%rbp), %eax
	movl	%eax, %esi
	movl	%ecx, %edi
	call	mov
_CDI_benchmark.s.mov_TO_benchmark.s.mov_3:
	.loc 1 25 0
	movl	$0, %eax
.L3:
	.loc 1 26 0
	leave
	.cfi_def_cfa 7, 8
	addq $8, %rsp
	cmpq	$_CDI_benchmark.s.mov_TO_benchmark.s.hanoi_main_1, -8(%rsp)
	je	_CDI_benchmark.s.mov_TO_benchmark.s.hanoi_main_1
	cmpq	$_CDI_benchmark.s.mov_TO_benchmark.s.mov_1, -8(%rsp)
	je	_CDI_benchmark.s.mov_TO_benchmark.s.mov_1
	cmpq	$_CDI_benchmark.s.mov_TO_benchmark.s.mov_2, -8(%rsp)
	je	_CDI_benchmark.s.mov_TO_benchmark.s.mov_2
	cmpq	$_CDI_benchmark.s.mov_TO_benchmark.s.mov_3, -8(%rsp)
	je	_CDI_benchmark.s.mov_TO_benchmark.s.mov_3
	movq	 $.CDI_sled_id_6, %rsi
	movq	$.CDI_sled_id_6_len, %rdx
	call	_CDI_abort
.CDI_sled_id_6:
	.string	"benchmark.c:26:0:benchmark.s id=6"
	.set	.CDI_sled_id_6_len, .-.CDI_sled_id_6
	.cfi_endproc
.LFE0:
	.size	mov, .-mov
	.section	.rodata
	.align 8
.LC0:
	.string	"Towers of Hanoi Puzzle Test Program\n"
.LC1:
	.string	"Disks     Moves\n"
.LC2:
	.string	"%3d  %04X%04X\n"
	.text
	.globl	hanoi_main
	.type	hanoi_main, @function
hanoi_main:
.globl	benchmark.s.hanoi_main
benchmark.s.hanoi_main:
.LFB1:
	.loc 1 30 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	.loc 1 31 0
	movl	$0, -4(%rbp)
	.loc 1 33 0
	movl	$.LC0, %edi
	movl	$0, %eax
	call	tfp_printf
.globl	_CDI_printf.s.tfp_printf_TO_benchmark.s.hanoi_main_1
_CDI_printf.s.tfp_printf_TO_benchmark.s.hanoi_main_1:
	.loc 1 34 0
	movl	$.LC1, %edi
	movl	$0, %eax
	call	tfp_printf
.globl	_CDI_printf.s.tfp_printf_TO_benchmark.s.hanoi_main_2
_CDI_printf.s.tfp_printf_TO_benchmark.s.hanoi_main_2:
	.loc 1 36 0
	movl	$0, -8(%rbp)
.L7:
	.loc 1 40 0
	addl	$1, -8(%rbp)
	.loc 1 41 0
	movl	$0, num(%rip)
	.loc 1 42 0
	movl	-8(%rbp), %eax
	movl	%eax, num+4(%rip)
	.loc 1 43 0
	movl	$0, num+8(%rip)
	.loc 1 44 0
	movl	$0, num+12(%rip)
	.loc 1 45 0
	movq	$0, count(%rip)
	.loc 1 47 0
	movl	-8(%rbp), %eax
	movl	$3, %edx
	movl	$1, %esi
	movl	%eax, %edi
	call	mov
_CDI_benchmark.s.mov_TO_benchmark.s.hanoi_main_1:
	.loc 1 49 0
	addl	$1, -4(%rbp)
	.loc 1 50 0
	movq	count(%rip), %rax
	movzwl	%ax, %edx
	movq	count(%rip), %rax
	sarq	$16, %rax
	movq	%rax, %rsi
	movl	-8(%rbp), %eax
	movq	%rdx, %rcx
	movq	%rsi, %rdx
	movl	%eax, %esi
	movl	$.LC2, %edi
	movl	$0, %eax
	call	tfp_printf
.globl	_CDI_printf.s.tfp_printf_TO_benchmark.s.hanoi_main_3
_CDI_printf.s.tfp_printf_TO_benchmark.s.hanoi_main_3:
	.loc 1 52 0
	cmpl	$30, -8(%rbp)
	jne	.L5
	.loc 1 52 0 is_stmt 0 discriminator 1
	jmp	.L9
.L5:
	.loc 1 53 0 is_stmt 1
	jmp	.L7
.L9:
	.loc 1 54 0
	movl	$0, %eax
	.loc 1 55 0
	leave
	.cfi_def_cfa 7, 8
	addq $8, %rsp
	cmpq	$_CDI_benchmark.s.hanoi_main_TO_benchmark.s.main_1, -8(%rsp)
	je	_CDI_benchmark.s.hanoi_main_TO_benchmark.s.main_1
	cmpq	$_CDI_benchmark.s.hanoi_main_TO_benchmark.s.cipher_main_1, -8(%rsp)
	je	_CDI_benchmark.s.hanoi_main_TO_benchmark.s.cipher_main_1
	movq	 $.CDI_sled_id_7, %rsi
	movq	$.CDI_sled_id_7_len, %rdx
	call	_CDI_abort
.CDI_sled_id_7:
	.string	"benchmark.c:55:0:benchmark.s id=7"
	.set	.CDI_sled_id_7_len, .-.CDI_sled_id_7
	.cfi_endproc
.LFE1:
	.size	hanoi_main, .-hanoi_main
	.globl	encipher
	.type	encipher, @function
encipher:
.globl	benchmark.s.encipher
benchmark.s.encipher:
.LFB2:
	.loc 1 63 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -56(%rbp)
	movq	%rsi, -64(%rbp)
	movq	%rdx, -72(%rbp)
	.loc 1 64 0
	movq	-56(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, -36(%rbp)
	movq	-56(%rbp), %rax
	movl	4(%rax), %eax
	movl	%eax, -32(%rbp)
	movl	$0, -28(%rbp)
	movl	$-1640531527, -20(%rbp)
	.loc 1 65 0
	movq	-72(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, -16(%rbp)
	movq	-72(%rbp), %rax
	movl	4(%rax), %eax
	movl	%eax, -12(%rbp)
	movq	-72(%rbp), %rax
	movl	8(%rax), %eax
	movl	%eax, -8(%rbp)
	movq	-72(%rbp), %rax
	movl	12(%rax), %eax
	movl	%eax, -4(%rbp)
	movl	$32, -24(%rbp)
	.loc 1 67 0
	jmp	.L11
.L12:
	.loc 1 69 0
	movl	-20(%rbp), %eax
	addl	%eax, -28(%rbp)
	.loc 1 70 0
	movl	-32(%rbp), %eax
	sall	$4, %eax
	movl	%eax, %edx
	movl	-16(%rbp), %eax
	leal	(%rdx,%rax), %ecx
	movl	-28(%rbp), %eax
	movl	-32(%rbp), %edx
	addl	%edx, %eax
	xorl	%eax, %ecx
	movl	%ecx, %edx
	movl	-32(%rbp), %eax
	shrl	$5, %eax
	movl	%eax, %ecx
	movl	-12(%rbp), %eax
	addl	%ecx, %eax
	xorl	%edx, %eax
	addl	%eax, -36(%rbp)
	.loc 1 71 0
	movl	-36(%rbp), %eax
	sall	$4, %eax
	movl	%eax, %edx
	movl	-8(%rbp), %eax
	leal	(%rdx,%rax), %ecx
	movl	-28(%rbp), %eax
	movl	-36(%rbp), %edx
	addl	%edx, %eax
	xorl	%eax, %ecx
	movl	%ecx, %edx
	movl	-36(%rbp), %eax
	shrl	$5, %eax
	movl	%eax, %ecx
	movl	-4(%rbp), %eax
	addl	%ecx, %eax
	xorl	%edx, %eax
	addl	%eax, -32(%rbp)
.L11:
	.loc 1 67 0 discriminator 1
	movl	-24(%rbp), %eax
	leal	-1(%rax), %edx
	movl	%edx, -24(%rbp)
	testl	%eax, %eax
	jne	.L12
	.loc 1 73 0
	movq	-64(%rbp), %rax
	movl	-36(%rbp), %edx
	movl	%edx, (%rax)
	movq	-64(%rbp), %rax
	leaq	4(%rax), %rdx
	movl	-32(%rbp), %eax
	movl	%eax, (%rdx)
	.loc 1 74 0
	popq	%rbp
	.cfi_def_cfa 7, 8
	addq $8, %rsp
	cmpq	$_CDI_benchmark.s.encipher_TO_benchmark.s.cipher_main_1, -8(%rsp)
	je	_CDI_benchmark.s.encipher_TO_benchmark.s.cipher_main_1
	cmpq	$_CDI_benchmark.s.encipher_TO_benchmark.s.cipher_main_2, -8(%rsp)
	je	_CDI_benchmark.s.encipher_TO_benchmark.s.cipher_main_2
	movq	 $.CDI_sled_id_8, %rsi
	movq	$.CDI_sled_id_8_len, %rdx
	call	_CDI_abort
.CDI_sled_id_8:
	.string	"benchmark.c:74:0:benchmark.s id=8"
	.set	.CDI_sled_id_8_len, .-.CDI_sled_id_8
	.cfi_endproc
.LFE2:
	.size	encipher, .-encipher
	.globl	decipher
	.type	decipher, @function
decipher:
.globl	benchmark.s.decipher
benchmark.s.decipher:
.LFB3:
	.loc 1 80 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -56(%rbp)
	movq	%rsi, -64(%rbp)
	movq	%rdx, -72(%rbp)
	.loc 1 81 0
	movq	-56(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, -36(%rbp)
	movq	-56(%rbp), %rax
	movl	4(%rax), %eax
	movl	%eax, -32(%rbp)
	movl	$-957401312, -28(%rbp)
	movl	$-1640531527, -20(%rbp)
	.loc 1 82 0
	movq	-72(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, -16(%rbp)
	movq	-72(%rbp), %rax
	movl	4(%rax), %eax
	movl	%eax, -12(%rbp)
	movq	-72(%rbp), %rax
	movl	8(%rax), %eax
	movl	%eax, -8(%rbp)
	movq	-72(%rbp), %rax
	movl	12(%rax), %eax
	movl	%eax, -4(%rbp)
	movl	$32, -24(%rbp)
	.loc 1 85 0
	jmp	.L14
.L15:
	.loc 1 87 0
	movl	-36(%rbp), %eax
	sall	$4, %eax
	movl	%eax, %edx
	movl	-8(%rbp), %eax
	leal	(%rdx,%rax), %ecx
	movl	-28(%rbp), %eax
	movl	-36(%rbp), %edx
	addl	%edx, %eax
	xorl	%eax, %ecx
	movl	%ecx, %edx
	movl	-36(%rbp), %eax
	shrl	$5, %eax
	movl	%eax, %ecx
	movl	-4(%rbp), %eax
	addl	%ecx, %eax
	xorl	%edx, %eax
	subl	%eax, -32(%rbp)
	.loc 1 88 0
	movl	-32(%rbp), %eax
	sall	$4, %eax
	movl	%eax, %edx
	movl	-16(%rbp), %eax
	leal	(%rdx,%rax), %ecx
	movl	-28(%rbp), %eax
	movl	-32(%rbp), %edx
	addl	%edx, %eax
	xorl	%eax, %ecx
	movl	%ecx, %edx
	movl	-32(%rbp), %eax
	shrl	$5, %eax
	movl	%eax, %ecx
	movl	-12(%rbp), %eax
	addl	%ecx, %eax
	xorl	%edx, %eax
	subl	%eax, -36(%rbp)
	.loc 1 89 0
	movl	-20(%rbp), %eax
	subl	%eax, -28(%rbp)
.L14:
	.loc 1 85 0 discriminator 1
	movl	-24(%rbp), %eax
	leal	-1(%rax), %edx
	movl	%edx, -24(%rbp)
	testl	%eax, %eax
	jne	.L15
	.loc 1 91 0
	movq	-64(%rbp), %rax
	movl	-36(%rbp), %edx
	movl	%edx, (%rax)
	movq	-64(%rbp), %rax
	leaq	4(%rax), %rdx
	movl	-32(%rbp), %eax
	movl	%eax, (%rdx)
	.loc 1 92 0
	popq	%rbp
	.cfi_def_cfa 7, 8
	addq $8, %rsp
	cmpq	$_CDI_benchmark.s.decipher_TO_benchmark.s.cipher_main_1, -8(%rsp)
	je	_CDI_benchmark.s.decipher_TO_benchmark.s.cipher_main_1
	cmpq	$_CDI_benchmark.s.decipher_TO_benchmark.s.cipher_main_2, -8(%rsp)
	je	_CDI_benchmark.s.decipher_TO_benchmark.s.cipher_main_2
	movq	 $.CDI_sled_id_9, %rsi
	movq	$.CDI_sled_id_9_len, %rdx
	call	_CDI_abort
.CDI_sled_id_9:
	.string	"benchmark.c:92:0:benchmark.s id=9"
	.set	.CDI_sled_id_9_len, .-.CDI_sled_id_9
	.cfi_endproc
.LFE3:
	.size	decipher, .-decipher
	.globl	keytext
	.data
	.align 16
	.type	keytext, @object
	.size	keytext, 16
keytext:
	.long	358852050
	.long	311606025
	.long	739108171
	.long	861449956
	.globl	plaintext
	.align 4
	.type	plaintext, @object
	.size	plaintext, 8
plaintext:
	.long	765625614
	.long	14247501
	.globl	cipherref
	.align 4
	.type	cipherref, @object
	.size	cipherref, 8
cipherref:
	.long	-1612527516
	.long	-673559132
	.comm	ciphertext,8,4
	.comm	newplain,8,4
	.section	.rodata
.LC3:
	.string	"TEA Cipher results:\n"
	.align 8
.LC4:
	.string	"  plaintext:  0x%04X%04X 0x%04X%04X\n"
	.align 8
.LC5:
	.string	"  ciphertext: 0x%04X%04X 0x%04X%04X\n"
	.align 8
.LC6:
	.string	"  newplain:   0x%04X%04X 0x%04X%04X\n"
	.text
	.globl	cipher_main
	.type	cipher_main, @function
cipher_main:
.globl	benchmark.s.cipher_main
benchmark.s.cipher_main:
.LFB4:
	.loc 1 103 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	.loc 1 107 0
	movq	$encipher, -8(%rbp)
	.loc 1 108 0
	movq	-8(%rbp), %rax
	movl	$keytext, %edx
	movl	$ciphertext, %esi
	movl	$plaintext, %edi
1:
	cmpq	$benchmark.s.decipher, %rax
	jne	1f
	call	benchmark.s.decipher
_CDI_benchmark.s.decipher_TO_benchmark.s.cipher_main_1:
	jmp	2f
1:
	cmpq	$benchmark.s.encipher, %rax
	jne	1f
	call	benchmark.s.encipher
_CDI_benchmark.s.encipher_TO_benchmark.s.cipher_main_1:
	jmp	2f
1:
	movq	 $.CDI_sled_id_10, %rsi
	movq	$.CDI_sled_id_10_len, %rdx
	call	_CDI_abort
.CDI_sled_id_10:
	.string	"benchmark.c:108:0:benchmark.s id=10"
	.set	.CDI_sled_id_10_len, .-.CDI_sled_id_10
2:
	.loc 1 109 0
	movl	ciphertext(%rip), %edx
	movl	cipherref(%rip), %eax
	cmpl	%eax, %edx
	jne	.L17
	.loc 1 109 0 is_stmt 0 discriminator 1
	movl	ciphertext+4(%rip), %edx
	movl	cipherref+4(%rip), %eax
	cmpl	%eax, %edx
	je	.L18
.L17:
	.loc 1 110 0 is_stmt 1
	movl	$1, %eax
	jmp	.L19
.L18:
	.loc 1 111 0
	movq	$decipher, -8(%rbp)
	.loc 1 112 0
	movq	-8(%rbp), %rax
	movl	$keytext, %edx
	movl	$newplain, %esi
	movl	$ciphertext, %edi
1:
	cmpq	$benchmark.s.decipher, %rax
	jne	1f
	call	benchmark.s.decipher
_CDI_benchmark.s.decipher_TO_benchmark.s.cipher_main_2:
	jmp	2f
1:
	cmpq	$benchmark.s.encipher, %rax
	jne	1f
	call	benchmark.s.encipher
_CDI_benchmark.s.encipher_TO_benchmark.s.cipher_main_2:
	jmp	2f
1:
	movq	 $.CDI_sled_id_11, %rsi
	movq	$.CDI_sled_id_11_len, %rdx
	call	_CDI_abort
.CDI_sled_id_11:
	.string	"benchmark.c:112:0:benchmark.s id=11"
	.set	.CDI_sled_id_11_len, .-.CDI_sled_id_11
2:
	.loc 1 113 0
	movl	newplain(%rip), %edx
	movl	plaintext(%rip), %eax
	cmpl	%eax, %edx
	jne	.L20
	.loc 1 113 0 is_stmt 0 discriminator 1
	movl	newplain+4(%rip), %edx
	movl	plaintext+4(%rip), %eax
	cmpl	%eax, %edx
	je	.L21
.L20:
	.loc 1 114 0 is_stmt 1
	movl	$1, %eax
	jmp	.L19
.L21:
	.loc 1 116 0
	movl	$.LC3, %edi
	movl	$0, %eax
	call	tfp_printf
.globl	_CDI_printf.s.tfp_printf_TO_benchmark.s.cipher_main_1
_CDI_printf.s.tfp_printf_TO_benchmark.s.cipher_main_1:
	.loc 1 119 0
	movl	plaintext+4(%rip), %eax
	.loc 1 117 0
	movzwl	%ax, %ecx
	.loc 1 119 0
	movl	plaintext+4(%rip), %eax
	.loc 1 117 0
	shrl	$16, %eax
	movl	%eax, %edx
	.loc 1 118 0
	movl	plaintext(%rip), %eax
	.loc 1 117 0
	movzwl	%ax, %eax
	.loc 1 118 0
	movl	plaintext(%rip), %esi
	.loc 1 117 0
	shrl	$16, %esi
	movl	%ecx, %r8d
	movl	%edx, %ecx
	movl	%eax, %edx
	movl	$.LC4, %edi
	movl	$0, %eax
	call	tfp_printf
.globl	_CDI_printf.s.tfp_printf_TO_benchmark.s.cipher_main_2
_CDI_printf.s.tfp_printf_TO_benchmark.s.cipher_main_2:
	.loc 1 122 0
	movl	ciphertext+4(%rip), %eax
	.loc 1 120 0
	movzwl	%ax, %ecx
	.loc 1 122 0
	movl	ciphertext+4(%rip), %eax
	.loc 1 120 0
	shrl	$16, %eax
	movl	%eax, %edx
	.loc 1 121 0
	movl	ciphertext(%rip), %eax
	.loc 1 120 0
	movzwl	%ax, %eax
	.loc 1 121 0
	movl	ciphertext(%rip), %esi
	.loc 1 120 0
	shrl	$16, %esi
	movl	%ecx, %r8d
	movl	%edx, %ecx
	movl	%eax, %edx
	movl	$.LC5, %edi
	movl	$0, %eax
	call	tfp_printf
.globl	_CDI_printf.s.tfp_printf_TO_benchmark.s.cipher_main_3
_CDI_printf.s.tfp_printf_TO_benchmark.s.cipher_main_3:
	.loc 1 125 0
	movl	newplain+4(%rip), %eax
	.loc 1 123 0
	movzwl	%ax, %ecx
	.loc 1 125 0
	movl	newplain+4(%rip), %eax
	.loc 1 123 0
	shrl	$16, %eax
	movl	%eax, %edx
	.loc 1 124 0
	movl	newplain(%rip), %eax
	.loc 1 123 0
	movzwl	%ax, %eax
	.loc 1 124 0
	movl	newplain(%rip), %esi
	.loc 1 123 0
	shrl	$16, %esi
	movl	%ecx, %r8d
	movl	%edx, %ecx
	movl	%eax, %edx
	movl	$.LC6, %edi
	movl	$0, %eax
	call	tfp_printf
.globl	_CDI_printf.s.tfp_printf_TO_benchmark.s.cipher_main_4
_CDI_printf.s.tfp_printf_TO_benchmark.s.cipher_main_4:
	.loc 1 126 0
	call	hanoi_main
_CDI_benchmark.s.hanoi_main_TO_benchmark.s.cipher_main_1:
	.loc 1 127 0
	movl	$0, %eax
.L19:
	.loc 1 128 0
	leave
	.cfi_def_cfa 7, 8
	addq $8, %rsp
	cmpq	$_CDI_benchmark.s.cipher_main_TO_benchmark.s.main_1, -8(%rsp)
	je	_CDI_benchmark.s.cipher_main_TO_benchmark.s.main_1
	movq	 $.CDI_sled_id_12, %rsi
	movq	$.CDI_sled_id_12_len, %rdx
	call	_CDI_abort
.CDI_sled_id_12:
	.string	"benchmark.c:128:0:benchmark.s id=12"
	.set	.CDI_sled_id_12_len, .-.CDI_sled_id_12
	.cfi_endproc
.LFE4:
	.size	cipher_main, .-cipher_main
	.globl	main
	.type	main, @function
main:
.globl	benchmark.s.main
benchmark.s.main:
.LFB5:
	.loc 1 132 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	.loc 1 133 0
	call	hanoi_main
_CDI_benchmark.s.hanoi_main_TO_benchmark.s.main_1:
	.loc 1 134 0
	call	cipher_main
_CDI_benchmark.s.cipher_main_TO_benchmark.s.main_1:
	.loc 1 135 0
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	main, .-main
.Letext0:
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x390
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF17
	.byte	0x1
	.long	.LASF18
	.long	.LASF19
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF0
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF1
	.uleb128 0x3
	.string	"mov"
	.byte	0x1
	.byte	0xb
	.long	0x8d
	.quad	.LFB0
	.quad	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.long	0x8d
	.uleb128 0x4
	.string	"n"
	.byte	0x1
	.byte	0xb
	.long	0x8d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x4
	.string	"f"
	.byte	0x1
	.byte	0xb
	.long	0x8d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x4
	.string	"t"
	.byte	0x1
	.byte	0xb
	.long	0x8d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x5
	.string	"o"
	.byte	0x1
	.byte	0xc
	.long	0x8d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x7
	.long	.LASF7
	.byte	0x1
	.byte	0x1d
	.long	0x8d
	.quad	.LFB1
	.quad	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.long	0xd2
	.uleb128 0x8
	.long	.LASF2
	.byte	0x1
	.byte	0x1f
	.long	0x8d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x8
	.long	.LASF3
	.byte	0x1
	.byte	0x1f
	.long	0x8d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x9
	.long	.LASF5
	.byte	0x1
	.byte	0x3c
	.quad	.LFB2
	.quad	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.long	0x18c
	.uleb128 0x4
	.string	"in"
	.byte	0x1
	.byte	0x3c
	.long	0x18c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x4
	.string	"out"
	.byte	0x1
	.byte	0x3d
	.long	0x18c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x4
	.string	"key"
	.byte	0x1
	.byte	0x3e
	.long	0x197
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0x5
	.string	"y"
	.byte	0x1
	.byte	0x40
	.long	0x34
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x5
	.string	"z"
	.byte	0x1
	.byte	0x40
	.long	0x34
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x5
	.string	"sum"
	.byte	0x1
	.byte	0x40
	.long	0x34
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x8
	.long	.LASF4
	.byte	0x1
	.byte	0x40
	.long	0x34
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x5
	.string	"a"
	.byte	0x1
	.byte	0x41
	.long	0x34
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x5
	.string	"b"
	.byte	0x1
	.byte	0x41
	.long	0x34
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x5
	.string	"c"
	.byte	0x1
	.byte	0x41
	.long	0x34
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x5
	.string	"d"
	.byte	0x1
	.byte	0x41
	.long	0x34
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x5
	.string	"n"
	.byte	0x1
	.byte	0x41
	.long	0x34
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.byte	0
	.uleb128 0xa
	.long	0x191
	.uleb128 0xb
	.byte	0x8
	.long	0x34
	.uleb128 0xa
	.long	0x19c
	.uleb128 0xb
	.byte	0x8
	.long	0x1a2
	.uleb128 0xa
	.long	0x34
	.uleb128 0x9
	.long	.LASF6
	.byte	0x1
	.byte	0x4d
	.quad	.LFB3
	.quad	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.long	0x261
	.uleb128 0x4
	.string	"in"
	.byte	0x1
	.byte	0x4d
	.long	0x18c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x4
	.string	"out"
	.byte	0x1
	.byte	0x4e
	.long	0x18c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x4
	.string	"key"
	.byte	0x1
	.byte	0x4f
	.long	0x197
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0x5
	.string	"y"
	.byte	0x1
	.byte	0x51
	.long	0x34
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x5
	.string	"z"
	.byte	0x1
	.byte	0x51
	.long	0x34
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x5
	.string	"sum"
	.byte	0x1
	.byte	0x51
	.long	0x34
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x8
	.long	.LASF4
	.byte	0x1
	.byte	0x51
	.long	0x34
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x5
	.string	"a"
	.byte	0x1
	.byte	0x52
	.long	0x34
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x5
	.string	"b"
	.byte	0x1
	.byte	0x52
	.long	0x34
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x5
	.string	"c"
	.byte	0x1
	.byte	0x52
	.long	0x34
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x5
	.string	"d"
	.byte	0x1
	.byte	0x52
	.long	0x34
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x5
	.string	"n"
	.byte	0x1
	.byte	0x52
	.long	0x34
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.byte	0
	.uleb128 0x7
	.long	.LASF8
	.byte	0x1
	.byte	0x66
	.long	0x8d
	.quad	.LFB4
	.quad	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.long	0x291
	.uleb128 0x8
	.long	.LASF9
	.byte	0x1
	.byte	0x68
	.long	0x2a6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0xc
	.long	0x2a6
	.uleb128 0xd
	.long	0x18c
	.uleb128 0xd
	.long	0x18c
	.uleb128 0xd
	.long	0x197
	.byte	0
	.uleb128 0xb
	.byte	0x8
	.long	0x291
	.uleb128 0xe
	.long	.LASF20
	.byte	0x1
	.byte	0x84
	.long	0x8d
	.quad	.LFB5
	.quad	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xf
	.long	0x8d
	.long	0x2d9
	.uleb128 0x10
	.long	0x2d
	.byte	0x3
	.byte	0
	.uleb128 0x5
	.string	"num"
	.byte	0x1
	.byte	0x7
	.long	0x2c9
	.uleb128 0x9
	.byte	0x3
	.quad	num
	.uleb128 0x8
	.long	.LASF10
	.byte	0x1
	.byte	0x8
	.long	0x303
	.uleb128 0x9
	.byte	0x3
	.quad	count
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF11
	.uleb128 0xf
	.long	0x34
	.long	0x31a
	.uleb128 0x10
	.long	0x2d
	.byte	0x3
	.byte	0
	.uleb128 0x11
	.long	.LASF12
	.byte	0x1
	.byte	0x5e
	.long	0x30a
	.uleb128 0x9
	.byte	0x3
	.quad	keytext
	.uleb128 0xf
	.long	0x34
	.long	0x33f
	.uleb128 0x10
	.long	0x2d
	.byte	0x1
	.byte	0
	.uleb128 0x11
	.long	.LASF13
	.byte	0x1
	.byte	0x5f
	.long	0x32f
	.uleb128 0x9
	.byte	0x3
	.quad	plaintext
	.uleb128 0x11
	.long	.LASF14
	.byte	0x1
	.byte	0x60
	.long	0x32f
	.uleb128 0x9
	.byte	0x3
	.quad	cipherref
	.uleb128 0x11
	.long	.LASF15
	.byte	0x1
	.byte	0x61
	.long	0x32f
	.uleb128 0x9
	.byte	0x3
	.quad	ciphertext
	.uleb128 0x11
	.long	.LASF16
	.byte	0x1
	.byte	0x62
	.long	0x32f
	.uleb128 0x9
	.byte	0x3
	.quad	newplain
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.long	0x2c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF7:
	.string	"hanoi_main"
.LASF4:
	.string	"delta"
.LASF15:
	.string	"ciphertext"
.LASF13:
	.string	"plaintext"
.LASF5:
	.string	"encipher"
.LASF17:
	.string	"GNU C 4.8.4 -mtune=generic -march=x86-64 -g -fstack-protector"
.LASF8:
	.string	"cipher_main"
.LASF6:
	.string	"decipher"
.LASF10:
	.string	"count"
.LASF3:
	.string	"Loops"
.LASF9:
	.string	"cipher_type"
.LASF20:
	.string	"main"
.LASF1:
	.string	"unsigned int"
.LASF18:
	.string	"benchmark.c"
.LASF2:
	.string	"disk"
.LASF16:
	.string	"newplain"
.LASF0:
	.string	"sizetype"
.LASF14:
	.string	"cipherref"
.LASF11:
	.string	"long int"
.LASF19:
	.string	"/vagrant/cdi/cdi_generator/improved_benchmark"
.LASF12:
	.string	"keytext"
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04.3) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
eb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.long	0x2c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF7:
	.string	"hanoi_main"
.LASF4:
	.string	"delta"
.LASF15:
	.string	"ciphertext"
.LASF13:
	.string	"plaintext"
.LASF5:
	.string	"encipher"
.LASF17:
	.string	"GNU C 4.8.4 -mtune=generic -march=x86-64 -g -fstack-protector"
.LASF8:
	.string	"cipher_main"
.LASF6:
	.string	"decipher"
.LASF10:
	.string	"count"
.LASF3:
	.string	"Loops"
.LASF9:
	.string	"cipher_type"
.LASF20:
	.string	"main"
.LASF1:
	.string	"unsigned int"
.LASF18:
	.string	"benchmark.c"
.LASF2:
	.string	"disk"
.LASF16:
	.string	"newplain"
.LASF0:
	.string	"sizetype"
.LASF14:
	.string	"cipherref"
.LASF11:
	.string	"long int"
.LASF19:
	.string	"/vagrant/cdi/cdi_generator/improved_benchmark"
.LASF12:
	.string	"keytext"
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04.3) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
