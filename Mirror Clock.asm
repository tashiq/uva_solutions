; Please Note:
; if you want to input a time, say 3:40
; you may input 3, I've ignored :
; and for 40, you should input the ascii item of (40+48) = 88
; that is X (capital x)
; ALSO
; OUTPUT WILL RETURN IN ASCII. IF YOU SEE AN ALPHABET OR SYMBOL
; PLEASE SUBSTRUCT 48 FROM THE ASCII VALUE OF THE OUTPUT.

.model small 
.stack 100h
.data
res dw 0
hAngle dw ?
rem db 0  
realAngle dw 360 
hr db ?
mn db ?
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
print proc
mov ah, 2
add dl, 48
int 21h
ret            
print endp

make12:
mov al, 12
jmp back   

makeZero:
mov dx, 0
mov hAngle, dx
jmp hourBack
main proc
mov ax, @data
mov ds, ax
  ; start
call input
mov cl, al
mov ch, 0   
call newline
testCase:
    call input 
    ; movement of hour Hand due to hour
    mov ah, 0    
    mov dl, 30
    mul dl    
    mov hAngle, ax 
    cmp hAngle, 360
    je makeZero
    hourBack:
    call space
    call input                         
    ; movement of hour Hand due to minute
    mov ah, 0
    mov dl, 2
    div dl
    mov rem, ah 
    mov ah, 0
    add hAngle, ax  
    
    call newline
    mov dx, realAngle
    sub dx, hAngle    
    ; calculate hour
    mov ax, dx
    mov dx, 30
    div dl       
    cmp al, 0
    je make12
    back:
    mov hr, al   
    ; calculate minute  
    mov al, ah
    mov ah, 0
    mov dl, 2
    mul dl  
    sub al, rem
    mov mn, al
    ; print the result
    mov dl, hr     
    call print 
    mov dl, 10 ; for :
    call print
    mov dl, mn
    call print
    call newline
loop testCase
mov ah, 4ch
int 21h
main endp
end main