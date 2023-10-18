.MODEL SMALL
.STACK 100H

.DATA 

result db ?
remainder db ?


.CODE
MAIN PROC
    
    
    MOV AX,26
    MOV BL,5
    
    DIV BL 
    
    MOV result, AL
    MOV remainder, AH
    
    MOV DL,result
    ADD DL,48 
    MOV AH,2
    INT 21H
    
    
    MOV DL,remainder
    ADD DL,48 
    MOV AH,2
    INT 21H
                    
 
    MOV AH,4CH
    INT 21H 
    
                       
                    

MAIN ENDP
END MAIN