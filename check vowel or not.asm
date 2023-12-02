
.MODEL SMALL
.STACK 100H

.DATA

MSG DB 'ENTER A ALPHABET: $'

IF_MSG DB 'VOWEL$'

ELSE_MSG DB 'NOT VOWEL$'

CHAR DB ?


.CODE
MAIN PROC
    
MOV AX,@DATA

MOV DS,AX    
    

MOV AH,9
MOV DX,OFFSET(MSG)
INT 21H


MOV AH,1
INT 21H    

MOV CHAR,AL

CMP CHAR,'A'
JE IF

CMP CHAR,'a'
JE IF

CMP CHAR,'E'
JE IF

CMP CHAR,'e'
JE IF

CMP CHAR,'I'
JE IF

CMP CHAR,'i'
JE IF

CMP CHAR,'O'
JE IF

CMP CHAR,'o'
JE IF

CMP CHAR,'U'
JE IF

CMP CHAR,'u'
JE IF

JNE ELSE
     
     
    IF: 
       MOV AH,2
       MOV DL,0DH
       INT 21H
       MOV AH,2       ;PRINT A NEW LINE
       MOV DL,0AH
       INT 21H 
       MOV AH,2
       
        
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