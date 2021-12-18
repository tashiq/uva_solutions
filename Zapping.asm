.model small 
.stack 100h
.data

a db ?
b db ? 
res db ?

.code

print proc
    ; output
mov ah, 2
add dl, 48
int 21h                
    ;newline with caret
mov ah, 2
mov dx, 10
int 21h
mov ah, 2
mov dx, 13
int 21h
ret
print endp

calculation proc

    ;newline with caret  
mov ah, 2
mov dx, 10
int 21h
mov ah, 2
mov dx, 13
int 21h    

mov dh, 0
mov bh, 0

mov dl, b
sub dl, a
mov res, dl
mov bl, 100
sub bl, b   
add bl, a

cmp bl, res
mov dl, res
ja print   
mov dl, bl
jbe print
ret  
calculation endp

swapAB proc
mov dl, a
xchg dl, b  
mov a, dl
call calculation
ret
swapAB endp

main proc
mov ax, @data
mov ds, ax

mov ah, 1
int 21h
sub al, 48
mov a, al

mov ah, 2
mov dx, 32
int 21h

mov ah, 1
int 21h
sub al, 48
mov b, al

cmp al, a
jb swapAB

call calculation

mov ah, 4ch
int 21h
main endp
end main