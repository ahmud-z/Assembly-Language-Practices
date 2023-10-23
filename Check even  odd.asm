.MODEL SMALL
.STACK 100H


.DATA 

NUM1 DB ?
NUM2 DB ?
NUMBER DB ?
TEMP DB 10


.CODE

MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX    
        
 
    MOV AH,1   
    INT 21H         ;User Input First Digit
    MOV NUM1,AL   

    
       
    
    MOV AH,2
    MOV DL,NUM1     ;Print User Input First Digit
    INT 21H
    
     
  
    SUB AL,48 
    MUL TEMP           ;Coverting      
    MOV NUMBER,AL


     
     
    MOV AH,1   
    INT 21H        ;User Input Second Digit
    MOV NUM1,AL   
    
    MOV AH,2
    MOV DL,NUM1    ;Print User Input Second Digit
    INT 21H
    
    
    SUB AL,48 
    ADD NUMBER,AL     ;Coverting in a single digit

     

    MOV AL,0
    MOV BL,2
    MOV AL,NUMBER   ;This section doesn't work):
    
    DIV BL

   
 
    MOV AH,4CH
    INT 21H    
   
    MAIN ENDP

    END MAIN