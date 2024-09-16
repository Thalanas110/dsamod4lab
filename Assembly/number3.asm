.model small
.stack 100h
.data
    str1 db 'example.com$', 0
    str2 db 'Example.com$', 0
    true_msg db 'Comparing example.com and example.com = true$', 0
    false_msg db 'Comparing Example.com and example.com = false$', 0

.code
main proc 
    mov ax, @data
    mov ds, ax

    lea si, str1
    lea di, str1
    mov cx, 12
    repe cmpsb
    jnz first_compare_failed

    lea si, str1
    lea di, str2
    mov cx, 12
    repe cmpsb
    jz both_equal

    mov ah, 09h
    lea dx, false_msg
    int 21h
    jmp done

first_compare_failed:
    mov ah, 09h
    lea dx, false_msg
    int 21h
    jmp done

both_equal:
    mov ah, 09h
    lea dx, true_msg
    int 21h

done:
    mov ah, 4Ch
    int 21h

main endp
end main
