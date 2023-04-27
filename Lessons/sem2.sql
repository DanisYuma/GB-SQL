create schema if not exists sem2;
use sem2;
-- DDL create drop	rename alter truncate

drop table if exists movies;
CREATE TABLE IF NOT EXISTS movies
(
	id INT primary key AUTO_INCREMENT,
    title varchar(45) not null,
    year_movie Year not null,
    count_min int,
    storyline text
);

select * from movies;

rename table movies to cinema;

select * from cinema;

-- DML (data manupalation): select insert update delete

insert into cinema (title, year_movie, count_min, storyline)
values
('A Beautiful Mind', 2001, 135, 'От всемирной известности до греховных глубин — все это познал на своей шкуре Джон Форбс Нэш-младший. Математический гений, он на заре своей карьеры сделал титаническую работу в области теории игр, которая перевернула этот раздел математики и практически принесла ему международную известность. Однако буквально в то же время заносчивый и пользующийся успехом у женщин Нэш получает удар судьбы, который переворачивает уже его собственную жизнь.'),
('Forrest Gump', 1994, 142, 'Сидя на автобусной остановке, Форрест Гамп — не очень умный, но добрый и открытый парень — рассказывает случайным встречным историю своей необыкновенной жизни. С самого малолетства парень страдал от заболевания ног, соседские мальчишки дразнили его, но в один прекрасный день Форрест открыл в себе невероятные способности к бегу. Подруга детства Дженни всегда его поддерживала и защищала, но вскоре дороги их разошлись.');

select * from cinema;

-- DDL ALTER

alter table cinema 
add column category INT,
add price int default 200;

SELECT * from cinema;

update cinema
set category = RAND();

SELECT * from cinema;

SELECT category, title,
case
when category = 1 then 'pay online'
else 'pay by cash'
end as message
from cinema;

-- IF (x, true, false)

select if (450<300, 'yes', 'no') as result;

select 
id as 'movie as number',
title as 'movie title',
count_min as 'lenth',
if (count_min < 60, 'short',
if (count_min >= 60 and count_min <= 120, 'middle',
if (count_min > 120, 'big', 'not')))
as 'movie type' 
from cinema;

SELECT * from cinema;

truncate table cinema;

delete from cinema
where title = 'test';

delete from cinema
where title = 'test';

