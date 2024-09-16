.model small
.stack 100h
.data
    str db 'thequickbrownfoxxofnworbquickthe$', 0
    msg_start db 'The longest palindrome substring is: $'
    msg_length db 'The length of the palindromic substring is: $'
    length db 0
.code
main proc
    ; Initialize data segment
    mov ax, @data
    mov ds, ax

    ; Find palindrome
    lea si, str
    call find_longest_palindrome

    ; Print the result
    mov ah, 09h
    lea dx, msg_start
    int 21h

    lea dx, si
    mov cx, length
print_loop:
    lodsb
    int 21h
    loop print_loop

    ; Print the length of the palindrome
    mov ah, 09h
    lea dx, msg_length
    int 21h

    ; Exit
    mov ah, 4Ch
    int 21h

main endp

find_longest_palindrome proc
    ; Your logic to find the palindrome goes here
    ; You would iterate through substrings and find the longest matching pair.
    ; Since assembly is limited for complex string handling, you would compare each character manually.
    ; Here's where the logic will go.
    ret
find_longest_palindrome endp
end main