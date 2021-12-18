.model small 
.stack 100h
.data
a db ?
b db ?
c db ?   
hunt db "Hunters win!$" 
prop db "Props win!$"
dif db ?
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
propWin:
mov dx, offset prop
mov ah, 9
int 21h
jmp back
ret       
hunted: 
mov dx, offset hunt
mov ah, 9
int 21h
jmp back
ret
main proc
mov ax, @data
mov ds, ax

call input
mov a, al
call space
call input 
mov b, al
call space
call input
mov c, al
call newline

mov al, c
sub al, a
cmp al, b
jae propWin
jb hunted
back:
call newline

mov ah, 4ch
int 21h
main endp
end main