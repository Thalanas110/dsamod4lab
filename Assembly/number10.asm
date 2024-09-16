.model small
.stack 100h
.data
    str db 'the quick brown fox$', 0    ; Input string
    mask db 'queen$', 0                 ; Mask string
    result db 100 dup(0)                ; Buffer for storing the resulting string
    msg1 db 'The given string is: $', 0
    msg2 db 'The given mask string is: $', 0
    msg3 db 'The new string is: $', 0
    newline db 0Dh, 0Ah, '$'
.code
main proc
    mov ax, @data
    mov ds, ax

    ; Print the original string
    mov ah, 09h
    lea dx, msg1
    int 21h
    lea dx, str
    int 21h
    mov ah, 09h
    lea dx, newline
    int 21h

    ; Print the mask string
    mov ah, 09h
    lea dx, msg2
    int 21h
    lea dx, mask
    int 21h
    mov ah, 09h
    lea dx, newline
    int 21h

    ; Remove duplicate characters based on mask
    lea si, str                        ; Load address of the input string
    lea di, result                     ; Load address of the result buffer
    lea bx, mask                       ; Load address of the mask string
    call remove_duplicates

    ; Print the new string
    mov ah, 09h
    lea dx, msg3
    int 21h
    lea dx, result
    int 21h
    mov ah, 09h
    lea dx, newline
    int 21h

    ; Exit program
    mov ah, 4Ch
    int 21h
main endp

remove_duplicates proc
    ; Loop through the input string (str)
next_char:
    lodsb                             ; Load a character from str into AL
    cmp al, '$'                       ; End of string check
    je done_removal                   ; If end, jump to done_removal

    ; Check if the character exists in the mask string
    push si                           ; Save SI
    lea si, mask                      ; Point to the start of mask string
check_mask:
    lodsb                             ; Load a character from mask into AL
    cmp al, '$'                       ; End of mask check
    je not_found                      ; If not found in mask, move to next char
    cmp al, ah                        ; Compare with original char from str
    je found                          ; If found, skip this char
    jmp check_mask

not_found:
    pop si                            ; Restore SI
    mov [di], ah                      ; Move the original character to result
    inc di                            ; Move result pointer forward
    jmp next_char

found:
    pop si                            ; Restore SI
    jmp next_char

done_removal:
    mov byte ptr [di], '$'            ; Null-terminate the result string
    ret
remove_duplicates endp
end main
