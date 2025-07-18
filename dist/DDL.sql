-- MySQL Script generated by MySQL Workbench
-- Tue May 13 08:57:27 2025
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema hopi_hari_db
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `hopi_hari_db` ;

-- -----------------------------------------------------
-- Schema hopi_hari_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `hopi_hari_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ;
USE `hopi_hari_db` ;

-- -----------------------------------------------------
-- Table `hopi_hari_db`.`rides`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hopi_hari_db`.`rides` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `tempo_espera` INT NOT NULL,
  `status` VARCHAR(50) NOT NULL,
  `area` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `hopi_hari_db`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hopi_hari_db`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(50) NOT NULL,
  `last_name` VARCHAR(50) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `birth_date` DATE NOT NULL,
  `phone` VARCHAR(20) NULL DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email` (`email` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `hopi_hari_db`.`notifications`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hopi_hari_db`.`notifications` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(45) NOT NULL,
  `id_atracoes` INT NOT NULL,
  `id_users` INT NOT NULL,
  `notificationscol` TINYINT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_notifications_atracoes1_idx` (`id_atracoes` ASC) VISIBLE,
  INDEX `fk_notifications_users1_idx` (`id_users` ASC) VISIBLE,
  CONSTRAINT `fk_notifications_atracoes1`
    FOREIGN KEY (`id_atracoes`)
    REFERENCES `hopi_hari_db`.`rides` (`id`),
  CONSTRAINT `fk_notifications_users1`
    FOREIGN KEY (`id_users`)
    REFERENCES `hopi_hari_db`.`users` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `hopi_hari_db`.`line`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hopi_hari_db`.`line` (
  `id_users` INT NOT NULL,
  `id_atracoes` INT NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_users`, `id_atracoes`),
  INDEX `fk_users_has_atracoes_atracoes1_idx` (`id_atracoes` ASC) VISIBLE,
  INDEX `fk_users_has_atracoes_users_idx` (`id_users` ASC) VISIBLE,
  CONSTRAINT `fk_users_has_atracoes_atracoes1`
    FOREIGN KEY (`id_atracoes`)
    REFERENCES `hopi_hari_db`.`rides` (`id`),
  CONSTRAINT `fk_users_has_atracoes_users`
    FOREIGN KEY (`id_users`)
    REFERENCES `hopi_hari_db`.`users` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
