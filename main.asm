; Calcule a soma de todos os números primos, no intervalo de precisão ; da máquina, imprimindo a soma na saída.

JMP .start
	int_i: DB 0     ; contador i
	int_j: DB 0     ; contador j
	int_tam: DB 1   ; tamanho da precisao
	int_soma: DB 0  ; guarda resultado da soma
	int_div: DB 0   ; guarda resultado da divisao
	MOV D, 232      ; posicao para imprimir//nao sei
.start:	
	JMP .for_um

.for_um:
	MOV A, [int_i]   ; coloca o contador i no A
	CMP A, [int_tam] ; Compara contado i com o tamanho de precisao
	JE .fora_for     ; se for igual sai do laco um
.for_dois:
	MOV A, [int_i]
	MOV B, [int_j]
        MOV B, 1         ; senao inicializa B com valor 1
	CMP B, A         ; compara o contador j com o contador i
	JA .fim_for_um   ; se igual sai do for um
	MOV D, [int_div] ; coloca o resultado da divisao (valendo zero) no D
	MOV D, 0         ; zera a divisao
	DIV B            ; divide pelo j
	MOV D, [A]       ; coloca o valor no D
	CMP D, 0         ; verifica se D = 0
	JNE .fim_for_dois; se sim sai do for
	SUB A, D         ; senao subtrai o dividendo - resultado 
	MOV D, [A]       ; coloca o resultado do resto no D
	CMP D, 0         ; verifica se o resto é zero
	JNE .fim_for_dois; se nao for sai do for dois
 	MOV A, [int_soma]; se for coloca a soma dos numero primos no A 
	MOV B, [int_i]   ; coloca o contador i no B
	ADD A, B         ; faz a soma dos primos + i
	MOV A, [A]       ; salva na soma
	JMP .fim_for_dois; volta para o for dois
.fim_for_um:	
	MOV A, [int_i]   ; incrementa o i
	INC A
	MOV B, [int_j]
	MOV B, 0         ;zera o j
	JMP .for_um
.fim_for_dois:
	MOV B, [int_j]
	INC B
	JMP .for_dois
.fora_for:



PUSH A
	PUSH B
	MOV B, 0
	MOV A, [C]
	MOV [D], A
	INC C
	INC D
	JMP .for



	
