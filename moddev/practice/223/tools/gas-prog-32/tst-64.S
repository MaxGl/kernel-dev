	.file	"tst.c"
	.text
	.globl	asmexit
	.type	asmexit, @function
asmexit:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, %eax
	movw	%ax, -4(%rbp)
	movswl	-4(%rbp), %eax
	movl	%eax, %edi
	call	exit
	.cfi_endproc
.LFE2:
	.size	asmexit, .-asmexit
	.globl	main
	.type	main, @function
main:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	movq	%rsi, -32(%rbp)
	movw	$7, -2(%rbp)
	movswl	-2(%rbp), %eax
	movl	%eax, %edi
	call	asmexit
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	main, .-main
	.ident	"GCC: (GNU) 4.8.2 20131212 (Red Hat 4.8.2-7)"
	.section	.note.GNU-stack,"",@progbits
