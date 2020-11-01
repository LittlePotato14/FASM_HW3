# Точилина Полина БПИ199.
## Вариант 25
### Разработать программу, вычисляющую число вхождений символов в заданной ASCII-строке
### Дополнительное ограничение - входная строка не более 1000 символов

# Код основного файла программы
## Секция data

![alt-текст](https://github.com/LittlePotato14/FASM_HW3/blob/master/Screens/data.png "data")

## Секция code
При входе в программу запрашиваем у пользователя строку

Выводим введённую строку для проверки корректности

Считаем длину строки (реализовано в макросе)

Выделяем память под массив ASCII-кодов

Считаем число вхождений каждого символа (реализовано в макросе)

Выводим все символы, повторённые как минимум раз (реализовано в макросе)

Чистим память и завершаем процесс

![alt-текст](https://github.com/LittlePotato14/FASM_HW3/blob/master/Screens/code.png "code")

## Секция idata
![alt-текст](https://github.com/LittlePotato14/FASM_HW3/blob/master/Screens/idata.png "idata")

# Код макросов
## Подсчёт длины строки

![alt-текст](https://github.com/LittlePotato14/FASM_HW3/blob/master/Screens/strLenMacro.png "str len macro")

## Подсчёт числа вхождений каждого символа
Проходимся по символам введённой строки, вычисляем ASCII коды символов, инкрементируем соответсвующие элементы массива ASCII-кодов

![alt-текст](https://github.com/LittlePotato14/FASM_HW3/blob/master/Screens/countAsciiMacro.png "count ASCII macro")

## Вывод символов, повторённых не менее одного раза

![alt-текст](https://github.com/LittlePotato14/FASM_HW3/blob/master/Screens/outMacro.png "output macro")

# Тестирование программы
## Корректные данные
Проверим программу на самом простом вводе - латинский алфавит

![alt-текст](https://github.com/LittlePotato14/FASM_HW3/blob/master/Screens/Рисунок1.png "Рисунок 1")

Проверим программу на строке с пробелами

![alt-текст](https://github.com/LittlePotato14/FASM_HW3/blob/master/Screens/Рисунок2.png "Рисунок 2")

Проверим программу на 100 повторяющихся одинаковых символах
![alt-текст](https://github.com/LittlePotato14/FASM_HW3/blob/master/Screens/Рисунок3.png "Рисунок 3")

## Некорректные данные
При вводе строки в более чем 1000 символов, лишние символы будут отсечены и программа отработает на оставшейся строке

Для примера сгенерирован текст на 1000 символов и добавлены лишние цифры в конце

![alt-текст](https://github.com/LittlePotato14/FASM_HW3/blob/master/Screens/Рисунок4.png "Рисунок 4")
