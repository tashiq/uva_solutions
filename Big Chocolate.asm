.model small 
.stack 100h
.data

n db ?
m db ?
res db ? 

.code
otherwise:   
mov al, n
mov bl, m
sub al, 49; n-1
sub bl, 48 ; m

mul bl 
sub bl, 1
add al, bl 
mov dl, al 
add dl, 48
mov ah, 2
int 21h

mov ah, 4ch
int 21h
ret 



main proc  
mov ax, @data
mov ds, ax

; take input 1
mov ah, 1
int 21h 
mov n, al

; give space
mov dx, 32
mov ah, 2
int 21h

; take input 2
mov ah, 1
int 21h
mov m, al

; put a newline
mov ah, 2
mov dx, 10
int 21h    

call otherwise

main endp
end main         
