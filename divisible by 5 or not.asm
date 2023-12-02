
.MODEL SMALL
.STACK 100H

.DATA 

MSG1 DB 'ENTER A SINGLE DIGIT NUMBER: $'

IF_MSG DB 'DIVISIBLE BY 5 $'

ELSE_MSG DB 'NOT DIVISIBLE BY 5 $'

NUM DB ?
RES DB ?
REM DB ?


.CODE
MAIN PROC
 
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,9
    MOV DX,OFFSET(MSG1)
    INT 21H
    
    MOV AH,1
    INT 21H   
                                                                                                                               
    SUB AL,48
    MOV NUM,AL

    MOV AH,0
    MOV AL,0
 
    MOV AL,NUM
    MOV BL,5
    
    DIV BL
    
    MOV RES,AL
    MOV REM,AH 

    CMP REM,0
    JE IF
    JNE ELSE
   
    IF:
        MOV DL,10
        MOV AH,02H
        INT 21H
                    ;PRINT A NEWLINE            
        MOV DL,13
        MOV AH,02H
        INT 21H
         
    
        MOV AH,9
        MOV DX,OFFSET(IF_MSG)  ;PRINT MSG2
        INT 21H
        JMP END_IF
         
     ELSE:  
        MOV DL,10
        MOV AH,02H
        INT 21H
                    ;PRINT A NEWLINE 
        MOV DL,13
        MOV AH,02H
        INT 21H
     
        MOV AH,9
        MOV DX,OFFSET(ELSE_MSG)   ;PRINT MSG2
        INT 21H
        JMP END_IF
     
     END_IF:
        
        MOV AH,4CH
        INT 21H
        
    MAIN ENDP

    END MAIN