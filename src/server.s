	.file	"server.c"
	.text
	.section	.rodata
.LC0:
	.string	"Ol\303\241 do Servidor"
.LC1:
	.string	"Cria\303\247\303\243o do socket falhou"
.LC2:
	.string	"bind falhou"
.LC3:
	.string	"Client : %s\n"
.LC4:
	.string	"Mensagem enviada."
	.text
	.globl	main
	.type	main, @function
main:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$1096, %rsp
	.cfi_offset 3, -24
	leaq	.LC0(%rip), %rax
	movq	%rax, -24(%rbp)
	movl	$0, %edx
	movl	$2, %esi
	movl	$2, %edi
	call	socket@PLT
	movl	%eax, -28(%rbp)
	cmpl	$0, -28(%rbp)
	jns	.L2
	leaq	.LC1(%rip), %rdi
	call	perror@PLT
	movl	$1, %edi
	call	exit@PLT
.L2:
	leaq	-1072(%rbp), %rax
	movl	$16, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	leaq	-1088(%rbp), %rax
	movl	$16, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	movw	$2, -1072(%rbp)
	movl	$0, -1068(%rbp)
	movl	$333, %edi
	call	htons@PLT
	movw	%ax, -1070(%rbp)
	leaq	-1072(%rbp), %rcx
	movl	-28(%rbp), %eax
	movl	$16, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	bind@PLT
	testl	%eax, %eax
	jns	.L3
	leaq	.LC2(%rip), %rdi
	call	perror@PLT
	movl	$1, %edi
	call	exit@PLT
.L3:
	movl	$16, -1092(%rbp)
	leaq	-1092(%rbp), %rcx
	leaq	-1088(%rbp), %rdx
	leaq	-1056(%rbp), %rsi
	movl	-28(%rbp), %eax
	movq	%rcx, %r9
	movq	%rdx, %r8
	movl	$256, %ecx
	movl	$1024, %edx
	movl	%eax, %edi
	call	recvfrom@PLT
	movl	%eax, -32(%rbp)
	movl	-32(%rbp), %eax
	cltq
	movb	$0, -1056(%rbp,%rax)
	leaq	-1056(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	-1092(%rbp), %eax
	movl	%eax, %ebx
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	leaq	-1088(%rbp), %rcx
	movq	-24(%rbp), %rsi
	movl	-28(%rbp), %eax
	movl	%ebx, %r9d
	movq	%rcx, %r8
	movl	$2048, %ecx
	movl	%eax, %edi
	call	sendto@PLT
	leaq	.LC4(%rip), %rdi
	call	puts@PLT
	movl	$0, %eax
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.ident	"GCC: (Debian 10.2.1-6) 10.2.1 20210110"
	.section	.note.GNU-stack,"",@progbits
