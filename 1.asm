gr GROUP c_sgm, d_sgm
ASSUME cs: gr, ds: gr

d_sgm SEGMENT PARA PUBLIC 'DATA'
    X DW ?
    
    INPMSG  DB 13
       	 DB 10
	 DB 'Input decimal number: '
	 DB 10
	 DB '$'
    buff    db 6,7 Dup(?)
    
    EXTRN space1:NEAR
    
    PUBLIC X
d_sgm ENDS

c_sgm SEGMENT PARA PUBLIC 'CODE'
PUBLIC inpt
inpt PROC NEAR
        mov  ax,   gr
        mov  ds,   ax 
        MOV AH,9
        MOV DX, OFFSET space1
        INT 21H
        mov ah,0ah
        xor di,di
        	mov dx,offset buff ; аддрес буфера
        	int 21h ; принимаем строку
        	mov dl,0ah
        	mov ah,02
        	int 21h ; выводим перевода строки      
	mov si,offset buff+2 ; берем аддрес начала строки
	cmp byte ptr [si],"-" ; если первый символ минус
	jnz ii1
	mov di,1  ; устанавливаем флаг
	inc si    ; и пропускаем его
        ;mov  ah,   4ch
        ;int  21h
        ret
    ii1:
        	xor ax,ax
        	mov bx,10  ; основание сc
    ii2:
        	mov cl,[si] ; берем символ из буфера
        	cmp cl,0dh  ; проверяем не последний ли он
        	jz endin
     
        	sub cl,'0' ; делаем из символа число 
        	mul bx     ; умножаем на 10
        	add ax,cx  ; прибавляем к остальным
        	inc si     ; указатель на следующий символ
        	jmp ii2     ; повторяем   
    endin:
        	cmp di,1 ; если установлен флаг, то
        	jnz ii3
        	neg ax   ; делаем число отрицательным
    ii3:
    	MOV X, AX
           ret
           ;JMP Choose
inpt endp
c_sgm ENDS
    END inpt