.MODEL SMALL
.STACK 64
.DATA

SONUC DW ?
.CODE
ANA PROC FAR 
    
  MOV AX,@DATA
  MOV DS, AX
 
 
  MOV CX,10
  CALL TOPLA 
  
  MOV AH,4CH
  INT 21H
  ANA ENDP 
 
TOPLA PROC NEAR
 
TEKRAR:

  ADD BX,CX
  LOOP TEKRAR 
  
  MOV SONUC,BX
  RET         
  
TOPLA ENDP
 END ANA