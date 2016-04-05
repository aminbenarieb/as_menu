gr GROUP c_sgm, d_sgm
ASSUME cs: gr, ds: gr

d_sgm SEGMENT PARA PUBLIC 'DATA'
        space0 DB "0. Show menu" 13,10, "$"
        space1 DB "1. Enter the number in X", 13,10, "$"
        space2 DB "2. Show with line break binary  value of X without sign", 13,10, "$"
        space3 DB "3. Show with line break binary  value of X with    sign", 13,10, "$"
        space4 DB "4. Show with line break decimal value of X without sign", 13,10, "$"
        space5 DB "5. Show with line break decimal value of X with    sign", 13,10, "$"
        space6 DB "6. Show with line break heximal value of X without sign", 13,10, "$"
        space7 DB "7. Show with line break heximal value of X with    sign", 13,10, "$"
        space8 DB "8. Exit", 13,10, "$"
        
        PUBLIC space1
        
d_sgm ENDS

c_sgm SEGMENT PARA PUBLIC 'CODE'
PUBLIC strt
strt PROC NEAR
        mov  ax,  gr
        mov  ds,  ax 
        mov  dx,  offset space0
        mov  ah,  9
        int  21h
	mov  dx,  offset space1
        mov  ah,  9
        int  21h
	mov  dx,  offset space2
        mov  ah,  9
        int  21h
	mov  dx,  offset space3
        mov  ah,  9
        int  21h
	mov  dx,  offset space4
        mov  ah,  9
        int  21h
	mov  dx,  offset space5
        mov  ah,  9
        int  21h
	mov  dx,  offset space6
        mov  ah,  9
        int  21h
	mov  dx,  offset space7
        mov  ah,  9
        int  21h
	mov  dx,  offset space8
        mov  ah,  9
        int  21h
        ret
strt endp
c_sgm ENDS

END strt