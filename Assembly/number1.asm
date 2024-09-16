.model small
.stack 100h
.data
    str db 'Java Exercises!', 0
    msg1 db 'Original String = $'
    msg2 db 'The character at position 0 is $'
    msg3 db 'The character at position 10 is $'
    char db 0

.code
main proc
    ; initialize data
    mov ax, @data
    mov ds, ax

    ; print original string
    mov ah, 09h
    lea dx, msg1
    int 21h
    lea dx, str
    int 21h
    mov ah, 0Eh
    int 21h  ; newline

    ; char at pos 0
    lea dx, msg2
    mov ah, 09h
    int 21h
    mov al, [str]
    mov dl, al
    mov ah, 02h
    int 21h
    mov ah, 0Eh
    int 21h  ; newline

    ; char at pos 10
    lea dx, msg3
    mov ah, 09h
    int 21h
    mov al, [str + 10]
    mov dl, al
    mov ah, 02h
    int 21h
    mov ah, 0Eh
    int 21h  ; newline

    ; end
    mov ah, 4Ch
    int 21h
main endp
end main
