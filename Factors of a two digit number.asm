.MODEL SMALL
.STACK 100H

.DATA 

    NUM DB ?
    MSG1 DB 'ENTER A TWO DIGIT NUMBER: $'
    MSG2 DB 'FACTORS OF GIVEN NUMBER: $'

    
.CODE

 MAIN PROC           
 MOV AX, @DATA
 MOV DS, AX 
         
 
 MOV AH,9
 MOV DX,OFFSET(MSG1) ; print input message
 INT 21H
 
 MOV AH, 1
 INT 21H
        
 SUB AL, 48
        
        
 MOV AH, 0
 MOV BL, 10
        
 MUL BL
 MOV CL, AL
        
 MOV AH, 1
 INT 21H
 SUB AL, 48      
 ADD CL, AL 
        
 MOV AL, CL
 MOV CH, 0
 MOV NUM, CL 
 MOV AH, 0 
  
  
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
      
        
 MOV AH,9
 MOV DX,OFFSET(MSG2) ; print output message
 INT 21H

  
  
        
           
 IF: 
     
 MY_LOOP:
        
 MOV AH, 0
 MOV AL, NUM
 DIV CL      
 CMP AH, 0
 
 JE ELSE
  
 LOOP MY_LOOP
        
                 
 ELSE:
        
 CMP CL, 10  
 JL PRINT_SINGLE_DIGIT
 JGE PRINT_TWO_DIGIT

    
           
 PRINT_SINGLE_DIGIT:
            
 MOV AH,2
 MOV DL,20h      ;print single space
 INT 21H 
        
        
 MOV AH, 2 
 MOV DL, CL
 ADD DL, 48
 INT 21H
        
 SUB CL, 1
 CMP CL, 0
 JE END_IF
 JMP IF
        
          
 PRINT_TWO_DIGIT:
        
 MOV AH,2
 MOV DL,20h      ;print single space
 INT 21H
        
        
 MOV AH, 0
 MOV AL, CL
 MOV BL, 10 
        
 DIV BL
        
 MOV BX, AX 
 MOV AH, 2
 MOV DL, BL
 ADD DL, 48
 INT 21H
         
 MOV DL, BH
 ADD DL, 48
 INT 21H
           
 SUB CL, 1
 CMP CL, 0
        
 JE END_IF
        
 JMP IF
                
         
 END_IF:
 MOV AH, 4CH
 INT 21H
        
        
 MAIN ENDP
 END MAIN