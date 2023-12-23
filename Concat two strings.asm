.MODEL SMALL
.STACK 100H

.DATA
STR1 DB 'GOODBYE$'
STR2 DB ' WORLD, IT IS AN AMAZING MEMORY I-N THIS WORLD WITH FRIENDS ND FAMILIES.$'

S DB 100 DUP('$') ; Assuming a maximum length for the concatenated string

.CODE
MAIN PROC

    MOV AX, @DATA
    MOV DS, AX

    MOV SI, OFFSET STR1
    MOV DI, OFFSET S

    L1:
        MOV AL, [SI]
        CMP AL, '$'

        JE EXIT1

        MOV [DI], AL

        INC SI
        INC DI
        JMP L1

    EXIT1:

    MOV SI, OFFSET STR2
    L2:

        MOV AL, [SI]
        CMP AL, '$'

        JE EXIT2

        MOV [DI], AL

        INC SI
        INC DI
        JMP L2

    EXIT2:

    MOV [DI], '$'

    MOV DX, OFFSET S
    MOV AH, 09H
    INT 21H

    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
