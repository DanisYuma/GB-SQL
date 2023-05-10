USE homeworks;

/*
Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов.
Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '
*/

DROP PROCEDURE time_to;
delimiter //
CREATE PROCEDURE time_to(seconds INT)
BEGIN

DECLARE days INT default 0;
DECLARE hours INT default 0;
DECLARE minutes INT default 0;
DECLARE secs INT default 0;
    
    SET days=floor(seconds/86400);
    SET hours=floor((seconds-days*86400)/3600);
    SET minutes=floor((seconds-(hours*3600+days*86400))  / 60);
    SET secs=seconds-(days*86400+hours*3600+minutes*60);
    SELECT days, hours, minutes, secs;

END //
DELIMITER ;

CALL time_to(1234556);

/*
Выведите только четные числа от 1 до 10.
Пример: 2,4,6,8,10
*/

DROP FUNCTION eventen;
delimiter //
CREATE FUNCTION eventen()
RETURNS VARCHAR(15)
DETERMINISTIC
	BEGIN 
		DECLARE num INT DEFAULT 2;
        DECLARE result VARCHAR(15);
        WHILE num < 11 DO
        SET num = num + 2;
        SET result = concat(result,',',num);
        END WHILE;
		RETURN result;
	END //
delimiter ;

SELECT eventen();


