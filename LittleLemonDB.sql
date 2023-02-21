-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema LittleLemonDB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema LittleLemonDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `LittleLemonDB` DEFAULT CHARACTER SET utf8 ;
USE `LittleLemonDB` ;

-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Deliveries`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LittleLemonDB`.`Deliveries` ;

CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Deliveries` (
  `deliveryID` INT NOT NULL AUTO_INCREMENT,
  `status` VARCHAR(45) NOT NULL,
  `date` DATE NOT NULL,
  PRIMARY KEY (`deliveryID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Customers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LittleLemonDB`.`Customers` ;

CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Customers` (
  `customerID` INT NOT NULL AUTO_INCREMENT,
  `firstName` VARCHAR(45) NOT NULL,
  `lastName` VARCHAR(45) NOT NULL,
  `phoneNo` INT NULL,
  `email` VARCHAR(100) NULL,
  PRIMARY KEY (`customerID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`MenuItems`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LittleLemonDB`.`MenuItems` ;

CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`MenuItems` (
  `menuItemID` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(255) NULL,
  `type` VARCHAR(45) NOT NULL COMMENT 'starter/main course/dessert/drink',
  `price` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`menuItemID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Menu`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LittleLemonDB`.`Menu` ;

CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Menu` (
  `menuID` INT NOT NULL,
  `menuItemID` INT NOT NULL,
  `cuisine` VARCHAR(45) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`menuID`, `menuItemID`),
  INDEX `menuItemID_idx` (`menuItemID` ASC) VISIBLE,
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE,
  CONSTRAINT `menuItemID`
    FOREIGN KEY (`menuItemID`)
    REFERENCES `LittleLemonDB`.`MenuItems` (`menuItemID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Employees`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LittleLemonDB`.`Employees` ;

CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Employees` (
  `employeeID` INT NOT NULL AUTO_INCREMENT,
  `firstName` VARCHAR(45) NOT NULL,
  `lastName` VARCHAR(45) NOT NULL,
  `role` VARCHAR(45) NOT NULL,
  `salary` DECIMAL(10,2) NOT NULL,
  `phoneNo` INT NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`employeeID`),
  UNIQUE INDEX `phoneNo_UNIQUE` (`phoneNo` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Orders`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LittleLemonDB`.`Orders` ;

CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Orders` (
  `orderID` INT NOT NULL AUTO_INCREMENT,
  `date` DATE NOT NULL,
  `quantity` DECIMAL(10,2) NOT NULL,
  `total` DECIMAL(10,2) NOT NULL,
  `tableNo` TINYINT NOT NULL,
  `employeeID` INT NOT NULL,
  `deliveryID` INT NOT NULL,
  `customerID` INT NOT NULL,
  `menuID` INT NOT NULL,
  PRIMARY KEY (`orderID`),
  INDEX `deliveryID_idx` (`deliveryID` ASC) VISIBLE,
  INDEX `customerID_idx` (`customerID` ASC) VISIBLE,
  INDEX `menuItemID_idx` (`menuID` ASC) VISIBLE,
  INDEX `employeeID_idx` (`employeeID` ASC) VISIBLE,
  CONSTRAINT `deliveryID`
    FOREIGN KEY (`deliveryID`)
    REFERENCES `LittleLemonDB`.`Deliveries` (`deliveryID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `customerFK1`
    FOREIGN KEY (`customerID`)
    REFERENCES `LittleLemonDB`.`Customers` (`customerID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `menuID`
    FOREIGN KEY (`menuID`)
    REFERENCES `LittleLemonDB`.`Menu` (`menuID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `employeeFK1`
    FOREIGN KEY (`employeeID`)
    REFERENCES `LittleLemonDB`.`Employees` (`employeeID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Bookings`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LittleLemonDB`.`Bookings` ;

CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Bookings` (
  `bookingID` INT NOT NULL AUTO_INCREMENT,
  `date` DATE NOT NULL,
  `time` TIME NOT NULL,
  `tableNo` INT NOT NULL,
  `employeeID` INT NOT NULL,
  `customerID` INT NOT NULL,
  PRIMARY KEY (`bookingID`),
  INDEX `customerID_idx` (`customerID` ASC) VISIBLE,
  INDEX `employeeID_idx` (`employeeID` ASC) VISIBLE,
  CONSTRAINT `customerFK2`
    FOREIGN KEY (`customerID`)
    REFERENCES `LittleLemonDB`.`Customers` (`customerID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `employeeFK2`
    FOREIGN KEY (`employeeID`)
    REFERENCES `LittleLemonDB`.`Employees` (`employeeID`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
