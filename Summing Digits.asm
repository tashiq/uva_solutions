.model small 
.stack 100h
.data
ans db ?
sum db 0
c db 1 
case db "Case $"
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
ret
casePrint endp 

sumFunction proc 
mov al, ans
mov dl, 10 
mov ah, 0
mov cl, 0 
mov sum, cl
    SUMDIGIT:  
    mov ah, 0   
    div dl ; ans = ans/10 
    add sum, ah
    cmp al, 0
    jne SUMDIGIT 
mov dl, sum
mov ans, dl              
ret
sumFunction endp
main proc
mov ax, @data
mov ds, ax

testCase:
call input
mov ans, al 
call newline
cmp ans, 0
je finish
jne hybernate

hybernate:
call sumFunction
cmp ans, 9
jbe print
ja hybernate

print:  
call casePrint
call space
mov ah, 2
mov dl, 48
add dl, ans
int 21h     
call newline
jmp testCase

finish:

mov ah, 4ch
int 21h
main endp
end main