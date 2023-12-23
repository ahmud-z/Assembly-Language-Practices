
INCLUDE 'EMU8086.INC'
.STACK 100H

.DATA
    
    CMP_MSG1 DB 'HELLO',0
    CMP_MSG2 DB 'WORLD',0
    
    ALERT_MSG1 DB 'MATCHED$'
    ALERT_MSG2 DB 'NOT MATCHED$'
   
    FINAL_CONCAT_STR DB 100 DUP('$')
    
    MSG DB 'HELLO',0 
    
    STRING DB 'HELLO WORLD$'
    
    MSG1 DB 'HELLO$'
    MSG2 DB ' ASSEMBLY$'
    
    INPUT_MSG1 DB 100 DUP('$')  
    INPUT_MSG2 DB 100 DUP('$')
          
    NEW_LINE DB 0AH,0DH,"$"
    
    LENGTH DB ?

.CODE

MAIN PROC

MOV AX,@DATA
MOV DS,AX


CHOSE_OPT:

    PRINT "1.LENGTH"
    
    LEA DX,NEW_LINE
    MOV AH,09H
    INT 21H         
    
    PRINT "2.CONCAT"   
        
    LEA DX,NEW_LINE
    MOV AH,09H
    INT 21H   
       
    PRINT "3.COMPARE"   
        
    LEA DX,NEW_LINE
    MOV AH,09H
    INT 21H   
    
    PRINT "4.REVERSE"   
       
    LEA DX,NEW_LINE
    MOV AH,09H
    INT 21H
    
    LEA DX,NEW_LINE
    MOV AH,09H
    INT 21H
       
   PRINT "CHOOSE A OPTION: "
      
    MOV AH,01H
    INT 21H     
    
    
    CMP AL,49
    JE FIND_LENGTH
    
    CMP AL,50
    JE STR_CONCAT   

    CMP AL,51
    JE STR_COMPARE
    
    CMP AL,52
    JE STR_REVERSE
    
FIND_LENGTH:   
    MOV SI,OFFSET MSG
    MOV CX,0       
            
CALC_LENGTH:
  
    CMP [SI],0
    JE PRINT_LENGTH
    INC CX
    INC SI     
    JMP CALC_LENGTH  
 
PRINT_LENGTH: 
        LEA DX, NEW_LINE
        MOV AH, 09H
        INT 21H
        
        PRINT "LENGTH OF GIVEN STRING: "
        MOV LENGTH,CL
        ADD LENGTH,48 
         
        MOV DL,LENGTH
        MOV AH,2
        INT 21H
        JMP END
 END:
  MOV AH,04H
  INT 21H       
            
MAIN ENDP 
   
     
PRINT_MSG PROC
                         
        MOV AH,09H  
        INT 21H
                            
        LEA DX, NEW_LINE
        MOV AH, 09H
        INT 21H                             
RET           
PRINT_MSG ENDP
     

STR_COMPARE PROC
        
    MOV SI, OFFSET CMP_MSG1 
    MOV DI, OFFSET CMP_MSG2
    
CHECK:
    MOV AL, [SI]       
    CMP AL, [DI]       
    JNE IF    
    
    CMP AL, 0
    JE ELSE

    INC SI             
    INC DI           
    JMP CHECK 

IF:  
    LEA DX, NEW_LINE
    MOV AH, 09H
    INT 21H
         
    LEA DX,ALERT_MSG2
    CALL PRINT_MSG
    JMP END

ELSE:
    LEA DX, NEW_LINE
    MOV AH, 09H
    INT 21H
    
    LEA DX,ALERT_MSG1
    CALL PRINT_MSG
    JMP END
    
STR_COMPARE ENDP


STR_CONCAT PROC
    
    MOV SI, OFFSET MSG1
    MOV DI, OFFSET FINAL_CONCAT_STR

    L1:
        MOV AL, [SI]
        CMP AL, '$'

        JE EXIT1

        MOV [DI], AL

        INC SI
        INC DI
        JMP L1

    EXIT1:

    MOV SI, OFFSET MSG2
    L2:

        MOV AL, [SI]
        CMP AL, '$'

        JE EXIT2

        MOV [DI], AL

        INC SI
        INC DI
        JMP L2

    EXIT2:

    LEA DX,NEW_LINE
    MOV AH,09H
    INT 21H
    
    PRINT "CONCATED STRING: "
    
    MOV [DI], '$'

    MOV DX, OFFSET FINAL_CONCAT_STR
    MOV AH, 09H
    INT 21H
 
    JMP END
       
    STR_CONCAT ENDP

STR_REVERSE PROC
        
    MOV SI,OFFSET STRING
    MOV CX,11

LOOP1:
    MOV BX,[SI]
    PUSH BX
    INC SI

LOOP LOOP1

    MOV CX,11
    LEA DX, NEW_LINE
    MOV AH, 09H
    INT 21H 
       
     PRINT "INPUT STRING: HELLO WORLD"      
       
    LEA DX, NEW_LINE
    MOV AH, 09H
    INT 21H 
       
    PRINT "REVERSE STRING: "

LOOP2:
    POP DX
    MOV AH, 02H
    INT 21H
LOOP LOOP2

JMP END
END MAIN