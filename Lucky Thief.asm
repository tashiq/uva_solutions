.model small 
.stack 100h
.data
a db ?
b db ?
c db ?

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
calcSum proc
mov al, dl
inc al
mul dl
mov dl, 2
mov ah, 0
div dl
ret
calcSum endp
print proc
add dl, 48
mov ah, 2
int 21h
call newline
ret
print endp
; main   
main proc
mov ax, @data
mov ds, ax

call input
mov cl, al
mov ch, 0
call newline
process:
call input
mov a, al
call space
call input
mov b, al
call newline
; sum of 1 to b
mov dl, b
call calcSum 
mov b, al
; sum of 1 to a
mov dl, a 
call calcSum 
sub b, al 
mov al, a 
sub b, al 
; print result
mov dl, b
call print
loop process

mov ah, 4ch
int 21h
main endp
end main