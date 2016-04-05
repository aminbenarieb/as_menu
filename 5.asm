SC1  SEGMENT PARA PUBLIC 'CODE'
     ASSUME CS:SC1,DS:SC1,SS:SSEG
;EXTRN space:DB
PUBLIC P5
P5   PROC NEAR

    mov    ax, -10
    
; Check number sign
    test    ax, ax
   jns     oi1
   mov  cx, ax
   mov     ah, 02h
   mov     dl, '-'
   int     21h
   mov  ax, cx
   neg     ax
oi1:      
    xor     cx, cx
    mov    bx, 10
oi2:
    xor     dx,dx
    div     bx

    push    dx
    inc     cx

    test    ax, ax
    jnz     oi2

    mov     ah, 02h
oi3:
    pop     dx

; if base > 10
    ;   cmp     dl,9
    ;   jbe     oi4
    ;   add     dl,7
    add     dl, '0'
    int     21h
    loop    oi3

    ret
P5  ENDP
SC1  ENDS

SSEG SEGMENT PARA STACK 'STACK'
     DB 64 DUP('STACK+++')
SSEG ENDS
 
     END P5