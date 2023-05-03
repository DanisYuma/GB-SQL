USE myfirstdb;

CREATE TABLE sales	(
sales_employee VARCHAR(50) NOT NULL,
fiscal_year INT NOT NULL,
sale DECIMAL(14,2) NOT NULL,
PRIMARY KEY(sales_employee, fiscal_year)
);
    
INSERT INTO sales(sales_employee, fiscal_year,sale)
VALUES
('Bob',2016,100),
('Bob',2017,150),
('Bob',2018,200),
('Alice',2016,150),
('Alice',2017,100),
('Alice',2018,200),
('John',2016,200),
('John',2017,150),
('John',2018,250);

SELECT * FROM sales;

SELECT fiscal_year, SUM(sale)
FROM sales
GROUP BY fiscal_year;

SELECT *
FROM myfirstdb.product;

CREATE VIEW CopyProduct AS
SELECT Price, ProductCount, Manufacturer
FROM Product
WHERE Manufacturer = 'Apple';

SELECT *
FROM CopyProduct;

DROP VIEW CopyProduct;

CREATE TABLE ToDElete
(
	Id INT,
    Count INT
);

DROP TABLE ToDelete;

CREATE VIEW CopyProduct AS
SELECT Price, ProductCount, Manufacturer
FROM Product
WHERE Manufacturer = 'Apple';

SELECT *
FROM CopyProduct;

ALTER VIEW CopyProduct AS
SELECT Price, ProductCount, Manufacturer, ProductName
FROM Product
WHERE Manufacturer = 'Apple';

ALTER TABLE ToDelete ADD COLUMN TestString VARCHAR(40);
SELECT *
FROM ToDelete;



Alter TABLE ToDelete DROP COLUMN TestString;

