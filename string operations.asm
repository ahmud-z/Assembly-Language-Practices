INCLUDE 'EMU8086.INC'


.STACK 100H

.DATA
    
    MSG DB 'HELLO WORLD',0
    
    CMP_MSG1 'HELLO'
    CMP_MSG2 'HELLO'
    
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
    JE COMP_STR



    FIND_LENGTH:
        
        MOV SI,OFFSET MSG
        MOV CX,0
            
        
 
    CALC_LENGTH:
      
     CMP [SI],0
    
     JE END
    
     INC CX
     INC SI 
        
    JMP CALC_LENGTH   
 
 
 END:
 
  MOV LENGTH,CL
  MOV AH,04H
  INT 21H    
   
            
MAIN ENDP           
END MAIN