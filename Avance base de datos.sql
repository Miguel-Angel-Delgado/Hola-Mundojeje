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
-- Table `mydb`.`Clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Clientes` (
  `id-user` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(80) NOT NULL,
  `Direccion` VARCHAR(45) NOT NULL,
  `telefono` INT NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `talla` VARCHAR(45) NULL,
  PRIMARY KEY (`id-user`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`productos` (
  `idproductos` INT NOT NULL,
  `Articulo` VARCHAR(45) NOT NULL,
  `Cantidad` INT NOT NULL,
  `Costo` FLOAT NOT NULL,
  `Talla` VARCHAR(45) NOT NULL,
  `Seccion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idproductos`),
  INDEX `talla_idx` (`Talla` ASC) VISIBLE,
  CONSTRAINT `talla`
    FOREIGN KEY (`Talla`)
    REFERENCES `mydb`.`Clientes` (`talla`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`pedidos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`pedidos` (
  `idpedidos` INT NOT NULL AUTO_INCREMENT,
  `Costo_producto` FLOAT NOT NULL,
  `costo de envio` FLOAT NOT NULL,
  `fecha` DATE NOT NULL,
  `titular` VARCHAR(80) NOT NULL,
  `direccion de envio` VARCHAR(45) NOT NULL,
  `costo total` FLOAT NOT NULL,
  `articulos` INT NOT NULL,
  `telefono_cliente` INT NOT NULL,
  `correo_cliente` VARCHAR(45) NOT NULL,
  `id_cliente` INT NOT NULL,
  PRIMARY KEY (`idpedidos`),
  INDEX `cliente_idx` (`id_cliente` ASC, `telefono_cliente` ASC, `titular` ASC, `correo_cliente` ASC, `articulos` ASC, `direccion de envio` ASC) VISIBLE,
  INDEX `costos_idx` (`articulos` ASC, `Costo_producto` ASC) VISIBLE,
  CONSTRAINT `cliente`
    FOREIGN KEY (`id_cliente` , `telefono_cliente` , `titular` , `correo_cliente` , `articulos` , `direccion de envio`)
    REFERENCES `mydb`.`Clientes` (`id-user` , `telefono` , `Nombre` , `email` , `id-user` , `Direccion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `costos`
    FOREIGN KEY (`articulos` , `Costo_producto`)
    REFERENCES `mydb`.`productos` (`idproductos` , `Costo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
