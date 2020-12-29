; 计算2^12
CODE SEGMENT
ASSUME CS:CODE
BEG:
    MOV AX,1    
    MOV BX,2
    MOV CX,12       ;设置循环次数
MUL_AX:
    MUL BX          ;每次循环乘2
    LOOP MUL_AX     ;对指定的标号循环
    JMP $
CODE ENDS
END BEG