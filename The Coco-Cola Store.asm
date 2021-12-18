.model small
.stack 100h
.data
x db ?
.code

finish proc
mov ah, 4ch
int 21h
finish endp 
process proc
 
mov dl, 2
mov al, x
mov ah, 0
div dl
mov dl, al
add dl, 48 
mov ah, 2
int  21h
 ; newline with caret
 mov ah, 2
 mov dx, 10
 int 21h
 mov dx, 13
 int 21h 
 
process endp
main proc
    
mov ax, @data
mov ds, ax

mov ah, 1
int 21h
sub al, 48
mov x, al
 ; newline with caret
 mov ah, 2
 mov dx, 10
 int 21h
 mov dx, 13
 int 21h
 
cmp x, 0
je finish
jne process
    
main endp
end main