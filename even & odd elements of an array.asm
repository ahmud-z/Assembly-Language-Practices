INCLUDE "EMU8086.INC"

DISPLAY MACRO N
    MOV AH, 2
    MOV DL, N
    ADD DL, 30H ; Convert to ASCII
    INT 21H
ENDM

.STACK 100H

.DATA
ARR DB 5 DUP(?) ; Define an array with 5 elements

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV CX, 5
    MOV SI, 0

    PRINT "ENTER VALUES: "

    INPUT:
        MOV AH, 1
        INT 21H
        PRINT " "

        SUB AL, 30H ; Convert to decimal
        MOV ARR[SI], AL

        INC SI
        LOOP INPUT

    ; Find and display odd elements
    MOV CX, 5
    MOV SI, 0

    PRINT "ODD ELEMENTS: "
    FIND_ODD_LOOP:
        MOV AL, ARR[SI]
        TEST AL, 1 ; Check if the number is odd
        JNZ ODD_FOUND
        JMP NEXT_ELEMENT

        ODD_FOUND:
        DISPLAY AL ; Display the odd element

        NEXT_ELEMENT:
        INC SI
        LOOP FIND_ODD_LOOP

    PRINT ""

    ; Find and display even elements
    MOV CX, 5
    MOV SI, 0

    PRINT "EVEN ELEMENTS: "
    FIND_EVEN_LOOP:
        MOV AL, ARR[SI]
        TEST AL, 1 ; Check if the number is odd
        JZ EVEN_FOUND
        JMP NEXT_ELEMENT_EVEN

        EVEN_FOUND:
        DISPLAY AL ; Display the even element

        NEXT_ELEMENT_EVEN:
        INC SI
        LOOP FIND_EVEN_LOOP

    PRINT ""

    MOV AH, 4CH
    INT 21H

MAIN ENDP
end main
