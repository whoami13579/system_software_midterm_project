test	START	0

main
	LDX	#0
	LDT	#24	.the length of the string
	JSUB	print1	.print enter the first number

	LDX	#0
	LDT	#10
	JSUB	clns	.clear the data in ns

	LDX	#0
	JSUB	inputns	.read the first number as string and store in ns

	LDT	#0
	LDX	#0
	LDA	#48
	JSUB	stn	.convert ns to int
	STT	n1	.store the value to n1

	LDX	#0
	LDT	#25	.the length of the string
	JSUB	print2	.print enter the second number

	LDX	#0
	LDT	#10
	JSUB	clns	.clear the data in ns

	LDX	#0
	JSUB	inputns	.read the second number and store in ns

	LDT	#0
	LDX	#0
	LDA	#48
	JSUB	stn	.convert ns to int
	STT	n2	.store the value to n1

	JSUB	nl

	LDX	#0
	LDT	#7	.the length of the string
	JSUB	print3	.print gcd is

	LDX	#0
	JSUB	printns

	LDX	#0
	LDT	#7	.the length of the string
	JSUB	print4	.print lcm is

	LDX	#0
	JSUB	printns

	J	halt


nl			.print new line
	TD	stdout
	JEQ	nl
	LDCH	newline
	WD	stdout
	RSUB

print1			.print input the first number
	TD	stdout
	JEQ	print1
	LDCH	str1, X
	WD	stdout
	TIXR	T
	JLT	print1

	RSUB

print2			.print input the second number
	TD	stdout
	JEQ	print2
	LDCH	str2, X
	WD	stdout
	TIXR	T
	JLT	print2

	RSUB

print3			.print gcd is
	TD	stdout
	JEQ	print3
	LDCH	str3, X
	WD	stdout
	TIXR	T
	JLT	print3
	RSUB

print4			.print lcm is
	TD	stdout
	JEQ	print4
	LDCH	str4, X
	WD	stdout
	TIXR	T
	JLT	print4
	RSUB

printns		.print the number in ns
	TD	stdout
	JEQ	printns
	LDCH	ns, X
	WD	stdout
	LDT	#1
	ADDR	T, X
	LDT	#10
	COMPR	T, A
	JLT	printns
	RSUB

inputns			.read the first number and store in ns
	TD	stdin
	JEQ	inputns
	RD	stdin
	STCH	ns, X
	LDT	#1
	ADDR	T, X
	LDT	#10
	COMPR	T, A
	JLT	inputns
	RSUB

clns			.clear the data in ns
	LDCH	space
	STCH	ns, X
	TIXR	T
	JLT	clns
	RSUB

stn			.convert ns to int and store in n1
	SUB	#48
	LDS	#10
	MULR	S, T
	ADDR	A, T
	LDCH	ns, X
	LDS	#1
	ADDR	S, X
	COMP	#10
	JLT	stn
	JGT	stn
	RSUB


halt	J	halt

str1	BYTE	C'input the first number: '
str2	BYTE	C'input the second number: '
str3	BYTE	C'gcd is '
str4	BYTE	C'lcm is '
s	RESB	50

ns	RESB	10	.store the first number as string

n1	WORD	0	.store the first number
n2	WORD	0	.store the second number
n3	WORD	0
n4	WORD	0

newline	BYTE	10
space	BYTE	32
stdin	BYTE	0
stdout	BYTE	1
