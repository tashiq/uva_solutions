.model small
.stack 100h
.data
female db 1
male db 0
total db 1

.code
main proc 

mov ax, @data
mov ds, ax

mov ah, 1
int 21h
sub al, 48 
mov ch, 0
mov cl, al

generation:
    mov dl, female
    add dl, male   
    mov bl, male
    mov male, dl 
    inc bl
    mov female, bl
      
loop generation 

mov dl, 10  
mov ah, 2
int 21h  
mov dl, 13
int 21h

mov dl, male
add dl, 48
int 21h 

mov dl, 32
int 21h

mov dl, female
add dl, male
add dl, 48
int 21h

main endp
end main