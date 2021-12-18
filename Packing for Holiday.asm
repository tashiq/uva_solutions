.model small
.stack 100h
.data

a db ?
b db ?
c db ?
gd db "GOOD $"
bd db "BAD $"
case db "Case $"  
count db 1

.code 
main proc

mov ax, @data
mov ds, ax

mov ah, 1
int 21h
sub al, 48
mov cl, al

mov ah, 2
mov dx, 10
int 21h
mov dx, 13
int 21h
        

 ; input
looping:
mov ah, 1
int 21h  
sub al, 48 
mov a, al
; space 
mov dx, 32
mov ah, 2
int 21h
;input
mov ah, 1
int 21h  
sub al, 48 
mov b, al
         
; space 
mov dx, 32
mov ah, 2
int 21h

; input
mov ah, 1
int 21h  
sub al, 48 
mov c, al 
; newline with caret
mov ah, 2
mov dx, 10
int 21h
mov dx, 13
int 21h
        
; case print
mov dx, offset case
mov ah, 9
int 21h 
; space
mov dx, 32
mov ah, 2
int 21h
mov dl, count
inc count
add dl, 48
int 21h  
mov dx, ':'
int 21h

; operation
mov dl, a
cmp dl, 10
jb call checkB
jae call bad 

; newline with caret
mov ah, 2
mov dx, 10
int 21h
mov dx, 13
int 21h

loop looping

mov ah, 4ch
int 21h 
endp   


bad proc

mov dx, offset bd
mov ah, 9
int 21h
 
ret
bad endp 

     

good proc

mov dx, offset gd
mov ah, 9
int 21h  
ret    
good endp 

checkC proc

mov dl, c
cmp dl, 10
jb good
jae bad
ret
endp

checkB proc

mov dl, b
cmp dl, 10
jb  checkC
jae bad 

ret 
endp