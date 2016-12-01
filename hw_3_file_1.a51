; example for a p39-like problem 

	cseg at 0
	ljmp start

table: db 0,1,4,9,16,25,36,49

	cseg at 100h
start:  mov P1,#0e0h         ; make bits 5 to 7 inputs

loop:   mov a,p1             ; read pl

	mov r2,#5            ; shift right 5x (Acc >>5)
rotlp:  rr a
	djnz r2, rotlp

	anl a,#7             ; mask input bits
	mov dptr,#table     ; get table address
	movc a,@a+dptr       ;get ith entry in table
	
	mov c,acc.5
	mov P3.0,c

	orl a,#0e0h          ; make high order bits = 1
	mov p1,a             ; output to pl
	sjmp loop            ; repeat forever

	end
