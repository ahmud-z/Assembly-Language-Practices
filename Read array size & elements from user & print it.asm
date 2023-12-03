
.MODEL SMALL
.DATA
    
    ARRAY_SIZE DB ?
    INPUT_ARRAY DB 50;
    
    MSG_SIZE DB 'ENTER SIZE: $'
    MSG_INPUT DB 'ENTER ELEMENT: $'
    MSG_OUTPUT DB 'ARRAY ELEMENTS: $'

.CODE
MAIN:
    MOV AX, @DATA
    MOV DS, AX

    MOV AH, 9
    LEA DX, MSG_SIZE
    INT 21H

    MOV AH, 1
    INT 21H
    SUB AL, 48   
    MOV ARRAY_SIZE, AL
      
    MOV CL, ARRAY_SIZE
    LEA SI, INPUT_ARRAY

    MOV AH, 9
    LEA DX, MSG_INPUT
    INT 21H

      
INPUT_LOOP:

    MOV AH,1
    INT 21H
    SUB AL, 48 
     
    MOV [SI], AL 

    INC SI
    LOOP INPUT_LOOP 

    MOV AH, 9    
    LEA DX,MSG_OUTPUT
    INT 21H

    MOV CL,ARRAY_SIZE
    MOV SI,0
    
    OUTPUT_LOOP:
        
        ADD INPUT_ARRAY[SI], 48
        MOV DL, INPUT_ARRAY[SI]     
        MOV AH,2 

        INT 21H 
        INC SI            
 
    LOOP OUTPUT_LOOP   

    MOV AH, 4CH
    INT 21H
END MAIN
