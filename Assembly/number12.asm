.model small
.stack 100h
.data
    input_str db 'ab5c2d4ef12s$', 0     ; Input string
    sum db 0                            ; To store the sum of digits
    msg db 'The sum of the digits in the string is: $'
    result db 'XX$'                     ; Buffer to store result
.code
main proc
    mov ax, @data
    mov ds, ax

    ; Loop through input string
    lea si, input_str
    xor al, al
    xor bx, bx

next_char:
    lodsb
    cmp al, '$'
    je done_summing

    cmp al, '0'
    jb next_char      ; If char < '0', skip it
    cmp al, '9'
    ja next_char      ; If char > '9', skip it

    sub al, '0'       ; Convert char to digit
    add bl, al        ; Add digit to sum
    jmp next_char

done_summing:
    ; Convert sum to ASCII
    add bl, '0'
    mov [result], bl
    mov byte ptr [result + 1], '$'

    ; Print the message
    mov ah, 09h
    lea dx, msg
    int 21h

    ; Print the result
    mov ah, 09h
    lea dx, result
    int 21h

    ; Newline
    mov ah, 02h
    mov dl, 0Dh
    int 21h
    mov dl, 0Ah
    int 21h

    ; Exit program
    mov ah, 4Ch
    int 21h
main endp
end main
