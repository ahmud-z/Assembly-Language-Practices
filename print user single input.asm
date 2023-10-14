.model small
.stack 100h         ;stack size 255 in decimal/100h in hex
.code


main proc
    mov ah,1        ;use for takes single character input
    int 21h         ;takes user input
    mov bl, al
           
           
    mov ah,2
    mov dl,20h      ;print single space
    int 21h
           
    
    mov ah,2        ;use for print single character
    mov dl,bl       ;print user input
    int 21h         ;interrupt
 

    exit:
    mov ah, 4ch
    int 21h         ; code return statemen
    main endp

end main



