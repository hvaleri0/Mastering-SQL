-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`roles` (
  `role_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`role_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`users` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `role_id` INT NOT NULL,
  `username` VARCHAR(50) NOT NULL,
  `email` VARCHAR(255) NULL,
  `password` VARCHAR(50) NOT NULL,
  `create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  INDEX `fk_users_Roles_idx` (`role_id` ASC) VISIBLE,
  CONSTRAINT `fk_users_Roles`
    FOREIGN KEY (`role_id`)
    REFERENCES `mydb`.`roles` (`role_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE);


-- -----------------------------------------------------
-- Table `mydb`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`customers` (
  `customer_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(50) NOT NULL,
  `last_name` VARCHAR(50) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `phone` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`customer_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`movies`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`movies` (
  `movie_id` INT NOT NULL AUTO_INCREMENT,
  `bascode` VARCHAR(50) NOT NULL,
  `daily_rental_rate` DECIMAL(5,2) NOT NULL,
  `number_in_stock` TINYINT NOT NULL,
  PRIMARY KEY (`movie_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`coupons`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`coupons` (
  `coupon_id` INT NOT NULL AUTO_INCREMENT,
  `code` VARCHAR(50) NOT NULL,
  `description` VARCHAR(255) NOT NULL,
  `discount` DECIMAL(5,2) NOT NULL,
  PRIMARY KEY (`coupon_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`rentals`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`rentals` (
  `rental_id` INT NOT NULL AUTO_INCREMENT,
  `customer_id` INT NOT NULL,
  `movie_id` INT NOT NULL,
  `coupon_id` INT NULL,
  `rentDate` DATE NOT NULL,
  `returnDate` DATE NULL,
  PRIMARY KEY (`rental_id`),
  INDEX `fk_rentals_customers1_idx` (`customer_id` ASC) VISIBLE,
  INDEX `fk_rentals_movies1_idx` (`movie_id` ASC) VISIBLE,
  INDEX `fk_rentals_coupons1_idx` (`coupon_id` ASC) VISIBLE,
  CONSTRAINT `fk_rentals_customers1`
    FOREIGN KEY (`customer_id`)
    REFERENCES `mydb`.`customers` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_rentals_movies1`
    FOREIGN KEY (`movie_id`)
    REFERENCES `mydb`.`movies` (`movie_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_rentals_coupons1`
    FOREIGN KEY (`coupon_id`)
    REFERENCES `mydb`.`coupons` (`coupon_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
