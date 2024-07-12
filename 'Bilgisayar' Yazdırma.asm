.MODEL SMALL
.STACK 64
.DATA
      
MESAJ DB 'BILGISAYAR',0AH,0DH,'$'      
      
.CODE
ANA PROC FAR
    
    MOV AX,@DATA
    MOV DS,AX
    
    CALL EKRANSIL
    LEA DX,MESAJ 
    
    MOV CX,10    
    
TEKRAR:
   
    CALL YAZ
    LOOP TEKRAR
    
    MOV AH,4CH
    INT 21H
    
ANA ENDP

YAZ PROC
    
    MOV AH,09
    INT 21H
    RET
    
YAZ ENDP

EKRANSIL PROC
    
    MOV AX,0600H
    MOV BH,4FH      ;ARKA PLAN RENGI
    MOV CX,0000H
    MOV DX,184FH
    INT 10H
    RET
    
EKRANSIL ENDP
 END ANA
    