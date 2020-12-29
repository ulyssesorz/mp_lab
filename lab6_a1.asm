; 2的指数幂数求和
CODE SEGMENT
ASSUME CS:CODE,DS:DATA
BEG:
    MOV DS,AX
    MOV SI,OFFSET TOTAL      
    MOV CX,10       ;项数
    MOV BX,2        ;指数2
    MOV DX,1        
    ADD [SI],DX     ;SI初始化为1
MUL_2:
    MOV AX,1
    PUSH CX         ;关键一步，把CX压栈以实现循环的嵌套
    LOP:
        MUL BX      ;乘法
        LOOP LOP
    POP CX          ;出栈
    ADD [SI],AX     ;每一项相加
    LOOP MUL_2
    JMP $
CODE ENDS
DATA SEGMENT
    TOTAL DW 0000H
DATA ENDS
END BEG