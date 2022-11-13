-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema busybee-db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema busybee-db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `busybee-db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `busybee-db` ;

-- -----------------------------------------------------
-- Table `busybee-db`.`coffees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `busybee-db`.`coffees` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `coffeeName` TINYTEXT NULL DEFAULT NULL,
  `roast` TINYTEXT NULL DEFAULT NULL,
  `origin` TINYTEXT NULL DEFAULT NULL,
  `type` TINYTEXT NULL DEFAULT NULL,
  `costLb` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- -----------------------------------------------------
-- Fill Table `busybee-db`.`coffees`
-- -----------------------------------------------------
INSERT INTO `busybee-db`.`coffees` (`id`, `coffeeName`, `roast`, `origin`, `type`, `costLb`) VALUES ('1', 'House Blend', 'Medium', 'Various', 'Blend', '13');
INSERT INTO `busybee-db`.`coffees` (`id`, `coffeeName`, `roast`, `origin`, `type`, `costLb`) VALUES ('2', 'Smoky Sumatran', 'Dark', 'Sumatra', 'Single Origin', '14');
INSERT INTO `busybee-db`.`coffees` (`id`, `coffeeName`, `roast`, `origin`, `type`, `costLb`) VALUES ('3', 'Hawaiian Honey', 'Light', 'Kona', 'Single Origin', '16');

-- -----------------------------------------------------
-- Table `busybee-db`.`drinks`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `busybee-db`.`drinks` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `drinkName` TINYTEXT NULL DEFAULT NULL,
  `whereAvailable` INT NULL DEFAULT NULL,
  `cost` INT NULL DEFAULT NULL,
  `coffees_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_drinks_coffees1_idx` (`coffees_id` ASC) VISIBLE,
  CONSTRAINT `fk_drinks_coffees1`
    FOREIGN KEY (`coffees_id`)
    REFERENCES `busybee-db`.`coffees` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- -----------------------------------------------------
-- Fill Table `busybee-db`.`drinks`
-- -----------------------------------------------------
INSERT INTO `busybee-db`.`drinks` (`id`, `drinkName`, `whereAvailable`, `cost`, `coffees_id`) VALUES ('1', 'Caramel Macchiato', '2', '6', '1');
INSERT INTO `busybee-db`.`drinks` (`id`, `drinkName`, `whereAvailable`, `cost`, `coffees_id`) VALUES ('2', 'Americano', '1', '6', '2');
INSERT INTO `busybee-db`.`drinks` (`id`, `drinkName`, `whereAvailable`, `cost`, `coffees_id`) VALUES ('3', 'Southern Buzz', '1', '2', '3');

-- -----------------------------------------------------
-- Table `busybee-db`.`locations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `busybee-db`.`locations` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `locationName` TINYTEXT NULL DEFAULT NULL,
  `address` TINYTEXT NULL DEFAULT NULL,
  `city` TINYTEXT NULL DEFAULT NULL,
  `state` CHAR(2) NULL DEFAULT NULL,
  `zip` VARCHAR(10) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- -----------------------------------------------------
-- Fill Table `busybee-db`.`locations`
-- -----------------------------------------------------
INSERT INTO `busybee-db`.`locations` (`id`, `locationName`, `address`, `city`, `state`, `zip`) VALUES ('1', 'bbEast', '123 4th Street', 'London', 'KY', '40741');
INSERT INTO `busybee-db`.`locations` (`id`, `locationName`, `address`, `city`, `state`, `zip`) VALUES ('2', 'bbNorth', '456 7th Street', 'Billings', 'MT', '59101');
INSERT INTO `busybee-db`.`locations` (`id`, `locationName`, `address`, `city`, `state`, `zip`) VALUES ('3', 'bbWest', '890 1st Street', 'Los Angeles', 'CA', '90201');
INSERT INTO `busybee-db`.`locations` (`id`, `locationName`, `address`, `city`, `state`, `zip`) VALUES ('4', 'bbSouth', '234 5th Street', 'Abilene', 'TX', '79601');

-- -----------------------------------------------------
-- Table `busybee-db`.`locations_has_drinks`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `busybee-db`.`locations_has_drinks` (
  `locations_id` INT NOT NULL AUTO_INCREMENT,
  `drinks_id` INT NOT NULL,
  PRIMARY KEY (`locations_id`, `drinks_id`),
  UNIQUE INDEX `locations_id_UNIQUE` (`locations_id` ASC) VISIBLE,
  UNIQUE INDEX `drinks_id_UNIQUE` (`drinks_id` ASC) VISIBLE,
  INDEX `fk_locations_has_drinks_drinks1_idx` (`drinks_id` ASC) VISIBLE,
  CONSTRAINT `fk_locations_has_drinks_drinks1`
    FOREIGN KEY (`drinks_id`)
    REFERENCES `busybee-db`.`drinks` (`id`),
  CONSTRAINT `fk_locations_has_drinks_locations`
    FOREIGN KEY (`locations_id`)
    REFERENCES `busybee-db`.`locations` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- -----------------------------------------------------
-- Fill Table `busybee-db`.`locations_has_drinks`
-- -----------------------------------------------------
INSERT INTO `busybee-db`.`locations_has_drinks` (`locations_id`, `drinks_id`) VALUES ('1', '1');
INSERT INTO `busybee-db`.`locations_has_drinks` (`locations_id`, `drinks_id`) VALUES ('2', '2');
INSERT INTO `busybee-db`.`locations_has_drinks` (`locations_id`, `drinks_id`) VALUES ('3', '3');


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
