TITLE CALCULADORA
;Lucas Dias Faquim 11121EMT019
;André Fernandes de Almeida 11011EMT013
.MODEL SMALL

.STACK 100h

.DATA
  MSG1 DB 'Digite a base desejada (d/h):$'
  MSG2 DB 0Dh,0Ah,'Entre com um valor em decimal (0-65535): $'
  MSG3 DB 0Dh,0Ah,'Valor na base escolhida: $'
  MSG4 DB 0Dh,0Ah,'|**************CALCULADORA ASSEMBLY**********| $'
  MSG5 DB 0Dh,0Ah,'| Digite a opcao desejada:                   | $'
  MSG6 DB 0Dh,0Ah,'|   a- Adicao                                | $'
  MSG7 DB 0Dh,0Ah,'|   b- Subtracao                             | $'
  MSG8 DB 0Dh,0Ah,'|   c- Multiplicacao                         | $'
  MSG9 DB 0Dh,0Ah,'|   d- Divisao                               | $'
  MSG10 DB 0Dh,0Ah,'|   e- Exponenciacao (a^b)                   | $'
  MSG11 DB 0Dh,0Ah,'|   f- Raiz Quadrada Inteira                 | $'
  MSG12 DB 0Dh,0Ah,'|********************************************| $'
  MSG13 DB 0Dh,0Ah,'Operacao Escolhida? $'
  MSG14 DB 0Dh,0Ah,'Entre com um valor (em decimal) [0-32767]: $'
  MSG15 DB 0Dh,0Ah,'Entre com o segundo valor (em decimal) [0-32768]: $'
  MSG16 DB 0Dh,0Ah,'Entre com um valor (em decimal) [0-255]: $'
  MSG17 DB 0Dh,0Ah,'Entre com o segundo valor (em decimal) [0-255]: $'
  MSG18 DB 0Dh,0Ah,'Entre com o dividendo (em decimal) [0-65535]: $'
  MSG19 DB 0Dh,0Ah,'Entre com o divisor (em decimal) [0-65535]: $'
  MSG20 DB 0Dh,0Ah,'**********Quociente da Divisao********** $'
  MSG21 DB 0Dh,0Ah,'**********Resto da Divisao********** $'
  MSG22 DB 0Dh,0Ah,'Entre com a base "a" (em decimal): $'
  MSG23 DB 0Dh,0Ah,'Entre com o expoente "b" (em decimal): $'
  MSG24 DB 0Dh,0Ah,'**********RAIZ********** $'
  MSG25 DB 0Dh,0Ah,'Entre com um valor menor ou igual que o inserido anteriormente: $'
  
  .CODE

MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    MOV AH, 9
    LEA DX, MSG4
    INT 21h
    LEA DX, MSG5
    INT 21h
    LEA DX, MSG6
    INT 21h
    LEA DX, MSG7
    INT 21h
    LEA DX, MSG8
    INT 21h
    LEA DX, MSG9
    INT 21h
    LEA DX, MSG10
    INT 21h
    LEA DX, MSG11
    INT 21h
    LEA DX, MSG12
    INT 21h
    LEA DX, MSG13
    INT 21h
    MOV AH, 1
    INT 21h
    CMP AL, 'a'
    JE Ops1
    CMP AL, 'b'
    JE Ops2
    CMP AL, 'c'
    JE Ops3
    CMP AL, 'd'
    JE Ops4
    CMP AL, 'e'
    JE Ops5
    CMP AL, 'f'
    JE Ops6
Ops1: CALL ADI
     JMP FIM
Ops2: CALL SUBS
     JMP FIM
Ops3: CALL MULT
     JMP FIM
Ops4: CALL DIVI
     JMP FIM
Ops5: CALL POT
     JMP FIM
Ops6: CALL RAIZ
     JMP FIM

;CALL LEHEX
;JMP M0
;M1: CALL LEDEC
;M0: MOV AH, 9
;    LEA DX, MSG1
;    INT 21h
;    MOV AH, 1
;    INT 21h
;    CMP AL, 'd'
;    JE M2
;    CALL IMPHEX 
;    JMP M3
;M2: CALL IMPDEC


FIM: MOV AH, 4Ch
     INT 21h
MAIN ENDP

;le decimal e armazena valor em BX
LEDEC PROC
    MOV BX, 0
L1: MOV AH, 1
    INT 21h
    CMP AL, 0Dh
    JE L2
    SUB AL, '0'
    MOV CL, AL
    MOV CH, 0
    MOV AX, 10
    MUL BX
    MOV BX, AX
    ADD BX, CX
    JMP L1
L2: RET
LEDEC ENDP

;imprime valor em BX na tela na base decimal
IMPDEC PROC
    MOV AH, 9
    LEA DX, MSG3
    INT 21h
    MOV CX, 0
L7: CMP BX, 0
    JE L8         ;imprime
    MOV AX, BX
    MOV DX, 0
    MOV BX, 10
    DIV BX
    PUSH DX
    MOV BX, AX
    INC CX
    JMP L7
L8: CMP CX, 0
    JE L9
    POP DX
    ADD DX, '0'
    MOV AH, 2
    INT 21h
    DEC CX
    JMP L8
L9: RET
IMPDEC ENDP

;imprime valor em BX na tela na base hexadecimal decimal
IMPHEX PROC
    MOV AH, 9
    LEA DX, MSG3
    INT 21h
    MOV CX, 0
LA: CMP BX, 0
    JE LB         ;imprime
    MOV AX, BX
    MOV DX, 0
    MOV BX, 16
    DIV BX
    PUSH DX
    MOV BX, AX
    INC CX
    JMP LA
LB: CMP CX, 0
    JE LF
    POP DX
    CMP DX, 10
    JGE LC
    ADD DX, '0'
    JMP LD
LC: ADD DX, 'a'
    SUB DX, 10
LD: MOV AH, 2
    INT 21h
    DEC CX
    JMP LB
LF: RET
IMPHEX ENDP

ADI PROC
    MOV AH, 9
    LEA DX, MSG14
    INT 21h
    CALL LEDEC
    PUSH BX
    MOV AH, 9
    LEA DX, MSG15
    INT 21h
    CALL LEDEC
    POP CX
    ADD CX, BX
    PUSH CX
    POP BX
    MOV AH, 9
    LEA DX, MSG1
    INT 21h
    MOV AH, 1
    INT 21h
    CMP AL, 'd'
    JE OP1
    CMP AL, 'h'
    JE OP2
    
OP1:
	 CALL IMPDEC
     JMP FIMADI
OP2: 
	 CALL IMPHEX
     JMP FIMADI
FIMADI: RET

ADI ENDP

SUBS PROC
    MOV AH, 9
    LEA DX, MSG2
    INT 21h
    CALL LEDEC
    PUSH BX
    MOV AH, 9
    LEA DX, MSG25
    INT 21h
    CALL LEDEC
    POP CX
    SUB CX, BX
    PUSH CX
    POP BX
    MOV AH, 9
    LEA DX, MSG1
    INT 21h
    MOV AH, 1
    INT 21h
    CMP AL, 'd'
    JE OP3
    CMP AL, 'h'
    JE OP4
OP3: CALL IMPDEC
     JMP FIMSUBS
OP4: CALL IMPHEX
     JMP FIMSUBS
FIMSUBS: RET

SUBS ENDP

MULT PROC
    MOV AH, 9
    LEA DX, MSG16
    INT 21h
    CALL LEDEC
    PUSH BX
    MOV AH, 9
    LEA DX, MSG17
    INT 21h
    CALL LEDEC
    POP CX
    MOV AX, BX
    MUL CX
    PUSH AX
    POP BX
    MOV AH, 9
    LEA DX, MSG1
    INT 21h
    MOV AH, 1
    INT 21h
    CMP AL, 'd'
    JE OP5
    CMP AL, 'h'
    JE OP6
OP5: CALL IMPDEC
     JMP FIMMULT
OP6: CALL IMPHEX
     JMP FIMMULT
FIMMULT: RET

MULT ENDP

DIVI PROC
    MOV AH, 9
    LEA DX, MSG18
    INT 21h
    CALL LEDEC
    PUSH BX
    MOV AH, 9
    LEA DX, MSG19
    INT 21h
    CALL LEDEC
    POP AX
    DIV BX
    PUSH DX
    PUSH AX
    MOV AH, 9
    LEA DX, MSG1
    INT 21h
    MOV AH, 1
    INT 21h
    CMP AL, 'd'
    JE OP7
    CMP AL, 'h'
    JE OP8

OP7: POP AX
	 MOV BX, AX
     MOV AH, 9
     LEA DX, MSG20
     INT 21h
     CALL IMPDEC
     POP DX
     MOV BX, DX
     MOV AH, 9
     LEA DX, MSG21
     INT 21h
     CALL IMPDEC
     JMP FIMDIVI

OP8: POP AX
	 MOV BX, AX
     MOV AH, 9
     LEA DX, MSG20
     INT 21h
     CALL IMPHEX
     POP DX
     MOV BX, DX
     MOV AH, 9
     LEA DX, MSG21
     INT 21h
     CALL IMPHEX
     JMP FIMDIVI
FIMDIVI: RET

DIVI ENDP

POT PROC
	MOV CX, 0
    MOV AH, 9
    LEA DX, MSG22
    INT 21h
    CALL LEDEC
    PUSH BX
    MOV AH, 9
    LEA DX, MSG23
    INT 21h
    CALL LEDEC
    POP AX
    MOV CX, BX
    SUB CX, 1
    MOV BX, AX
LOOP1:
	MUL BX
    LOOP LOOP1
    PUSH AX
    POP BX
    MOV AH, 9
    LEA DX, MSG1
    INT 21h
    MOV AH, 1
    INT 21h
    CMP AL, 'd'
    JE OP9
    CMP AL, 'h'
    JE OP10
OP9: CALL IMPDEC
     JMP FIMPOT
OP10: CALL IMPHEX
     JMP FIMPOT
FIMPOT: RET

POT ENDP

RAIZ PROC
    MOV AH, 9
    LEA DX, MSG2
    INT 21h
    CALL LEDEC
    MOV CX, 0
    MOV AX, 1
LOOP2:
    CMP BX, AX
    JB CONTINUA
    SUB BX, AX
    ADD AX, 2
    ADD CX, 1
    JMP LOOP2
CONTINUA:
    PUSH CX
    POP BX
    MOV AH, 9
    LEA DX, MSG1
    INT 21h
    MOV AH, 1
    INT 21h
    CMP AL, 'd'
    JE OP11
    CMP AL, 'h'
    JE OP12
OP11: 
     MOV AH, 9
     LEA DX, MSG24
     INT 21h
     CALL IMPDEC
     JMP FIMRAIZ
OP12: 
     MOV AH, 9
     LEA DX, MSG24
     INT 21h
     CALL IMPHEX
     JMP FIMRAIZ
FIMRAIZ: RET

RAIZ ENDP

END MAIN