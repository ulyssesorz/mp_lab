; 三角形数列求和，1+3+6+10+15
CODE SEGMENT
ASSUME CS:CODE,DS:DATA
BEG:
    MOV DS,AX
    MOV SI,OFFSET TOTAL      
    MOV CX,50       
TRANGLE:
    MOV AX,0
    MOV BX,1        ;每次计算前先初始化
    PUSH CX         ;关键一步，把CX压栈以实现循环的嵌套
    LOP:
        ADD AX，BX   ;循环，计算每一个三角
        INC BX
        LOOP LOP
    POP CX          ;出栈
    ADD [SI],AX     ;每一项相加
    LOOP TRANGLE
    JMP $
CODE ENDS
DATA SEGMENT
    TOTAL DW 0000H
DATA ENDS
END BEG