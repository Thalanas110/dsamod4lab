.model small
.stack 100h
.data
    arr db '1234', 0
    msg db 'The book contains $'
    end_msg db ' pages.$'

.code
main proc
    ; initialize data
    mov ax, @data
    mov ds, ax

    ; print message
    mov ah, 09h
    lea dx, msg
    int 21h

    ; print number
    lea dx, arr
    int 21h

    ; end message
    lea dx, end_msg
    int 21h

    ; end program
    mov ah, 4Ch
    int 21h
main endp
end main
