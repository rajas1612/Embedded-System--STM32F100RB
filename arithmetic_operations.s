
         PRESERVE8
          THUMB       
 

 
          AREA    RESET, DATA, READONLY
          EXPORT  __Vectors
 
__Vectors 
	  DCD  0x20001000     
          DCD  Reset_Handler  
  
          ALIGN
 
; The program
; Linker requires Reset_Handler
 
          AREA    MYCODE, CODE, READONLY
 
   	  ENTRY
   	  EXPORT Reset_Handler
 
 
Reset_Handler
;;;;;;;;;;User Code Starts from the next line;;;;;;;;;;;;

   	  MOV R0, #0x1212
 	  MOV R1, #0x4242
	  ;MOV32 R0,#0x10101010
	  ;MOV32 R1,#0x20202020
STOP	
	  ADD R2, R0, R1
	  MUL R3,R0,R1
	  SUB R4,R0,R1
	  RSB R5,R0,R1
	  UDIV R6,R1,R0
	  MLA R7,R1,R0,R0
	  ADC R8,R0,R1
	  ASR R9,R0,#2
	  MLS R10,R0,R1,R2


      B  STOP
 
          END	;End of the program