.model small 
.stack 100h
.data
a db ?
.code
main proc
mov ax, @data
mov ds, ax

mov ah, 1
int 21h
sub al, 48
mov dl, 2
mov ah, 0
mov bl, al
div dl

add al, bl
add al, 48 
mov a, al
; newline with caret 
mov ah, 2
mov dx, 10
int 21h
mov dx, 13
int 21h

mov dl, a
mov ah, 2
int 21h

mov ah, 4ch
int 21h
main endp
end main