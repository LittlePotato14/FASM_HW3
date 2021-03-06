macro count_ASCII_macro {
;--------------------------------------------------------------------------
; ������� ����� ��������� ������� ������� � ������
         countAscii:
                mov [tmpStack], esp
                mov ecx, [strLen]
                mov esi, inputStr
                _loop:
                        ; ����� ��������� �������� ��������
                        push ecx
                        ; ��������� ������ �� ������ ������� �������
                        mov edi, [A]

                        ; �������� ASCII ��� �������
                        mov eax, 0
                        lodsb

                        ; �������������� ������� � �������� ASCII ���� �������
                        mov edx, eax
                        imul edx, dword 4
                        add edi, edx
                        mov eax, [edi]
                        inc eax
                        mov [edi], eax

                        ;; ��������� ������� � �����������
                        pop ecx
                        LOOP _loop

                mov esp, [tmpStack]    
                ret
}

macro out_macro {
;--------------------------------------------------------------------------
; ������� �������, ����������� ��� ������� ���� ���
        outputArray:
                ;��������� ���� ��� ������ ��������
                mov [tmpStack], esp
                mov ecx, 0
                mov [i], ecx

                mov ecx, [N]

                lp:
                        push ecx
                        ;��������� ����� ����� ������
                        mov ecx, [i]
                        imul ecx, dword 4
                        mov eax, [A]
                        add eax, ecx

                        ;������� ��������, ���� ��� �� 0
                        mov ecx, 0
                        cmp [eax], ecx
                        jne outputElement
                        contin:

                        ;�����������
                        inc[i]
                        pop ecx
                        LOOP lp

                mov esp, [tmpStack]
                ret

        outputElement:
                cinvoke printf, outputElementString, [i], [eax]
                jmp contin
}

macro strLen_macro {
;--------------------------------------------------------------------------
; ������� ����� ������
         strlen:
                mov     edi, [esp+4]
                mov     ecx, -1
                xor     al, al
                ; � ������ � �����
                cld
                ; while(msg[edi] != al) {edi++; ecx--;}
                repne   scasb
                neg     ecx
                sub     ecx, 2
                mov     eax, ecx
                ret

}