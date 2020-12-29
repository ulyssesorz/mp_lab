; N4=N1+N2+N3 =0011H+0033H+0055H=0099H 
CODE SEGMENT
ASSUME CS:CODE,DS:DATA
BEG:
        MOV AX,DATA
        MOV SI,OFFSET NUM1      ;得到偏移量
        MOV AX,0                ;初始化
        ADD AX,[SI+0]
        ADD AX,[SI+2]
        ADD AX,[SI+4]
        MOV [SI+6],AX           ;将寄存器中的结果存到内存中
        JMP $
CODE ENDS
DATA SEGMENT            ;数据段
NUM1 DW 0011H
NUM2 DW 0033H
NUM3 DW 0055H
NUM4 DW 0000H
DATA ENDS
END BEG