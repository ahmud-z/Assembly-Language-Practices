INCLUDE 'EMU8086.INC'

.STACK 100H

.DATA
MSG DB 'HELLO WORLD!',0

LENGTH DB ?

.CODE
MAIN PROC
    
MOV AX,@DATA
MOV DS,AX

 MOV SI,OFFSET MSG
 MOV CX,0
 
 
 FIND_LENGTH:
    
    CMP [SI],0
    
    JE END
    
    INC CX
    INC SI
    
 JMP FIND_LENGTH
 
 
 END:
    
    MOV LENGTH,CL 
                               
    MOV AH,04H
    INT 21H   
    
    MAIN ENDP
    END MAIN 
