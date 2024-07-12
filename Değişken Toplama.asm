.MODEL SMALL
.STACK 64
.DATA

SAYI1 DB 19H
SAYI2 DB 25H
TOPLAM DB 0

MESAJ1 DB 'SAYI1: 19H$'
MESAJ2 DB 'SAYI2: 25H$'
MESAJ3 DB 'TOPLAM: --H$'

TABLO DB '0123456789ABCDEF$'

SAT DB 12
SUT DB 12
CHAR DB 0

.CODE
ANA PROC FAR
    
    MOV AX,@DATA
    MOV DS,AX
    
    CALL EKRANSIL
    CALL KURKON
    
    LEA DX,MESAJ1
    CALL PRINT
    
    INC SAT
    CALL KURKON
    LEA DX,MESAJ2
    CALL PRINT
    
    INC SAT
    CALL KURKON
    LEA DX,MESAJ3
    CALL PRINT
    
    MOV BL,SAYI1
    ADD BL,SAYI2
    MOV TOPLAM,BL
    
    MOV SAT,14
    MOV SUT,21
    CALL KURKON
    
    MOV AL,TOPLAM
    AND AL,0FH
    
    MOV BH,0
    MOV BL,AL
    
    MOV AL,TABLO[BX]
    
    MOV CHAR,AL
    CALL YAZ
    
    MOV SAT,14
    MOV SUT,20
    CALL KURKON
    
    MOV AL,TOPLAM
    SHR AL,4
    
    MOV BH,0
    MOV BL,AL
    
    MOV AL,TABLO[BX]
    MOV CHAR,AL
    CALL YAZ
    
    MOV AH,4CH
    INT 21H
    
ANA ENDP

KURKON PROC
    
    MOV AH,02
    MOV BH,00
    MOV DH,SAT
    MOV DL,SUT
    INT 10H
    RET
    
KURKON ENDP

YAZ PROC
    
    MOV AH,02
    MOV DL,CHAR
    INT 21H
    RET
    
YAZ ENDP

PRINT PROC
    
    MOV AH,09
    INT 21H
    RET
    
PRINT ENDP

EKRANSIL PROC
    
    MOV AX,0600H
    MOV BH,30H
    MOV CX,0000H
    MOV DX,184FH
    INT 10H
    RET
    
EKRANSIL ENDP
 END ANA