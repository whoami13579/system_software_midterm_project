test	START	0

main
	LDX	#0
	LDT	#24	.the length of the string
	JSUB	print1	.print enter the first number

	LDX	#0
	LDT	#10
	JSUB	clns1	.clear the data in ns1

	LDX	#0
	JSUB	input1	.read the first number as string and store in ns1

	LDT	#0
	LDX	#0
	LDA	#48
	JSUB	stn	.convert ns1 to int
	STT	n1	.store the value to n1

	LDX	#0
	LDT	#25	.the length of the string
	JSUB	print2	.print enter the second number

	LDX	#0
	LDT	#10
	JSUB	clns1	.clear the data in ns2

	LDX	#0
	JSUB	input1	.read the second number and store in ns2

	LDT	#0
	LDX	#0
	LDA	#48
	JSUB	stn	.convert ns1 to int
	STT	n2	.store the value to n1

	JSUB	nl

	LDX	#0
	LDT	#7	.the length of the string
	JSUB	print3	.print gcd is

	LDX	#0
	JSUB	printns1

	LDX	#0
	LDT	#7	.the length of the string
	JSUB	print4	.print lcm is

	LDX	#0
	JSUB	printns1

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

printns1		.print the number in ns1
	TD	stdout
	JEQ	printns1
	LDCH	ns1, X
	WD	stdout
	LDT	#1
	ADDR	T, X
	LDT	#10
	COMPR	T, A
	JLT	printns1
	RSUB

printns2		.print the number in ns2
	TD	stdout
	JEQ	printns2
	LDCH	ns2, X
	WD	stdout
	LDT	#1
	ADDR	T, X
	LDT	#10
	COMPR	T, A
	JLT	printns2
	RSUB

input1			.read the first number and store in ns1
	TD	stdin
	JEQ	input1
	RD	stdin
	STCH	ns1, X
	LDT	#1
	ADDR	T, X
	LDT	#10
	COMPR	T, A
	JLT	input1
	RSUB

clns1			.clear the data in ns1
	LDCH	space
	STCH	ns1, X
	TIXR	T
	JLT	clns1
	RSUB

stn			.convert ns1 to int and store in n1
	SUB	#48
	LDS	#10
	MULR	S, T
	ADDR	A, T
	LDCH	ns1, X
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

ns1	RESB	10	.store the first number as string
ns2	RESB	10	.store the second number as string

n1	WORD	0	.store the first number
n2	WORD	0	.store the second number
n3	WORD	0
n4	WORD	0

newline	BYTE	10
space	BYTE	32
stdin	BYTE	0
stdout	BYTE	1
