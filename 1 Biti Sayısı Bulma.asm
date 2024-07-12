.MODEL SMALL
.STACK 64
.DATA

SAYI DW 1CF3H
SONUC DW 0

.CODE
ANA PROC FAR
    
    MOV AX,@DATA
    MOV DS,AX
    
    MOV CX,16
    
SAY:  

    SHL SAYI,1  
    JNC ARTIRMA
    INC SONUC
    MOV BX,SONUC
    
ARTIRMA: 

    LOOP SAY
    
    MOV AH,4CH
    INT 21H
    
ANA ENDP
 END ANA