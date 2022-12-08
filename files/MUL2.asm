	ORG 	1000H
MSJ  	DB 	"Ingrese un numero"
FIN  	DB 	?
var1  	DB 	?
var2  	DB 	?
var3	DB	0
dec 	DB 	0
unit 	DB 	?
	ORG 	2000H
	MOV 	BX, 	OFFSET MSJ
	MOV 	AL, 	OFFSET FIN - OFFSET MSJ
	INT 	7
      	MOV 	BX, 	OFFSET var1
      	INT 	6
      	MOV 	AL, 	1
      	INT 	7
 	MOV 	BX, 	OFFSET MSJ
	MOV 	AL, 	OFFSET FIN - OFFSET MSJ
	INT 	7
      	MOV 	BX, 	OFFSET var2
      	INT 	6
      	MOV 	AL, 	1
      	INT 	7
      	SUB	var1,	30H
      	SUB 	var2,	30H
      	MOV 	CH, 	var1
      	MOV 	DL,	0
      	CALL	MUL

DECE:  	CMP 	DL,	10
      	JS 	FIND
      	SUB 	DL,	10
      	INC 	decenas
     	JMP 	DECE 
FIND:  	MOV 	unit,	DL
      	ADD 	unit,	30H
      	ADD 	dec, 	30H
      	MOV 	BX, 	OFFSET decenas         
      	MOV 	AL,	2
      	INT 	7
      	INT 	0
      
MUL:	CMP	CH,	0
	JZ	FMUL
	SUB	CH,	1
	ADD	DL,	var2
	JMP	MUL
FMUL:	RET      

	END



