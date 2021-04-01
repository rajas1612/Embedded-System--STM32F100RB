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
stack_base DCD 0X05000000  
Reset_Handler
start
;MAP 0X04000000 , 0X05000000 READ WRITE EXEC
		LDR R0, stack_base
		MOV sp, R0
        MOV32 R0 , #0x12340000
		MOV32 R1 , #0x24246868
		MOV32 R2 , #0x45451234
		MOV32 R3 , #0x11111111
		MOV32 R4 , #0x36368989
		MOV32 R5 , #0x34343434
		
		STMFD sp!, {R0-R5} ;Push onto a Full Descending Stack
		LSL R0,R0,#5
		MUL R1,R0,R1
		SUB R2,R2,R1
		AND R3, R1, R0
		MLA R4,R1,R0,R0
		ORR R5, R2, R3
		PUSH {R0,R1, R2, R3, R4,R5}	
		LDMIA R13!, {R6-R11} ;copy stack back into registers
