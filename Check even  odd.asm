INCLUDE 'EMU8086.INC'
.MODEL SMALL
.STACK 100H
.DATA 

NUMBER DB ?
RESULT DB ?
REMAINDER DB ?
TEMP DB 10 

MSG DB 'Enter a two digit number: $'


.CODE

MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX    
        
    
    MOV AH,9
    MOV DX,OFFSET(MSG)
    INT 21H
    
     
    MOV AH,1   
    INT 21H       
    SUB AL,48
    
     
    MUL TEMP          
    MOV NUMBER,AL
    
     
    MOV AH,1   
    INT 21H      
    SUB AL,48
    
     
    ADD NUMBER,AL   
    
    
    MOV AL,NUMBER
    MOV BL,2
    MOV AH,0
    
    
    DIV BL      
    
    MOV RESULT,AL
    MOV REMAINDER,AH   
    
          
    MOV AH,2
    MOV DL,0DH
    INT 21H
    MOV AH,2       ;PRINT A NEW LINE
    MOV DL,0AH
    INT 21H 
    
    MOV AH,2
    MOV DL,0DH
    INT 21H
    MOV AH,2       ;PRINT A NEW LINE
    MOV DL,0AH
    INT 21H 
    
        
    MOV BL,REMAINDER
     
 
    CMP BL,0
    JLE IF
    JG ELSE
    
    
    IF:
    PRINTN "The number is EVEN"   
     
    JMP END_IF 
     
     ELSE:
        PRINTN "The number is ODD"
     JMP END_IF
               
               
    END_IF:       
 
    MOV AH,4CH
    INT 21H
       
    MAIN ENDP
    END MAIN
    