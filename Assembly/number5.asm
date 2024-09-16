.model small
.stack 100h
.data
    str1 db 'Stephen Edwin King', 0
    str2 db 'Walter Winchell', 0
    str3 db 'stephen edwin king', 0
    true_msg db 'true$', 0
    false_msg db 'false$', 0

.code
main proc
    mov ax, @data
    mov ds, ax

    ; Compare str1 with str2
    lea si, str1
    lea di, str2
    call str_case_cmp
    cmp al, 0
    je not_equal
    lea dx, true_msg
    jmp print_result
not_equal:
    lea dx, false_msg

print_result:
    mov ah, 09h
    int 21h

    ; Compare str1 with str3
    lea si, str1
    lea di, str3
    call str_case_cmp
    cmp al, 0
    je not_equal2
    lea dx, true_msg
    jmp print_result2
not_equal2:
    lea dx, false_msg

print_result2:
    mov ah, 09h
    int 21h

    mov ah, 4Ch
    int 21h
main endp

str_case_cmp proc
    next_char:
        lodsb            ; Load byte from SI
        scasb            ; Compare with byte in DI
        je match_char    ; If equal, go on
        ; Convert both to lowercase
        cmp al, 'A'
        jl next_char     ; If it's already lowercase, continue
        cmp al, 'Z'
        jg next_char     ; If it's lowercase, continue
        add al, 20h      ; Convert to lowercase
    match_char:
        loop next_char   ; Continue looping
        ret
str_case_cmp endp
end main
