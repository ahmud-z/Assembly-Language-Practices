
.MODEL SMALL
.STACK 100H

.DATA

MSG DB 'ENTER YOUR INPUT: $'

IF_MSG DB 'DIGIT$'

ELSE_MSG DB 'ALPHABET$'

INPUT DB ?


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
MOV INPUT,AL

CMP INPUT,0
JE IF

CMP INPUT,1
JE IF

CMP INPUT,2
JE IF

CMP INPUT,3
JE IF

CMP INPUT,4
JE IF

CMP INPUT,5
JE IF

CMP INPUT,6
JE IF

CMP INPUT,7
JE IF
CMP INPUT,8

JE IF

CMP INPUT,9
JE IF

JNE ELSE
     
     
    IF: 
       
       MOV AH,2
       MOV DL,0DH
       INT 21H
       MOV AH,2       ;PRINT A NEW LINE
       MOV DL,0AH
       INT 21H
       
        
       MOV AH,9
       MOV DX,OFFSET(IF_MSG)
       INT 21H
        
       JMP END_IF
    
    ELSE:

       MOV AH,2
       MOV DL,0DH
       INT 21H
       MOV AH,2       ;PRINT A NEW LINE
       MOV DL,0AH
       INT 21H
       
    
       MOV AH,9
       MOV DX,OFFSET(ELSE_MSG)
       INT 21H 
       
       JMP END_IF      
     
    END_IF:
       
       MOV AH,4CH
       INT 21H
       
           
MAIN ENDP
END MAIN