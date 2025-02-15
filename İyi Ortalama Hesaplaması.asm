.MODEL SMALL
.STACK 64
.DATA
    
MESAJ1 DB 'VIZE NOTU: $'
MESAJ2 DB 0AH,0DH,'FINAL NOTU: $'
MESAJ3 DB 0AH,0DH,'ORTALAMA: $'
MESAJ4 DB ',5$'

VIZE1 DB ?
VIZE2 DB ?

FINAL1 DB ?    
FINAL2 DB ?

ORTALAMA1 DB ?
ORTALAMA2 DB ?

CHAR  DB ?
STAND DB ?
CARRY DB 0
    
.CODE
ANA PROC FAR
    
    MOV AX,@DATA
    MOV DS, AX
 
    CALL EKRANSIL
    CALL KURKON
    
    LEA DX,MESAJ1
    CALL YAZ
   
BASLA:
  
    MOV AH,00
    INT 16H 
    
    PUSH AX
    CALL EKRANSIL
    CALL KURKON
    
    LEA DX,MESAJ1
    CALL YAZ
    POP AX
    
    MOV VIZE1,AL
    MOV CHAR,AL
    CALL YAZCHAR
    
    MOV AH,00
    INT 16H
    
    MOV VIZE2,AL
    MOV CHAR,AL
    CALL YAZCHAR
    
    LEA DX,MESAJ2
    CALL YAZ
    
    MOV AH,00
    INT 16H
            
    MOV FINAL1,AL
    MOV CHAR,AL
    CALL YAZCHAR
    
    MOV AH,00
    INT 16H
    
    MOV FINAL2,AL
    MOV CHAR,AL
    CALL YAZCHAR
    
    LEA DX,MESAJ3
    CALL YAZ
    
    MOV AL,VIZE1
    SUB AL,30H
    MOV AH,00H
    MOV BL,0AH
    MUL BL
    
    MOV BL,VIZE2
    SUB BL,30H
    ADC AL,BL
    MOV BL,02H
    DIV BL
    MOV STAND,AL
    
    CMP AH,1
    JNE DEVAM1
    INC CARRY
    
DEVAM1:    
    
    MOV AL,FINAL1
    SUB AL,30H
    MOV AH,00H
    MOV BL,0AH
    MUL BL
    
    MOV BL,FINAL2
    SUB BL,30H
    ADC AL,BL
    MOV BL,02H
    DIV BL
    ADC STAND,AL
    
    CMP AH,1
    JNE DEVAM2
    INC CARRY
    
DEVAM2:    
    
    MOV AL,CARRY
    MOV AH,00H
    
    CMP AL,2
    JNE DEVAM3
    INC STAND
    
DEVAM3:
    
    MOV AL,STAND
    MOV BL,0AH
    DIV BL
    
    MOV ORTALAMA1,AL
    MOV ORTALAMA2,AH
    
    MOV AL,ORTALAMA1
    ADD AL,30H
    MOV CHAR,AL
    CALL YAZCHAR
    
    MOV AL,ORTALAMA2
    ADD AL,30H
    MOV CHAR,AL
    CALL YAZCHAR
    
    CMP CARRY,1
    JNE SON
    LEA DX,MESAJ4
    CALL YAZ
    
SON:
    
    MOV CARRY,00H   
    JMP BASLA    
    
    MOV AH,4CH
    INT 21H
    
ANA ENDP

YAZ PROC 
 
    MOV AH,09
    INT 21H
    RET 
    
YAZ ENDP
        
YAZCHAR PROC
             
    MOV DL,CHAR
    MOV AH,02
    INT 21H
    RET 
     
YAZCHAR ENDP  
 
KURKON PROC
    
    MOV AH,02
    MOV BH,00
    MOV DH,12
    MOV DL,00
    INT 10H
    RET
    
KURKON ENDP 
  
EKRANSIL PROC
    
    MOV AX,0600H
    MOV BH,30H
    MOV CX,0000H
    MOV DX,184FH 
    INT 10H
    RET 
    
EKRANSIL ENDP
 END ANA