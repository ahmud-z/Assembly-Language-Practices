INCLUDE 'EMU8086.INC'

.STACK 100H

.DATA
ARR DB 5

.CODE
MAIN PROC
    
    MOV AX, @DATA
    MOV DS, AX
    
    PRINT 'ENTER ARRAY ELEMENTS:'
    
    MOV CX, 5
    MOV BX, OFFSET ARR
    
    INPUT:
        MOV AH, 1
        INT 21H
        
        MOV [BX], AL
        INC BX
    
    LOOP INPUT  
    
    
     MOV DL, 13  
 MOV AH, 2  
 INT 21H       ;print a new line
 MOV DL, 10
 INT 21H
  MOV DL, 13  
 MOV AH, 2  
 INT 21H       ;print a new line
 MOV DL, 10
 INT 21H
            
    CALL SORT_ASC
    
    PRINT 'ELEMENTS IN ASCENDING ORDER: '
    CALL PRINTARRAY
          
        MOV DL, 13  
 MOV AH, 2  
 INT 21H       ;print a new line
 MOV DL, 10
 INT 21H 
 MOV DL, 13  
 MOV AH, 2  
 INT 21H       ;print a new line
 MOV DL, 10
 INT 21H   
          
    CALL SORT_DES
    
    PRINT 'ELEMENTS IN DESCENDING ORDER: '
    CALL PRINTARRAY
             
HLT
    MAIN ENDP
    
SORT_ASC PROC
    MOV CX, 5
    DEC CX
    
    OUTERLOOP:
        MOV BX, CX
        MOV SI, 0
        
        COMPLOOP:
            MOV AL, ARR[SI]
            MOV DL, ARR[SI + 1]
            CMP AL, DL
            
            JBE NOSWAPASC
            
            MOV ARR[SI], DL
            MOV ARR[SI + 1], AL
            
        NOSWAPASC:
            INC SI
            DEC BX  
            
            JNZ COMPLOOP
            
        LOOP OUTERLOOP
    
    RET
SORT_ASC ENDP

SORT_DES PROC
    MOV CX, 5
    DEC CX
    
    OUTERLOOPDESC:
        MOV BX, CX
        MOV SI, 0
        
        COMPLOOPDESC:
            MOV AL, ARR[SI]
            MOV DL, ARR[SI + 1]
            CMP AL, DL
            
            JGE NO_SWAP_DES
            
            MOV ARR[SI], DL
            MOV ARR[SI + 1], AL
            
        NO_SWAP_DES:
            INC SI
            DEC BX  
            
            JNZ COMPLOOPDESC
            
        LOOP OUTERLOOPDESC
    
    RET
SORT_DES ENDP

PRINTARRAY PROC
    MOV CX, 5
    MOV SI, 0
    
    OUTPUT:
        MOV DL, [BX]            
        MOV AH, 2
        INT 21H 
        
         MOV AH,2
 MOV DL,20h      ;print single space
 INT 21H 
        
        INC BX
        LOOP OUTPUT
    
    RET
PRINTARRAY ENDP

END MAIN
