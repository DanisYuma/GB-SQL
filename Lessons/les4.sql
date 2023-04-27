CREATE table if not EXISTS customers
(
	Id int AUTO_INCREMENT primary key,
    FirstName VARCHAR(20) not null,
    LastName VARCHAR(20) not null,
    AccountSum DECIMAL
);

create table employee
(
	Id int AUTO_INCREMENT primary key,
    FirstName VARCHAR(20) not null,
    LastName VARCHAR(20) not null
);

insert into customers(FirstName, LastName, AccountSum)
Values
('Tom', 'Smith', 2000),
('Sam', 'Sally', 4000),
('Jack', 'Black', 3000),
('Tom', 'Cruz', 5000),
('Bill', 'Murrey', 8000);

insert into employee(FirstName, LastName)
Values
('Tom', 'Tom'),
('Sam', 'Carl'),
('Jack', 'White'),
('Tom', 'Cruz'),
('Bill', 'Murrey');

select FirstName, LastName
From customers
UNION select FirstName, LastName from employee
order by FirstName desc;

select FirstName, LastName
from customers
Union all select FirstName, LastName
from employee
ORDER BY FirstName;

select FirstName, LastName, AccountSum + AccountSum * 0.1 as TotalSum
from customers where AccountSum < 3000
UNION select FirstName, LastName, AccountSum + AccountSum * 0.3 as TotalSum
from customers where AccountSum >= 3000;

select * from product;

create table orders
(
	Id int auto_increment primary key,
    ProductId int not null,
    CustomerId int not null,
    CreatedAt date not null,
    ProductCount int default 1,
    price decimal not null,
    foreign key (ProductId) references product(Id) on delete cascade,
    foreign key (CustomerId) references customers(Id) on delete cascade
);

select orders.CreatedAt, orders.ProductCount, product.ProductName
from orders
join product on product.Id = orders.ProductId;

create table test4
(
	Id int,
    Name VARCHAR(20)
);

Insert into test4 values
(1, 'Bob'), (2, 'Tom'), (3, 'Tim');

select * from test4;
create table copy select * from test4;
select * from copy;

