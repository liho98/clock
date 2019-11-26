.model small
.386
.stack 64

.data
	floating_point_str db "000000000000000000000","$"
	temp_buf db "000000000000000000000"
	
	fraction_pointer dw ?	
	hundred_million dd 100000000.0      ; used as multiplier.
	is_neg db 0b

	ten dd 10      ; used as multiplier.	
	to_floor_num dd 0.5
	
	input_value dd 399999999
	sin_value dd 0.0
	cos_value dd 0.0	
	is_cos db 0b
	deg_180 dd 180.0
	value dd 0

	integer dd 0.0
	fraction dd 0.0
	
	quotient dd ?
	
.code


main proc

	mov ax,@data
	mov ds,ax
	
	finit
	fild input_value	
	;call sincos
	call squareroot

	mov eax,fraction
	mov quotient,eax
	call adjust_float	
	
	mov eax,integer
	mov quotient,eax
	call get_integer	
	
	mov eax,fraction
	mov quotient,eax
	call get_fraction		
	
	mov ah,09h
	lea dx,floating_point_str	
	int 21h		
	
	;mov ax,0012h
	;int 10h
	
	;mov dx,0010h
	;call res_cur

	mov ax,4c00h
	int 21h

main endp

sincos proc
	fdiv deg_180		;convert degree to rad
	fldpi		
	fmul 
	fsincos				;cos(st(0)),sin(st(1))
	
	;cmp is_cos,0b
	;jne not_cos
	;mov is_cos,0b	
	;fxch				;sin(st(0)),cos(st(1))

not_cos:
	fstp cos_value
	fst sin_value
	ftst                ; compare (operands like fadd), set flags C0-C3
	fstsw ax             ; copy flags to AX
	sahf                  ; copy AH to flags
	mov al,ah
	shl al,7
	shr al,7
	cmp al,1
	jne positive
	mov is_neg,1b

positive:	

	fabs
	fstp value
	
	finit
	
	fld to_floor_num
	fchs
	fld value
	fadd
	
	frndint
	fist integer	
	
	fchs
	
	fld value
	fadd

	fstp fraction
	
no_float:	

	fld fraction
	fld hundred_million
	fmul
	fist fraction
	ret
sincos endp

squareroot proc
	fsqrt
	

	ftst                ; compare (operands like fadd), set flags C0-C3
	fstsw ax             ; copy flags to AX
	sahf                  ; copy AH to flags
	mov al,ah
	shl al,7
	shr al,7
	cmp al,1
	jne positive1
	mov is_neg,1b

positive1:	

	fabs
	fstp value
	
	finit
	
	fld to_floor_num
	fchs
	fld value
	fadd
	
	frndint
	fist integer	
	
	fchs
	
	fld value
	fadd

	fstp fraction
	

	fld fraction
	fld hundred_million
	fmul
	fist fraction
	ret
squareroot endp

;in quotient, out floating_point_str
get_integer proc
	mov di,0
	
	cmp is_neg,1b
	jne chk_int_zero
	mov floating_point_str[di],"-"
	mov is_neg,0b	
	inc di
	
chk_int_zero:	
	cmp integer,0
	jne not_int_zero
	mov floating_point_str[di],"0"
	inc di
	jmp end_int	
	
not_int_zero:
	mov si,0
	
get_int:	
	mov edx,0			; clear dividend, high
	mov eax,quotient	; dividend, low
	div ten
	
	mov quotient,eax
			
	cmp eax,0
	je last_digit
	
	add dl,30h
	mov temp_buf[si],dl
	inc si	
	jmp get_int

last_digit:	
	add dl,30h
	mov temp_buf[si],dl	
	
	mov dx,si
	inc dx
reset_int_position:	
	cmp dx,0
	je end_int
	mov al,temp_buf[si]
	mov floating_point_str[di],al	
	dec si
	inc di
	dec dx
	
	jmp reset_int_position
	
end_int:
	mov floating_point_str[di],"."
	inc di
	mov floating_point_str[di],"$"	
	mov fraction_pointer,di
	ret
get_integer endp

get_fraction proc
	cmp fraction,0
	jne not_frac_zero
	mov di,fraction_pointer
	mov floating_point_str[di],"0"
	inc di
	jmp end_frac	

not_frac_zero:
	mov si,0
	mov bx,0
get_frac:	
	mov edx,0			; clear dividend, high
	mov eax,quotient	; dividend, low
	div ten
	
	mov quotient,eax
			
	cmp eax,0
	je last_digit_frac

	add dl,30h
	mov temp_buf[si],dl
	inc bx
	inc si
	jmp get_frac

last_digit_frac:	
	add dl,30h
	mov temp_buf[si],dl	
	inc bx
	mov di,fraction_pointer

reseting_frac:
	
	mov ax,8
	sub ax,bx
	jns correcting
	mov floating_point_str[di],"0"
	inc di
	jmp end_frac
correcting:	
	cmp ax,0
	je truncate
	mov floating_point_str[di],"0"
	inc di
	dec ax
	jmp correcting
	
truncate:
	mov dx,bx
	mov bx,0
truncating:
	mov al,temp_buf[bx]
	cmp al,"0"
	jne	corrected
	inc bx
	jmp truncating

corrected:
	dec bx	
reset_frac_position:

	cmp si,bx
	je end_frac
	mov al,temp_buf[si]	
	mov floating_point_str[di],al
	dec si
	inc di

	jmp reset_frac_position

end_frac:

	mov floating_point_str[di],"$"

	ret
get_fraction endp

adjust_float proc
	
adjusting:	
	mov edx,0			; clear dividend, high
	mov eax,quotient	; dividend, low
	div ten
	
	mov quotient,eax
			
	cmp eax,0
	je adjusted
	inc bx
	jmp adjusting

adjusted:	
	inc bx
	
	mov ax,8
	sub ax,bx
	jns end_adjust_float
	mov eax,1
	add integer,eax

end_adjust_float:
	ret
adjust_float endp


;INT 10 - AH = 02h VIDEO - SET CURSOR POSITION
res_cur proc
	;dh = row,dl = column
	mov bh,0
	mov ah,02h
	int 10h
	ret
res_cur endp

end main