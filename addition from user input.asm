.MODEL SMALL
.STACK 100H


.DATA

MSG1 DB 'Enter first number: $'
MSG2 DB 'Enter second number: $'
MSG3 DB 'Addition Result: $'

NUM1 DB ?
NUM2 DB ?
SUM  DB ?


.CODE

MAIN PROC

MOV AX, @DATA
MOV DS,AX


MOV AH,9
MOV DX,OFFSET(MSG1)
INT 21H

MOV AH,1
SUB AL,48
INT 21H     ;USER FIRST INPUT
MOV NUM1,AL


 MOV AH,2
 MOV DL,0DH
 INT 21H
 MOV AH,2       ;PRINT A NEW LINE
 MOV DL,0AH
 INT 21H
 


MOV AH,9
MOV DX,OFFSET(MSG2)
INT 21H


MOV AH,1
SUB AL,48
INT 21H
MOV NUM2,AL 

      
 MOV DL,NUM1
 ADD DL,NUM2
 ADD SUM,30H
 MOV SUM,DL     
 
      

 MOV AH,2
 MOV DL,0DH
 INT 21H
 MOV AH,2       ;PRINT A NEW LINE
 MOV DL,0AH
 INT 21H
 
 
MOV AH,9
MOV DX,OFFSET(MSG3)
INT 21H      
       
 

MOV AH,2
SUB SUM,48
MOV DL,SUM
INT 21H 




MOV AH,4CH
INT 21H    

    
MAIN ENDP 
END MAIN
