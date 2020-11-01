macro count_ASCII_macro {
;--------------------------------------------------------------------------
; Считает число вхождений каждого символа в строке
         countAscii:
                mov [tmpStack], esp
                mov ecx, [strLen]
                mov esi, inputStr
                _loop:
                        ; чтобы сохранить значение счетчика
                        push ecx
                        ; обновляем ссылку на первый элемент массива
                        mov edi, [A]

                        ; получаем ASCII код символа
                        mov eax, 0
                        lodsb

                        ; инкрементируем элемент с индексом ASCII кода символа
                        mov edx, eax
                        imul edx, dword 4
                        add edi, edx
                        mov eax, [edi]
                        inc eax
                        mov [edi], eax

                        ;; обновляем счётчик и зацикливаем
                        pop ecx
                        LOOP _loop

                mov esp, [tmpStack]    
                ret
}

macro out_macro {
;--------------------------------------------------------------------------
; Выводит символы, повторенные как минимум один раз
        outputArray:
                ;сохраняем стэк для адреса возврата
                mov [tmpStack], esp
                mov ecx, 0
                mov [i], ecx

                mov ecx, [N]

                lp:
                        push ecx
                        ;вычисляем адрес новой ячейки
                        mov ecx, [i]
                        imul ecx, dword 4
                        mov eax, [A]
                        add eax, ecx

                        ;выводим значение, если оно не 0
                        mov ecx, 0
                        cmp [eax], ecx
                        jne outputElement
                        contin:

                        ;зацикливаем
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
; Считает длину строки
         strlen:
                mov     edi, [esp+4]
                mov     ecx, -1
                xor     al, al
                ; с начала в конец
                cld
                ; while(msg[edi] != al) {edi++; ecx--;}
                repne   scasb
                neg     ecx
                sub     ecx, 2
                mov     eax, ecx
                ret

}