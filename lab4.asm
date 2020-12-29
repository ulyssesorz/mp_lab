; 有交集的内存移动
CODE SEGMENT
ASSUME CS:CODE
BEG:
    MOV SI,1000H    ;源内存起始地址
    MOV CX,100      ;移动字节数
    MOV AL,1        
PUT_IN:
    MOV [SI],AL     ;存入数据1到100
    INC AL          ;后移
    INC SI
    LOOP PUT_IN

    MOV CX,101      
    MOV SI,1064H    ;从后往前移动
    MOV DI,1084H    ;目的内存的起始地址

FADR:
    MOV AL,[SI]     ;移动数据
    MOV [DI],AL
    DEC SI          ;移动上一单元
    DEC DI
    LOOP FADR
    JMP $
CODE ENDS
END BEG