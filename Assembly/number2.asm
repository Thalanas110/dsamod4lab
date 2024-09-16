.model small
.stack 100h
.data
    str1 db 'this is exercise 1', 0
    str2 db 'this is exercise 2', 0
    less_msg db '"this is exercise 1" is less than "this is exercise 2"$'
    eq_msg db '"Strings are equal"$'
    gt_msg db '"this is exercise 1" is greater than "this is exercise 2"$'

.code
main proc
    ; initialize data
    mov ax, @data
    mov ds, ax

    ; compare the strings
    lea si, str1
    lea di, str2
    mov cx, 16 ; first 16 chars

; loop the comparison
compare_loop:
    lodsb
    scasb
    jne not_equal
    loop compare_loop
    jmp equal

; not equal
not_equal:
    jb less
    ja greater

; if less than
less:
    mov ah, 09h
    lea dx, less_msg
    int 21h
    jmp done

; if equal
equal:
    mov ah, 09h
    lea dx, eq_msg
    int 21h
    jmp done

; if greater than
greater:
    mov  ah, 09h
    lea dx, gt_msg
    int 21h

; close the thing
done:
    mov ah, 4ch
    int 21h
main endp
end main


