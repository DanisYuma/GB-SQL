drop DATABASE if EXISTS sem3;
CREATE DATABASE if not EXISTS sem3;
use sem3;

DROP table if EXISTS `staff`;
create table if not exists `staff`
(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`firstname` VARCHAR(45),
`lastname` VARCHAR(45),
`post` VARCHAR(45),
`seniority` INT,
`salary` INT,
`age` INT
);

alter table staff
modify post VARCHAR(30);

INSERT INTO `staff` (`firstname`, `lastname`, `post`,`seniority`,`salary`, `age`)
VALUES
('Вася', 'Васькин', 'Начальник', 40, 100000, 60), 
('Петр', 'Власов', 'Начальник', 8, 70000, 30),
('Катя', 'Катина', 'Инженер', 2, 70000, 25),
('Саша', 'Сасин', 'Инженер', 12, 50000, 35),
('Иван', 'Петров', 'Рабочий', 40, 30000, 59),
('Петр', 'Петров', 'Рабочий', 20, 55000, 60),
('Сидр', 'Сидоров', 'Рабочий', 10, 20000, 35),
('Антон', 'Антонов', 'Рабочий', 8, 19000, 28),
('Юрий', 'Юрков', 'Рабочий', 5, 15000, 25),
('Максим', 'Петров', 'Рабочий', 2, 11000, 19),
('Юрий', 'Петров', 'Рабочий', 3, 12000, 24),
('Людмила', 'Маркина', 'Уборщик', 10, 10000, 49);

DROP TABLE IF EXISTS activity_staff;
CREATE TABLE IF NOT EXISTS `activity_staff`
(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`staff_id` INT,
FOREIGN KEY(staff_id) REFERENCES staff(id),
`date_activity` DATE,
`count_pages` INT
);

INSERT `activity_staff` (`staff_id`, `date_activity`, `count_pages`)
VALUES
(1,'2022-01-01',250),
(2,'2022-01-01',220),
(3,'2022-01-01',170),
(1,'2022-01-02',100),
(2,'2022-01-01',220),
(3,'2022-01-01',300),
(7,'2022-01-01',350),
(1,'2022-01-03',168),
(2,'2022-01-03',62),
(3,'2022-01-03',84);

select * 
from staff;

select avg(salary)
from staff;

select *
from staff
where salary > (select avg(salary) from staff);

select salary, id 
from staff
order by salary desc;

select *
from staff
where seniority > 5 and post = 'Рабочий'
order by salary;

select *
from staff
order by age;

select *
from staff
order by firstname;

select firstname, lastname, age
from staff
order by firstname;

select firstname
from staff
order by firstname desc;

select age
from staff
order by age desc;

select firstname, age
from staff
order by firstname desc, age desc;

select id, firstname, age
from staff
limit 5;

select id, firstname, age
from staff
limit 2, 3;

select count(distinct lastname)
from staff;

select distinct lastname
from staff;

select distinct firstname
from staff;

select id
from staff
ORDER BY id
limit 2;

select id
from staff
ORDER BY id
limit 4,3;

select *
from staff
ORDER BY id desc
limit 2,3;

SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

 select salary, lastname, post,
 max(salary) as 'max salary',
 min(salary) as 'min salary'
 from staff
 group by post;
 
SELECT COUNT(salary), COUNT(lastname), post,
MAX(salary) AS "Макс зарплата",
MIN(salary) AS "Минзарплата",
MAX(salary) - MIN(salary) AS "Разница"
FROM staff
GROUP BY post;

select staff_id, sum(count_pages) as 'pages'
from activity_staff
GROUP BY staff_id;

select date_activity, sum(count_pages) as 'pages'
from activity_staff
group by date_activity;

select avg(count_pages) as 'average'
from activity_staff
group by date_activity;

select sum(salary), name_age
from 
(select salary,
case 
when age < 20 then 'yonger then 20'
when age between 20 and 40 then 'from 20 to 40'
when age > 40 then 'older then 40'
end as name_age
from staff) as lists
GROUP BY name_age;

select * 
from staff
group by salary
having salary > 50000;

select *, GROUP_CONCAT(lastname)
from staff
group by salary
having salary > 50000;

select *
from staff
having salary > 50000;

select *
from staff
where salary > 50000;

select post, avg(salary)
from staff
where post != 'Инженер'
GROUP BY post 
having AVG(salary) > 50000;



