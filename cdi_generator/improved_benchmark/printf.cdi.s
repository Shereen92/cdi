	.file	"printf.c"
	.text
.Ltext0:
	.globl	outchar
	.type	outchar, @function
outchar:
.globl	printf.s.outchar
printf.s.outchar:
.LFB0:
	.file 1 "outchar.h"
	.loc 1 5 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, %eax
	movb	%al, -4(%rbp)
	.loc 1 6 0
	movl	$1, %eax
	movl	$1, %edi
	leaq	-4(%rbp), %rcx
	movl	$1, %edx
	movq	%rcx, %rsi
#APP
# 6 "outchar.h" 1
	syscall
# 0 "" 2
	.loc 1 10 0
#NO_APP
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	addq $8, %rsp
	cmpq	$_CDI_printf.s.outchar_TO_printf.s.tfp_printf_1, -8(%rsp)
	je	_CDI_printf.s.outchar_TO_printf.s.tfp_printf_1
	cmpq	$_CDI_printf.s.outchar_TO_printf.s.tfp_printf_2, -8(%rsp)
	je	_CDI_printf.s.outchar_TO_printf.s.tfp_printf_2
	cmpq	$_CDI_printf.s.outchar_TO_printf.s.tfp_printf_3, -8(%rsp)
	je	_CDI_printf.s.outchar_TO_printf.s.tfp_printf_3
	movq	 $.CDI_sled_id_1, %rsi
	movq	$.CDI_sled_id_1_len, %rdx
	call	_CDI_abort
.CDI_sled_id_1:
	.string	"outchar.h:10:0:printf.s id=1"
	.set	.CDI_sled_id_1_len, .-.CDI_sled_id_1
	.cfi_endproc
.LFE0:
	.size	outchar, .-outchar
	.local	bf
	.comm	bf,8,8
	.local	buf
	.comm	buf,12,8
	.local	num
	.comm	num,4,4
	.local	uc
	.comm	uc,1,1
	.local	zs
	.comm	zs,1,1
	.type	out, @function
out:
.globl	printf.s.out
printf.s.out:
.LFB1:
	.file 2 "printf.c"
	.loc 2 49 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, %eax
	movb	%al, -4(%rbp)
	.loc 2 50 0
	movq	bf(%rip), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, bf(%rip)
	movzbl	-4(%rbp), %edx
	movb	%dl, (%rax)
	.loc 2 51 0
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	addq $8, %rsp
	cmpq	$_CDI_printf.s.out_TO_printf.s.outDgt_1, -8(%rsp)
	je	_CDI_printf.s.out_TO_printf.s.outDgt_1
	movq	 $.CDI_sled_id_2, %rsi
	movq	$.CDI_sled_id_2_len, %rdx
	call	_CDI_abort
.CDI_sled_id_2:
	.string	"printf.c:51:0:printf.s id=2"
	.set	.CDI_sled_id_2_len, .-.CDI_sled_id_2
	.cfi_endproc
.LFE1:
	.size	out, .-out
	.type	outDgt, @function
out_2:
.globl	printf.s.out_2
printf.s.out_2:
.LFB1_2:
	.file 2 "printf.c"
	.loc 2 49 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, %eax
	movb	%al, -4(%rbp)
	.loc 2 50 0
	movq	bf(%rip), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, bf(%rip)
	movzbl	-4(%rbp), %edx
	movb	%dl, (%rax)
	.loc 2 51 0
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	addq $8, %rsp
	cmpq	$_CDI_printf.s.out_2_TO_printf.s.out_2Dgt_1, -8(%rsp)
	je	_CDI_printf.s.out_2_TO_printf.s.out_2Dgt_1
	movq	 $.CDI_sled_id_2, %rsi
	movq	$.CDI_sled_id_2_len, %rdx
	call	_CDI_abort
.CDI_sled_id_2:
	.string	"printf.c:51:0:printf.s id=2"
	.set	.CDI_sled_id_2_len, .-.CDI_sled_id_2
	.cfi_endproc
.LFE1_2:
	.size	out_2,	.-out_2
	.type	outDgt, @function
outDgt:
.globl	printf.s.outDgt
printf.s.outDgt:
.LFB2:
	.loc 2 53 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$8, %rsp
	movl	%edi, %eax
	movb	%al, -4(%rbp)
	.loc 2 54 0
	cmpb	$9, -4(%rbp)
	jle	.L4
	.loc 2 54 0 is_stmt 0 discriminator 1
	movzbl	uc(%rip), %eax
	testb	%al, %al
	je	.L5
	.loc 2 54 0 discriminator 3
	movl	$55, %eax
	jmp	.L7
.L5:
	.loc 2 54 0 discriminator 4
	movl	$87, %eax
	jmp	.L7
.L4:
	.loc 2 54 0 discriminator 2
	movl	$48, %eax
.L7:
	.loc 2 54 0 discriminator 8
	movzbl	-4(%rbp), %edx
	addl	%edx, %eax
	movsbl	%al, %eax
	movl	%eax, %edi
	call	out_2
_CDI_printf.s.out_2_2_TO_printf.s.out_2_2Dgt_1:
	.loc 2 55 0 is_stmt 1 discriminator 8
	movb	$1, zs(%rip)
	.loc 2 56 0 discriminator 8
	nop
	leave
	.cfi_def_cfa 7, 8
	addq $8, %rsp
	cmpq	$_CDI_printf.s.outDgt_TO_printf.s.tfp_printf_1, -8(%rsp)
	je	_CDI_printf.s.outDgt_TO_printf.s.tfp_printf_1
	cmpq	$_CDI_printf.s.outDgt_TO_printf.s.tfp_printf_2, -8(%rsp)
	je	_CDI_printf.s.outDgt_TO_printf.s.tfp_printf_2
	cmpq	$_CDI_printf.s.outDgt_TO_printf.s.divOut_1, -8(%rsp)
	je	_CDI_printf.s.outDgt_TO_printf.s.divOut_1
	movq	 $.CDI_sled_id_3, %rsi
	movq	$.CDI_sled_id_3_len, %rdx
	call	_CDI_abort
.CDI_sled_id_3:
	.string	"printf.c:56:0:printf.s id=3"
	.set	.CDI_sled_id_3_len, .-.CDI_sled_id_3
	.cfi_endproc
.LFE2:
	.size	outDgt, .-outDgt
	.type	divOut, @function
divOut:
.globl	printf.s.divOut
printf.s.divOut:
.LFB3:
	.loc 2 58 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$24, %rsp
	movl	%edi, -20(%rbp)
	.loc 2 59 0
	movb	$0, -1(%rbp)
	.loc 2 60 0
	movl	num(%rip), %eax
	movzwl	%ax, %eax
	movl	%eax, num(%rip)
	.loc 2 61 0
	jmp	.L9
.L10:
	.loc 2 62 0
	movl	num(%rip), %eax
	subl	-20(%rbp), %eax
	movl	%eax, num(%rip)
	.loc 2 63 0
	movzbl	-1(%rbp), %eax
	addl	$1, %eax
	movb	%al, -1(%rbp)
.L9:
	.loc 2 61 0
	movl	num(%rip), %eax
	cmpl	-20(%rbp), %eax
	jnb	.L10
	.loc 2 65 0
	movzbl	zs(%rip), %eax
	testb	%al, %al
	jne	.L11
	.loc 2 65 0 is_stmt 0 discriminator 1
	cmpb	$0, -1(%rbp)
	je	.L13
.L11:
	.loc 2 66 0 is_stmt 1
	movzbl	-1(%rbp), %eax
	movsbl	%al, %eax
	movl	%eax, %edi
	call	outDgt
_CDI_printf.s.outDgt_TO_printf.s.divOut_1:
.L13:
	.loc 2 67 0
	nop
	leave
	.cfi_def_cfa 7, 8
	addq $8, %rsp
	cmpq	$_CDI_printf.s.divOut_TO_printf.s.tfp_printf_1, -8(%rsp)
	je	_CDI_printf.s.divOut_TO_printf.s.tfp_printf_1
	cmpq	$_CDI_printf.s.divOut_TO_printf.s.tfp_printf_2, -8(%rsp)
	je	_CDI_printf.s.divOut_TO_printf.s.tfp_printf_2
	cmpq	$_CDI_printf.s.divOut_TO_printf.s.tfp_printf_3, -8(%rsp)
	je	_CDI_printf.s.divOut_TO_printf.s.tfp_printf_3
	cmpq	$_CDI_printf.s.divOut_TO_printf.s.tfp_printf_4, -8(%rsp)
	je	_CDI_printf.s.divOut_TO_printf.s.tfp_printf_4
	cmpq	$_CDI_printf.s.divOut_TO_printf.s.tfp_printf_5, -8(%rsp)
	je	_CDI_printf.s.divOut_TO_printf.s.tfp_printf_5
	cmpq	$_CDI_printf.s.divOut_TO_printf.s.tfp_printf_6, -8(%rsp)
	je	_CDI_printf.s.divOut_TO_printf.s.tfp_printf_6
	cmpq	$_CDI_printf.s.divOut_TO_printf.s.tfp_printf_7, -8(%rsp)
	je	_CDI_printf.s.divOut_TO_printf.s.tfp_printf_7
	movq	 $.CDI_sled_id_4, %rsi
	movq	$.CDI_sled_id_4_len, %rdx
	call	_CDI_abort
.CDI_sled_id_4:
	.string	"printf.c:67:0:printf.s id=4"
	.set	.CDI_sled_id_4_len, .-.CDI_sled_id_4
	.cfi_endproc
.LFE3:
	.size	divOut, .-divOut
	.globl	tfp_printf
	.type	tfp_printf, @function
tfp_printf:
.globl	printf.s.tfp_printf
printf.s.tfp_printf:
.LFB4:
	.loc 2 70 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$240, %rsp
	movq	%rdi, -232(%rbp)
	movq	%rsi, -168(%rbp)
	movq	%rdx, -160(%rbp)
	movq	%rcx, -152(%rbp)
	movq	%r8, -144(%rbp)
	movq	%r9, -136(%rbp)
	testb	%al, %al
	je	.L52
	movaps	%xmm0, -128(%rbp)
	movaps	%xmm1, -112(%rbp)
	movaps	%xmm2, -96(%rbp)
	movaps	%xmm3, -80(%rbp)
	movaps	%xmm4, -64(%rbp)
	movaps	%xmm5, -48(%rbp)
	movaps	%xmm6, -32(%rbp)
	movaps	%xmm7, -16(%rbp)
.L52:
	.loc 2 75 0
	movl	$8, -224(%rbp)
	movl	$48, -220(%rbp)
	leaq	16(%rbp), %rax
	movq	%rax, -216(%rbp)
	leaq	-176(%rbp), %rax
	movq	%rax, -208(%rbp)
	.loc 2 77 0
	jmp	.L16
.L51:
	.loc 2 78 0
	cmpb	$37, -177(%rbp)
	je	.L17
	.loc 2 79 0
	movsbl	-177(%rbp), %eax
	movl	%eax, %edi
	call	outchar
_CDI_printf.s.outchar_TO_printf.s.tfp_printf_1:
	jmp	.L16
.L17:
.LBB2:
	.loc 2 82 0
	movb	$0, -193(%rbp)
	.loc 2 83 0
	movb	$0, -194(%rbp)
	.loc 2 84 0
	movq	-232(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -232(%rbp)
	movzbl	(%rax), %eax
	movb	%al, -177(%rbp)
	.loc 2 85 0
	cmpb	$48, -177(%rbp)
	jne	.L18
	.loc 2 86 0
	movq	-232(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -232(%rbp)
	movzbl	(%rax), %eax
	movb	%al, -177(%rbp)
	.loc 2 87 0
	movb	$1, -193(%rbp)
.L18:
	.loc 2 89 0
	cmpb	$47, -177(%rbp)
	jle	.L19
	.loc 2 89 0 is_stmt 0 discriminator 1
	cmpb	$57, -177(%rbp)
	jg	.L19
	.loc 2 90 0 is_stmt 1
	movb	$0, -194(%rbp)
	.loc 2 91 0
	jmp	.L20
.L21:
	.loc 2 92 0
	movzbl	-194(%rbp), %eax
	leal	0(,%rax,4), %edx
	movzbl	-194(%rbp), %eax
	addl	%edx, %eax
	leal	(%rax,%rax), %edx
	movzbl	-177(%rbp), %eax
	addl	%edx, %eax
	subl	$48, %eax
	movb	%al, -194(%rbp)
	.loc 2 93 0
	movq	-232(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -232(%rbp)
	movzbl	(%rax), %eax
	movb	%al, -177(%rbp)
.L20:
	.loc 2 91 0
	cmpb	$47, -177(%rbp)
	jle	.L19
	.loc 2 91 0 is_stmt 0 discriminator 1
	cmpb	$57, -177(%rbp)
	jle	.L21
.L19:
	.loc 2 96 0 is_stmt 1
	movq	$buf, bf(%rip)
	.loc 2 97 0
	movq	bf(%rip), %rax
	movq	%rax, -192(%rbp)
	.loc 2 98 0
	movb	$0, zs(%rip)
	.loc 2 99 0
	movsbl	-177(%rbp), %eax
	cmpl	$99, %eax
	je	.L23
	cmpl	$99, %eax
	jg	.L24
	cmpl	$37, %eax
	je	.L25
	cmpl	$88, %eax
	je	.L26
	testl	%eax, %eax
	je	.L53
	.loc 2 133 0
	jmp	.L54
.L24:
	.loc 2 99 0
	cmpl	$115, %eax
	je	.L28
	cmpl	$115, %eax
	jg	.L29
	cmpl	$100, %eax
	je	.L30
	.loc 2 133 0
	jmp	.L54
.L29:
	.loc 2 99 0
	cmpl	$117, %eax
	je	.L30
	cmpl	$120, %eax
	je	.L26
	.loc 2 133 0
	jmp	.L54
.L30:
	.loc 2 104 0
	movl	-224(%rbp), %eax
	cmpl	$47, %eax
	ja	.L32
	movq	-208(%rbp), %rax
	movl	-224(%rbp), %edx
	movl	%edx, %edx
	addq	%rdx, %rax
	movl	-224(%rbp), %edx
	addl	$8, %edx
	movl	%edx, -224(%rbp)
	jmp	.L33
.L32:
	movq	-216(%rbp), %rax
	leaq	8(%rax), %rdx
	movq	%rdx, -216(%rbp)
.L33:
	movl	(%rax), %eax
	.loc 2 104 0
	movl	%eax, num(%rip)
	.loc 2 105 0
	cmpb	$100, -177(%rbp)
	jne	.L34
	.loc 2 105 0 is_stmt 0 discriminator 1
	movl	num(%rip), %eax
	testl	%eax, %eax
	jns	.L34
	.loc 2 106 0 is_stmt 1
	movl	num(%rip), %eax
	negl	%eax
	movl	%eax, num(%rip)
	.loc 2 107 0
	movl	$45, %edi
	call	out
_CDI_printf.s.out_TO_printf.s.tfp_printf_1:
.L34:
	.loc 2 109 0
	movl	$10000, %edi
	call	divOut
_CDI_printf.s.divOut_TO_printf.s.tfp_printf_1:
	.loc 2 110 0
	movl	$1000, %edi
	call	divOut
_CDI_printf.s.divOut_TO_printf.s.tfp_printf_2:
	.loc 2 111 0
	movl	$100, %edi
	call	divOut
_CDI_printf.s.divOut_TO_printf.s.tfp_printf_3:
	.loc 2 112 0
	movl	$10, %edi
	call	divOut
_CDI_printf.s.divOut_TO_printf.s.tfp_printf_4:
	.loc 2 113 0
	movl	num(%rip), %eax
	movsbl	%al, %eax
	movl	%eax, %edi
	call	outDgt
_CDI_printf.s.outDgt_TO_printf.s.tfp_printf_1:
	.loc 2 114 0
	jmp	.L35
.L26:
	.loc 2 117 0
	cmpb	$88, -177(%rbp)
	sete	%al
	movb	%al, uc(%rip)
	.loc 2 118 0
	movl	-224(%rbp), %eax
	cmpl	$47, %eax
	ja	.L36
	movq	-208(%rbp), %rax
	movl	-224(%rbp), %edx
	movl	%edx, %edx
	addq	%rdx, %rax
	movl	-224(%rbp), %edx
	addl	$8, %edx
	movl	%edx, -224(%rbp)
	jmp	.L37
.L36:
	movq	-216(%rbp), %rax
	leaq	8(%rax), %rdx
	movq	%rdx, -216(%rbp)
.L37:
	movl	(%rax), %eax
	.loc 2 118 0
	movl	%eax, num(%rip)
	.loc 2 119 0
	movl	$4096, %edi
	call	divOut
_CDI_printf.s.divOut_TO_printf.s.tfp_printf_5:
	.loc 2 120 0
	movl	$256, %edi
	call	divOut
_CDI_printf.s.divOut_TO_printf.s.tfp_printf_6:
	.loc 2 121 0
	movl	$16, %edi
	call	divOut
_CDI_printf.s.divOut_TO_printf.s.tfp_printf_7:
	.loc 2 122 0
	movl	num(%rip), %eax
	movsbl	%al, %eax
	movl	%eax, %edi
	call	outDgt
_CDI_printf.s.outDgt_TO_printf.s.tfp_printf_2:
	.loc 2 123 0
	jmp	.L35
.L23:
	.loc 2 125 0
	movl	-224(%rbp), %eax
	cmpl	$47, %eax
	ja	.L38
	movq	-208(%rbp), %rax
	movl	-224(%rbp), %edx
	movl	%edx, %edx
	addq	%rdx, %rax
	movl	-224(%rbp), %edx
	addl	$8, %edx
	movl	%edx, -224(%rbp)
	jmp	.L39
.L38:
	movq	-216(%rbp), %rax
	leaq	8(%rax), %rdx
	movq	%rdx, -216(%rbp)
.L39:
	movl	(%rax), %eax
	.loc 2 125 0
	movsbl	%al, %eax
	movl	%eax, %edi
	call	out
_CDI_printf.s.out_TO_printf.s.tfp_printf_2:
	.loc 2 126 0
	jmp	.L35
.L28:
	.loc 2 128 0
	movl	-224(%rbp), %eax
	cmpl	$47, %eax
	ja	.L40
	movq	-208(%rbp), %rax
	movl	-224(%rbp), %edx
	movl	%edx, %edx
	addq	%rdx, %rax
	movl	-224(%rbp), %edx
	addl	$8, %edx
	movl	%edx, -224(%rbp)
	jmp	.L41
.L40:
	movq	-216(%rbp), %rax
	leaq	8(%rax), %rdx
	movq	%rdx, -216(%rbp)
.L41:
	movq	(%rax), %rax
	movq	%rax, -192(%rbp)
	.loc 2 129 0
	jmp	.L35
.L25:
	.loc 2 131 0
	movl	$37, %edi
	call	out
_CDI_printf.s.out_TO_printf.s.tfp_printf_3:
.L54:
	.loc 2 133 0
	nop
.L35:
	.loc 2 135 0
	movq	bf(%rip), %rax
	movb	$0, (%rax)
	.loc 2 136 0
	movq	-192(%rbp), %rax
	movq	%rax, bf(%rip)
	.loc 2 137 0
	jmp	.L42
.L44:
	.loc 2 138 0
	movzbl	-194(%rbp), %eax
	subl	$1, %eax
	movb	%al, -194(%rbp)
.L42:
	.loc 2 137 0
	movq	bf(%rip), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, bf(%rip)
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L45
	.loc 2 137 0 is_stmt 0 discriminator 1
	cmpb	$0, -194(%rbp)
	jg	.L44
	.loc 2 139 0 is_stmt 1
	jmp	.L45
.L48:
	.loc 2 140 0
	cmpb	$0, -193(%rbp)
	je	.L46
	.loc 2 140 0 is_stmt 0 discriminator 1
	movl	$48, %eax
	jmp	.L47
.L46:
	.loc 2 140 0 discriminator 2
	movl	$32, %eax
.L47:
	.loc 2 140 0 discriminator 4
	movl	%eax, %edi
	call	outchar
_CDI_printf.s.outchar_TO_printf.s.tfp_printf_2:
.L45:
	.loc 2 139 0 is_stmt 1
	movzbl	-194(%rbp), %eax
	movl	%eax, %edx
	subl	$1, %edx
	movb	%dl, -194(%rbp)
	testb	%al, %al
	jg	.L48
	.loc 2 141 0
	jmp	.L49
.L50:
	.loc 2 142 0
	movsbl	-177(%rbp), %eax
	movl	%eax, %edi
	call	outchar
_CDI_printf.s.outchar_TO_printf.s.tfp_printf_3:
.L49:
	.loc 2 141 0
	movq	-192(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -192(%rbp)
	movzbl	(%rax), %eax
	movb	%al, -177(%rbp)
	cmpb	$0, -177(%rbp)
	jne	.L50
.L16:
.LBE2:
	.loc 2 77 0
	movq	-232(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -232(%rbp)
	movzbl	(%rax), %eax
	movb	%al, -177(%rbp)
	cmpb	$0, -177(%rbp)
	jne	.L51
	.loc 2 147 0
	jmp	.L31
.L53:
.LBB3:
	.loc 2 101 0
	nop
.L31:
.LBE3:
	.loc 2 147 0
	nop
	leave
	.cfi_def_cfa 7, 8
	addq $8, %rsp
	cmpq	$_CDI_printf.s.tfp_printf_TO_benchmark.s.cipher_main_1, -8(%rsp)
	je	_CDI_printf.s.tfp_printf_TO_benchmark.s.cipher_main_1
	cmpq	$_CDI_printf.s.tfp_printf_TO_benchmark.s.cipher_main_2, -8(%rsp)
	je	_CDI_printf.s.tfp_printf_TO_benchmark.s.cipher_main_2
	cmpq	$_CDI_printf.s.tfp_printf_TO_benchmark.s.cipher_main_3, -8(%rsp)
	je	_CDI_printf.s.tfp_printf_TO_benchmark.s.cipher_main_3
	cmpq	$_CDI_printf.s.tfp_printf_TO_benchmark.s.cipher_main_4, -8(%rsp)
	je	_CDI_printf.s.tfp_printf_TO_benchmark.s.cipher_main_4
	cmpq	$_CDI_printf.s.tfp_printf_TO_benchmark.s.hanoi_main_1, -8(%rsp)
	je	_CDI_printf.s.tfp_printf_TO_benchmark.s.hanoi_main_1
	cmpq	$_CDI_printf.s.tfp_printf_TO_benchmark.s.hanoi_main_2, -8(%rsp)
	je	_CDI_printf.s.tfp_printf_TO_benchmark.s.hanoi_main_2
	cmpq	$_CDI_printf.s.tfp_printf_TO_benchmark.s.hanoi_main_3, -8(%rsp)
	je	_CDI_printf.s.tfp_printf_TO_benchmark.s.hanoi_main_3
	movq	 $.CDI_sled_id_5, %rsi
	movq	$.CDI_sled_id_5_len, %rdx
	call	_CDI_abort
.CDI_sled_id_5:
	.string	"printf.c:147:0:printf.s id=5"
	.set	.CDI_sled_id_5_len, .-.CDI_sled_id_5
	.cfi_endproc
.LFE4:
	.size	tfp_printf, .-tfp_printf
.Letext0:
	.file 3 "/home/misiker/Desktop/CDI/GCC/dest/lib/gcc/x86_64-pc-linux-gnu/6.1.0/include/stdarg.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x216
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF6
	.byte	0xc
	.long	.LASF7
	.long	.LASF8
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.uleb128 0x2
	.long	.LASF9
	.byte	0x3
	.byte	0x28
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF0
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF1
	.uleb128 0x4
	.long	.LASF10
	.byte	0x3
	.byte	0x63
	.long	0x2d
	.uleb128 0x5
	.string	"bf"
	.byte	0x2
	.byte	0x2b
	.long	0x61
	.uleb128 0x9
	.byte	0x3
	.quad	bf
	.uleb128 0x6
	.byte	0x8
	.long	0x67
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF2
	.uleb128 0x7
	.long	0x67
	.long	0x7e
	.uleb128 0x8
	.long	0x34
	.byte	0xb
	.byte	0
	.uleb128 0x5
	.string	"buf"
	.byte	0x2
	.byte	0x2c
	.long	0x6e
	.uleb128 0x9
	.byte	0x3
	.quad	buf
	.uleb128 0x5
	.string	"num"
	.byte	0x2
	.byte	0x2d
	.long	0x3b
	.uleb128 0x9
	.byte	0x3
	.quad	num
	.uleb128 0x5
	.string	"uc"
	.byte	0x2
	.byte	0x2e
	.long	0x67
	.uleb128 0x9
	.byte	0x3
	.quad	uc
	.uleb128 0x5
	.string	"zs"
	.byte	0x2
	.byte	0x2f
	.long	0x67
	.uleb128 0x9
	.byte	0x3
	.quad	zs
	.uleb128 0x9
	.long	.LASF11
	.byte	0x2
	.byte	0x45
	.quad	.LFB4
	.quad	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.long	0x15c
	.uleb128 0xa
	.string	"fmt"
	.byte	0x2
	.byte	0x45
	.long	0x61
	.uleb128 0x3
	.byte	0x91
	.sleb128 -248
	.uleb128 0xb
	.uleb128 0x5
	.string	"va"
	.byte	0x2
	.byte	0x47
	.long	0x42
	.uleb128 0x3
	.byte	0x91
	.sleb128 -240
	.uleb128 0x5
	.string	"ch"
	.byte	0x2
	.byte	0x48
	.long	0x67
	.uleb128 0x3
	.byte	0x91
	.sleb128 -193
	.uleb128 0x5
	.string	"p"
	.byte	0x2
	.byte	0x49
	.long	0x61
	.uleb128 0x3
	.byte	0x91
	.sleb128 -208
	.uleb128 0xc
	.long	.LASF12
	.byte	0x2
	.byte	0x91
	.quad	.L31
	.uleb128 0xd
	.long	.Ldebug_ranges0+0
	.long	0x15a
	.uleb128 0x5
	.string	"lz"
	.byte	0x2
	.byte	0x52
	.long	0x67
	.uleb128 0x3
	.byte	0x91
	.sleb128 -209
	.uleb128 0x5
	.string	"w"
	.byte	0x2
	.byte	0x53
	.long	0x67
	.uleb128 0x3
	.byte	0x91
	.sleb128 -210
	.byte	0
	.uleb128 0xb
	.byte	0
	.uleb128 0xe
	.long	.LASF4
	.byte	0x2
	.byte	0x3a
	.quad	.LFB3
	.quad	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.long	0x196
	.uleb128 0xa
	.string	"div"
	.byte	0x2
	.byte	0x3a
	.long	0x3b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x5
	.string	"dgt"
	.byte	0x2
	.byte	0x3b
	.long	0x196
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.byte	0
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.long	.LASF3
	.uleb128 0xe
	.long	.LASF5
	.byte	0x2
	.byte	0x35
	.quad	.LFB2
	.quad	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.long	0x1c9
	.uleb128 0xa
	.string	"dgt"
	.byte	0x2
	.byte	0x35
	.long	0x67
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0xf
	.string	"out"
	.byte	0x2
	.byte	0x31
	.quad	.LFB1
	.quad	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.long	0x1f3
	.uleb128 0xa
	.string	"c"
	.byte	0x2
	.byte	0x31
	.long	0x67
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x10
	.long	.LASF13
	.byte	0x1
	.byte	0x5
	.quad	.LFB0
	.quad	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xa
	.string	"c"
	.byte	0x1
	.byte	0x5
	.long	0x67
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
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
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x3
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
	.uleb128 0x4
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
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
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
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
	.uleb128 0xb
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0xa
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x11
	.uleb128 0x1
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x2e
	.byte	0x1
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
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
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
	.uleb128 0x10
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
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.quad	.LBB2-.Ltext0
	.quad	.LBE2-.Ltext0
	.quad	.LBB3-.Ltext0
	.quad	.LBE3-.Ltext0
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF8:
	.string	"/home/misiker/Desktop/CDI/cdi_generator/improved_benchmark"
.LASF1:
	.string	"unsigned int"
.LASF7:
	.string	"printf.c"
.LASF11:
	.string	"tfp_printf"
.LASF13:
	.string	"outchar"
.LASF3:
	.string	"unsigned char"
.LASF2:
	.string	"char"
.LASF5:
	.string	"outDgt"
.LASF4:
	.string	"divOut"
.LASF10:
	.string	"va_list"
.LASF6:
	.string	"GNU C11 6.1.0 -mtune=generic -march=x86-64 -g"
.LASF9:
	.string	"__gnuc_va_list"
.LASF12:
	.string	"abort"
.LASF0:
	.string	"sizetype"
	.ident	"GCC: (GNU) 6.1.0"
	.section	.note.GNU-stack,"",@progbits
d	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF8:
	.string	"/home/misiker/Desktop/CDI/cdi_generator/improved_benchmark"
.LASF1:
	.string	"unsigned int"
.LASF7:
	.string	"printf.c"
.LASF11:
	.string	"tfp_printf"
.LASF13:
	.string	"outchar"
.LASF3:
	.string	"unsigned char"
.LASF2:
	.string	"char"
.LASF5:
	.string	"outDgt"
.LASF4:
	.string	"divOut"
.LASF10:
	.string	"va_list"
.LASF6:
	.string	"GNU C11 6.1.0 -mtune=generic -march=x86-64 -g"
.LASF9:
	.string	"__gnuc_va_list"
.LASF12:
	.string	"abort"
.LASF0:
	.string	"sizetype"
	.ident	"GCC: (GNU) 6.1.0"
	.section	.note.GNU-stack,"",@progbits
