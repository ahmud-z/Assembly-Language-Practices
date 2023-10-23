.MODEL SMALL
.STACK 100H
.DATA
  INPUTS DB ?
  SUM DB 0
  AVERAGE DB ?
  LARGEST DB ?
  SMALLEST DB ?
  
.CODE
    MAIN PROC
    INCLUDE "EMU8086.INC"
    
    MOV AX,@DATA
    MOV DS,AX
    
    ;LOOPING 7 TIMES
    MOV CX,7
    MOV SI,0
    
    TAKE_INPUT:
        MOV AH,1
        INT 21H  
        SUB AL,48
        MOV INPUTS[SI],AL
        INC SI  
        LOOP TAKE_INPUT        
    
        
    
    PRINTN ""

    CALL FIND_AVERAGE
    PRINT "AVERAGE: "
    MOV AH,2
    MOV DL,AL
    INT 21H
    PRINTN ""
    
    CALL FIND_LARGEST
    PRINT "LARGEST: "
    MOV AH,2
    MOV DL,AL
    INT 21H
    PRINTN ""
    
    CALL FIND_SMALLEST
    PRINT "SMALLEST: "
    MOV AH,2
    MOV DL,AL
    INT 21H
    PRINTN ""
        
    HLT


FIND_AVERAGE PROC
    
    MOV CX,7
    MOV SI,0
    MOV AL,0
    
    MOV AH,0
    ADD_INPUTS:         
        ADD AL,INPUTS[SI]
        INC SI
        LOOP ADD_INPUTS
    
    MOV BL,7
    DIV BL
    
    ADD AL,48
    
    RET
FIND_AVERAGE ENDP

FIND_LARGEST PROC

    MOV AH,0
    
    ;STORE THE BIGGEST
    MOV AL,0
    
    
    MOV SI,0
    MOV AL, INPUTS[SI]
    INC SI
    
    MOV CX,6
    CHECK_LARGER:  
        CMP INPUTS[SI],AL
        JG SET_LARGEST
        JNG CONT_LOOP

    SET_LARGEST:
        MOV AL, INPUTS[SI]
        INC SI
        
    CONT_LOOP:
        LOOP CHECK_LARGER 
        
    ADD AL,48
    
    RET
FIND_LARGEST ENDP     


FIND_SMALLEST PROC
    MOV AH,0
    
    ;STORE THE SMALLEST
    MOV AL,0
    
    
    MOV SI,0
    MOV AL, INPUTS[SI]
    INC SI
    
    MOV CX,6
    CHECK_SMALLER:         
        CMP INPUTS[SI],AL
        JL SET_SMALLEST
        JNL CONT_SMALL_LOOP

    SET_SMALLEST:
        MOV AL, INPUTS[SI]
        INC SI
        
    CONT_SMALL_LOOP:
        LOOP CHECK_SMALLER 
        
    ADD AL,48
   
    
    RET
FIND_SMALLEST ENDP    