DROP DATABASE IF EXISTS sem_5;
CREATE DATABASE sem_5;
USE sem_5;

-- Персонал
DROP TABLE IF EXISTS staff;
CREATE TABLE staff (
id INT AUTO_INCREMENT PRIMARY KEY,
firstname VARCHAR(45),
lastname VARCHAR(45),
post VARCHAR(100),
seniority INT,
salary INT,
age INT
);

-- Наполнение данными
INSERT INTO staff (firstname, lastname, post, seniority, salary, age)
VALUES
('Вася', 'Петров', 'Начальник', '40', 100000, 60),
('Петр', 'Власов', 'Начальник', '8', 70000, 30),
('Катя', 'Катина', 'Инженер', '2', 70000, 25),
('Саша', 'Сасин', 'Инженер', '12', 50000, 35),
('Ольга', 'Васютина', 'Инженер', '2', 70000, 25),
('Петр', 'Некрасов', 'Уборщик', '36', 16000, 59),
('Саша', 'Петров', 'Инженер', '12', 50000, 49),
('Иван', 'Сидоров', 'Рабочий', '40', 50000, 59),
('Петр', 'Петров', 'Рабочий', '20', 25000, 40),
('Сидр', 'Сидоров', 'Рабочий', '10', 20000, 35),
('Антон', 'Антонов', 'Рабочий', '8', 19000, 28),
('Юрий', 'Юрков', 'Рабочий', '5', 15000, 25),
('Максим', 'Максимов', 'Рабочий', '2', 11000, 22),
('Юрий', 'Галкин', 'Рабочий', '3', 12000, 24),
('Людмили', 'Маркина', 'Уборщик', '10', 10000, 49),
('Юрий', 'Онегин', 'Начальник', '8', 100000, 39);

-- Range DENSE_RANK, RANK, ROW_NUMBER, NTILE
-- Вывыдем список и место по зарплатамALTER

SELECT DENSE_RANK() OVER(ORDER BY salary DESC) AS 'dence_rank',
RANK() OVER(ORDER BY salary DESC) AS 'rank',
ROW_NUMBER() OVER(ORDER BY salary DESC) AS 'number',
NTILE(4) OVER(ORDER BY salary DESC) AS 'ntile', -- Внутри указывается количество групп
post,
salary,
CONCAT(firstname,' ',lastname) AS 'full_name'
FROM staff;

-- Выведем ранки по должностям

SELECT
DENSE_RANK() OVER(PARTITION BY post ORDER BY salary DESC) AS `dense_rank`,
post,
salary,
CONCAT(firstname,' ',lastname) AS 'full_name'
FROM staff;	

-- Most salary by post

SELECT
post, salary, `DENSE_RANK`, `full_name`
FROM
(SELECT
DENSE_RANK() OVER(PARTITION BY post ORDER BY salary DESC) AS `dense_rank`,
post,
salary,
CONCAT(firstname,' ',lastname) AS 'full_name'
FROM staff) AS `rank`
WHERE `dense_rank` = 1
ORDER BY salary DESC;

/* emloyees by salary in each post and calc:
1. total sum of each post
2. share of each salary to total sum by post
3. AVG salary by post
4. share of each salary to avg salary by post
*/

SELECT * FROM staff;

SELECT 
id,
CONCAT(firstname,' ',lastname) AS `full_name`,
post, salary,
SUM(salary) OVER w AS sum_salary,
ROUND(salary*100/SUM(salary) OVER w) AS percent_sum_salary,
AVG(salary) OVER w AS avg_salary,
ROUND(salary*100/SUM(salary) OVER w, 3) AS percent_avg_salary
FROM staff
WINDOW w AS (PARTITION BY post);

DROP TABLE IF EXISTS academic_record;
CREATE TABLE IF NOT EXISTS academic_record ( student_name varchar(45),
quartal varchar(45),
course varchar(45),
grade int
);

INSERT INTO academic_record
VALUES ('Александр','1 четверть', 'математика', 4),
('Александр','2 четверть', 'русский', 4),
('Александр', '3 четверть','физика', 5),
('Александр', '4 четверть','история', 4),
('Антон', '1 четверть','математика', 4),
('Антон', '2 четверть','русский', 3),
('Антон', '3 четверть','физика', 5),
('Антон', '4 четверть','история', 3),
('Петя', '1 четверть', 'физика', 4),
('Петя', '2 четверть', 'физика', 3),
('Петя', '3 четверть', 'физика', 4),
('Петя', '4 четверть', 'физика', 5);

select *
from academic_record;
-- Получить с помощью оконных функции:
-- 1. Средний балл ученика
-- 2. Наименьшую оценку ученика
-- 3. Наибольшую оценку ученика

SELECT DISTINCT student_name,
AVG(grade) OVER s AS avg_grade,
MIN(grade) OVER s AS min_grade,
MAX(grade) OVER s AS max_grade
FROM academic_record
WINDOW s AS (PARTITION BY student_name);

-- Смещающиеся функции LAG, LEAD, FIRST_VALUE, LAST_VALUE

SELECT
id, post, salary, 
LAG(id) OVER w AS `lag`,
LEAD(id) OVER w AS `lead`,
FIRST_VALUE(id) OVER w AS `first_value`,
LAST_VALUE(id) OVER w AS `last_value`
FROM staff
WINDOW w AS (PARTITION BY post);

-- Virtual tables

USE lesson4;
CREATE OR REPLACE VIEW teacher_web AS
SELECT t.surname, l.course
FROM teacher AS t
LEFT JOIN lesson l
ON t.id = l.teacher_id
WHERE l.teacher_id IS NULL;

SELECT * FROM teacher_web;

USE sem_5;

DROP TABLE IF EXISTS summer_medals;
CREATE TABLE IF NOT EXISTS summer_medals
(
year INT,
city VARCHAR(45),
sport VARCHAR(45),
discipline VARCHAR(45),
athlete VARCHAR(45),
country VARCHAR(45),
gender VARCHAR(45),
event VARCHAR(45),
medal VARCHAR(45)
);

SELECT *
FROM summer_medals;
INSERT summer_medals
VALUES
(1896, "Athens", "Aquatics", "Swimming", "HAJOS ALfred", "HUN", "Men","100M Freestyle", "Gold"),
(1896, "Athens", "Archery", "Swimming", "HERSCHMANN Otto", "AUT", "Men","100M Freestyle", "Silver"),
(1896, "Athens", "Athletics", "Swimming", "DRIVAC Dimitros", "GRE", "Men","100M Freestyle For Saliors", "Bronze"),
(1900, "Athens", "Badminton", "Swimming", "MALOKINIS Ioannis", "GRE", "Men","100M Freestyle For Saliors", "Gold"),
(1896, "Athens", "Aquatics", "Swimming", "CHASAPIS Spiridon", "GRE", "Men","100M Freestyle For Saliors", "Silver"),
(1896, "Athens", "Aquatics", "Swimming", "CHOROPHAS Elfstathios", "GRE", "Men","1200M Freestele", "Bronze");

SELECT * FROM summer_medals;
/*
1. Выберите имеющиеся виды спорта и пронумеруем их в алфавитном порядке
2. Создайте представление, в которое попадает информация о спортсменах (страна, пол, имя)
3.Создайте представление, в котором будет храниться информация 
о спортсменах по конкретному виду спорта (Aquatics)
*/

SELECT ROW_NUMBER() OVER(ORDER BY sport) AS `num`, sport
FROM (SELECT DISTINCT sport FROM summer_medals) AS test;

CREATE OR REPLACE VIEW sportsman AS SELECT country, gender, athlete 
FROM summer_medals;
SELECT * FROM sportsman;

CREATE OR REPLACE VIEW aqua AS SELECT * 
FROM summer_medals
WHERE sport='Aquatics';
SELECT * FROM aqua;

