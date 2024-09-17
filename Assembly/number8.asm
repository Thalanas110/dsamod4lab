.model small
.stack 100h
.data
    str db 'thequickbrownfoxxofnworbquickthe$', 0  
    msg_start db 0Dh, 0Ah, 'The longest palindrome substring is: $'
    msg_length db 0Dh, 0Ah, 'The length of the palindromic substring is: $'
    longest_palindrome db 256 dup(0)             
    length db 0                                 
    new_line db 0Dh, 0Ah, '$'
.code
main proc
    mov ax, @data
    mov ds, ax

    call find_longest_palindrome

    mov ah, 09h
    lea dx, msg_start
    int 21h

    lea si, longest_palindrome
    mov cx, length

print_loop:
    lodsb
    cmp al, 0
    je done_print
    mov ah, 02h
    mov dl, al
    int 21h
    loop print_loop

done_print:
    mov ah, 09h
    lea dx, new_line
    int 21h

    mov ah, 09h
    lea dx, msg_length
    int 21h

    mov al, length
    add al, '0'
    mov dl, al
    mov ah, 02h
    int 21h

    ; Newline
    mov ah, 09h
    lea dx, new_line
    int 21h

    ; Exit
    mov ah, 4Ch
    int 21h
main endp

find_longest_palindrome proc
    lea si, str              
    xor di, di                
    xor bx, bx               

outer_loop:
    mov cx, si               
    lea dx, str
    add dx, cx               

inner_loop:
    mov al, [si]              
    mov ah, [dx]              
    cmp al, ah                
    jne not_palindrome        
    inc si                  
    dec dx                   
    cmp si, dx               
    jb inner_loop             
    jmp palindrome_found     

not_palindrome:
    inc si                   
    cmp byte ptr [si], '$'    
    jne outer_loop            

    ret

palindrome_found:
    mov length, cx           
    lea di, str              
    add di, cx              
    mov si, di               
    lea di, longest_palindrome 

copy_palindrome:
    lodsb                   
    stosb                    
    loop copy_palindrome      

    jmp outer_loop          

find_longest_palindrome endp
end main
