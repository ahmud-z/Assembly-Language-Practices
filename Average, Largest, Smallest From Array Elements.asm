.STACK 100H

.DATA

ARR DB 1,8,7,2 

MAX DB ?



.CODE
MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
    
    MOV CX,4
    MOV SI,0

    MOV AL, ARR[SI]         
    MOV MAX,AL

    FIRST_LOOP:

    MOV DL,ARR[SI]    

    CMP DL, MAX    ; Compare DL (current element) with MAX
    JLE NOT_GREATER  ; Jump if NOT greater or equal (i.e., if DL is less than or equal to MAX)

    ; If DL is greater than MAX, update MAX
    MOV AL, DL
    MOV MAX, AL

    NOT_GREATER:

    ADD DL, 48

    MOV AH,02H
    INT 21H

    MOV AH,2
    MOV DL,20h      ;Print Single Space
    INT 21H

    INC SI

    LOOP FIRST_LOOP 

    MOV DL, MAX
    ADD DL, 48
    MOV AH,02H
    INT 21H

    MOV AH,4CH
    INT 21H  
    
MAIN ENDP
END MAIN
