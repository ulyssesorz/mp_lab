; 斐波那契数列，1+1+2+3+5+8
CODE SEGMENT
ASSUME CS:CODE,DS:DATA
BEG:
    MOV DS,AX
    MOV SI,OFFSET TOTAL      
    MOV CX,50 
    MOV AX,1
    MOV BX,1
    MOV DX,2
    MOV [SI],DX     ;前两项直接赋值
FIB:
    MOV AX,1
    MOV BX,1        ;每次计算前先初始化
    PUSH CX         ;关键一步，把CX压栈以实现循环的嵌套
    LOP:
        MOV DX,AX
        MOV AX,BX
        MOV BX,DX
        LOOP LOP
    POP CX          ;出栈
    ADD [SI],AX     ;每一项相加
    LOOP FIB
    JMP $
CODE ENDS
DATA SEGMENT
    TOTAL DW 0000H
DATA ENDS
END BEG