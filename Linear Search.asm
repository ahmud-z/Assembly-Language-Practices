.MODEL SMALL
.STACK 100H

.DATA
    
    ARR DB 6, 1, 2, 4, 5    
    SIZE equ $ - ARR
    
    SEARCH_VALUE DB 3
    
    MSG_FOUND DB 'VALUE FOUND $'
    MSG_NOT_FOUND DB 'VALUE NOT FOUND $'

.CODE
    MOV AX, @DATA
    MOV DS, AX

    MOV SI, 0     
    MOV AL, SEARCH_VALUE

    
SEARCH_LOOP:

    CMP SI, SIZE        
    JE  NOT_FOUND       

    CMP [SI], AL        
    JE  VALUE_FOUND     

    INC SI              
    JMP SEARCH_LOOP     

VALUE_FOUND:

    MOV AH, 09H         
    MOV DX, OFFSET MSG_FOUND
    INT 21H

    JMP END_PROGRAM
    
    
NOT_FOUND:
    MOV AH, 09H         
    MOV DX, OFFSET MSG_NOT_FOUND
    INT 21H
    
    
END_PROGRAM:
    MOV AH, 4CH         
    INT 21H
    
END
