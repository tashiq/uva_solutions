.model small 
.stack 100h
.data
x db ?
y db ?
z db ?

a db ?
b db ?
c db ?
no db "wrong!$"
yes db "right!$"
.code

finish:

mov ah, 4ch
int 21h

ret
   

ok: 

lea dx, yes
mov ah, 9
int 21h

mov ah, 4ch
int 21h
ret

wrong:
lea dx, no


mov ah, 9
int 21h

mov ah, 4ch
int 21h
ret    

calk:
 mov ah, 0
 mov al, b
 mul al
 mov dl, al
 mov al, c
 mul al
 add dl, al
 mov al, a
 mul al
 cmp dl, al
 je ok
 jne wrong
ret
xyz:

mov dl, x
mov dh, y
mov al, z
mov a, dl
mov b, dh
mov c, al

call calk
ret   

xzy:

mov dl, x
mov dh, z
mov al, y
mov a, dl
mov b, dh
mov c, al  
call calk
ret 


yxz:

mov dl, y
mov dh, x
mov al, z
mov a, dl
mov b, dh
mov c, al  
call calk
ret 

yzx:

mov dl, y
mov dh, z
mov al, x
mov a, dl
mov b, dh
mov c, al  
call calk
ret
zxy:

mov dl, z
mov dh, x
mov al, y
mov a, dl
mov b, dh
mov c, al  
call calk
ret 
zyx:

mov dl, z
mov dh, y
mov al, x
mov a, dl
mov b, dh
mov c, al  
call calk
ret 
xVSz: ; y is smallest  y<x y<z
mov dl, x
cmp dl, z
ja xzy ; x>z z>y 
jb zxy; z<x x<y

mov ah, 4ch
int 21h
ret    


zVSy: ; x is smallest
mov dl, y
cmp dl, z
ja yzx ; 
jbe zyx

mov ah, 4ch
int 21h
ret    

xWiny:  ; x>y
mov bl, y
cmp bl, z
ja xyz ; x>y>z
jbe xVSz; x>y, z>y
   
mov ah, 4ch
int 21h
ret 

yWinx:  ; y>x
mov bl, x
cmp bl, z
ja yxz ; y>x>z
jbe zVSy ; x<z, x<y
   
mov ah, 4ch
int 21h
ret   

work proc
mov dl, x
cmp dl, y

ja xWiny 
jbe yWinx
ret    
work endp


main proc
mov ax, @data
mov ds, ax


mov ah, 1
int 21h
sub al, 48
mov x, al

mov ah, 2
mov dx, 32
int 21h

mov ah, 1        
int 21h   
sub al, 48
mov y, al
       
mov ah, 2
mov dx, 32
int 21h
  
mov ah, 1
int 21h   
sub al, 48
mov z, al  

mov ah, 2
mov dx, 10
int 21h  

mov ah, 2
mov dx, 10
int 21h
mov dx, 13
int 21h  

mov dl, x
add dl, y
add dl, z
cmp dl, 0
je finish
jne work



mov ah, 4ch
int 21h
main endp


end main