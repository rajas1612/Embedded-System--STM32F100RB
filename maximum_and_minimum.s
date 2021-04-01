		  PRESERVE8
          THUMB       
          AREA    RESET, DATA, READONLY
          EXPORT  __Vectors
__Vectors 
	  DCD  0x20001000     
          DCD  Reset_Handler  
          ALIGN
          AREA    MYCODE, CODE, READONLY
   	  ENTRY
   	  EXPORT Reset_Handler
		  
dest  DCD 0x00200000
			ALIGN
result1  DCD 0x00600000
result2  DCD 0x0060001A
			ALIGN	
Reset_Handler
;MAP 0x00000000, 0x01000000 READ WRITE EXEC

STOP 
      MOV32 R0,#0x00000040 ;storing the 32 bit values in register
	  MOV32 R1,#0x00000004
	  MOV32 R2,#0x00000010
	  MOV32 R3,#0x0000F000
	  MOV32 R4,#0x00000050
	  MOV32 R5,#0x00000100
	  MOV32 R6,#0x00000001
	  MOV32 R7,#0x00000120
	  MOV32 R8,#0x00000009
	  MOV32 R9,#0x00000030
	  LDR R10,dest 
	  STM R10!,{R0-R9} 
	  SUB R10,R10,#0x00000028 
	  LDR R1,[R10],#4 
	  MOV R11,#10	  
min 
	  LDR R2,[R10],#4 
	  CMP R2,R1 
      IT LT 
	  MOVLT R1,R2 
      SUB R11,R11,#1 	  
	  CMP R11,#1 
	  BNE min 
	  LDR R12,result1 
	  STR R1,[R12],#4 
	  SUB R10,R10,#0x00000028 
	  LDR R1,[R10],#4 
	  MOV32 R11,#10
max
	  LDR R2,[R10],#4 
	  CMP R2,R1 
	  IT GT 
	  MOVGT R1,R2 
      SUB R11,R11,#1 	  
	  CMP R11,#1 
	  BNE max   

      LDR R12,result2
	  STR R1,[R12],#4 
          END	;End of the program