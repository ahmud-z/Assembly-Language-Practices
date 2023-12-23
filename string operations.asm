INCLUDE 'EMU8086.INC'


.STACK 100H

.DATA
    
    CMP_MSG1 DB 'HELLO',0
    CMP_MSG2 DB 'WORLD',0
    
    ALERT_MSG1 DB 'MATCHED$'
    ALERT_MSG2 DB 'NOT MATCHED$'
    
    
    MSG DB 'HELLO',0
    
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

    CMP AL,51
    JE STR_COMPARE
    
    CMP AL,52
    JE REVERSE_STRING


 
    
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


 
 

TAKE_STR_INPUT PROC 
        
    PRINT "ENTER FIRST STRING: "
    MOV AH, 0AH         ; Function to read input into buffer
    LEA DX, INPUT_MSG1     ; DX points to the buffer
    INT 21H             ; Call DOS interrupt

    LEA DX, NEW_LINE
    MOV AH, 09H
    INT 21H
   
    PRINT "ENTER SECOND STRING: "
    
    MOV AH, 0AH         ; Function to read input into buffer
    LEA DX, INPUT_MSG2     ; DX points to the buffer
    INT 21H             ; Call DOS interrupt

TAKE_STR_INPUT ENDP
    


     
     
PRINT_MSG PROC
                         
        MOV AH,09H  
        INT 21H
                            
        LEA DX, NEW_LINE
        MOV AH, 09H
        INT 21H                             
RET           
PRINT_MSG ENDP
     

REVERSE_STRING PROC
        
        MOV DI,OFFSET(MSG)
        MOV CX,5
        
        
        PRINT_REVERSE:
            
            CMP [SI],0
            JE END
            
            MOV AH,2
            MOV DL,[SI]
            INT 21H
            
            INC SI
            
        JMP PRINT_REVERSE           
 
 REVERSE_STRING ENDP           
                     
                     
                     
 
 
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
END MAIN