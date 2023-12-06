INCLUDE "EMU8086.INC"

.STACK 100H

.DATA
ARR DB 5
NUM DB 2
EVENSUMRESULT DB 0

ODDSUMRESULT DB 0

.CODE
MAIN PROC

   MOV AX, @DATA
   MOV DS, AX

   MOV CX, 5
   MOV SI, 0
   
   PRINT "ENTER VALUES: "
   INPUT:
        MOV AH, 1
        INT 21H
        PRINT " "
        
        SUB AL, 48 ; Convert to decimal
        MOV ARR[SI], AL
        INC SI
           
    LOOP INPUT
   
   PRINTN ""  
   CALL FIND_SUMS
   PRINT "SUM OF EVEN: "
   MOV AH, 2
   MOV DL, BL
   INT 21H

   PRINTN ""
   PRINT "SUM OF ODD: "
   MOV DL, BH
   INT 21H

   HLT
   
MAIN ENDP
             
             
FIND_SUMS PROC
    
    MOV SI, 0
    MOV BL, 0 ; Store the even sum
    MOV BH, 0 ; Store the odd sum
    MOV CX, 5
    MOV AH, 0
    
    ELOOP:
    
        MOV AL, ARR[SI]
    
        DIV NUM
    
        CMP AH, 0  
        JE EVEN_SUM
        JNE ODD_SUM
   
    
    EVEN_SUM:   
        ADD BL, ARR[SI]
        INC SI
        LOOP ELOOP
        
    ODD_SUM:
        ADD BH, ARR[SI]
        INC SI
        LOOP ELOOP
        
    
    ADD BL, 48 ; Convert to print on screen
    ADD BH, 48 ; Convert to print on screen
     
    
    RET
   
    
FIND_SUMS ENDP
 
 

END MAIN