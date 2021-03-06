;�������� ������
;���199
;������� 25
;����������� ���������, ����������� ����� ��������� �������� � �������� ASCII-������
;�������������� ����������� - ������� ������ �� ����� 1000 ��������
format PE console

entry start

include 'win32a.inc'
include 'ASCII_counter_macro.inc'

section '.data' data readable writeable

        ;�������������� ������ �����
        formatNum db '%d', 0
        ;�������������� ������ ������
        formatStr db '%s', 0
        ;�������������� ����� ������ � ��������� � ������������
        formatInpStr db '%1000[^',10,']c', 0

        ;������ ������ ������� ��������
        outputElementString db '"%c" symbol was repeated %d times', 10, 13, 0

        ;������ �� ���� ������
        stringStr db 'Input a string: ', 0
        ;����� ���������� � �������� ������
        yourStringStr db 'Your string: ', 0
        ;����� ���������� � ������������� ��������
        otherSymb db 'Other symbols did not appear in the string', 10, 13, 0
        ;������� �� ����� ������
        endlStr db 10, 13, 0

        ;��� �������� �������� ������
        inputStr rb 1000;
        ;��� �������� ����� �������� ������
        strLen dd ?

        ;���-�� ASCII-��������
        N dd 256
        ;��� �������� ������� ��������
        A dd ?

        ;��� ���������� �����
        tmpStack dd ?
        ;�������� ��� �������
        i dd 0

        NULL = 0

section '.code' code readable executable

        start:
                ; ���� ������
                cinvoke printf, formatStr, stringStr
                cinvoke scanf, formatInpStr, inputStr
                cinvoke printf, formatStr, endlStr

                ; ����� �������� ������
                cinvoke printf, formatStr, yourStringStr
                cinvoke printf, formatStr, inputStr
                cinvoke printf, formatStr, endlStr
                cinvoke printf, formatStr, endlStr

                ; ������� ����� ������ ��� �������� �� ���
                push inputStr
                call strlen

                mov [strLen], eax

                ;�������� ������ ��� ������� ����� ASCII
                invoke  VirtualAlloc, NULL, [N], MEM_COMMIT+MEM_RESERVE, PAGE_READWRITE
                mov [A], eax

                ; ������� ����� ��������� ������� �������
                call countAscii

                ;����� �������
                call outputArray

                cinvoke printf, otherSymb

                invoke  VirtualFree, [A], [N], MEM_DECOMMIT

                call [getch]

                push NULL
                call [ExitProcess]


       ; �������
       count_ASCII_macro
       out_macro
       strLen_macro

section '.idata' import data readable

        library kernel, 'kernel32.dll',\
                msvcrt, 'msvcrt.dll'

        import kernel,\
               ExitProcess, 'ExitProcess',\
               VirtualAlloc, 'VirtualAlloc',\
               VirtualFree, 'VirtualFree'

        import msvcrt,\
               printf, 'printf',\
               getch, '_getch',\
               scanf, 'scanf'
