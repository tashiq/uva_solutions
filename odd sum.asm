.model small 
.stack 100h
.data
sum db 0
l db ?
h db ? 
case db "case $"
count db 1
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
main proc
mov ax, @data
mov ds, ax

call input 
mov cl, al
mov ch, 0  
call newline

process:
    call input 
    mov l, al
    call space
    call input 
    mov h, al
    call newline
    ;print case 
    mov dx, offset case
    mov ah, 9
    int 21h
    mov dl, count
    inc count
    mov ah, 2
    mov dh, 0
    add dx, 48
    int 21h   
    mov dl, ':'
    int 21h
    call space
    ; n
    mov al, h
    inc al
    mov ah, 0
    mov dl, 2
    div dl  
    mul al 
    mov h, al
    ; n         
    mov al, l
    mov ah, 0
    mov dl, 2
    div dl 
    mul al
    mov l, al
    
    sub h, al
    mov dl, h 
    mov ah, 2
    add dl, 48
    int 21h 

call newline

loop process

mov ah, 4ch
int 21h
main endp
end main