.STACK 100H

.DATA

ARR DB 1,2,3,4,5 

MSG1 DB 'ARRAY ELEMENTS: $'
MSG2 DB 'ELEMENTS IN REVERSE ORDER: $'



.CODE
MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
      
    
    MOV CX,5
    MOV SI,0
    
    
    MOV AH,9
    MOV DX,OFFSET(MSG1)  ;Print msg
    INT 21H   
    
        
    FIRST_LOOP:
    
    MOV DL,[SI]
    ADD DL,48
    MOV AH,02H
    INT 21H
    
    MOV AH,2
    MOV DL,20h      ;Print Single Space
    INT 21H
    
    INC SI 
    
    LOOP FIRST_LOOP 
      
      
    MOV DL,10
    MOV AH,02H
    INT 21H
                ;PRINT A NEW LINE    
    MOV DL,13
    MOV AH,02H
    INT 21H  

MOV DL,10
    MOV AH,02H
    INT 21H
                ;PRINT A NEW LINE    
    MOV DL,13
    MOV AH,02H
    INT 21H      
      
    MOV CX,5      
    MOV SI, 4
    
    
    MOV AH,9
    MOV DX,OFFSET(MSG2)  ;print msg
    INT 21H 
      
      
    SECOND_LOOP:
    
    MOV DL,[SI]
    ADD DL,48
    MOV AH,02H
    INT 21H
    
    MOV AH,2
    MOV DL,20h      ;print single space
    INT 21H
    
    DEC SI  
    LOOP SECOND_LOOP
 
    
    MOV AH,4CH
    INT 21H  
    
    MAIN ENDP
    END MAIN 