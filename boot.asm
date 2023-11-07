[bits 16]
mov ah, 0x0e
mov bx, welcomefoog

KERNEL_OFFSET equ 0x1000
mov [BOOT_DRIVE], dl

%include "read_disk.asm"
%include "protmode.asm"
  
printfoog:
    mov al, [bx + 0x7c00]
    cmp al, 0
    je end
    int 0x10
    inc bx
    jmp printfoog
end:

get_input:
    mov ax, 0
    int 0x16
    mov al, ah
    int 0x10
    jmp get_input


jmp $

[bits 16]
loadkern:
    mov bx, KERNEL_OFFSET
    mov dh, 2
    mov dl [BOOT_DRIVE]
    call disk_load
    ret

[bits 32]
BEGIN_PROT:
    call KERNEL_OFFSET
    jmp $

BOOT_DRIVE db 0

welcomefoog:
    db "Hail Lord Foog the 2st", 0
times 510-($-$$) db 0
dw 0xaa55
