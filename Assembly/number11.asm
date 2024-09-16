.model small
.stack 100h
.data
    input_str db 'resourceful$', 0    ; Input string
    freq_table db 256 dup(0)          ; Frequency table for counting ASCII characters
    dup_msg db 'The duplicate characters and counts are:$'
    new_line db 0Dh, 0Ah, '$'
    num db ' appears X times$'
    count db 'X', 0
.code
main proc
    mov ax, @data
    mov ds, ax

    ; Loop through input string
    lea si, input_str
count_chars:
    lodsb
    cmp al, '$'
    je check_duplicates
    inc byte ptr [freq_table + al]
    jmp count_chars

check_duplicates:
    mov ah, 09h
    lea dx, dup_msg
    int 21h

    ; Loop through the frequency table and check for duplicates
    mov cx, 256
    xor bx, bx                ; Reset index to 0
check_loop:
    mov al, [freq_table + bx]
    cmp al, 1                 ; Skip if the character appears only once or less
    jbe skip_char

    ; Print the character
    mov dl, bl                ; Load character to print
    mov ah, 02h
    int 21h

    ; Print " appears "
    mov ah, 09h
    lea dx, num
    int 21h

    ; Convert the count to ASCII and print it
    mov al, [freq_table + bx]
    add al, '0'
    mov [count], al
    mov ah, 09h
    lea dx, count
    int 21h

    ; Newline
    mov ah, 09h
    lea dx, new_line
    int 21h

skip_char:
    inc bx
    loop check_loop

    ; Exit
    mov ah, 4Ch
    int 21h
main endp
end main
