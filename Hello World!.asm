.model small 
.stack 100h
.data
a db ?
c db 1   
b db 1
ans db 0
case db "Case $"
.code  
newline proc
    mov ah, 2
    mov dx, 10
    int 21h
    mov dx, 13
    int 21h
    ret
newline endp
space proc
    mov ah, 2
    mov dx, 32
    int 21h
    ret
space endp   
input proc
    mov ah, 1
    int 21h
    sub al, 48
    ret
input endp    

casePrint proc
    mov dx, offset case
    mov ah, 9
    int 21h 
    mov dl, c 
    inc c
    add dl, 48 
    mov ah, 2
    int 21h
    mov dl, ':'
    int 21h
ret
casePrint endp 

; exit and print
exit: 
; print ans 
    call casePrint
    call space
    mov dl, ans
    add dl, 48
    int 21h
    call newline
    mov dl, 0
    mov ans, dl
    call operate
    ret   

calc proc
    mov al, 1
    mov bl, 2
    mov dl, 0
    mov ans, dl 
    nwh:
        mul bl
        inc ans
        mov b, al
        cmp al, a
        jae exit
        mov al, b    
    loop nwh 
calc endp 

main proc
    mov ax, @data
    mov ds, ax
    
    operate:
        call input
        mov a, al 
        call newline
        call calc
    
    mov ah, 4ch
    int 21h
main endp
end main