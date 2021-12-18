.model small 
.stack 100h
.data
angle db ?
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

print proc
mov ah, 2
int 21h  
call newline
jmp repeat
print endp 

main proc
mov ax, @data
mov ds, ax

repeat:
call input  
mov angle, al
call newline 
mov al, angle
mov ah, 0 
mov dl, 6
div dl   
cmp ah, 0
mov dl, 'Y'
je print   
mov dl, 'N'
jne print 
jmp repeat

mov ah, 4ch
int 21h
main endp
end main