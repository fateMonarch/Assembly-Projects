.MODEL SMALL
.STACK 64
.DATA 
    
MESAJ1 DB 'ASCII KODU: $' 
MESAJ2 DB 0AH,0DH,'SCAN KODU: $' 
TABLO DB '0123456789ABCDEF$'    
    
ASCII DB ?
SCAN DB ? 
CHAR DB ?

.CODE
ANA PROC FAR
 
    MOV AX,@DATA
    MOV DS, AX
   
    CALL EKRANSIL
    CALL CURSER
 
BASLA:
 
    MOV AH,00
    INT 16H       
           
    PUSH AX
    CALL EKRANSIL
    CALL CURSER
    POP AX
    
    MOV ASCII,AL
    MOV SCAN,AH
    
    CMP AL,1BH
    JE SONLANDIR
    
    LEA DX,MESAJ1
    CALL PRINT
    
    MOV AL,ASCII
    SHR AL,4
    MOV BH,0
    MOV BL,AL
    MOV AL,TABLO[BX]
    MOV CHAR,AL
    CALL YAZ
    
    MOV AL,ASCII
    AND AL,0FH
    MOV BH,0
    MOV BL,AL
    MOV AL,TABLO[BX]
    MOV CHAR,AL
    CALL YAZ
    
    LEA DX,MESAJ2
    CALL PRINT 
                      
    MOV AL,SCAN
    SHR AL,4
    MOV BH,0
    MOV BL,AL
    MOV AL,TABLO[BX]
    MOV CHAR,AL
    CALL YAZ
    
    MOV AL,SCAN
    AND AL,0FH
    MOV BH,0
    MOV BL,AL
    MOV AL,TABLO[BX]
    MOV CHAR,AL
    CALL YAZ        
    
    JMP BASLA
    
SONLANDIR:

    MOV AH,4CH
    INT 21H 
    
ANA ENDP

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
    MOV DX,284FH
    INT 10H
    RET

EKRANSIL ENDP 
 
CURSER PROC
 
    MOV AH,02
    MOV BH,00
    MOV DH,12
    MOV DL,00
    INT 10H
    RET
    
CURSER ENDP 
 END ANA