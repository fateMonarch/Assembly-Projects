.MODEL SMALL
.STACK 64
.DATA
    
MESAJ1 DB 'SAYAC:  $'
    
CHAR  DB ?
SAYAC DB 0 
    
SAT DB 14
SUT DB 14
    
.CODE
ANA PROC FAR
    
    MOV AX,@DATA
    MOV DS, AX
 
    CALL EKRSIL
    CALL KURKON
    
    LEA DX,MESAJ1
    CALL YAZ 
   
TEKRAR:   
   
    MOV AH,00
    INT 16H     
    
    CMP AL,'A'
    JNE ATLA1
    
    INC SAYAC
    MOV AL,SAYAC
    ADD AL,30H
    MOV CHAR,AL
    
    MOV SUT,20
    CALL KURKON
    
    CALL YAZCHAR
 
ATLA1:
    
    CMP AL,'S'
    JNE ATLA2
    
    DEC SAYAC
    MOV AL,SAYAC
    ADD AL,30H
    MOV CHAR,AL 
    
    MOV SUT,20
    CALL KURKON
    CALL YAZCHAR
    
ATLA2:

    CMP AL,'Q'
    JNE TEKRAR    
    
    MOV AH,4CH
    INT 21H
    
ANA ENDP
          
YAZCHAR PROC
             
    MOV DL,CHAR
    MOV AH,02
    INT 21H
    RET
      
YAZCHAR ENDP  
 
KURKON PROC 
    
    MOV AH,02
    MOV BH,00
    MOV DH, SAT
    MOV DL, SUT
    INT 10H
    RET 
    
KURKON ENDP 
   
YAZ PROC 
  
    MOV AH,09
    INT 21H
    RET 
    
YAZ ENDP
 
EKRSIL PROC 
    
    MOV AX,0600H
    MOV BH,30H
    MOV CX,0000H
    MOV DX,184FH 
    INT 10H
    RET
    
EKRSIL ENDP
 END ANA
