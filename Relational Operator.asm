.model small 
.stack 100h
.data

x db ?
y db ?
.code 

; 40 <
; 41 >
; 61 =
printG: 

mov dx, 41
mov ah, 2
int 21h

jmp input
ret

printL: 

mov dx, 40
mov ah, 2
int 21h
 
jmp input
ret 

printE: 

mov dx, 61
mov ah, 2
int 21h

jmp input
ret    

return: 
mov ah, 4ch
int 21h
ret

; main procedure
main proc
mov ax, @data
mov ds, ax 
mov cx, 4
input:
cmp cx, 0
je return
sub cx, 1

mov ah, 1
int 21h
mov x, al

mov ah, 2
mov dx, 32
int 21h

mov ah, 1
int 21h
mov y, al

mov ah, 2
mov dx, 10
int 21h

mov dl, x
cmp dl, y
ja printG
jb printL
je printE

loop input 

mov ah, 4ch
int 21h
main endp
end main