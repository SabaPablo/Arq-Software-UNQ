
# Laboratorio 2

**Ejercicio 1:** Escribir un programa que solicite el ingreso de un número (de un dígito) por teclado. Comprobar si el caracter ingresado es un número y, si lo es, mostrarlo por pantalla. Caso contrario mostrar por pantalla el mensaje “CARACTER NO VALIDO"


```assembly
ORG   	1000H
MSJ  	DB   "Ingresa un numero"
FIN  	DB   ?
VAR  	DB   ?
MERROR  DB   "CARACTER NO VALIDO"
EFIN  	DB   ?

  	ORG  2000H

  	MOV  BX, OFFSET MSJ
  	MOV  AL, OFFSET FIN - OFFSET MSJ
  	INT  7
  	MOV  BX, OFFSET VAR
  	INT  6
  	MOV  AL, 1
  	SUB  VAR,30H
  	CMP  VAR, 10
  	JS   NUM
  	MOV  BX, OFFSET MERROR
  	MOV  AL, OFFSET EFIN - OFFSET MERROR
  	INT  7
  	JMP  F
  
NUM: 	ADD  VAR, 30H  
  	MOV  BX, OFFSET VAR
  	MOV  AL, 1
  	INT  7
F:  	INT  0
  
  	END
  
```

**Ejercicio 2:** Realizar una multiplicación de 2 valores utilizando la subrutina MUL, pero esta vez pidiendo el ingreso de dichos valores por teclado. Al finalizar la operación, muestre el resultado por pantalla.

NOTA: la multiplicación se realizará entre valores de un solo dígito. Para mostrar por pantalla tener en cuenta que el resultado puede tener 2 dígitos y realizar la subrutina correspondiente para mostrar el valor entero por pantalla.

```assembly
	ORG   1000H
MSJ    	DB    "Ingrese un numero"
FIN    	DB    ?
var1    DB    ?
var2    DB    ?
var3  	DB    0
dec   	DB    0
unit  	DB    ?
  	ORG   2000H
  	MOV   BX,   OFFSET MSJ
 	MOV   AL,   OFFSET FIN - OFFSET MSJ
  	INT   7
        MOV   BX,   OFFSET var1
        INT   6
        MOV   AL,   1
        INT   7
   	MOV   BX,   OFFSET MSJ
  	MOV   AL,   OFFSET FIN - OFFSET MSJ
  	INT   7
        MOV   BX,   OFFSET var2
        INT   6
        MOV   AL,   1
        INT   7
        SUB   var1,  30H
        SUB   var2,  30H
        MOV   CH,   var1
        MOV   DL,  0
        CALL  MUL

DECE:   CMP   DL,  10
        JS    FIND
        SUB   DL,  10
        INC   decenas
       	JMP   DECE 
FIND:   MOV   unit,  DL
        ADD   unit,  30H
        ADD   dec,   30H
        MOV   BX,   OFFSET decenas         
        MOV   AL,  2
        INT   7
        INT   0
      
MUL:  	CMP  CH,  0
  	JZ   FMUL
  	SUB  CH,  1
  	ADD  DL,  var2
  	JMP  MUL
FMUL:  	RET      

  	END
  
 ```
