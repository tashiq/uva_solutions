.model small 
.stack 100h
.data

x db ?
y db ?
z db ?
per db ? 
aex db ?
bex db ?

.code

input proc
mov ah, 1
int 21h
sub al, 48
ret       
input endp
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
print proc
mov ah, 2
add dl, 48
int 21h
call newline  
ret
print endp
calculation proc

mov al, x
add al, y
mov ah, 0
mov dl, 3
div dl 
mov per, al 
; extra completed by a
mov dl, x
sub dl, per
mov aex, dl
;  b extra
mov dl, y
sub dl, per
mov bex, dl
mov bl, bex
add bl, aex
mov al, z
mov ah, 0 
; paid per hour
div per
mul aex
mov dl, al
call print
ret
calculation endp


main proc
mov ax, @data
mov ds, ax

; tese case input
call input
mov cl, al
mov ah, 0 
call newline
testCase: 
    call input
    mov x, al  
    call space
    call input
    mov y, al 
    call space
    call input
    mov z, al
    call newline 
    call calculation
loop testCase

mov ah, 4ch
int 21h
main endp
end main