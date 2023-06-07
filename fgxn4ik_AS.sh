#!/bin/bash

# Проверка наличия четырех аргументов
if [ $# -ne 4 ]; then
    echo "Неверное кол-во аргументов."
    exit 1
fi

input_file=$1
output_file=$2
option=$3

# Проверка наличия входного файла
if [ ! -f "$input_file" ]; then
    echo "Файл $input_file не найден."
    exit 1
fi

# Проверка значения третьего аргумента
if [ "$option" != "-d" ]; then
    echo "Неверное значение третьего аргумента. Необходимое значение: '-d'."
    exit 1
fi

even_or_odd=$4

# Подсчет четных или нечетных чисел и запись результата в выходной файл
if [ "$even_or_odd" = "четные" ]; then
    count=$(grep -E "\b[0-9]*[02468]\b" "$input_file" | wc -l)
elif [ "$even_or_odd" = "нечетные" ]; then
    count=$(grep -E "\b[0-9]*[13579]\b" "$input_file" | wc -l)
else
    echo "Неверное значение четвертого аргумента. Необходимые значения: 'четные' или 'нечетные'."
    exit 1
fi

echo "$count" > "$output_file"

echo "Успешно. Результат записан в файл $output_file."
