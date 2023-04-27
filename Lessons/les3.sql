use myfirstdb;

select * from product
order by price;

select * from product
order by price desc;

SELECT ProductName, ProductCount * Price as TotalSum
from product
order by TotalSum;

select * from product
LIMIT 3;

select * from product
LIMIT 3;

SELECT DISTINCT Manufacturer, ProductCount from Product;

select Manufacturer, count(*) as ModelsCount
from product
group by Manufacturer;


select AVG(Price) as AveragePrice from product
where Manufacturer = 'Apple';

select COUNT(*) from product;

select min(Price), MAX(Price) from product;

select Manufacturer, count(*) as ModelCount
from Product
GROUP BY Manufacturer
having count(*) > 1;

select sum(Price) from product;

SELECT min(price) from product
where manufacturer ='Apple';

select min(price),
 max(price),
 avg(price)
 from product
 where manufacturer = 'Samsung';
 
select Manufacturer, count(*) as Models, ProductCount
from product;




