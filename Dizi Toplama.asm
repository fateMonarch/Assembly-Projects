.MODEL SMALL
.STACK 64
.DATA

DIZI DB 5, 6, 7, 8, 9, 0,-6,-9, 3, 8
SONUC DB ?

.CODE
ANA PROC FAR 
    
  MOV AX,@DATA
  MOV DS,AX
  
  MOV AL,0
  MOV CX,10 
  
  LEA SI,DIZI
 
BAS:

  MOV BL,[SI]
  ADD AL,BL
  INC SI   
  
  LOOP BAS
  MOV SONUC,AL   
  
  MOV AH,4CH
  INT 21H   
  
ANA ENDP
 END ANA