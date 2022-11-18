
# Laboratorio 2

**Ejercicio 1:** Escribir un programa que solicite el ingreso de un número (de un dígito) por teclado. Comprobar si el caracter ingresado es un número y, si lo es, mostrarlo por pantalla. Caso contrario mostrar por pantalla el mensaje “CARACTER NO VALIDO"


```àssemby
	ORG	1000H
MSJ	DB	"Ingrese un número: "
FIN	DB	?

	ORG	1500H
NUM	DB	?

	ORG	2000H
	MOV	BX, OFFSET MSJ
	MOV	AL, OFFSET FIN - OFFSET MSJ
	INT	7
	MOV	BX,OFFSET NUM
	INT	6
	CALL	VAL
	
	
	
	
	
	INT	0
	END
	
	ORG 3000H
VAL:	CMP	NUM, 0
	JMP	
        INCOMPLETO
```


**Ejercicio 2:** Realizar una multiplicación de 2 valores utilizando la subrutina MUL, pero esta vez pidiendo el ingreso de dichos valores por teclado. Al finalizar la operación, muestre el resultado por pantalla.

NOTA: la multiplicación se realizará entre valores de un solo dígito. Para mostrar por pantalla tener en cuenta que el resultado puede tener 2 dígitos y realizar la subrutina correspondiente para mostrar el valor entero por pantalla.

