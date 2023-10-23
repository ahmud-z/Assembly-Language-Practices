

.MODEL SMALL
.STACK 100H

.DATA
 MCG DB ' Factorial is: $'
 NUM DW 3

.CODE

MAIN PROC
 
    MOV AX,@DATA
    MOV DS,AX
 
 
    MOV AH,2 
    MOV DX,NUM
    ADD DL,48
    INT 21H 
       
            
    MOV AH,9
    MOV DX,OFFSET(MCG)
    INT 21H 
    
    
    MOV AX,1
    MOV CX,NUM 
 
    
    myLoop:
    MUL CX
    LOOP myLoop
     
    MOV AH,2
    ADD AL,48 
    MOV DL,AL
    INT 21H 
     
      
    MOV AH,4CH
    INT 21H    
    
    MAIN ENDP
    END MAIN