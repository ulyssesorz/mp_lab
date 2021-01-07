;判断表中素数的个数
CODE SEGMENT
ASSUME  CS:CODE,DS:DATA
START:MOV  CX,DATA
      MOV  DS,CX
      MOV  DI,OFFSET TABLE	;获得表的偏移量
	  MOV CX,[DI]			;循环次数需足够大，确保JUDGE通过JZ跳出
	  MOV DL,[DI]
	  DEC DL				;判断n是素数，从n-1开始作除法

JUDGE:	MOV AX,WORD PTR[DI]
		DIV DL				;从表中取出一个数，相除
		CMP AH,0			;能整除则非素数
		JZ AGAIN			
		DEC DL				;除数减1
		CMP DL,1			;DL为1时仍未判为非素数，则其是素数
		JZ PRIME
		LOOP JUDGE
AGAIN:	CMP DI,LEN			
		JZ DONE				;判断完表中的数，程序执行完毕
		INC DI				;不是素数，判断下一个数，字-2
		INC DI		
		MOV DL,[DI]	
		MOV CX,[DI]			
		DEC DL				;为下一次判断初始化
		JMP JUDGE
PRIME:	INC BX				;是素数，BX+1
		JMP AGAIN			;继续下一个数的判断
DONE:	MOV  COUNT,BX 
	JMP $
CODE   ENDS
DATA      SEGMENT
TABLE DW 5,6,7,8,9 ;表中的内容
LEN EQU $-TABLE
COUNT  DW  0 
DATA ENDS
	END START
