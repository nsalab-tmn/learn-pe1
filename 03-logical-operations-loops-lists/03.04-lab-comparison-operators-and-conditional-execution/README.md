## Цели

* знакомство с функцией `input()`;
* знакомство с операторами сравнения в Python;
* знакомство с концепцией условного исполнения.

## Сценарий

[Спатифиллюм](https://upload.wikimedia.org/wikipedia/commons/b/bd/Spathiphyllum_cochlearispathum_RTBG.jpg), более известный как лилия мира или белый парус, является одним из самых популярных комнатных растений, фильтрующих вредные токсины из воздуха. Некоторые из токсинов, которые он нейтрализует, включают бензол, формальдегид и аммиак.

Представьте, что Ваша компьютерная программа любит эти растения. Всякий раз, когда она получает ввод в виде слова `Spathiphyllum`, она невольно выкрикивает в консоль следующую строку: `"Spathiphyllum is the best plant ever!"`

Напишите программу, которая использует концепцию условного выполнения, принимает строку в качестве входных данных и:

* выводит на экран предложение `"Yes - Spathiphyllum is the best plant ever!"`, если введенная строка - `"Spathiphyllum"` (верхний регистр)
* печатает `"No, I want a big Spathiphyllum!"`, если введенная строка - `"spathiphyllum"` (в нижнем регистре)
* выводит `"Spathiphyllum! Not [input]!"` в противном случае. Примечание. `[input]` - это строка, принятая как входная.

Протестируйте свой код, используя данные, которые мы Вам предоставили. И купите себе спатифиллюм!


## Тестовые данные
---------------

Пример ввода: `spathiphyllum`

Ожидаемый вывод: `No, I want a big Spathiphyllum!`

* * *

Пример ввода: `pelargonium`

Ожидаемый вывод: `Spathiphyllum! Not pelargonium!`

* * *

Пример ввода: `Spathiphyllum`

Ожидаемый вывод: `Yes - Spathiphyllum is the best plant ever!`  

