.model small
.stack 100h
.data
    str db 'The quick brown fox jumps over the lazy dog.', 0
    new_str db 100 dup (0)
    msg_original db 'Original string: $'
    msg_new db 'New string: $'
.code
main proc
    mov ax, @data
    mov ds, ax

    ; Print original string
    mov ah, 09h
    lea dx, msg_original
    int 21h
    lea dx, str
    int 21h

    ; Copy string to new_str
    lea si, str
    lea di, new_str
copy_loop:
    lodsb
    stosb
    cmp al, 0
    je find_fox

find_fox:
    lea si, new_str
    mov cx, 100
find_loop:
    lodsb
    cmp al, 'f'
    jne find_loop
    lodsb
    cmp al, 'o'
    jne find_loop
    lodsb
    cmp al, 'x'
    jne find_loop

    ; Replace "fox" with "cat"
    lea di, new_str
    mov al, 'c'
    stosb
    mov al, 'a'
    stosb
    mov al, 't'
    stosb

    ; Print new string
    mov ah, 09h
    lea dx, msg_new
    int 21h
    lea dx, new_str
    int 21h

    ; Exit
    mov ah, 4Ch
    int 21h
main endp
end main
