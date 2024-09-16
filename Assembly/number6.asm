.model small
.stack 100h
.data
    time_message db 'Current Date and Time :$'
    new_line db 13, 10, '$'
    month_name db 'January$'
    date_format db 'Date: $'
    time_format db 'Time: $'
    am_pm db 'am$', 0
.code
main proc
    mov ax, @data
    mov ds, ax

    ; Print message
    mov ah, 09h
    lea dx, time_message
    int 21h

    ; Get Date from BIOS
    mov ah, 04h
    int 1Ah

    ; BIOS provides day in CX, month in DH, and year in DL
    mov ah, 09h
    lea dx, new_line
    int 21h

    mov ah, 09h
    lea dx, date_format
    int 21h

    ; Print the month
    cmp dh, 6
    jz June_label

June_label:
    lea dx, month_name
    int 21h

    ; Print the day and year
    mov ah, 09h
    lea dx, new_line
    int 21h

    ; Get Time from BIOS
    mov ah, 02h
    int 1Ah

    ; Print formatted time
    mov ah, 09h
    lea dx, time_format
    int 21h

    ; 12-hour format conversion
    mov bx, cx
    cmp cx, 12
    jge pm_time
    mov ah, 09h
    lea dx, am_pm
    int 21h

pm_time:
    ; You can add logic for printing formatted time with AM/PM.

    ; Exit program
    mov ah, 4Ch
    int 21h

main endp
end main
