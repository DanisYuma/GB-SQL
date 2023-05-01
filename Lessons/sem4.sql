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

SELECT teacher.surname, lesson.course
FROM teacher
JOIN lesson
ON teacher.id = lesson.teacher_id;

SELECT t.surname, l.course
FROM teacher AS t
JOIN lesson AS l
ON t.id = l.teacher_id;

SELECT *
FROM teacher t, lesson l
WHERE t.id = l.teacher_id;

SELECT t.surname,  l.course
FROM teacher AS t
LEFT JOIN lesson l
ON t.id = l.teacher_id
WHERE l.teacher_id IS NULL;

SELECT t.surname,  l.course
FROM teacher AS t
LEFT JOIN lesson l
ON t.id = l.teacher_id;

SELECT *
FROM teacher t
WHERE EXISTS (SELECT * FROM lesson l
WHERE t.id = l.teacher_id);

SELECT *
FROM teacher t
WHERE NOT EXISTS ( SELECT * -- Try EXISTS instead NOT EXISTS
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

SELECT t.*, lesson2.*
FROM teacher t
JOIN (SELECT course, teacher_id
FROM lesson WHERE lesson.course = 'Знакомство с веб-технологиями') AS
lesson2
ON t.id = lesson2.teacher_id;

SELECT id
FROM teacher 
UNION ALL
SELECT teacher_id
FROM lesson;

DROP TABLE IF EXISTS users;
CREATE TABLE IF NOT EXISTS users
(
id int auto_increment primary key,
login varchar(255) null,
pass varchar(255) null,
male tinyint null
);

DROP TABLE IF EXISTS clients;
CREATE TABLE IF NOT EXISTS clients
(
id int auto_increment primary key,
login varchar(255) null,
pass varchar(255) null,
male tinyint null
);

INSERT INTO users (login, pass, male)
VALUES
('alex', '$2y$10$6SzbBCMENklStIgTqBKIluijJUnbeZ5WqIu4RJgkksnFZon5kH14y', 1),
('Mikle', '$ws$10$6SzbBCMENklStIgTqBKIluijJUnbeZ5WqIu4RJgkksnFZon5kH14y', 1),
('Olia', '$2y$10$88zbBCKLJklStIgTqBKIluijJUnbeZ5WqJI4RJgkksnFZon5kH14y', 2),
('Tom', '$2y$20$6SzbBCNRNklStIgTqBKIluijJUnbeZ5WqIu4RJgkksnFZon5kH20y', 1),
('Margaret', '$2y$20$6SzbBCNRNklStIgTqBKIluijJUnbeZ4wqIu4RJgkksnFZon5kH20y', 2),
('alex', '$2y$10$6SzbBCMENklStIgTqBKIluijJUnbeZ5WqIu4RJgkksnFZon5kH14y', 1);

INSERT INTO clients (login, pass, male) VALUES ('alexander', '$2y$10$6SzbBCMENklStIgTqBKIluijJUnbeZ5WqIu4RJgkksnFZon5kH14y', 1),
 ('Mikle', '$ws$10$6SzbBCMENklStIgTqBKIluijJUnbeZ5WqIu4RJgkksnFZon5kH14y', 1),
('Olia', '$2y$10$88zbBCKLJklStIgTqBKIluijJUnbeZ5WqJI4RJgkksnFZon5kH14y', 2),
('Dmitry', '$2y$20$6SzbBCNRNklStIgTqBKIluijJUnbeZ5WqIu4RJgkksnFZon5kH20y', 1),
 ('Margaret', '$2y$20$6SzbBCNRNklStIgTqBKIluijJUnbeZ4wqIu4RJgkksnFZon5kH20y', 2),
('Leonid', '$2y$10$6SzbBCMENklStIgTqBKIluijJUnbeZ5WqIu4RJgkksnFZon5kH14y', 1),
('Mikle', '$ws$10$6SzbBCMENklStIgTqBKIluijJUnbeZ5WqIu4RJgkksnFZon5kH14y', 1),
('Olga', '$2y$10$88zbBCKLJklStIgTqBKIluijJUnbeZ5WqJI4RJgkksnFZon5kH14y', 2),
 ('Tom', '$2y$20$6SzbBCNRNklStIgTqBKIluijJUnbeZ5WqIu4RJgkksnFZon5kH20y', 1),
('Masha', '$2y$20$6SzbBCNRNklStIgTqBKIluijJUnbeZ4wqIu4RJgkksnFZon5kH20y', 2),
 ('alex', '$2y$10$6SzbBCMENklStIgTqBKIluijJUnbeZ5WqIu4RJgkksnFZon5kH14y', 1);
 
SELECT login
FROM users 
UNION 
SELECT login
FROM clients;

SELECT login
FROM users 
UNION ALL
SELECT login
FROM clients;

SELECT *
FROM users
-- LEFT JOIN clients
UNION ALL
SELECT *
FROM clients;

SELECT *
FROM users
CROSS JOIN clients;

SELECT users.login, users.pass, clients.login, clients.pass 
FROM users
LEFT JOIN clients ON users.login = clients.login
UNION ALL 
SELECT users.login, users.pass, clients.login, clients.pass 
FROM users
RIGHT JOIN clients ON clients.login = users.login;

SELECT u.login, u.pass FROM users u
LEFT JOIN clients c ON u.login=c.login
UNION ALL
SELECT c.login, c.pass FROM users u
RIGHT JOIN clients c ON u.login=c.login;

SELECT users.login, users.pass, clients.login, clients.pass 
FROM users
JOIN clients ON users.login = clients.login;