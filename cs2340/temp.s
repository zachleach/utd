	.data
string:		.asciiz		"Hello World!\n"

	.text
main:
	li	$v0, 4
	la	$a0, string
	syscall

	li	$v0, 10
	syscall
