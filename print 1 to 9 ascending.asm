;Print 1 to 9 in ascending order;

.model small
.stack 100h
.code 
 
main proc
 
 MOV AX,30H
 MOV CX,9
 
 
 my_loop:
     
     INC AX 
      
     MOV DL,AL   
     MOV AH,2        
     INT 21H
    
 loop my_loop            

         
    MOV AH,4CH
    INT 21H 
         
    main endp
    end main