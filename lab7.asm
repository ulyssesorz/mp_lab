;插入排序
CODE SEGMENT
      ASSUME CS:CODE,DS:DATA,SS:STACK

START:  
      MOV AX,DATA           
      MOV DS,AX                           
      MOV BX,002H               ;设置第一个要插入的数，即数组中的第3个数
AGAIN0: MOV SI,BX               ;SI为将要插入的数
AGAIN1: MOV AL,ARRAY[SI]                  
      CMP AL,ARRAY[SI-1]        ;与前一个数交换
      JAE UNCH                  ;不满足条件不交换
EXCH: XCHG ARRAY[SI-1],AL       
      MOV ARRAY[SI],AL          ;实现两个数交换
      DEC SI                    ;交换后将当前的索引前移，继续指向插入的数     
      LOOP AGAIN1               ;插入的数接着和比较前一个数比较
UNCH: INC BX                    ;索引后移，准备插入下一个数                      
      CMP BX,COUNT              ;检查是否已完成
      JE DONE 
      JMP AGAIN0                ;未完成则继续下一个数的插入
DONE: JMP $
CODE ENDS
DATA SEGMENT
      ARRAY DB  25,46,3,75,5,30         ;定义数据
      COUNT EQU $-ARRAY                 ;数组长度
DATA ENDS
STACK SEGMENT PARA STACK 'STACK' 
      DB 60 DUP(?)
STACK ENDS
      END START       
