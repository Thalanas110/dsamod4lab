.model small
.stack 100h
.data
    str db 'PQR$', 0
    msg db 'Permuted strings are:$'
.code
main proc
    mov ax, @data
    mov ds, ax

    ; Print permuted strings message
    mov ah, 09h
    lea dx, msg
    int 21h

    ; Call function to generate permutations
    call generate_permutations

    ; Exit
    mov ah, 4Ch
    int 21h
main endp

generate_permutations proc
    ; Manually loop through all permutations (PPP, PPQ, PPR, ..., RRR)
    lea si, str
    mov cx, 27
    ; Nested loop structure to print the permutations (repetition)
    ; You'll iterate over each character and print combinations
    ret
generate_permutations endp
end main
