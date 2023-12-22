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
    MOV AH,2
    MOV DL,20h      ;print single space
    INT 21H
    
    MOV AH, 1
    INT 21H
     
     
     
    MOV [BX], AL
    INC BX
    
LOOP INPUT
               
    CALL BUBBLE_SORT  
    
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

    
    PRINT 'SORTED ELEMENTS: '
    
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
    
    HLT
    
MAIN ENDP 

    
    BUBBLE_SORT PROC
        
    MOV CX, 5
    DEC CX
    
OUTERLOOP:
    MOV BX, CX
    MOV SI, 0
    
COMPLOOP:
        MOV AL, ARR[SI]
        MOV DL, ARR[SI + 1]
        CMP AL, DL
        
        JC NOSWAP
        
        MOV ARR[SI], DL
        MOV ARR[SI + 1], AL
        
NOSWAP:
        INC SI
        DEC BX  
        
        JNZ COMPLOOP
        
    LOOP OUTERLOOP

RET  
    
    BUBBLE_SORT ENDP
END MAIN