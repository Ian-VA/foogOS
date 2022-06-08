mov ah, 0x0e
mov bx, welcomefoog

  
printfoog:
    mov al, [bx + 0x7c00]
    cmp al, 0
    je end
    int 0x10
    inc bx
    jmp printfoog
end:

jmp $

welcomefoog:
    db "Welcome to Foog OS. Hail Lord Foog the 2st", 0
times 510-($-$$) db 0
dw 0xaa55

 
