INCLUDE 'EMU8086.INC'

.STACK 100H

.DATA

STRING DB 'HELLO WORLD$'


.CODE 
MAIN PROC

    MOV AX,@DATA
    MOV DS,AX



    MOV SI,OFFSET STRING
    MOV CX,11

LOOP1:
    MOV BX,[SI]
    PUSH BX
    INC SI

LOOP LOOP1

    MOV CX,11

LOOP2:
    POP DX
    MOV AH, 02H
    INT 21H
LOOP LOOP2

MAIN ENDP
END MAIN




