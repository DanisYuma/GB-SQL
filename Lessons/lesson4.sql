DROP DATABASE IF EXISTS lesson4;
CREATE DATABASE IF NOT EXISTS lesson4;
USE lesson4;

DROP TABLE IF EXISTS teacher;
CREATE TABLE IF NOT EXISTS teacher
(	
	id INT NOT NULL PRIMARY KEY,
    surname VARCHAR(45),
    salary INT
);

INSERT teacher
VALUES
	(1,"Авдеев", 17000),
    (2,"Гущенко",27000),
    (3,"Пчелкин",32000),
    (4,"Питошин",15000),
    (5,"Вебов",45000),
    (6,"Шарпов",30000),
    (7,"Шарпов",40000),
    (8,"Питошин",30000);
    
SELECT * from teacher; 

DROP TABLE IF EXISTS lesson;
CREATE TABLE IF NOT EXISTS lesson
(	
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    course VARCHAR(45),
    teacher_id INT,
    FOREIGN KEY (teacher_id)  REFERENCES teacher(id)
);
INSERT INTO lesson(course,teacher_id)
VALUES
	("Знакомство с веб-технологиями",1),
    ("Знакомство с веб-технологиями",2),
    ("Знакомство с языками программирования",3),
    ("Базы данных и SQL",4);

-- Получить фамилии преподавателей и их курсы
SELECT t.surname, l.course
FROM teacher AS t
INNER JOIN lesson l -- INNER JOIN  и JOIN одно и то же
ON t.id = l.teacher_id;

SELECT *
FROM teacher t, lesson l
WHERE t.id = l.teacher_id;


-- Получить фамилии преподавателей, которые ничего не ведут
SELECT t.surname, l.course
FROM teacher AS t
LEFT JOIN lesson l
ON t.id = l.teacher_id
WHERE l.teacher_id IS NULL;

-- Получить всех преподавателей из нашего вуща
SELECT t.surname, l.course
FROM teacher AS t
LEFT JOIN lesson l
ON t.id = l.teacher_id;

SELECT *
FROM teacher t
WHERE EXISTS ( SELECT * FROM lesson l
WHERE t.id = l.teacher_id);

SELECT *
FROM teacher t, lesson l
WHERE t.id = l.teacher_id;

SELECT *
FROM teacher t
WHERE NOT EXISTS ( SELECT *
FROM lesson l
WHERE t.id = l.teacher_id);

SELECT t.*, l.*
FROM teacher t
CROSS JOIN lesson l;


SELECT t.*, l.*, (SELECT COUNT(*)
FROM teacher t
CROSS JOIN lesson l) AS Sum
FROM teacher t
CROSS JOIN lesson l;


SELECT t.*, l.*
FROM teacher t
JOIN lesson l
ON t.id = l.teacher_id
WHERE l.course = "Знакомство с веб-технологиями";


SELECT t.*, lesson2.*
FROM teacher t
JOIN (SELECT course, teacher_id
FROM lesson WHERE lesson.course = "Знакомство с веб-технологиями") AS
lesson2
ON t.id = lesson2.teacher_id;


SELECT id
FROM teacher
UNION ALL
SELECT teacher_id
FROM lesson;








