-- Используя операторы языка SQL, создайте табличку “sales”. Заполните ее данными

USE homeworks;

DROP TABLE IF EXISTS sales;

CREATE TABLE IF NOT EXISTS sales
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    category VARCHAR(20) NOT NULL,
    product VARCHAR(20) NOT NULL,
    amount INT
    );
    
INSERT INTO sales (category, product, amount)
VALUES
('milk_product', 'milk', 400),
('milk_product', 'cheese', 120),
('bakery', 'bread', 500),
('milk_product', 'sour_cream', 80),
('pastry', 'cookies', 250);

SELECT * FROM sales;

-- Сгруппируйте значений количества в 3 сегмента — меньше 100, 100-300 и больше 300.

SELECT sum(amount) 
FROM 
(SELECT amount,
CASE
WHEN amount < 100 THEN 'less then 100'
WHEN amount BETWEEN 100 AND 300 THEN 'from 100 to 300'
WHEN amount > 300 THEN 'more then 300'
END AS amounts
FROM sales) AS lists
GROUP BY amounts;

/* Чем NULL отличается от 0?
NULL это отсутвие значения, а 0 это значение равное нулю */



