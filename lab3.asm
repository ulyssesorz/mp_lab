; 构造符号函数，判断5个输入的的输出
CODE SEGMENT
ASSUME CS:CODE
BEG:
    MOV AX,DATA     
    MOV DS,AX
    MOV CX,5        ;循环次数
    MOV SI,OFFSET NUM
    MOV DL,0        ;参照数
SGN:
    MOV AL,[SI]        
    CMP AL,DL   
    JG MQ_T     ;大于
    JE EQUA     ;等于
    JL LESS     ;等于
MQ_T:
    MOV BYTE PTR [SI+5],1   ;在指定内存放1
    JMP EN
EQUA:
    MOV BYTE PTR [SI+5],0
    JMP EN
LESS:
    MOV BYTE PTR [SI+5],-1
    JMP EN
EN:
    INC SI      ;指向下一个输入
    LOOP SGN
JMP $
CODE ENDS
DATA SEGMENT
    NUM DB 24H,13H,00H,0FFH,0ABH
    RESULT DB 5 DUP(?)          ;5个未知数作为输出
DATA ENDS
END BEG