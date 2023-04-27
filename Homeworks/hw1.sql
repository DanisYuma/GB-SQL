use homeworks;

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

SELECT * FROM homeworks.phone;

SELECT Manufacturer, Model, Price
FROM homeworks.phone
WHERE amount > 2;

SELECT *
FROM homeworks.phone
WHERE Manufacturer = 'Samsung';

select * FROM homeworks.phone
where model = 's20';