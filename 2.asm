gr GROUP c_sgm, d_sgm
ASSUME cs: gr, ds: gr

d_sgm SEGMENT PARA PUBLIC 'DATA'  
 
    EXTRN X:NEAR    
    
    
    
    
    
    
    
    
    
    
d_sgm ENDS

c_sgm SEGMENT PARA PUBLIC 'CODE'
PUBLIC P2
P2   PROC NEAR
;EXTRN X:NEAR

; Check number sign
;   test    ax, ax
;   jns     oi1
;   mov  cx, ax
;   mov     ah, 02h
;   mov     dl, '-'
;   int     21h
;   mov  ax, cx
;   neg     ax

    mov    ax, X 
    xor    cx, cx
    mov    bx, 2
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
         
P2 endp
c_sgm ENDS
    END P2