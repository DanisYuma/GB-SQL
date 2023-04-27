DROP DATABASE IF EXISTS lesson3;
CREATE DATABASE IF NOT EXISTS lesson3;

USE lesson3;
# 'sql', "sql"
# `ё на англ.раскладке` - выделяются названия таблиц, столбцов и БД
DROP TABLE IF EXISTS staff;
CREATE TABLE IF NOT EXISTS `staff`
(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`firstname` VARCHAR(45),
`lastname` VARCHAR(45),
`post` VARCHAR(45),
`seniority` INT,
`salary` INT,
`age` INT
);

ALTER TABLE staff
MODIFY post VARCHAR(30);

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


SELECT * 
FROM staff;

SELECT AVG(salary)
FROM staff;

SELECT *
FROM staff
WHERE salary > (SELECT AVG(salary) FROM staff);

SELECT salary, id
FROM staff
ORDER BY salary DESC; -- ASC - от меньшего к большему DESC - от большего к меньшему

SELECT *
FROM staff
WHERE seniority > 5 AND post = 'Рабочий'
ORDER BY salary;

SELECT id, firstname, age
FROM staff
LIMIT 5;

SELECT id, firstname, age
FROM staff
LIMIT 2,3; -- первая цифра отвечает за кол-во пропущенных строк, вторая цифра за кол-во выводимых строк

SELECT  COUNT(DISTINCT lastname) AS "ЧИСЛО"
FROM staff;

SELECT COUNT(lastname) - COUNT(DISTINCT lastname) "ЧИСЛО"
FROM staff;

SELECT *
FROM staff;

SELECT COUNT(salary), lastname, post,
MAX(salary) AS "Макс зарплата",
MIN(salary) AS "Минзарплата",
MAX(salary) - MIN(salary) AS "Разница"
FROM staff
GROUP BY post;

/*
Сгруппируйте данные о сотрудниках по возрасту: 
1 группа – младше 20 лет
2 группа – от 20 до 40 лет
3 группа – старше  40 лет 
Для каждой группы  найдите суммарную зарплату 
*/

  SELECT SUM(salary), name_age
  FROM
  (SELECT salary,
  CASE
  WHEN age < 20 THEN "Младше 20 лет"
  WHEN age between 20 AND 40 THEN "от 20 до 40"
  ELSE "больше 40" 
  END AS name_age
  FROM staff) AS lists
  GROUP BY name_age;


SELECT salary,
  CASE
  WHEN age < 20 THEN "Младше 20 лет"
  WHEN age between 20 AND 40 THEN "от 20 до 40"
  ELSE "больше 40" 
  END AS name_age
  FROM staff;
  
  SELECT COUNT(salary), COUNT(firstname), GROUP_CONCAT(firstname)
  FROM staff
  GROUP BY salary
  HAVING salary > 50000;
  
  
  SELECT * 
  FROM staff
  HAVING salary > 50000;
  
  SELECT post, AVG(salary)
  FROM staff
  WHERE post != "Начальник"
  GROUP BY post
  HAVING AVG(salary) > 50000;
  
  
SELECT * 
FROM staff
 WHERE salary > 50000;