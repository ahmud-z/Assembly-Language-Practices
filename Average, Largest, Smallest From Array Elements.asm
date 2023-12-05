INCLUDE "EMU8086.INC"

.STACK 100H
.DATA       
    INPUTS DB ?

.CODE
    MAIN PROC
        
        
        MOV AX,@DATA
        MOV DS,AX
     
        PRINT 'ENTER VALUES: '
        
        ;LOOPING 5 TIMES
        MOV CX,5
        MOV SI,0   
        
        TAKE_INPUT:
            MOV AH,1
            INT 21H
            SUB AL,48
            MOV INPUTS[SI],AL
            INC SI
            PRINT " "
            LOOP TAKE_INPUT 
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
        
        CALL FIND_AVERAGE
        PRINT "AVERAGE: "
        MOV AH,2
        MOV DL,AL
        INT 21H
        PRINTN "" 
    
    HLT
    
    FIND_LARGEST PROC
            
        MOV SI,0
        MOV CX,4
        
        MOV AL, INPUTS[SI] ;STORE THE BIGGEST
        
        
        CHECK_LARGER:
            INC SI
            CMP INPUTS[SI],AL
            
            JG SET_LARGEST
            JNG CONT_LOOP
            
        SET_LARGEST:
            MOV AL, INPUTS[SI]
            
            
        CONT_LOOP:
            LOOP CHECK_LARGER
        
        ADD AL,48
        
        RET
    ENDP FIND_LARGEST
    
    FIND_SMALLEST PROC
            
        MOV SI,0
        MOV CX,4
        MOV AL, INPUTS[SI] ;STORE THE SMALLEST
        
        
        CHECK_SMALLEST:
            INC SI
            CMP INPUTS[SI],AL
            JL SET_SMALLEST
            JG CONT_SMALL_LOOP
            
        SET_SMALLEST:
            MOV AL, INPUTS[SI]
            
        CONT_SMALL_LOOP:
            LOOP CHECK_SMALLEST
        
        ADD AL,48
        
        RET
    ENDP FIND_SMALLEST 


    FIND_AVERAGE PROC
            
        MOV SI,0
        MOV CX,5
        
        MOV BL,0 ;STORE THE SUM 
        
        CALCULATE_SUM:
            MOV AL, INPUTS[SI]
            ADD BL, AL
            INC SI
            LOOP CALCULATE_SUM
        
             
        MOV AX, BX
        MOV BL, 5 ; Divide by
        DIV BL
         
        ADD AL, 48 ; Convert to print as ascii
        
        RET

    ENDP FIND_AVERAGE