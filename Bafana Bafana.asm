.model small 
.stack 100h
.data
n db ?
k db ?
p db ?
t db ? 
c db 1  
case db "Case $"
.code   
input proc
mov ah, 1
int 21h
sub al, 48
ret       
input endp
space proc
mov dx, 32
mov ah, 2
int 21h
ret
space endp 
newline proc
mov dx, 10
mov ah, 2
int 21h
mov dx, 13
int 21h
ret
newline endp 
makeItN:
mov ah, n
jmp back
ret    
casePrint proc
mov dx, offset case
mov ah, 9
int 21h 
mov dl, c 
inc c
add dl, 48 
mov ah, 2
int 21h
mov dl, ':'
int 21h
call space

ret
casePrint endp
main proc
mov ax, @data
mov ds, ax

call input 
mov t, al
mov cl, t
mov ch, 0
call newline

bafanaForever:
call input
mov n, al
call space
call input
mov k, al
call space
call input
mov p, al
call newline  
call casePrint

; k+p%n
mov al, k
add al, p
mov dl, n
mov ah, 0
div dl        
cmp ah, 0
je makeItN
back:
; print result
mov dl, ah
add dl, 48
mov ah, 2
int 21h 

call newline

loop bafanaForever

mov ah, 4ch
int 21h
main endp
end main