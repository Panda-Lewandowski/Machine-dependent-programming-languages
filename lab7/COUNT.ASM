;��������� ������������ � ������ Count ����
;      function (const S: LONGWORD; L:LONGWORD)
;������������ ����� ������ ������� ������ S ����� L.

.386
.model FLAT,PASCAL
PUBLIC COUNT

.CODE
COUNT:
A EQU DWORD PTR[EBP+12]       ;���� ������
L EQU DWORD PTR[EBP+8]        ;����� ������
  PUSH EBP                    ;����� ������ ����� EBP
  MOV EBP,ESP                 ;����� � EBP ������� �������� ESP

  PUSH EBX                    ;��������� ��������

  MOV EAX,0                   ;���������
  MOV EBX,A                   ;����� ����� ������
  MOV ECX,L                   ;����� ������
  MOV ESI,0                   ;������

M:
  BT [EBX], ESI
  JA M2                       ;���� 0
  INC EAX                     ;EAX += 1
M2:
  DEC ECX                     ;��������� �������� �����
  JZ M4                       ;�� ��� ��� ���� ����� != 0, �������� �������
  INC ESI
  JZ M3                       ;���� CF = 1, ���� �� �3
  JMP M                       ;����� ���� �� �
M3:
  ADD EBX,4                   ;�� ���� ��� ��� ������� ����� ��� ������
  JMP M
M4:

  POP EBX
  POP EBP                     ;��������������� ��������
  RET 8
END


;������������� ������� bt
