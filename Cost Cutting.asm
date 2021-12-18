.model small 
.stack 100h
.data

x db ?
y db ?
z db ?
.code 

return: 
mov ah, 4ch
int 21h
ret

printX:

mov ah, 2
mov dl, x
int 21h

call input
ret   

printY:

mov ah, 2
mov dl, y
int 21h  
call input
ret 


printZ:

mov ah, 2
mov dl, z
int 21h

call input
ret 
    
xVSz: ; y is smallest  y<x y<z
mov dl, x
cmp dl, z
ja printZ ; x>z z>y 
jb printX ; z<x x<y

mov ah, 4ch
int 21h
ret    


zVSy: ; x is smallest
mov dl, y
cmp dl, z
ja printZ
jb printY

mov ah, 4ch
int 21h
ret    

xWiny:  ; x>y
mov bl, y
cmp bl, z
ja printY ; x>y>z
jb xVSz; x>y, z>y
   
mov ah, 4ch
int 21h
ret 

yWinx:  ; y>x
mov bl, x
cmp bl, z
ja printX ; y>x>z
jb zVSy ; x<z, x<y
   
mov ah, 4ch
int 21h
ret 
main proc
mov ax, @data
mov ds, ax

mov cx, 4  ; initial value of input number is 4
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
mov dx, 32
int 21h
  
mov ah, 1
int 21h  
mov z, al  

mov ah, 2
mov dx, 10
int 21h


mov bl, x
cmp bl, y 
ja xWiny ; x>y
jb yWinx ; y>x
loop input

mov ah, 4ch
int 21h
main endp
end main