## Задачи

* ознакомиться с концепцией переменных и работой с ними;
* выполнить базовые вычисления и преобразования;
* поэкспериментировать с кодом Python.

## Сценарий

Мили и километры - это единицы длины или расстояния.

Учитывая, что `1` миля (mile) равна приблизительно `1.61` километрам (kilometers), напишите программу в редакторе, чтобы она преобразовала:

* мили в километры;
* километры в мили.

```python
kilometers = 12.25
miles = 7.38

miles_to_kilometers = ###
kilometers_to_miles = ###

print(miles, "miles is", round(miles_to_kilometers, 2), "kilometers")
print(kilometers, "kilometers is", round(kilometers_to_miles, 2), "miles")

```

Не изменяйте ничего в существующем коде. Допишите свой код в местах, обозначенных `###`. Протестируйте вашу программу с данными, которые мы предоставили в исходном коде.

Обратите особое внимание на то, что происходит внутри функции `print()` Проанализируйте, как мы предоставляем несколько аргументов функции и как мы выводим ожидаемые данные.

Обратите внимание, что некоторые аргументы внутри функции `print()` являются строками (например, `"miles is"`, тогда как некоторые другие являются переменными (например,`miles`).

**Подсказка**

Здесь происходит еще одна интересная вещь. Можете ли вы увидеть другую функцию внутри функции `print()`? Это функция `round()`. Ее работа заключается в округлении выводимого результата до количества десятичных разрядов, указанных в скобках, и возврата значения с плавающей запятой (внутри функции `round()` вы можете найти имя переменной, запятую и число десятичных знаков, к которым мы стремимся).

После завершения лабораторной работы поэкспериментируйте. Попробуйте написать разные конвертеры, например, конвертер USD в EUR, конвертер температуры и т.д. Дайте волю своему воображению! Попробуйте вывести результаты, комбинируя строки и переменные. Попробуйте использовать и поэкспериментировать с функцией `round()`, чтобы округлить результаты до одного, двух или трех десятичных знаков. Проверьте, что произойдет, если вы не предоставите какое-нибудь количество цифр. Не забудьте протестировать свои программы.

Экспериментируйте, делайте выводы и учитесь. Будьте любопытным.


## Ожидаемый вывод

```
7.38 miles is 11.88 kilometers
12.25 kilometers is 7.61 miles
```

