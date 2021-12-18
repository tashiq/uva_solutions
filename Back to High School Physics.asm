.model small 
.stack 100h
.data

x db ?
y db ?
.code 
 
main proc
mov ax, @data
mov ds, ax

mov ah, 1
int 21h  
sub al, 48
mov x, al 

mov ah, 2
mov dx, 32
int 21h

mov ah, 1
int 21h 
sub al, 48
mov y, al

mov ah,2
mov dx, 10
int 21h

; calculates x*y*2; the displacement in twice of given time
; s=vt is applied
mov al, x
mul y 
mov dl, 2
mul dl


mov dl, al
add dl, 48
mov ah, 2
int 21h

mov ah, 4ch
int 21h
main endp
end main