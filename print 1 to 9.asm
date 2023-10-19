.model small
.stack 100h
.code 
 
main proc
 MOV AX,1
 MOV CX,9
 
 my_loop:
          
     MOV DL,CL
     ADD DL,48    
     MOV AH,2        ;print single CL value
     INT 21H 
      
     MOV AH,2
     MOV DL,20h      ;print single space
     INT 21H      
    
 loop my_loop            
 
    MOV AH,4CH
    INT 21H 
         
    main endp
    end main