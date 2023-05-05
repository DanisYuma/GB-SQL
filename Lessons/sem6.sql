-- SET
SET @test := 5;
SELECT @test;

-- SELECT
SELECT @test_var := 50;

USE sem_5;

delimiter // 
CREATE PROCEDURE hello()
	BEGIN
		CASE
			WHEN curdate() BETWEEN '06:00:00' AND '11:59:59' THEN
			SELECT 'Good morning';
			WHEN curdate() BETWEEN '12:00:00' AND '17:59:59' THEN
			SELECT 'Good afternoon';
			WHEN curdate() BETWEEN '18:00:00' AND '23:59:59' THEN
			SELECT 'Good evining';
			ELSE
			SELECT 'Good night';
		END CASE;
	END //
delimiter ;

CALL hello();

delimiter //
DROP PROCEDURE digit;
CREATE PROCEDURE digit(Num INT)
	BEGIN
		CASE
			WHEN Num BETWEEN 0 AND 9 THEN
            SELECT '1 digit';
            WHEN Num BETWEEN 10 AND 99 THEN
            SELECT '2 digit';
            WHEN Num BETWEEN 100 AND 999 THEN
            SELECT '3 digit';
		END CASE;
	END //
delimiter ;

CALL digit(74);

DROP FUNCTION fib;
delimiter //
CREATE FUNCTION fib(Num INT)
RETURNS VARCHAR(45)
DETERMINISTIC
	BEGIN 
		DECLARE fib1 INT DEFAULT 0;
        DECLARE fib2 INT DEFAULT 1;
        DECLARE fib3 INT DEFAULT 0;
        DECLARE result VARCHAR(45) DEFAULT '0 1'; -- first fibonacchi
        IF num = 1 THEN
        RETURN fib1;
        ELSEIF num = 2 THEN
        RETURN CONCAT(fib1,' ',fib2);
        ELSE
        WHILE num > 2 DO
        SET fib3 = fib1 + fib2;
        SET fib1 = fib2;
        SET fib2 = fib3;
        SET num = num - 1;
        SET result = concat(result,' ', fib3);
        END WHILE;
        RETURN result;
        END IF;
	END //
delimiter ;
        
SELECT fib(12);

DROP FUNCTION sum3;
delimiter //
CREATE FUNCTION sum3(a INT, b INT, c INT)
RETURNS INT
DETERMINISTIC
	BEGIN 
		DECLARE result INT;
        SET result = a + b + c;
		RETURN result;
	END //
delimiter ;

SELECT sum3(12, 12, 12);