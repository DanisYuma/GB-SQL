USE homeworks;

SELECT * FROM cats;
SELECT * FROM shops;

/*
Используя JOIN-ы, выполните следующие операции:
1.Вывести всех котиков по магазинам по id (условие соединения shops.id = cats.shops_id)
2.Вывести магазин, в котором продается кот “Мурзик” (попробуйте выполнить 2 способами)
3.Вывести магазины, в которых НЕ продаются коты “Мурзик” и “Zuza”

Табличка (после слов “Последнее задание, таблица:”)
4.Вывести название и цену для всех анализов, которые продавались 5 февраля 2020 и всю следующую неделю.
*/

-- 1. Вывести всех котиков по магазинам по id (условие соединения shops.id = cats.shops_id)
SELECT cats.name, shops.shopname
FROM cats
JOIN shops 
ON shops.id = cats.shops_id;

-- 2.Вывести магазин, в котором продается кот “Мурзик” (попробуйте выполнить 2 способами)

SELECT cats.name, shops.shopname
FROM cats
JOIN shops 
ON shops.id = cats.shops_id
WHERE cats.name = 'Murzik';

SELECT cats.name, shops.shopname
FROM cats
JOIN shops 
ON shops.id = cats.shops_id
WHERE cats.name IN ('Murzik');


-- 3.Вывести магазины, в которых НЕ продаются коты “Мурзик” и “Zuza

SELECT shops.shopname AS shop
FROM shops
JOIN cats
ON shops.id = cats.shops_id
WHERE cats.name NOT IN ('Murzik', 'Zuza');

/* 4.Вывести название и цену для всех анализов, 
которые продавались 5 февраля 2020 и всю следующую неделю. */

SELECT * FROM orders;
SELECT * FROM groupsan;
SELECT * FROM analysis;

SELECT A.an_name, A.an_price, O.ord_datetime
FROM Orders AS O
JOIN Analysis AS A
ON A.an_id = O.ord_an
WHERE O.ord_datetime > '2020-02-05' AND O.ord_datetime < '2020-02-12' -- Не нравится мне такое решение
ORDER BY O.ord_datetime;

/* Коммент от ревьюера
Здравствуйте! 
Задания выполнены правильно, единственное, в последнем задании даты нужно было включить то есть <= и >=, 
либо вы могли использовать between, или вообще обозначить первую дату как переменную(вариантов огромное количество).
*/
