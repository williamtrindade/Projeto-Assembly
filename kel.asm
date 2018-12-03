; Trabalho Arq e Org de Computadores, Kelvin

JMP start
i:	DB 1
j:	DB 1
count:	DB 0
aux:	DB 0
countPrimo: DB 0
x: 	DB 10

start:
	MOV D, [i]	; inicializando o for

for:	
	MOV B, [count]	; B = count, smp resetar count após o uso
	CMP D, B
	JZ imprimir	; verifica se D já passou dos 255, qd vira 0
	MOV C, [j]	; (re)inicializa o J para q compare desd o 1
for2:	CMP C, D	; verifica se nesse for o C é > D
	JA outFor2	;         para poder continuar o laço
	CMP B,2		; se count=2 antes d chegar no i vai no fora 
	JE fora
	MOV A, D	; A = aux, método para verifica se tem resto
	DIV C		; aux = i/j, se aux*j = i
	MUL C
if:	CMP A, D
	JNE foraif	; se forem diferentes, tem resto e pula fora
	INC B		; incrementa o contador
	INC C
	JMP for2
	
foraif: INC C
	JMP for2
outFor2:
	CMP B, 2	; segundo IF pra verificar se count == 2
	JNE fora
	MOV B, [countPrimo]
	INC B
	MOV [countPrimo], B
	
fora:
	INC D
	JMP for

imprimir:
	MOV C, countPrimo	; Point to var 
	MOV D, 232	; Point to output
	CALL printNum
        HLT             ; Stop execution

printNum:		; print(C:*from, D:*to)
	PUSH A
	PUSH B

.do:
	MOV B, [x]
	MOV A, [C]	; carrega num
	DIV B
	MOV B, A
	DIV 10
	MUL 10
	SUB B, A
	ADD B, 48
	
	MOV [D], B	; Write to output
	INC D 
	MOV A, [x]
	DIV 10
	MOV [x], A
	
	CMP A, 1	; Check if end
	JAE .do		; jump if not

	POP B
	POP A
	RET
