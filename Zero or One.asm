.MODEL small
.stack 100h
.data
a db ?
b db ?
c db ?
.code
; input a character
input proc
   mov ah, 1
   int 21h
   sub al, 48 
   
ret   
 
input endp  

space proc
mov ah, 2
mov dx, 32
int 21h
ret
space endp 

newline proc
mov ah, 2
mov dx, 10
int 21h
mov dx, 13
int 21h
newline endp

;print a character
print proc
mov ah, 2
int 21h  
;newline with caret
mov dl, 10
int 21h
mov dl, 13
int 21h
ret
print endp

abO proc

mov al, a
cmp al, 0
mov dl, 'B'
je print
mov dl, 'A'
jne print 

abO endp  

abZ proc
mov al, a
cmp al, 0
mov dl, 'A'
je print
mov dl, 'B'
jne print 
abZ endp


printStar proc
mov dl, '*'
call print
ret    
printStar endp  

findOne proc

mov bl, a
cmp bl, b
mov dl, 'C'
je print
jne abO

ret    
findOne endp
findZero proc
mov bl, a
cmp bl, b
mov dl, 'C'
je print
jne abZ

findZero endp


main proc
    mov ax, @data
    mov ds, ax
    
    call input
    mov a, al  
    call space
    call input 
    mov b, al  
    call space
    call input 
    mov c, al 
    
    call newline
    
    
    mov dl, a 
    add dl, b
    add dl, c
    
    cmp dl, 0
    je call printStar 
    cmp dl, 3
    je call printStar
    
    cmp dl, 1
    je call findOne
    cmp dl, 2
    je call findZero
    
    
    
main endp
end main