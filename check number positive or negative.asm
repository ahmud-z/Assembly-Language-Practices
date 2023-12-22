
INCLUDE 'EMU8086.INC'

.MODEL SMALL
.STACK 100H

.DATA
 
 NUM DB -5
 
 
 
 .CODE 
 MAIN PROC 
    
 
    MOV AX,@DATA
    MOV DS,AX
       
    
    CHECK:
    
    CMP NUM,0
    
    JE ZERO_MSG
    
    JG POSITIVE_MSG 
    
    JMP NEGATIVE_MSG
    
 
    
    
     
    ZERO_MSG:
    
    PRINT "ZERO"
    
    JMP END 
     
    
    POSITIVE_MSG:
    
    PRINT "POSITIVE"
    
    JMP END
    
    
    
    NEGATIVE_MSG:
    
    PRINT "NEGATIVE"
    
    JMP END
    
    
    END:
        MOV AH,04H
        INT 21H
    
    MAIN ENDP 
    END  MAIN
    
 
 
 
    