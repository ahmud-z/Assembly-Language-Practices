INCLUDE 'EMU8086.INC'

.STACK 100H

.DATA
   
    INPUT_MSG1 DB 100 DUP('$')  ; Reserve 11 bytes for the string, including the length byte
     
    INPUT_MSG2 DB 100 DUP('$')
     
    NEW_LINE DB 0AH,0DH,"$"

.CODE
MAIN PROC
    
    MOV AX, @DATA
    MOV DS, AX

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

    LEA DX, NEW_LINE
    MOV AH, 09H
    INT 21H 
    
    
    LEA DX,INPUT_MSG1+2
    
    CALL PRINT_MSG
    
    
    LEA DX,INPUT_MSG2+2
    
    CALL PRINT_MSG   
    


    MOV AH, 4CH         ; Terminate program
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

END MAIN
