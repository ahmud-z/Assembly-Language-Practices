.MODEL SMALL
.STACK 100H

.DATA 

MSG1 DB 'Enter Five number: $'
MSG_SUM DB 'Addition Result: $'
MSG_RES DB 'Division Result: $'
MSG_REM DB 'Remainder Result: $'

SUM DB ?
RES DB ?
REM DB ?


.CODE
MAIN PROC
 
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,9
    MOV DX,OFFSET(MSG1)  ;PRINT MSG 1
    INT 21H
    
    MOV AH,1
    INT 21H        ;TAKE USER INPUT 1
                                                                                                                               
    SUB AL,48
    MOV SUM,AL
     
     
    MOV AH,2
    MOV DL,20H      ;print single space
    INT 21H 
    
    MOV AH,1
    INT 21H        ;TAKE USER INPUT 2
        
    SUB AL,48
    ADD SUM,AL
    
        
    MOV AH,2
    MOV DL,20H      ;print single space
    INT 21H  
    
    MOV AH,1
    INT 21H        ;TAKE USER INPUT 3
    
   
    SUB AL,48
    ADD SUM,AL
         
    MOV AH,2
    MOV DL,20H      ;print single space
    INT 21H 
    
    MOV AH,1
    INT 21H        ;TAKE USER INPUT 4
    
    SUB AL,48
    ADD SUM,AL
           
    MOV AH,2
    MOV DL,20H      ;print single space
    INT 21H 
    
    
    MOV AH,1
    INT 21H        ;TAKE USER INPUT 5
    
    SUB AL,48
    ADD SUM,AL
 
          

    MOV AH,2
    MOV DL,0DH
    INT 21H
    MOV AH,2       ;PRINT A NEW LINE
    MOV DL,0AH
    INT 21H    
    
    
    MOV AH,9
    MOV DX,OFFSET(MSG_SUM)  ;PRINT Final MSG
    INT 21H

    
    MOV AH,2  
    ADD SUM,48 
    MOV DL,SUM
    INT 21H   
 
    MOV AH,0
    MOV AL,0
    
    SUB SUM,48
    
    MOV AL,SUM
    MOV BL,2
    DIV BL
    
    MOV RES,AL
    MOV REM,AH 
    
    MOV AH,2
    MOV DL,0DH
    INT 21H
    MOV AH,2       ;PRINT A NEW LINE
    MOV DL,0AH
    INT 21H
    
    MOV AH,9
    MOV DX,OFFSET(MSG_RES)  ;PRINT Final MSG
    INT 21H
    
    
    MOV AH,2  
    ADD RES,48 
    MOV DL,RES
    INT 21H
    
             
    MOV AH,2
    MOV DL,0DH
    INT 21H
    MOV AH,2       ;PRINT A NEW LINE
    MOV DL,0AH
    INT 21H
    
    MOV AH,9
    MOV DX,OFFSET(MSG_REM)  ;PRINT Final MSG
    INT 21H
    
    MOV AH,2  
    ADD REM,48 
    MOV DL,REM
    INT 21H  
    
    
    
    
    MAIN ENDP

    END MAIN