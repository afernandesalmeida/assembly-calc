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