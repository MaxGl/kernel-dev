	.file	"tst.c"
	.text
	.globl	asmexit
	.type	asmexit, @function
asmexit:
.LFB2:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	8(%ebp), %eax
	movw	%ax, -12(%ebp)
	movswl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	exit
	.cfi_endproc
.LFE2:
	.size	asmexit, .-asmexit
	.globl	main
	.type	main, @function
main:
.LFB3:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	subl	$32, %esp
	movw	$7, 30(%esp)
	movswl	30(%esp), %eax
	movl	%eax, (%esp)
	call	asmexit
	movl	$0, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE3:
	.size	main, .-main
	.ident	"GCC: (GNU) 4.8.2 20131212 (Red Hat 4.8.2-7)"
	.section	.note.GNU-stack,"",@progbits
