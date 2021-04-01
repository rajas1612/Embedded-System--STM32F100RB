;; Directives
	PRESERVE8
	THUMB
; Vector Table Mapped to Address 0 at Reset
; Linker requires __Vectors to be exported
	AREA RESET, DATA, READONLY
	EXPORT __Vectors
__Vectors
	DCD 0x20001000
	DCD Reset_Handler ; reset vector
	ALIGN
		AREA MYCODE, CODE, READONLY		
    ENTRY
    EXPORT Reset_Handler 
A DCW 0x1024
	ALIGN
B_ DCW 0x2048
	ALIGN
C DCW 0x4096
	ALIGN
D DCW 0x8192
	ALIGN
E DCW 0x5000
	ALIGN
F DCW 0x1000
	ALIGN
R DCW 0x3000
	ALIGN
T DCW 0x4500
	ALIGN
result DCD 0x20001000
Reset_Handler
	LDR R0, A
	LDR R1, B_
	LDR R2, C
	LDR R3, D
	LDR R4, E
	LDR R5, F 
	LDR R6, R
	LDR R7, T
start

	MUL R8,R3,R3
	MUL R9,R2,R4
	MUL R10,R6,R7
	ADD R11,R8,R9
	SUB R11,R11,R10

	MOV R8, #0x0038
	MUL R8, R0, R8
	MOV R9, #0x0056
	MUL R9, R1, R9
	SUB R8, R8, R9
	MOV R9, #0x0043
	MUL R9, R3, R9
	MOV R10, #0x0051
	MUL R10, R4, R10
	MUL R8, R8, R10
	MOV R10, #0x0023
	MUL R5, R5, R10
	UDIV R12, R8, R5
	
	LDR R7,result
	MOV SP,R7
	STMFD SP!,{R11-R12}
end