.model small 
.stack 100h
.data
sum db 0 
a db ?
b db ?
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
sumFunction proc
mov al, a
mov dl, b
answer:
mov ah, 0
div dl
add sum, al  
add al, ah
cmp al, b
ja answer 


mov dl, sum
add dl, a
add dl, 48
mov ah, 2
int 21h
call newline
ret 
sumFunction endp
main proc
mov ax, @data
mov ds, ax

call input 
mov a, al  
call space
call input  
mov b, al
call newline
call sumFunction
mov ah, 4ch
int 21h
main endp
end main