/*create database worker;
use worker;
create table employ
(
idemploy int primary key not null,
worker_name varchar(30) not null,
dept varchar(30) not null,
salary varchar(10)
)*/

/*insert employ
(
idemploy, worker_name, dept, salary
)
values
(1, 'Andrey', 'Sales', '20000'),
(2, 'Boris', 'Sales', '25000'),
(3, 'Galya', 'IT', '50000'),
(4, 'Petr', 'IT', ''),
(5, 'Andrey', 'CEO', '100000');*/

select * from employ
where salary < '40000';

select * from employ
where dept = 'it';

select * from employ
where dept != 'it';

select * from employ
where dept not like 'it';

select * from employ
where not dept = 'it';


