.STACK 100H
.DATA 

RESULT DW ?


.CODE

MAIN PROC

 MOV AX,@DATA
 MOV DS,AX


 MOV CX,4
 MOV AX,0

 MOV BX,2

 MY_LOOP:

 ADD AX,BX
 ADD BX,3 

 MOV RESULT,AX   ;final result stored in
 LOOP MY_LOOP    ;the result variable
    
    
 MOV AH,4CH
 INT 21H    
    
 MAIN ENDP
 END MAIN
