USE homeworks;

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

select * from staff;
select * from activity_staff;

-- 1. Выведите id сотрудников, которые напечатали более 500 страниц за всех дни

SELECT staff_id, SUM(count_pages)
FROM activity_staff
GROUP BY staff_id
HAVING SUM(count_pages) > 500;

-- 2. Выведите дни, когда работало более 3 сотрудников Также укажите кол-во сотрудников, которые работали в выбранные дни.

SELECT date_activity AS da, COUNT(date_activity)
FROM activity_staff AS a
GROUP BY da
HAVING COUNT(da) > 3;

-- 3. Выведите среднюю заработную плату по должностям, которая составляет более 30000

SELECT post, AVG(salary) AS 'average'
FROM staff
GROUP by post
HAVING average > 30000;

-- 4. Отсортируйте данные по полю заработная плата (salary) в порядке: убывания; возрастания

SELECT *
FROM staff
ORDER BY salary;

SELECT *
FROM staff
ORDER BY salary DESC;

-- 5.Выведите 5 максимальных заработных плат (salary)

SELECT *
FROM staff
ORDER BY salary DESC
LIMIT 5;

-- 6.Посчитайте суммарную зарплату (salary) по каждой специальности (роst)

SELECT post, SUM(salary)
FROM staff
GROUP BY post;

-- 7.Найдите кол-во сотрудников с специальностью (post) «Рабочий» в возрасте от 24 до 49 лет включительно.

SELECT *
FROM staff
WHERE post = 'Рабочий' AND age between 24 AND 49;

-- 8. Найдите количество специальностей

SELECT COUNT(DISTINCT post) AS 'posts'
FROM staff;

-- 9. Выведите специальности, у которых средний возраст сотрудников меньше 30 лет

SELECT post, AVG(age)
FROM staff
GROUP BY post;

SELECT post, AVG(age)
FROM staff
GROUP BY post
HAVING AVG(age) < 30;