INCLUDE 'EMU8086.INC'

.STACK 100H

.DATA 

    M1 DB 'HELLO', 0
    M2 DB 'WORLD', 0  
    
    MSG1 DB 'MATCHED$'
    MSG2 DB 'NOT MATCHED$'

.CODE
MAIN PROC
    
    MOV AX, @DATA
    MOV DS, AX

    MOV SI, OFFSET M1 
    MOV DI, OFFSET M2 

    
CHECK:
    MOV AL, [SI]       
    CMP AL, [DI]       
    JNE IF    

    
    CMP AL, 0
    JE ELSE

    INC SI             
    INC DI
                 
    JMP CHECK 

IF:
    MOV AH, 09H        
    MOV DX, OFFSET MSG2
    INT 21H

    JMP END_PROGRAM

ELSE:
    MOV AH, 09H        
    MOV DX, OFFSET MSG1
    INT 21H

END_PROGRAM:
    

    MAIN ENDP
    END MAIN
