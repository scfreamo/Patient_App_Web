SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Patient`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Patient` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`Patient` (
  `PID` INT NOT NULL ,
  `Phone Number` INT NULL ,
  `Last Name` VARCHAR(50) NULL ,
  `First Name` VARCHAR(50) NULL ,
  `Email` VARCHAR(50) NULL ,
  `Address` VARCHAR(1000) NULL ,
  PRIMARY KEY (`PID`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Doctor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Doctor` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`Doctor` (
  `DID` INT NOT NULL ,
  `Phone Number` INT NULL ,
  `Address` VARCHAR(1000) NULL ,
  `Email` VARCHAR(50) NULL ,
  `First Name` VARCHAR(50) NULL ,
  `Last Name` VARCHAR(50) NULL ,
  PRIMARY KEY (`DID`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Question`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Question` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`Question` (
  `Question` VARCHAR(5000) NULL ,
  `QID` INT NOT NULL ,
  PRIMARY KEY (`QID`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`User`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`User` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`User` (
  `UID` INT NOT NULL ,
  `Password` VARCHAR(1000) NULL ,
  PRIMARY KEY (`UID`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Security Class`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Security Class` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`Security Class` (
  `SCID` INT NOT NULL ,
  `Code` VARCHAR(10) NULL ,
  PRIMARY KEY (`SCID`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Log`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Log` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`Log` (
  `LID` INT NOT NULL ,
  `DID` INT NULL ,
  `PID` INT NULL ,
  `CID` INT NULL ,
  `QID` INT NULL ,
  `Time` DATETIME NULL ,
  `Rating` INT NULL ,
  `Details` VARCHAR(5000) NULL ,
  PRIMARY KEY (`LID`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Condition`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Condition` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`Condition` (
  `CID` INT NOT NULL ,
  `Name` VARCHAR(50) NULL ,
  `Description` VARCHAR(5000) NULL ,
  PRIMARY KEY (`CID`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Patient Doctor Rel`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Patient Doctor Rel` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`Patient Doctor Rel` (
  `PDID` INT NOT NULL ,
  `PID` INT NULL ,
  `DID` INT NULL ,
  PRIMARY KEY (`PDID`) ,
  INDEX `PID_idx` (`PID` ASC) ,
  INDEX `DID_idx` (`DID` ASC) ,
  CONSTRAINT `PID3`
    FOREIGN KEY (`PID` )
    REFERENCES `mydb`.`Patient` (`PID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `DID3`
    FOREIGN KEY (`DID` )
    REFERENCES `mydb`.`Doctor` (`DID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Condition Question Rel`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Condition Question Rel` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`Condition Question Rel` (
  `CQID` INT NOT NULL ,
  `CID` INT NULL ,
  `QID` INT NULL ,
  PRIMARY KEY (`CQID`) ,
  INDEX `CID_idx` (`CID` ASC) ,
  INDEX `QID_idx` (`QID` ASC) ,
  CONSTRAINT `CID`
    FOREIGN KEY (`CID` )
    REFERENCES `mydb`.`Condition` (`CID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `QID`
    FOREIGN KEY (`QID` )
    REFERENCES `mydb`.`Question` (`QID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Patient Condition Rel`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Patient Condition Rel` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`Patient Condition Rel` (
  `PCID` INT NOT NULL ,
  `PID` INT NULL ,
  `CID` INT NULL ,
  PRIMARY KEY (`PCID`) ,
  INDEX `PID_idx` (`PID` ASC) ,
  INDEX `CID_idx` (`CID` ASC) ,
  CONSTRAINT `PID2`
    FOREIGN KEY (`PID` )
    REFERENCES `mydb`.`Patient` (`PID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `CID2`
    FOREIGN KEY (`CID` )
    REFERENCES `mydb`.`Condition` (`CID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Patient User Rel`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Patient User Rel` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`Patient User Rel` (
  `PUID` INT NOT NULL ,
  `PID` INT NULL ,
  `UID` INT NULL ,
  PRIMARY KEY (`PUID`) ,
  INDEX `PID_idx` (`PID` ASC) ,
  INDEX `UID_idx` (`UID` ASC) ,
  CONSTRAINT `PID4`
    FOREIGN KEY (`PID` )
    REFERENCES `mydb`.`Patient` (`PID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `UID4`
    FOREIGN KEY (`UID` )
    REFERENCES `mydb`.`User` (`UID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Doctor User Rel`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Doctor User Rel` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`Doctor User Rel` (
  `DUID` INT NOT NULL ,
  `DID` INT NULL ,
  `UID` INT NULL ,
  PRIMARY KEY (`DUID`) ,
  INDEX `DID_idx` (`DID` ASC) ,
  INDEX `UID_idx` (`UID` ASC) ,
  CONSTRAINT `DID4`
    FOREIGN KEY (`DID` )
    REFERENCES `mydb`.`Doctor` (`DID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `UID2`
    FOREIGN KEY (`UID` )
    REFERENCES `mydb`.`User` (`UID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`User Security Class Rel`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`User Security Class Rel` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`User Security Class Rel` (
  `USCID` INT NOT NULL ,
  `UID` INT NULL ,
  `SCID` INT NULL ,
  PRIMARY KEY (`USCID`) ,
  INDEX `UID_idx` (`UID` ASC) ,
  INDEX `SCID_idx` (`SCID` ASC) ,
  CONSTRAINT `UID5`
    FOREIGN KEY (`UID` )
    REFERENCES `mydb`.`User` (`UID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `SCID2`
    FOREIGN KEY (`SCID` )
    REFERENCES `mydb`.`Security Class` (`SCID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `mydb` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
