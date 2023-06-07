#!/bin/bash

input_file=/media/egor/560ED1500ED129AF/qqqwwqeewqweeee/wwqeeweee/input.txt
output_file=fake_output

echo "-Запущен тест Аргументов-"

chmod +x fgxn4ik_AS.sh

echo "Тест №1: Проверка работы скрипта с неправильным количеством аргументов"
./fgxn4ik_AS.sh
if [[ $? -eq 1 ]]; then
    echo "Тест №1 пройден!"
else
    echo "Тест №1 провален :("
    echo "Входные аргументы: ПУСТО"
    exit 1
fi

echo "Тест №2: Проверка работы скрипта с правильными аргументами"
./fgxn4ik_AS.sh "$input_file" "$output_file" -d четные
if [[ $? -eq 0 ]]; then
    echo "Тест №2 пройден!"
else
    echo "Тест №2 провален :("
    echo "Входные аргументы: $input_file $output_file -d четные"
    exit 1
fi

echo "Тест №3: Проверка работы скрипта с неправильным четвертым аргументом"
./fgxn4ik_AS.sh "$input_file" "$output_file" -d неправильное
if [[ $? -eq 1 ]]; then
    echo "Тест №3 пройден!"
else
    echo "Тест №3 провален :("
    echo "Входные аргументы: $input_file $output_file -d неправильное"
    exit 1
fi

# Проверка записанного результата
result=$(cat "$output_file")
expected_result=4
if [[ $result -eq $expected_result ]]; then
    echo "Результат верный."
else
    echo "Результат неверный :("
    echo "Ожидаемый результат: $expected_result"
    echo "Фактический результат: $result"
    exit 1
fi

echo "Все тесты пройдены успешно!"
