#  коментарий может начинаться или с # как AT&T,
// так и ограничиваться как в C: // & /* ... */ 
/* void asmexit( int retcod ); */
.globl asmexit
        .type   asmexit, @function
asmexit:
        pushl   %ebp             // соглашение о связях
        movl    %esp, %ebp
	movl    $1, %eax
        movl    8(%ebp), %ebx
	int     $0x80
        popl    %ebp             // соглашение о связях
        ret
