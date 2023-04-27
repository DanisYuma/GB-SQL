-- 1. Создайте таблицу с мобильными телефонами, используя графический интерфейс. Заполните БД данными

CREATE SCHEMA `homework` DEFAULT CHARACTER SET utf8mb3 ;

CREATE TABLE `homeworks`.`phone` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Manufacturer` VARCHAR(45) NOT NULL,
  `Model` VARCHAR(45) NOT NULL,
  `Price` INT NOT NULL,
  `Amount` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Id`));

INSERT INTO `homeworks`.`phone` (`Manufacturer`, `Model`, `Price`, `Amount`) VALUES ('Apple', 'Iphone 8', '40000', '3');
INSERT INTO `homeworks`.`phone` (`Manufacturer`, `Model`, `Price`, `Amount`) VALUES ('Apple', 'Ipone X', '70000', '1');
INSERT INTO `homeworks`.`phone` (`Manufacturer`, `Model`, `Price`, `Amount`) VALUES ('Samsung', 'S20', '50000', '4');
INSERT INTO `homeworks`.`phone` (`Manufacturer`, `Model`, `Price`, `Amount`) VALUES ('Samsung', 'A52', '20000', '1');
INSERT INTO `homeworks`.`phone` (`Manufacturer`, `Model`, `Price`, `Amount`) VALUES ('Nokia', '3310', '3000', '0');

-- 2. Выведите название, производителя и цену для товаров, количество которых превышает 2

SELECT Manufacturer, Model, Price
FROM homeworks.phone
WHERE amount > 2;

-- 3. Выведите весь ассортимент товаров марки “Samsung”

SELECT *
FROM homeworks.phone
WHERE Manufacturer = 'Samsung';
