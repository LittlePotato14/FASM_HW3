;Точилина Полина
;БПИ199
;Вариант 25
;Разработать программу, вычисляющую число вхождений символов в заданной ASCII-строке
;Дополнительное ограничение - входная строка не более 1000 символов
format PE console

entry start

include 'win32a.inc'
include 'ASCII_counter_macro.inc'

section '.data' data readable writeable

        ;форматирование вывода числа
        formatNum db '%d', 0
        ;форматирование вывода строки
        formatStr db '%s', 0
        ;форматировнаие ввода строки с пробелами с ограничением
        formatInpStr db '%1000[^',10,']c', 0

        ;строка вывода каждого элемента
        outputElementString db '"%c" symbol was repeated %d times', 10, 13, 0

        ;запрос на ввод строки
        stringStr db 'Input a string: ', 0
        ;вывод информации о введённой строке
        yourStringStr db 'Your string: ', 0
        ;вывод информации о непосчитанных символах
        otherSymb db 'Other symbols did not appear in the string', 10, 13, 0
        ;переход на новую строку
        endlStr db 10, 13, 0

        ;для хранения введённой строки
        inputStr rb 1000;
        ;для хранения длины введённой строки
        strLen dd ?

        ;кол-во ASCII-символов
        N dd 256
        ;для хранения массива символов
        A dd ?

        ;для сохранения стэка
        tmpStack dd ?
        ;итератор для массива
        i dd 0

        NULL = 0

section '.code' code readable executable

        start:
                ; ввод строки
                cinvoke printf, formatStr, stringStr
                cinvoke scanf, formatInpStr, inputStr
                cinvoke printf, formatStr, endlStr

                ; вывод введённой строки
                cinvoke printf, formatStr, yourStringStr
                cinvoke printf, formatStr, inputStr
                cinvoke printf, formatStr, endlStr
                cinvoke printf, formatStr, endlStr

                ; считаем длину строки для итерации по ней
                push inputStr
                call strlen

                mov [strLen], eax

                ;выделяем память для массива кодов ASCII
                invoke  VirtualAlloc, NULL, [N], MEM_COMMIT+MEM_RESERVE, PAGE_READWRITE
                mov [A], eax

                ; считаем число вхождений каждого символа
                call countAscii

                ;вывод массива
                call outputArray

                cinvoke printf, otherSymb

                call [getch]

                push NULL
                call [ExitProcess]


       ; макросы
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
