;;; Directives
	PRESERVE8
	THUMB
; Vector Table Mapped to Address 0 at Reset
; Linker requires __Vectors to be exported
	AREA RESET, DATA, READONLY
	EXPORT __Vectors
__Vectors
	DCD 0x10001000
	DCD Reset_Handler ; reset vector
	ALIGN
		AREA MYCODE, CODE, READONLY
num     EQU   23                 		
    ENTRY
    EXPORT Reset_Handler
				  
Reset_Handler
start
        LDR   r0, =src              
        LDR   r1, =dst              
        MOV   r2, #num              
copyword
        LDR   r3, [r0],#4     
        STR   r3, [r1],#4
        SUBS  r2, r2, #1          
        BNE   copyword             
STOP
	 MOV R10, R0
	 MOV R11, R1
	 AREA  BlockData, DATA, READWRITE
src DCD 0x2,1,2,0X4,9,7,0xB,5,0xA,8
dst DCD 0,0,0,0,0,0,0,0,0,0
	 	END