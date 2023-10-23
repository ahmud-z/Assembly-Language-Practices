.MODEL SMALL
.STACK 100H


.DATA

MSG1 DB 'Enter first number: $'
MSG2 DB 'Enter second number: $'
MSG3 DB 'Enter third number: $'
MSG4 DB 'Enter fourth number: $'
MSG5 DB 'Enter fifth number: $'

MSG_SUM DB 'Addition Result: $'

MSG_RES DB 'Division Result: $'
MSG_REM DB 'Remainder Result: $'

SUM DB ?
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
    MOV DL,0DH
    INT 21H
    MOV AH,2       ;PRINT A NEW LINE
    MOV DL,0AH
    INT 21H 
       
       
    
    MOV AH,9
    MOV DX,OFFSET(MSG2)  ;PRINT MSG 2
    INT 21H
    
    
    MOV AH,1
    INT 21H        ;TAKE USER INPUT 2
    
      
    
    SUB AL,48
    ADD SUM,AL
    
    
    MOV AH,2
    MOV DL,0DH
    INT 21H
    MOV AH,2       ;PRINT A NEW LINE
    MOV DL,0AH
    INT 21H 
       
       
    
    MOV AH,9
    MOV DX,OFFSET(MSG3)  ;PRINT MSG 3
    INT 21H
    
    
    MOV AH,1
    INT 21H        ;TAKE USER INPUT 3
    
    
    
    SUB AL,48
    ADD SUM,AL
    
    
    MOV AH,2
    MOV DL,0DH
    INT 21H
    MOV AH,2       ;PRINT A NEW LINE
    MOV DL,0AH
    INT 21H 
       
       
    
    MOV AH,9
    MOV DX,OFFSET(MSG4)  ;PRINT MSG 4
    INT 21H
    
    
    MOV AH,1
    INT 21H        ;TAKE USER INPUT 4
    
 
    
    SUB AL,48
    ADD SUM,AL
    
    
    MOV AH,2
    MOV DL,0DH
    INT 21H
    MOV AH,2       ;PRINT A NEW LINE
    MOV DL,0AH
    INT 21H 
       
       
    
    MOV AH,9
    MOV DX,OFFSET(MSG5)  ;PRINT MSG 5
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
    
    MOV AL,SUM
    
    MOV AH,2  
    ADD SUM,48 
    MOV DL,SUM
    INT 21H   
    
    
    
    MOV AL,0 
    SUB SUM,48
    MOV AL,SUM
    MOV BL,2    ;Division Portion
    DIV BL
     
 
        
 
    MOV AH,4CH
    INT 21H       
    
    MAIN ENDP

    END MAIN