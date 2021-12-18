.model small
.stack 100h
.data

.code    

x db ?
res db 1

main proc
 mov ax, @data
 mov ds, ax
    
 mov ah, 1
 int 21h 
 sub al, 48
 mov x, al  
 
 
 ; newline with caret
 mov ah, 2
 mov dl, 10
 int 21h
 mov dl, 13
 int 21h 
   
 
 mov al, x
 inc al 
 mov ah, 0
 mul x
 mov dl, 2    
 div dl

 add res, al
 mov dl, res          
 
 add dl, 48
 mov ah, 2
 int 21h 
 mov ah, 4ch
 int 21h
main endp
end main