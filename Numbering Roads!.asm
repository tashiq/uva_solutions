.model small 
.stack 100h
.data
a db ? 
b db ?  
impo db "impossible$" 
c db 1        
sum db 0
case db "Case $"
ans db ?
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
impossible:
mov dx, offset impo
mov ah, 9
int 21h
call newline
jmp opera
ret         
showAns:          
mov dl, ans
add dl, 48
mov ah, 2
int 21h 
call newline
jmp opera
ret
incAns:
inc ans
call showAns
ret
calcSuf:
mov al, a
mov ans, 0
mov dl, a
cmp dl, b
jb showAns
sub al, b 
mov dl, al
cmp dl, 26
mov dl, 1
mov ans, dl
jb showAns
mov dl, 26
div dl
cmp ah, 0 
mov ans, al
je showAns 
jne incAns 
ret 
; print the case no
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
calculate:    
call casePrint
mov dl, 26
mov al, b
mov ah, 0
mul dl
add al, b
cmp al, a
jb impossible
jae calcSuf
back: 
;do some stuff  
call newline 
ret  

main proc
mov ax, @data
mov ds, ax
opera:
; code goes here
call input 
mov a, al  
mov sum, al
call space
call input 
mov b, al   
call newline 
mov dl, sum
add dl, b
cmp dl, 0
je finish
jne calculate
   
finish:

mov ah, 4ch
int 21h
main endp
end main
