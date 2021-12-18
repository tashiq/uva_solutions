.model small 
.stack 100h
.data
input1 db ?
input2 db ?
result db ?
.code
main proc
   mov ax, @data
   mov ds, ax
   
   ; take input 1
   mov ah, 1
   int 21h
   mov input1, al
   
   ; put a newline 
   mov dx, 10
   mov ah, 2
   int 21h  
    
   ; take input 2
   mov ah, 1       
   int 21h 
   mov input2, al
   
   ; put a newline 
   mov dx, 10
   mov ah, 2
   int 21h
   
   
   mov al, input1
   mov dl, input2 
   
   ; input2 - input1
   sub dl, al 
   add dl, 48
   mov dh, 0
   mov ah, 2
   int 21h
   
main endp
end main