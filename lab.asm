dseg SEGMENT PARA PUBLIC 'DATA'

 

ACTC    DB 'Choose action: ',10,13,'$'
AF      DB " ",10,13,"$"

dseg	ends

cseg	SEGMENT PARA PUBLIC 'CODE'
assume	CS:cseg, DS:dseg, SS:sseg
start:
EXTRN strt:NEAR
EXTRN inpt:NEAR
EXTRN P2:NEAR
EXTRN P3:NEAR
EXTRN P4:NEAR
EXTRN P5:NEAR
EXTRN P6:NEAR
EXTRN P7:NEAR


CALL strt
mb:
        mov  ax,  dseg
        mov  ds,  ax
        mov  dx,  offset AF
        mov  ah,  9
        int  21h 
        mov  dx,  offset ACTC
        mov  ah,  9
        int  21h
	  mov AH,7
	  int 21h
	  cmp AL,'0'
	  jne m1
	  PUSH DS;
	  CALL strt
	  jmp mb
m1:
	cmp AL,'1'
	jne m2
	PUSH DS;
	CALL inpt
	jmp mb
m2:
	cmp AL,'2'
	jne m3
	PUSH DS;
	CALL P2
	jmp mb
m3:
	cmp AL,'3'
	jne m4
	PUSH DS;
	CALL P3
	jmp mb
m4:
	cmp AL,'4'
	jne m5
	;PUSH DS;
	CALL P4
	jmp mb
m5:
	cmp AL,'5'
	jne m6
	PUSH DS;
	CALL P5
	jmp mb
m6:
	cmp AL,'6'
	jne m7
	PUSH DS;
	CALL P6
	jmp mb
m7:
	cmp AL,'7'
	jne m8
	PUSH DS;
	CALL P7
	jmp mb
m8:
	cmp AL,'8'
	je me 

	jmp mb
me:
	mov AH,4CH
	int 21H

cseg	ends
sseg	segment	stack
	dw	64 dup(0)
sseg	ends
END start