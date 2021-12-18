.model small
.stack 100h
.data
a db ?
.code 
newline proc
mov ah, 2
mov dx, 10
int 21h
mov dx, 13
int 21h
ret
newline endp   
iterate:  
call newline   
mov dl, a
int 21h  
call newline
jmp fact
ret       
finish:
jmp back
ret      

main proc
mov ax, @data
mov ds, ax

fact:   

mov ah, 1
int 21h  
mov a, al
cmp a, 48
jne iterate
je finish 
back:  
mov ah, 4ch
int 21h

main endp 
end main