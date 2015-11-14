SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

DROP SCHEMA IF EXISTS `sgstt` ;
CREATE SCHEMA IF NOT EXISTS `sgstt` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `sgstt` ;

-- -----------------------------------------------------
-- Table `sgstt`.`tipo_servicio`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sgstt`.`tipo_servicio` ;

CREATE  TABLE IF NOT EXISTS `sgstt`.`tipo_servicio` (
  `idtipo_servicio` INT NOT NULL AUTO_INCREMENT ,
  `descripcion` VARCHAR(45) NULL ,
  `ESTADO` TINYINT(1) NOT NULL DEFAULT 1 ,
  PRIMARY KEY (`idtipo_servicio`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sgstt`.`trasladista`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sgstt`.`trasladista` ;

CREATE  TABLE IF NOT EXISTS `sgstt`.`trasladista` (
  `idtrasladista` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(60) NULL DEFAULT NULL ,
  `apellido` VARCHAR(80) NULL DEFAULT NULL ,
  `dni` VARCHAR(8) NULL DEFAULT NULL ,
  `direccion` VARCHAR(200) NULL ,
  `correo` VARCHAR(100) NULL ,
  `telefono` VARCHAR(9) NULL ,
  `celular` VARCHAR(11) NULL ,
  `estado` TINYINT(4) NULL DEFAULT '1' ,
  PRIMARY KEY (`idtrasladista`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sgstt`.`Sede`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sgstt`.`Sede` ;

CREATE  TABLE IF NOT EXISTS `sgstt`.`Sede` (
  `idSede` INT NOT NULL AUTO_INCREMENT ,
  `descripcion` VARCHAR(200) NOT NULL ,
  PRIMARY KEY (`idSede`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sgstt`.`chofer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sgstt`.`chofer` ;

CREATE  TABLE IF NOT EXISTS `sgstt`.`chofer` (
  `idchofer` INT NOT NULL AUTO_INCREMENT ,
  `idSede` INT NOT NULL ,
  `nombre` VARCHAR(45) NULL ,
  `apellido` VARCHAR(45) NULL ,
  `dni` VARCHAR(45) NULL ,
  `categoria` VARCHAR(45) NULL ,
  `ESTADO` TINYINT(1) NOT NULL DEFAULT 1 ,
  PRIMARY KEY (`idchofer`, `idSede`) ,
  INDEX `fk_chofer_Sede1` (`idSede` ASC) ,
  CONSTRAINT `fk_chofer_Sede1`
    FOREIGN KEY (`idSede` )
    REFERENCES `sgstt`.`Sede` (`idSede` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sgstt`.`marca`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sgstt`.`marca` ;

CREATE  TABLE IF NOT EXISTS `sgstt`.`marca` (
  `idmarca` INT NOT NULL AUTO_INCREMENT ,
  `nombreMarca` VARCHAR(45) NULL ,
  PRIMARY KEY (`idmarca`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sgstt`.`tipo_vehiculo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sgstt`.`tipo_vehiculo` ;

CREATE  TABLE IF NOT EXISTS `sgstt`.`tipo_vehiculo` (
  `idtipo_vehiculo` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(45) NULL ,
  `capacidad` INT NULL ,
  PRIMARY KEY (`idtipo_vehiculo`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sgstt`.`vehiculo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sgstt`.`vehiculo` ;

CREATE  TABLE IF NOT EXISTS `sgstt`.`vehiculo` (
  `idvehiculo` INT NOT NULL AUTO_INCREMENT ,
  `idSede` INT NOT NULL ,
  `descripcion` VARCHAR(45) NULL ,
  `placa` VARCHAR(7) NULL ,
  `ESTADO` TINYINT(1) NOT NULL DEFAULT 1 ,
  `año_fabricacion` VARCHAR(4) NULL ,
  `capacidad_max` VARCHAR(3) NULL ,
  `capacidad_recomendada` VARCHAR(3) NULL ,
  `color` VARCHAR(25) NULL ,
  `idtipo_vehiculo` INT NOT NULL ,
  `marca_idmarca` INT NOT NULL ,
  `fecha_registro` DATETIME NULL ,
  `fecha_modificacion` DATETIME NULL ,
  PRIMARY KEY (`idvehiculo`, `idSede`) ,
  INDEX `fk_vehículo_marca1_idx` (`marca_idmarca` ASC) ,
  INDEX `fk_vehículo_tipo vehiculo1_idx` (`idtipo_vehiculo` ASC) ,
  INDEX `fk_vehiculo_Sede1` (`idSede` ASC) ,
  CONSTRAINT `fk_vehículo_marca1`
    FOREIGN KEY (`marca_idmarca` )
    REFERENCES `sgstt`.`marca` (`idmarca` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_vehículo_tipo vehiculo1`
    FOREIGN KEY (`idtipo_vehiculo` )
    REFERENCES `sgstt`.`tipo_vehiculo` (`idtipo_vehiculo` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_vehiculo_Sede1`
    FOREIGN KEY (`idSede` )
    REFERENCES `sgstt`.`Sede` (`idSede` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sgstt`.`aerolinea`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sgstt`.`aerolinea` ;

CREATE  TABLE IF NOT EXISTS `sgstt`.`aerolinea` (
  `idaerolinea` INT NOT NULL AUTO_INCREMENT ,
  `descripcion` VARCHAR(45) NULL ,
  PRIMARY KEY (`idaerolinea`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sgstt`.`vuelo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sgstt`.`vuelo` ;

CREATE  TABLE IF NOT EXISTS `sgstt`.`vuelo` (
  `idvuelo` INT NOT NULL AUTO_INCREMENT ,
  `descripcion` VARCHAR(45) NOT NULL ,
  `origen` VARCHAR(45) NULL ,
  `destino` VARCHAR(45) NULL ,
  `horario` VARCHAR(45) NULL ,
  `idaerolinea` INT NOT NULL ,
  PRIMARY KEY (`idvuelo`, `idaerolinea`) ,
  INDEX `fk_vuelo_aerolinea1_idx` (`idaerolinea` ASC) ,
  CONSTRAINT `fk_vuelo_aerolinea1`
    FOREIGN KEY (`idaerolinea` )
    REFERENCES `sgstt`.`aerolinea` (`idaerolinea` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sgstt`.`tipo_servicio_has_vehículo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sgstt`.`tipo_servicio_has_vehículo` ;

CREATE  TABLE IF NOT EXISTS `sgstt`.`tipo_servicio_has_vehículo` (
  `tipo_servicio_idtipo_servicio` INT NOT NULL AUTO_INCREMENT ,
  `vehículo_idvehículo` INT NOT NULL ,
  PRIMARY KEY (`tipo_servicio_idtipo_servicio`, `vehículo_idvehículo`) ,
  INDEX `fk_tipo_servicio_has_vehículo_vehículo1_idx` (`vehículo_idvehículo` ASC) ,
  INDEX `fk_tipo_servicio_has_vehículo_tipo_servicio1_idx` (`tipo_servicio_idtipo_servicio` ASC) ,
  CONSTRAINT `fk_tipo_servicio_has_vehículo_tipo_servicio1`
    FOREIGN KEY (`tipo_servicio_idtipo_servicio` )
    REFERENCES `sgstt`.`tipo_servicio` (`idtipo_servicio` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tipo_servicio_has_vehículo_vehículo1`
    FOREIGN KEY (`vehículo_idvehículo` )
    REFERENCES `sgstt`.`vehiculo` (`idvehiculo` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sgstt`.`servicio`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sgstt`.`servicio` ;

CREATE  TABLE IF NOT EXISTS `sgstt`.`servicio` (
  `idservicio` INT NOT NULL AUTO_INCREMENT ,
  `idSede` INT NOT NULL ,
  `descripcion` VARCHAR(300) NOT NULL ,
  `ESTADO` TINYINT(1) NOT NULL DEFAULT 1 ,
  `idtipo_servicio` INT NOT NULL ,
  PRIMARY KEY (`idservicio`, `idSede`) ,
  INDEX `fk_servicio_tipo_servicio1_idx` (`idtipo_servicio` ASC) ,
  INDEX `fk_servicio_Sede1` (`idSede` ASC) ,
  CONSTRAINT `fk_servicio_tipo_servicio1`
    FOREIGN KEY (`idtipo_servicio` )
    REFERENCES `sgstt`.`tipo_servicio` (`idtipo_servicio` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_servicio_Sede1`
    FOREIGN KEY (`idSede` )
    REFERENCES `sgstt`.`Sede` (`idSede` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sgstt`.`tarifa`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sgstt`.`tarifa` ;

CREATE  TABLE IF NOT EXISTS `sgstt`.`tarifa` (
  `idTarifa` INT NOT NULL AUTO_INCREMENT ,
  `horas` VARCHAR(45) NULL ,
  `descripcion` VARCHAR(45) NULL ,
  `precio` DECIMAL(10,2) NULL ,
  `idtipo_vehiculo` INT NOT NULL ,
  `idservicio` INT NOT NULL ,
  `ESTADO` TINYINT(1) NOT NULL DEFAULT 1 ,
  `FECHA_REGISTRO` DATETIME NULL ,
  `FECHA_MODIFICACION` DATETIME NULL ,
  PRIMARY KEY (`idTarifa`) ,
  INDEX `fk_tarifa_tipo_vehiculo1_idx` (`idtipo_vehiculo` ASC) ,
  INDEX `fk_tarifa_servicio1_idx` (`idservicio` ASC) ,
  CONSTRAINT `fk_tarifa_tipo_vehiculo1`
    FOREIGN KEY (`idtipo_vehiculo` )
    REFERENCES `sgstt`.`tipo_vehiculo` (`idtipo_vehiculo` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tarifa_servicio1`
    FOREIGN KEY (`idservicio` )
    REFERENCES `sgstt`.`servicio` (`idservicio` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sgstt`.`cobro`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sgstt`.`cobro` ;

CREATE  TABLE IF NOT EXISTS `sgstt`.`cobro` (
  `idcobro` INT NOT NULL ,
  `descuento` VARCHAR(45) NULL ,
  `adicional` VARCHAR(45) NULL ,
  `neto` VARCHAR(45) NULL ,
  `total` VARCHAR(45) NULL ,
  PRIMARY KEY (`idcobro`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sgstt`.`modelo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sgstt`.`modelo` ;

CREATE  TABLE IF NOT EXISTS `sgstt`.`modelo` (
  `idmodelo` INT NOT NULL AUTO_INCREMENT ,
  `nombreModelo` VARCHAR(45) NULL ,
  `marca_idmarca` INT NOT NULL ,
  PRIMARY KEY (`idmodelo`, `marca_idmarca`) ,
  INDEX `fk_modelo_marca1_idx` (`marca_idmarca` ASC) ,
  CONSTRAINT `fk_modelo_marca1`
    FOREIGN KEY (`marca_idmarca` )
    REFERENCES `sgstt`.`marca` (`idmarca` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sgstt`.`tipo_incidencia`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sgstt`.`tipo_incidencia` ;

CREATE  TABLE IF NOT EXISTS `sgstt`.`tipo_incidencia` (
  `idtipo_incidencia` INT NOT NULL AUTO_INCREMENT ,
  `descripcion` VARCHAR(45) NULL ,
  PRIMARY KEY (`idtipo_incidencia`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sgstt`.`estado_incidencia`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sgstt`.`estado_incidencia` ;

CREATE  TABLE IF NOT EXISTS `sgstt`.`estado_incidencia` (
  `idestado_incidencia` INT NOT NULL AUTO_INCREMENT ,
  `descripcion` VARCHAR(45) NULL ,
  PRIMARY KEY (`idestado_incidencia`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sgstt`.`empresa`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sgstt`.`empresa` ;

CREATE  TABLE IF NOT EXISTS `sgstt`.`empresa` (
  `idempresa` INT NOT NULL AUTO_INCREMENT ,
  `razon_social` VARCHAR(45) NULL ,
  `ruc` VARCHAR(45) NULL ,
  `telefono` VARCHAR(45) NULL ,
  `celular` VARCHAR(45) NULL ,
  `correo` VARCHAR(45) NULL ,
  PRIMARY KEY (`idempresa`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sgstt`.`empresa_chofer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sgstt`.`empresa_chofer` ;

CREATE  TABLE IF NOT EXISTS `sgstt`.`empresa_chofer` (
  `idempresa_chofer` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(60) NULL ,
  `apellido` VARCHAR(60) NULL ,
  `dni` VARCHAR(8) NULL ,
  `empresa_idempresa` INT NOT NULL ,
  PRIMARY KEY (`idempresa_chofer`) ,
  INDEX `fk_empresa_chofer_empresa1_idx` (`empresa_idempresa` ASC) ,
  CONSTRAINT `fk_empresa_chofer_empresa1`
    FOREIGN KEY (`empresa_idempresa` )
    REFERENCES `sgstt`.`empresa` (`idempresa` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sgstt`.`empresa_vehiculo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sgstt`.`empresa_vehiculo` ;

CREATE  TABLE IF NOT EXISTS `sgstt`.`empresa_vehiculo` (
  `idempresa_vehiculo` INT NOT NULL AUTO_INCREMENT ,
  `marca` VARCHAR(25) NULL ,
  `placa` VARCHAR(16) NULL ,
  `empresa_idempresa` INT NOT NULL ,
  PRIMARY KEY (`idempresa_vehiculo`) ,
  INDEX `fk_empresa_vehiculo_empresa1_idx` (`empresa_idempresa` ASC) ,
  CONSTRAINT `fk_empresa_vehiculo_empresa1`
    FOREIGN KEY (`empresa_idempresa` )
    REFERENCES `sgstt`.`empresa` (`idempresa` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sgstt`.`Tipo_Cliente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sgstt`.`Tipo_Cliente` ;

CREATE  TABLE IF NOT EXISTS `sgstt`.`Tipo_Cliente` (
  `id_TipoCliente` INT NOT NULL AUTO_INCREMENT ,
  `Tipo_Cliente` VARCHAR(45) NULL ,
  PRIMARY KEY (`id_TipoCliente`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sgstt`.`Cliente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sgstt`.`Cliente` ;

CREATE  TABLE IF NOT EXISTS `sgstt`.`Cliente` (
  `idCliente` INT NOT NULL AUTO_INCREMENT ,
  `Nombre` VARCHAR(45) NULL ,
  `NumeroDocumento` VARCHAR(12) NULL ,
  `RazonSocial` VARCHAR(45) NULL ,
  `Direccion` VARCHAR(45) NULL ,
  `ESTADO` TINYINT(1) NOT NULL DEFAULT 1 ,
  `TIPO_DOCUMENTO` VARCHAR(50) NULL ,
  `Correo` VARCHAR(45) NULL ,
  `id_TipoCliente` INT NOT NULL ,
  PRIMARY KEY (`idCliente`) ,
  INDEX `fk_Cliente_Tipo_Cliente1_idx` (`id_TipoCliente` ASC) ,
  CONSTRAINT `fk_Cliente_Tipo_Cliente1`
    FOREIGN KEY (`id_TipoCliente` )
    REFERENCES `sgstt`.`Tipo_Cliente` (`id_TipoCliente` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sgstt`.`EMPLEADO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sgstt`.`EMPLEADO` ;

CREATE  TABLE IF NOT EXISTS `sgstt`.`EMPLEADO` (
  `idEMPLEADO` INT NOT NULL AUTO_INCREMENT ,
  `NOMBRE` VARCHAR(45) NOT NULL ,
  `APELLIDOS` VARCHAR(45) NOT NULL ,
  `DNI` VARCHAR(8) NOT NULL ,
  PRIMARY KEY (`idEMPLEADO`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sgstt`.`File`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sgstt`.`File` ;

CREATE  TABLE IF NOT EXISTS `sgstt`.`File` (
  `idFile` INT NOT NULL AUTO_INCREMENT ,
  `idCliente` INT NOT NULL ,
  `idEMPLEADO` INT NOT NULL ,
  `PAX` VARCHAR(80) NOT NULL ,
  `FECHA_REGISTRO` DATETIME NOT NULL ,
  `FECHA_MODIFICACION` DATETIME NOT NULL ,
  `NRO_CORRELATIVO` VARCHAR(45) NULL ,
  `ESTADO` TINYINT(1) NOT NULL DEFAULT 1 ,
  PRIMARY KEY (`idFile`, `idCliente`, `idEMPLEADO`) ,
  INDEX `fk_File_Cliente1_idx` (`idCliente` ASC) ,
  INDEX `fk_File_EMPLEADO1_idx` (`idEMPLEADO` ASC) ,
  CONSTRAINT `fk_File_Cliente1`
    FOREIGN KEY (`idCliente` )
    REFERENCES `sgstt`.`Cliente` (`idCliente` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_File_EMPLEADO1`
    FOREIGN KEY (`idEMPLEADO` )
    REFERENCES `sgstt`.`EMPLEADO` (`idEMPLEADO` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sgstt`.`venta_directa`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sgstt`.`venta_directa` ;

CREATE  TABLE IF NOT EXISTS `sgstt`.`venta_directa` (
  `idventa` INT NOT NULL AUTO_INCREMENT ,
  `idCliente` INT NOT NULL ,
  `serie` VARCHAR(10) NOT NULL DEFAULT 'VTA' ,
  PRIMARY KEY (`idventa`, `idCliente`) ,
  INDEX `fk_venta_directa_Cliente1` (`idCliente` ASC) ,
  CONSTRAINT `fk_venta_directa_Cliente1`
    FOREIGN KEY (`idCliente` )
    REFERENCES `sgstt`.`Cliente` (`idCliente` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sgstt`.`servicio_detalle`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sgstt`.`servicio_detalle` ;

CREATE  TABLE IF NOT EXISTS `sgstt`.`servicio_detalle` (
  `idservicio_detalle` INT NOT NULL AUTO_INCREMENT ,
  `idservicio` INT NOT NULL ,
  `num_personas` INT NOT NULL ,
  `FECHA` DATETIME NOT NULL ,
  `externalizado` VARCHAR(2) NOT NULL DEFAULT 'NO' ,
  `PRECIO_SERVICIO` DECIMAL(12,2) NULL ,
  `DESCUENTO` DECIMAL(12,2) NOT NULL DEFAULT 0.00 ,
  `ADICIONAL` DECIMAL(12,2) NOT NULL DEFAULT 0.00 ,
  `GRAVADA` TINYINT(1) NOT NULL DEFAULT 1 ,
  `DIAS_VIAJE` INT NULL ,
  `PAX` VARCHAR(80) NULL ,
  `ESTADO` TINYINT(1) NOT NULL DEFAULT 1 ,
  `ESTADO_SERVICIO` VARCHAR(60) NULL ,
  `FECHA_REGISTRO` DATETIME NOT NULL ,
  `FECHA_MODIFICACION` DATETIME NOT NULL ,
  `idvuelo` INT NULL ,
  `idchofer` INT NULL ,
  `idtrasladista` INT NULL ,
  `idcobro` INT NULL ,
  `idvehiculo` INT NULL ,
  `idempresa_chofer` INT NULL ,
  `idempresa_vehiculo` INT NULL ,
  `idFile` INT NULL ,
  `idventa` INT NULL ,
  PRIMARY KEY (`idservicio_detalle`, `idservicio`) ,
  INDEX `fk_servicio_detalle_trasladista1_idx` (`idtrasladista` ASC) ,
  INDEX `fk_servicio_detalle_cobro1_idx` (`idcobro` ASC) ,
  INDEX `fk_servicio_detalle_servicio1_idx` (`idservicio` ASC) ,
  INDEX `fk_servicio_detalle_vuelo1_idx` (`idvuelo` ASC) ,
  INDEX `fk_servicio_detalle_chofer1_idx` (`idchofer` ASC) ,
  INDEX `fk_servicio_detalle_vehiculo1_idx` (`idvehiculo` ASC) ,
  INDEX `fk_servicio_detalle_empresa_chofer1_idx` (`idempresa_chofer` ASC) ,
  INDEX `fk_servicio_detalle_empresa_vehiculo1_idx` (`idempresa_vehiculo` ASC) ,
  INDEX `fk_servicio_detalle_File1` (`idFile` ASC) ,
  INDEX `fk_servicio_detalle_venta_directa1` (`idventa` ASC) ,
  CONSTRAINT `fk_servicio_detalle_trasladista1`
    FOREIGN KEY (`idtrasladista` )
    REFERENCES `sgstt`.`trasladista` (`idtrasladista` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_servicio_detalle_cobro1`
    FOREIGN KEY (`idcobro` )
    REFERENCES `sgstt`.`cobro` (`idcobro` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_servicio_detalle_servicio1`
    FOREIGN KEY (`idservicio` )
    REFERENCES `sgstt`.`servicio` (`idservicio` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_servicio_detalle_vuelo1`
    FOREIGN KEY (`idvuelo` )
    REFERENCES `sgstt`.`vuelo` (`idvuelo` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_servicio_detalle_chofer1`
    FOREIGN KEY (`idchofer` )
    REFERENCES `sgstt`.`chofer` (`idchofer` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_servicio_detalle_vehiculo1`
    FOREIGN KEY (`idvehiculo` )
    REFERENCES `sgstt`.`vehiculo` (`idvehiculo` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_servicio_detalle_empresa_chofer1`
    FOREIGN KEY (`idempresa_chofer` )
    REFERENCES `sgstt`.`empresa_chofer` (`idempresa_chofer` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_servicio_detalle_empresa_vehiculo1`
    FOREIGN KEY (`idempresa_vehiculo` )
    REFERENCES `sgstt`.`empresa_vehiculo` (`idempresa_vehiculo` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_servicio_detalle_File1`
    FOREIGN KEY (`idFile` )
    REFERENCES `sgstt`.`File` (`idFile` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_servicio_detalle_venta_directa1`
    FOREIGN KEY (`idventa` )
    REFERENCES `sgstt`.`venta_directa` (`idventa` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sgstt`.`incidencia`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sgstt`.`incidencia` ;

CREATE  TABLE IF NOT EXISTS `sgstt`.`incidencia` (
  `idincidencia` INT NOT NULL ,
  `descripcion` VARCHAR(45) NULL ,
  `idestado_incidencia` INT NOT NULL ,
  `idtipo_incidencia` INT NOT NULL ,
  `idservicio_detalle` INT NOT NULL ,
  `FECHA_REGISTRO` DATETIME NOT NULL ,
  `FECHA_MODIFICACION` DATETIME NOT NULL ,
  `ESTADO` TINYINT(2) NULL DEFAULT '1' ,
  PRIMARY KEY (`idincidencia`, `idservicio_detalle`) ,
  INDEX `fk_incidencia_tipo_incidencia1_idx` (`idtipo_incidencia` ASC) ,
  INDEX `fk_incidencia_estado_incidencia1_idx` (`idestado_incidencia` ASC) ,
  INDEX `fk_incidencia_servicio_detalle1_idx` (`idservicio_detalle` ASC) ,
  CONSTRAINT `fk_incidencia_tipo_incidencia1`
    FOREIGN KEY (`idtipo_incidencia` )
    REFERENCES `sgstt`.`tipo_incidencia` (`idtipo_incidencia` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_incidencia_estado_incidencia1`
    FOREIGN KEY (`idestado_incidencia` )
    REFERENCES `sgstt`.`estado_incidencia` (`idestado_incidencia` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_incidencia_servicio_detalle1`
    FOREIGN KEY (`idservicio_detalle` )
    REFERENCES `sgstt`.`servicio_detalle` (`idservicio_detalle` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sgstt`.`PERFIL`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sgstt`.`PERFIL` ;

CREATE  TABLE IF NOT EXISTS `sgstt`.`PERFIL` (
  `idPERFIL` INT NOT NULL AUTO_INCREMENT ,
  `NOMBRE` VARCHAR(200) NOT NULL ,
  `ESTADO` TINYINT(1) NOT NULL DEFAULT 1 ,
  PRIMARY KEY (`idPERFIL`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sgstt`.`USUARIO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sgstt`.`USUARIO` ;

CREATE  TABLE IF NOT EXISTS `sgstt`.`USUARIO` (
  `idUSUARIO` INT NOT NULL AUTO_INCREMENT ,
  `idPERFIL` INT NOT NULL ,
  `idEMPLEADO` INT NOT NULL ,
  `idSede` INT NOT NULL ,
  `NICK` VARCHAR(20) NOT NULL ,
  `CLAVE` VARCHAR(20) NOT NULL ,
  `ESTADO` TINYINT(1) NOT NULL DEFAULT 1 ,
  PRIMARY KEY (`idUSUARIO`, `idPERFIL`, `idEMPLEADO`, `idSede`) ,
  INDEX `fk_USUARIO_PERFIL1_idx` (`idPERFIL` ASC) ,
  INDEX `fk_USUARIO_EMPLEADO1_idx` (`idEMPLEADO` ASC) ,
  INDEX `fk_USUARIO_Sede1` (`idSede` ASC) ,
  CONSTRAINT `fk_USUARIO_PERFIL1`
    FOREIGN KEY (`idPERFIL` )
    REFERENCES `sgstt`.`PERFIL` (`idPERFIL` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_USUARIO_EMPLEADO1`
    FOREIGN KEY (`idEMPLEADO` )
    REFERENCES `sgstt`.`EMPLEADO` (`idEMPLEADO` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_USUARIO_Sede1`
    FOREIGN KEY (`idSede` )
    REFERENCES `sgstt`.`Sede` (`idSede` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sgstt`.`MODULO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sgstt`.`MODULO` ;

CREATE  TABLE IF NOT EXISTS `sgstt`.`MODULO` (
  `idMODULO` INT NOT NULL AUTO_INCREMENT ,
  `NOMBRE` VARCHAR(100) NOT NULL ,
  `URL` VARCHAR(50) NOT NULL ,
  `LISTAR` TINYINT(1) NOT NULL ,
  `CREAR` TINYINT(1) NOT NULL ,
  `ACTUALIZAR` TINYINT(1) NOT NULL ,
  `ELIMINAR` TINYINT(1) NOT NULL ,
  `ESTADO` TINYINT(1) NOT NULL DEFAULT 1 ,
  PRIMARY KEY (`idMODULO`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sgstt`.`PERMISO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sgstt`.`PERMISO` ;

CREATE  TABLE IF NOT EXISTS `sgstt`.`PERMISO` (
  `idPERMISO` INT NOT NULL AUTO_INCREMENT ,
  `idPERFIL` INT NOT NULL ,
  `idMODULO` INT NOT NULL ,
  `LISTAR` TINYINT(1) NULL ,
  `CREAR` TINYINT(1) NULL ,
  `ACTUALIZAR` TINYINT(1) NULL ,
  `ELIMINAR` TINYINT(1) NULL ,
  PRIMARY KEY (`idPERMISO`, `idPERFIL`, `idMODULO`) ,
  INDEX `fk_PERMISO_PERFIL1_idx` (`idPERFIL` ASC) ,
  INDEX `fk_PERMISO_MODULO1_idx` (`idMODULO` ASC) ,
  CONSTRAINT `fk_PERMISO_PERFIL1`
    FOREIGN KEY (`idPERFIL` )
    REFERENCES `sgstt`.`PERFIL` (`idPERFIL` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PERMISO_MODULO1`
    FOREIGN KEY (`idMODULO` )
    REFERENCES `sgstt`.`MODULO` (`idMODULO` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sgstt`.`Destinos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sgstt`.`Destinos` ;

CREATE  TABLE IF NOT EXISTS `sgstt`.`Destinos` (
  `idDestinos` INT NOT NULL AUTO_INCREMENT ,
  `NOMBRE` VARCHAR(300) NOT NULL ,
  `LATITUD` VARCHAR(50) NULL ,
  `LONGITUD` VARCHAR(50) NULL ,
  `ESTADO` TINYINT(1) NOT NULL DEFAULT 1 ,
  PRIMARY KEY (`idDestinos`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sgstt`.`servicio_destinos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sgstt`.`servicio_destinos` ;

CREATE  TABLE IF NOT EXISTS `sgstt`.`servicio_destinos` (
  `servicio_idservicio` INT NOT NULL ,
  `Destinos_idDestinos` INT NOT NULL ,
  PRIMARY KEY (`servicio_idservicio`, `Destinos_idDestinos`) ,
  INDEX `fk_servicio_has_Destinos_Destinos1` (`Destinos_idDestinos` ASC) ,
  INDEX `fk_servicio_has_Destinos_servicio1` (`servicio_idservicio` ASC) ,
  CONSTRAINT `fk_servicio_has_Destinos_servicio1`
    FOREIGN KEY (`servicio_idservicio` )
    REFERENCES `sgstt`.`servicio` (`idservicio` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_servicio_has_Destinos_Destinos1`
    FOREIGN KEY (`Destinos_idDestinos` )
    REFERENCES `sgstt`.`Destinos` (`idDestinos` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `sgstt`.`tipo_servicio`
-- -----------------------------------------------------
START TRANSACTION;
USE `sgstt`;
INSERT INTO `sgstt`.`tipo_servicio` (`idtipo_servicio`, `descripcion`, `ESTADO`) VALUES (1, 'Traslado', 1);
INSERT INTO `sgstt`.`tipo_servicio` (`idtipo_servicio`, `descripcion`, `ESTADO`) VALUES (2, 'Tour/Excursion', 1);
INSERT INTO `sgstt`.`tipo_servicio` (`idtipo_servicio`, `descripcion`, `ESTADO`) VALUES (3, 'Viaje', 1);
INSERT INTO `sgstt`.`tipo_servicio` (`idtipo_servicio`, `descripcion`, `ESTADO`) VALUES (4, 'Servicio Adicional', 1);

COMMIT;

-- -----------------------------------------------------
-- Data for table `sgstt`.`trasladista`
-- -----------------------------------------------------
START TRANSACTION;
USE `sgstt`;
INSERT INTO `sgstt`.`trasladista` (`idtrasladista`, `nombre`, `apellido`, `dni`, `direccion`, `correo`, `telefono`, `celular`, `estado`) VALUES (1, 'Margarita', 'Stuard', '00000000', 'Domeyer 128 Dpto 502 ', 'No disponible', '7437434', '992096541', 1);
INSERT INTO `sgstt`.`trasladista` (`idtrasladista`, `nombre`, `apellido`, `dni`, `direccion`, `correo`, `telefono`, `celular`, `estado`) VALUES (2, 'Victor', 'Aranda', '00000000', 'Av. El laurel rosa 411, Dpto 502 Los sauces', 'No disponible', '5457854', '965874123', 1);
INSERT INTO `sgstt`.`trasladista` (`idtrasladista`, `nombre`, `apellido`, `dni`, `direccion`, `correo`, `telefono`, `celular`, `estado`) VALUES (3, 'Silvia', 'de Vettor', 'v', 'Ramón Castilla 418 Urb. Aurora', 'No disponible', '7437434', '987654345', 1);
INSERT INTO `sgstt`.`trasladista` (`idtrasladista`, `nombre`, `apellido`, `dni`, `direccion`, `correo`, `telefono`, `celular`, `estado`) VALUES (4, 'Ursula', 'Collas', '00000000', 'Calle. Alfredo silva 142, Casa 115', 'No disponible', '5457854', '965874123', 1);
INSERT INTO `sgstt`.`trasladista` (`idtrasladista`, `nombre`, `apellido`, `dni`, `direccion`, `correo`, `telefono`, `celular`, `estado`) VALUES (5, 'Nelida', 'Manrique', '00000000', 'Calle. Manco Capac 421-Dpto 102 ', 'No disponible', '7437434', '987654345', 1);
INSERT INTO `sgstt`.`trasladista` (`idtrasladista`, `nombre`, `apellido`, `dni`, `direccion`, `correo`, `telefono`, `celular`, `estado`) VALUES (6, 'Franz', 'Alarcon', '00000000', 'Av. Grau 341 – Dpto 602', 'No disponible', '5457854', '965874123', 1);
INSERT INTO `sgstt`.`trasladista` (`idtrasladista`, `nombre`, `apellido`, `dni`, `direccion`, `correo`, `telefono`, `celular`, `estado`) VALUES (7, 'Nieves', 'Echegaray', '00000000', 'Parque echenique 741 Dpto. 501', 'No disponible', '7437434', '987654345', 1);
INSERT INTO `sgstt`.`trasladista` (`idtrasladista`, `nombre`, `apellido`, `dni`, `direccion`, `correo`, `telefono`, `celular`, `estado`) VALUES (8, 'Oscar', 'Von Bishopsahussen', '00000000', 'Av. Castilla con Av. Ayacucho G in 17 - Urbanización La Capullana', 'No disponible', '5457854', '965874123', 1);
INSERT INTO `sgstt`.`trasladista` (`idtrasladista`, `nombre`, `apellido`, `dni`, `direccion`, `correo`, `telefono`, `celular`, `estado`) VALUES (9, 'Ernesto', 'Riedner', '00000000', 'Jr. Fernando castrat #320', 'No disponible', '7437434', '987654345', 1);
INSERT INTO `sgstt`.`trasladista` (`idtrasladista`, `nombre`, `apellido`, `dni`, `direccion`, `correo`, `telefono`, `celular`, `estado`) VALUES (10, 'Guillermo', 'Torres', '00000000', 'Enrique Barrón Nº 845 – Dpto. 202 – Santa Beatriz / Referencia al frente del parque de las aguas.', 'No disponible', '5457854', '965874123', 1);
INSERT INTO `sgstt`.`trasladista` (`idtrasladista`, `nombre`, `apellido`, `dni`, `direccion`, `correo`, `telefono`, `celular`, `estado`) VALUES (11, 'Mariana', 'Garcia', '00000000', 'Calle La Península Mz C1 Lt 21 Urb. La Ensenada', 'No disponible', '7437434', '987654345', 1);
INSERT INTO `sgstt`.`trasladista` (`idtrasladista`, `nombre`, `apellido`, `dni`, `direccion`, `correo`, `telefono`, `celular`, `estado`) VALUES (12, 'Karina', 'Bartens', '00000000', 'Jr. El escorial F-3 urb comopus', 'No disponible', '5457854', '965874123', 1);

COMMIT;

-- -----------------------------------------------------
-- Data for table `sgstt`.`Sede`
-- -----------------------------------------------------
START TRANSACTION;
USE `sgstt`;
INSERT INTO `sgstt`.`Sede` (`idSede`, `descripcion`) VALUES (1, 'LIMA');
INSERT INTO `sgstt`.`Sede` (`idSede`, `descripcion`) VALUES (2, 'CUSCO');

COMMIT;

-- -----------------------------------------------------
-- Data for table `sgstt`.`chofer`
-- -----------------------------------------------------
START TRANSACTION;
USE `sgstt`;
INSERT INTO `sgstt`.`chofer` (`idchofer`, `idSede`, `nombre`, `apellido`, `dni`, `categoria`, `ESTADO`) VALUES (1, 2, 'JAIME', 'AGUILAR EGOAVIL', '23885693', 'A1', 1);
INSERT INTO `sgstt`.`chofer` (`idchofer`, `idSede`, `nombre`, `apellido`, `dni`, `categoria`, `ESTADO`) VALUES (2, 2, 'CESAR AMADO', 'ARELLANOS MUÑOZ', '25662462', 'A2', 1);
INSERT INTO `sgstt`.`chofer` (`idchofer`, `idSede`, `nombre`, `apellido`, `dni`, `categoria`, `ESTADO`) VALUES (3, 1, 'MARIO HERNAN', 'CUADROS HUAPAYA', '25577045', 'A3', 1);
INSERT INTO `sgstt`.`chofer` (`idchofer`, `idSede`, `nombre`, `apellido`, `dni`, `categoria`, `ESTADO`) VALUES (4, 1, 'PEPE', 'DAMIAN JURO', '10550499', 'A1', 1);
INSERT INTO `sgstt`.`chofer` (`idchofer`, `idSede`, `nombre`, `apellido`, `dni`, `categoria`, `ESTADO`) VALUES (5, 1, 'KATTY DORIS', 'ESCOBAR PUMACALLAO', '07884541', 'A2', 1);
INSERT INTO `sgstt`.`chofer` (`idchofer`, `idSede`, `nombre`, `apellido`, `dni`, `categoria`, `ESTADO`) VALUES (6, 1, 'CARLOS ALBERTO', 'HERRERA NAVARRO', '10630551', 'A3', 1);
INSERT INTO `sgstt`.`chofer` (`idchofer`, `idSede`, `nombre`, `apellido`, `dni`, `categoria`, `ESTADO`) VALUES (7, 1, 'JOSE EDUARDO', 'HUAPALLA BALCAZAR', '10144415', 'A1', 1);
INSERT INTO `sgstt`.`chofer` (`idchofer`, `idSede`, `nombre`, `apellido`, `dni`, `categoria`, `ESTADO`) VALUES (8, 1, 'RODOLFO CESAR', 'LAZO CALDERON', '25717877', 'A2', 1);
INSERT INTO `sgstt`.`chofer` (`idchofer`, `idSede`, `nombre`, `apellido`, `dni`, `categoria`, `ESTADO`) VALUES (9, 1, 'JOSE LUIS', 'NUÑEZ CUENCA ROJAS', '09461980', 'A3', 1);
INSERT INTO `sgstt`.`chofer` (`idchofer`, `idSede`, `nombre`, `apellido`, `dni`, `categoria`, `ESTADO`) VALUES (10, 1, 'ADRIAN', 'TICONA APAZA', '10520991', 'A1', 1);
COMMIT;

-- -----------------------------------------------------
-- Data for table `sgstt`.`marca`
-- -----------------------------------------------------
START TRANSACTION;
USE `sgstt`;

INSERT INTO `sgstt`.`marca` (`idmarca`, `nombreMarca`) VALUES (1, 'Hino');
INSERT INTO `sgstt`.`marca` (`idmarca`, `nombreMarca`) VALUES (2, 'Hyundai');
INSERT INTO `sgstt`.`marca` (`idmarca`, `nombreMarca`) VALUES (3, 'Mercedes Benz');
INSERT INTO `sgstt`.`marca` (`idmarca`, `nombreMarca`) VALUES (4, 'Scania');
INSERT INTO `sgstt`.`marca` (`idmarca`, `nombreMarca`) VALUES (5, 'Toyota');

COMMIT;

-- -----------------------------------------------------
-- Data for table `sgstt`.`tipo_vehiculo`
-- -----------------------------------------------------
START TRANSACTION;
USE `sgstt`;
INSERT INTO `sgstt`.`tipo_vehiculo` (`idtipo_vehiculo`, `nombre`, `capacidad`) VALUES (1, 'Bus', 30);
INSERT INTO `sgstt`.`tipo_vehiculo` (`idtipo_vehiculo`, `nombre`, `capacidad`) VALUES (2, 'Mini Bus', 20);
INSERT INTO `sgstt`.`tipo_vehiculo` (`idtipo_vehiculo`, `nombre`, `capacidad`) VALUES (3, 'Sprinter Larga', 40);
INSERT INTO `sgstt`.`tipo_vehiculo` (`idtipo_vehiculo`, `nombre`, `capacidad`) VALUES (4, 'Van H1', 10);
INSERT INTO `sgstt`.`tipo_vehiculo` (`idtipo_vehiculo`, `nombre`, `capacidad`) VALUES (5, 'Van Toyota', 10);
COMMIT;

-- -----------------------------------------------------
-- Data for table `sgstt`.`vehiculo`
-- -----------------------------------------------------
START TRANSACTION;
USE `sgstt`;
INSERT INTO `sgstt`.`vehiculo` (`idvehiculo`, `idSede`, `descripcion`, `placa`, `ESTADO`, `año_fabricacion`, `capacidad_max`, `capacidad_recomendada`, `color`, `idtipo_vehiculo`, `marca_idmarca`, `fecha_registro`, `fecha_modificacion`) VALUES (1, 1, 'V-01', 'B6F-962', 1, '2006', '12', '10', 'negro', 1, 4, '2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO `sgstt`.`vehiculo` (`idvehiculo`, `idSede`, `descripcion`, `placa`, `ESTADO`, `año_fabricacion`, `capacidad_max`, `capacidad_recomendada`, `color`, `idtipo_vehiculo`, `marca_idmarca`, `fecha_registro`, `fecha_modificacion`) VALUES (2, 2, 'V-04', 'B3Z-954', 1, '2009', '40', '36', 'plata', 4, 2, '2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO `sgstt`.`vehiculo` (`idvehiculo`, `idSede`, `descripcion`, `placa`, `ESTADO`, `año_fabricacion`, `capacidad_max`, `capacidad_recomendada`, `color`, `idtipo_vehiculo`, `marca_idmarca`, `fecha_registro`, `fecha_modificacion`) VALUES (3, 1, 'V-05', 'B6H-966', 1, '2009', '50', '45', 'plata', 5, 5, '2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO `sgstt`.`vehiculo` (`idvehiculo`, `idSede`, `descripcion`, `placa`, `ESTADO`, `año_fabricacion`, `capacidad_max`, `capacidad_recomendada`, `color`, `idtipo_vehiculo`, `marca_idmarca`, `fecha_registro`, `fecha_modificacion`) VALUES (4, 1, 'V-06', 'A3H-968', 1, '2010', '12', '10', 'negro', 4, 2, '2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO `sgstt`.`vehiculo` (`idvehiculo`, `idSede`, `descripcion`, `placa`, `ESTADO`, `año_fabricacion`, `capacidad_max`, `capacidad_recomendada`, `color`, `idtipo_vehiculo`, `marca_idmarca`, `fecha_registro`, `fecha_modificacion`) VALUES (5, 2, 'V-08', 'B8P-788', 1, '2012', '40', '36', 'plata', 4, 4, '2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO `sgstt`.`vehiculo` (`idvehiculo`, `idSede`, `descripcion`, `placa`, `ESTADO`, `año_fabricacion`, `capacidad_max`, `capacidad_recomendada`, `color`, `idtipo_vehiculo`, `marca_idmarca`, `fecha_registro`, `fecha_modificacion`) VALUES (6, 1, 'V-09', 'B0F-958', 1, '2012', '50', '45', 'plata', 2, 3, '2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO `sgstt`.`vehiculo` (`idvehiculo`, `idSede`, `descripcion`, `placa`, `ESTADO`, `año_fabricacion`, `capacidad_max`, `capacidad_recomendada`, `color`, `idtipo_vehiculo`, `marca_idmarca`, `fecha_registro`, `fecha_modificacion`) VALUES (7, 1, 'V-10', 'C3H-964', 1, '2012', '12', '10', 'negro', 2, 1, '2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO `sgstt`.`vehiculo` (`idvehiculo`, `idSede`, `descripcion`, `placa`, `ESTADO`, `año_fabricacion`, `capacidad_max`, `capacidad_recomendada`, `color`, `idtipo_vehiculo`, `marca_idmarca`, `fecha_registro`, `fecha_modificacion`) VALUES (8, 1, 'V-11', 'C3E-953', 1, '2013', '40', '36', 'plata', 3, 3, '2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO `sgstt`.`vehiculo` (`idvehiculo`, `idSede`, `descripcion`, `placa`, `ESTADO`, `año_fabricacion`, `capacidad_max`, `capacidad_recomendada`, `color`, `idtipo_vehiculo`, `marca_idmarca`, `fecha_registro`, `fecha_modificacion`) VALUES (9, 1, 'V-12', 'C5J-959', 1, '2013', '50', '45', 'plata', 4, 2, '2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO `sgstt`.`vehiculo` (`idvehiculo`, `idSede`, `descripcion`, `placa`, `ESTADO`, `año_fabricacion`, `capacidad_max`, `capacidad_recomendada`, `color`, `idtipo_vehiculo`, `marca_idmarca`, `fecha_registro`, `fecha_modificacion`) VALUES (10, 1, 'V-13', 'C6Q-967', 1, '2014', '12', '10', 'negro', 2, 1, '2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO `sgstt`.`vehiculo` (`idvehiculo`, `idSede`, `descripcion`, `placa`, `ESTADO`, `año_fabricacion`, `capacidad_max`, `capacidad_recomendada`, `color`, `idtipo_vehiculo`, `marca_idmarca`, `fecha_registro`, `fecha_modificacion`) VALUES (11, 1, 'V-14', 'C6T-963', 1, '2014', '40', '36', 'plata', 1, 4, '2015-05-27 19:56:47', '2015-05-27 19:56:47');
COMMIT;

-- -----------------------------------------------------
-- Data for table `sgstt`.`aerolinea`
-- -----------------------------------------------------
START TRANSACTION;
USE `sgstt`;
INSERT INTO `sgstt`.`aerolinea` (`idaerolinea`, `descripcion`) VALUES (1, 'Avianca');
INSERT INTO `sgstt`.`aerolinea` (`idaerolinea`, `descripcion`) VALUES (2, 'LAN-Peru');
INSERT INTO `sgstt`.`aerolinea` (`idaerolinea`, `descripcion`) VALUES (3, 'LAN-Chile');

COMMIT;

-- -----------------------------------------------------
-- Data for table `sgstt`.`vuelo`
-- -----------------------------------------------------
START TRANSACTION;
USE `sgstt`;
INSERT INTO `sgstt`.`vuelo` (`idvuelo`, `descripcion`, `origen`, `destino`, `horario`, `idaerolinea`) VALUES (1, 'AV141', 'BOGOTA', 'LIMA', NULL, 1);
INSERT INTO `sgstt`.`vuelo` (`idvuelo`, `descripcion`, `origen`, `destino`, `horario`, `idaerolinea`) VALUES (2, 'LA2027', 'CARACAS', 'LIMA', NULL, 2);

COMMIT;

-- -----------------------------------------------------
-- Data for table `sgstt`.`servicio`
-- -----------------------------------------------------
START TRANSACTION;
USE `sgstt`;
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idSede`, `descripcion`, `ESTADO`, `idtipo_servicio`) VALUES (1, 1, 'APTO-LIMA-MIRAFLORES-SAN ISIDRO', 1, 1);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idSede`, `descripcion`, `ESTADO`, `idtipo_servicio`) VALUES (2, 1, 'APTO-SURCO-LA MOLINA', 1, 1);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idSede`, `descripcion`, `ESTADO`, `idtipo_servicio`) VALUES (3, 1, 'RESTAURANT (LIMA-SAN ISIDRO-MIRAFLORES)', 1, 1);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idSede`, `descripcion`, `ESTADO`, `idtipo_servicio`) VALUES (4, 1, 'RECOJO DE TRASLADISTA', 1, 1);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idSede`, `descripcion`, `ESTADO`, `idtipo_servicio`) VALUES (5, 1, 'RECOJO Y DEJADA DE TRASLADISTA', 1, 1);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idSede`, `descripcion`, `ESTADO`, `idtipo_servicio`) VALUES (6, 1, 'APTO - HOTEL EL PUEBLO', 1, 1);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idSede`, `descripcion`, `ESTADO`, `idtipo_servicio`) VALUES (7, 1, 'MOVIL- ORMEÑO-CRUZ DEL SUR S.I./HOTEL', 1, 1);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idSede`, `descripcion`, `ESTADO`, `idtipo_servicio`) VALUES (8, 1, 'PUERTO CALLAO/APTO', 1, 1);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idSede`, `descripcion`, `ESTADO`, `idtipo_servicio`) VALUES (9, 1, 'PUERTO CALLAO/ MIRAFLORES O SAN ISIDRO', 1, 1);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idSede`, `descripcion`, `ESTADO`, `idtipo_servicio`) VALUES (10, 1, 'ASISTENCIA', 1, 1);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idSede`, `descripcion`, `ESTADO`, `idtipo_servicio`) VALUES (11, 1, 'CITY TOUR (COLONIAL Y MODERNO)', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idSede`, `descripcion`, `ESTADO`, `idtipo_servicio`) VALUES (12, 1, 'UN MUSEO O COMPRAS', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idSede`, `descripcion`, `ESTADO`, `idtipo_servicio`) VALUES (13, 1, 'CITY + MUSEO O COMPRAS', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idSede`, `descripcion`, `ESTADO`, `idtipo_servicio`) VALUES (14, 1, 'CITY + RESTAURANT + MUSEO O COMPRAS', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idSede`, `descripcion`, `ESTADO`, `idtipo_servicio`) VALUES (15, 1, 'DOS MUSEOS', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idSede`, `descripcion`, `ESTADO`, `idtipo_servicio`) VALUES (16, 1, 'RUINAS (PACHACAMAC,PURUCHUCO)', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idSede`, `descripcion`, `ESTADO`, `idtipo_servicio`) VALUES (17, 1, 'RUINAS + MUSEO O RESTAURANT', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idSede`, `descripcion`, `ESTADO`, `idtipo_servicio`) VALUES (18, 1, 'RUINAS + RESTAURANT + CITY + MUSEO', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idSede`, `descripcion`, `ESTADO`, `idtipo_servicio`) VALUES (19, 1, 'ISLAS PALOMINO (RT)', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idSede`, `descripcion`, `ESTADO`, `idtipo_servicio`) VALUES (20, 1, 'LIMA - PARACAS O ICA', 1, 3);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idSede`, `descripcion`, `ESTADO`, `idtipo_servicio`) VALUES (21, 1, 'LIMA - NAZCA', 1, 3);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idSede`, `descripcion`, `ESTADO`, `idtipo_servicio`) VALUES (22, 1, 'LIMA - AREQUIPA - HUARAZ O HUANCAYO', 1, 3);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idSede`, `descripcion`, `ESTADO`, `idtipo_servicio`) VALUES (23, 1, 'LIMA - AREQUIPA Serie Polish - Philiberth', 1, 3);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idSede`, `descripcion`, `ESTADO`, `idtipo_servicio`) VALUES (24, 1, 'FULL DAY PARACAS O ICA', 1, 3);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idSede`, `descripcion`, `ESTADO`, `idtipo_servicio`) VALUES (25, 1, 'FULL DAY CARAL', 1, 3);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idSede`, `descripcion`, `ESTADO`, `idtipo_servicio`) VALUES (26, 1, 'VIATICOS POR CADA CHOFER X  DIA', 1, 3);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idSede`, `descripcion`, `ESTADO`, `idtipo_servicio`) VALUES (27, 1, 'LIMA-ASIA', 1, 3);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idSede`, `descripcion`, `ESTADO`, `idtipo_servicio`) VALUES (28, 1, 'LIMA/AREQUIPA S.MILLER', 1, 3);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idSede`, `descripcion`, `ESTADO`, `idtipo_servicio`) VALUES (29, 1, 'LIM/NAZCA/LIMA 2 DIAS S. MILLER', 1, 3);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idSede`, `descripcion`, `ESTADO`, `idtipo_servicio`) VALUES (30, 1, 'LIM/NAZCA/LIMA 3 DIAS S. MILLER', 1, 3);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idSede`, `descripcion`, `ESTADO`, `idtipo_servicio`) VALUES (31, 1, 'LIMA-CARAL-BARRANCA-SECHIN-TRUJILLO', 1, 3);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idSede`, `descripcion`, `ESTADO`, `idtipo_servicio`) VALUES (32, 1, 'CITY BY NIGHT', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idSede`, `descripcion`, `ESTADO`, `idtipo_servicio`) VALUES (33, 1, 'FUENTES MAGICAS DE AGUA', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idSede`, `descripcion`, `ESTADO`, `idtipo_servicio`) VALUES (34, 1, 'FUENTES MAGICAS DE AGUA', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idSede`, `descripcion`, `ESTADO`, `idtipo_servicio`) VALUES (35, 1, 'FUENTES MAGICAS + CENA SHOW', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idSede`, `descripcion`, `ESTADO`, `idtipo_servicio`) VALUES (36, 1, 'CITY BY NIGH + CENA SHOW', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idSede`, `descripcion`, `ESTADO`, `idtipo_servicio`) VALUES (37, 1, 'CITY BY NIGHT + F. MAGICAS+CENA SHOW', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idSede`, `descripcion`, `ESTADO`, `idtipo_servicio`) VALUES (38, 1, 'CITY + MUSEO P.OSMA', 1, 2);

COMMIT;

-- -----------------------------------------------------
-- Data for table `sgstt`.`tipo_incidencia`
-- -----------------------------------------------------
START TRANSACTION;
USE `sgstt`;
INSERT INTO `sgstt`.`tipo_incidencia` (`idtipo_incidencia`, `descripcion`) VALUES (1, 'Demora Pasajeros');
INSERT INTO `sgstt`.`tipo_incidencia` (`idtipo_incidencia`, `descripcion`) VALUES (2, 'Horas adicionales');

COMMIT;

-- -----------------------------------------------------
-- Data for table `sgstt`.`estado_incidencia`
-- -----------------------------------------------------
START TRANSACTION;
USE `sgstt`;
INSERT INTO `sgstt`.`estado_incidencia` (`idestado_incidencia`, `descripcion`) VALUES (1, 'pendiente');
INSERT INTO `sgstt`.`estado_incidencia` (`idestado_incidencia`, `descripcion`) VALUES (2, 'atendida');

COMMIT;

-- -----------------------------------------------------
-- Data for table `sgstt`.`empresa`
-- -----------------------------------------------------
START TRANSACTION;
USE `sgstt`;
INSERT INTO `sgstt`.`empresa` (`idempresa`, `razon_social`, `ruc`, `telefono`, `celular`, `correo`) VALUES (1, 'TARAKATOURS', NULL, NULL, NULL, NULL);

COMMIT;

-- -----------------------------------------------------
-- Data for table `sgstt`.`empresa_chofer`
-- -----------------------------------------------------
START TRANSACTION;
USE `sgstt`;
INSERT INTO `sgstt`.`empresa_chofer` (`idempresa_chofer`, `nombre`, `apellido`, `dni`, `empresa_idempresa`) VALUES (1, 'Rodrigo', 'Rosas', '12345678', 1);

COMMIT;

-- -----------------------------------------------------
-- Data for table `sgstt`.`empresa_vehiculo`
-- -----------------------------------------------------
START TRANSACTION;
USE `sgstt`;
INSERT INTO `sgstt`.`empresa_vehiculo` (`idempresa_vehiculo`, `marca`, `placa`, `empresa_idempresa`) VALUES (1, 'hyundai', '124-afg', 1);

COMMIT;

-- -----------------------------------------------------
-- Data for table `sgstt`.`Tipo_Cliente`
-- -----------------------------------------------------
START TRANSACTION;
USE `sgstt`;
INSERT INTO `sgstt`.`Tipo_Cliente` (`id_TipoCliente`, `Tipo_Cliente`) VALUES (1, 'NATURAL');
INSERT INTO `sgstt`.`Tipo_Cliente` (`id_TipoCliente`, `Tipo_Cliente`) VALUES (2, 'JURIDICO');

COMMIT;

-- -----------------------------------------------------
-- Data for table `sgstt`.`Cliente`
-- -----------------------------------------------------
START TRANSACTION;
USE `sgstt`;
INSERT INTO `sgstt`.`Cliente` (`idCliente`, `Nombre`, `NumeroDocumento`, `RazonSocial`, `Direccion`, `ESTADO`, `TIPO_DOCUMENTO`, `Correo`, `id_TipoCliente`) VALUES (1, '', NULL, 'GEBECO', NULL, 1, 'RUC', NULL, 2);
INSERT INTO `sgstt`.`Cliente` (`idCliente`, `Nombre`, `NumeroDocumento`, `RazonSocial`, `Direccion`, `ESTADO`, `TIPO_DOCUMENTO`, `Correo`, `id_TipoCliente`) VALUES (2, '', NULL, 'AVS', NULL, 1, 'RUC', NULL, 2);
INSERT INTO `sgstt`.`Cliente` (`idCliente`, `Nombre`, `NumeroDocumento`, `RazonSocial`, `Direccion`, `ESTADO`, `TIPO_DOCUMENTO`, `Correo`, `id_TipoCliente`) VALUES (3, '', NULL, 'SETOURS', NULL, 1, 'RUC', NULL, 2);

COMMIT;

-- -----------------------------------------------------
-- Data for table `sgstt`.`EMPLEADO`
-- -----------------------------------------------------
START TRANSACTION;
USE `sgstt`;
INSERT INTO `sgstt`.`EMPLEADO` (`idEMPLEADO`, `NOMBRE`, `APELLIDOS`, `DNI`) VALUES (1, 'Sistema', 'Administrador', 'admin');

COMMIT;

-- -----------------------------------------------------
-- Data for table `sgstt`.`PERFIL`
-- -----------------------------------------------------
START TRANSACTION;
USE `sgstt`;
INSERT INTO `sgstt`.`PERFIL` (`idPERFIL`, `NOMBRE`, `ESTADO`) VALUES (1, 'Administrador del Sistema', 1);
INSERT INTO `sgstt`.`PERFIL` (`idPERFIL`, `NOMBRE`, `ESTADO`) VALUES (2, 'Encargador de Servicios', 1);

COMMIT;

-- -----------------------------------------------------
-- Data for table `sgstt`.`USUARIO`
-- -----------------------------------------------------
START TRANSACTION;
USE `sgstt`;
INSERT INTO `sgstt`.`USUARIO` (`idUSUARIO`, `idPERFIL`, `idEMPLEADO`, `idSede`, `NICK`, `CLAVE`, `ESTADO`) VALUES (1, 1, 1, 1, 'admin', 'admin1234', 1);

COMMIT;

-- -----------------------------------------------------
-- Data for table `sgstt`.`MODULO`
-- -----------------------------------------------------
START TRANSACTION;
USE `sgstt`;
INSERT INTO `sgstt`.`MODULO` (`idMODULO`, `NOMBRE`, `URL`, `LISTAR`, `CREAR`, `ACTUALIZAR`, `ELIMINAR`, `ESTADO`) VALUES (1, 'Administrar Perfil', 'perfil', 1, 1, 1, 1, 1);
INSERT INTO `sgstt`.`MODULO` (`idMODULO`, `NOMBRE`, `URL`, `LISTAR`, `CREAR`, `ACTUALIZAR`, `ELIMINAR`, `ESTADO`) VALUES (2, 'Administrar Modulos', 'modulo', 1, 0, 1, 0, 1);
INSERT INTO `sgstt`.`MODULO` (`idMODULO`, `NOMBRE`, `URL`, `LISTAR`, `CREAR`, `ACTUALIZAR`, `ELIMINAR`, `ESTADO`) VALUES (3, 'Administrar Cuenta', 'cuenta', 1, 1, 1, 1, 1);
INSERT INTO `sgstt`.`MODULO` (`idMODULO`, `NOMBRE`, `URL`, `LISTAR`, `CREAR`, `ACTUALIZAR`, `ELIMINAR`, `ESTADO`) VALUES (4, 'Administrar File', 'file', 1, 1, 1, 1, 1);
INSERT INTO `sgstt`.`MODULO` (`idMODULO`, `NOMBRE`, `URL`, `LISTAR`, `CREAR`, `ACTUALIZAR`, `ELIMINAR`, `ESTADO`) VALUES (5, 'Administrar Orden Servicios', 'ordenServicio', 1, 1, 1, 1, 1);
INSERT INTO `sgstt`.`MODULO` (`idMODULO`, `NOMBRE`, `URL`, `LISTAR`, `CREAR`, `ACTUALIZAR`, `ELIMINAR`, `ESTADO`) VALUES (6, 'Administrar Tarifario', 'tarifa', 1, 1, 1, 1, 1);
INSERT INTO `sgstt`.`MODULO` (`idMODULO`, `NOMBRE`, `URL`, `LISTAR`, `CREAR`, `ACTUALIZAR`, `ELIMINAR`, `ESTADO`) VALUES (7, 'Administrar Vehiculo', 'vehiculo', 1, 1, 1, 1, 1);
INSERT INTO `sgstt`.`MODULO` (`idMODULO`, `NOMBRE`, `URL`, `LISTAR`, `CREAR`, `ACTUALIZAR`, `ELIMINAR`, `ESTADO`) VALUES (8, 'Administrar Incidencia', 'incidencia', 1, 1, 1, 1, 1);
INSERT INTO `sgstt`.`MODULO` (`idMODULO`, `NOMBRE`, `URL`, `LISTAR`, `CREAR`, `ACTUALIZAR`, `ELIMINAR`, `ESTADO`) VALUES (9, 'Administrar Choferes', 'chofer', 1, 1, 1, 1, 1);
INSERT INTO `sgstt`.`MODULO` (`idMODULO`, `NOMBRE`, `URL`, `LISTAR`, `CREAR`, `ACTUALIZAR`, `ELIMINAR`, `ESTADO`) VALUES (10, 'Administrar Cliente', 'cliente', 1, 1, 1, 1, 1);
INSERT INTO `sgstt`.`MODULO` (`idMODULO`, `NOMBRE`, `URL`, `LISTAR`, `CREAR`, `ACTUALIZAR`, `ELIMINAR`, `ESTADO`) VALUES (11, 'Administrar Destino', 'destino', 1, 1, 1, 1, 1);
INSERT INTO `sgstt`.`MODULO` (`idMODULO`, `NOMBRE`, `URL`, `LISTAR`, `CREAR`, `ACTUALIZAR`, `ELIMINAR`, `ESTADO`) VALUES (12, 'Administrar Tipo Servicio', 'tipoServicio', 1, 1, 1, 1, 1);
INSERT INTO `sgstt`.`MODULO` (`idMODULO`, `NOMBRE`, `URL`, `LISTAR`, `CREAR`, `ACTUALIZAR`, `ELIMINAR`, `ESTADO`) VALUES (13, 'Administrar Servicios', 'servicio', 1, 1, 1, 1, 1);

COMMIT;

-- -----------------------------------------------------
-- Data for table `sgstt`.`PERMISO`
-- -----------------------------------------------------
START TRANSACTION;
USE `sgstt`;
INSERT INTO `sgstt`.`PERMISO` (`idPERMISO`, `idPERFIL`, `idMODULO`, `LISTAR`, `CREAR`, `ACTUALIZAR`, `ELIMINAR`) VALUES (1, 1, 1, 1, 1, 1, 1);
INSERT INTO `sgstt`.`PERMISO` (`idPERMISO`, `idPERFIL`, `idMODULO`, `LISTAR`, `CREAR`, `ACTUALIZAR`, `ELIMINAR`) VALUES (2, 1, 2, 1, 0, 1, 0);
INSERT INTO `sgstt`.`PERMISO` (`idPERMISO`, `idPERFIL`, `idMODULO`, `LISTAR`, `CREAR`, `ACTUALIZAR`, `ELIMINAR`) VALUES (3, 1, 3, 1, 1, 1, 1);
INSERT INTO `sgstt`.`PERMISO` (`idPERMISO`, `idPERFIL`, `idMODULO`, `LISTAR`, `CREAR`, `ACTUALIZAR`, `ELIMINAR`) VALUES (4, 1, 4, 1, 1, 1, 1);
INSERT INTO `sgstt`.`PERMISO` (`idPERMISO`, `idPERFIL`, `idMODULO`, `LISTAR`, `CREAR`, `ACTUALIZAR`, `ELIMINAR`) VALUES (5, 1, 5, 1, 1, 1, 1);
INSERT INTO `sgstt`.`PERMISO` (`idPERMISO`, `idPERFIL`, `idMODULO`, `LISTAR`, `CREAR`, `ACTUALIZAR`, `ELIMINAR`) VALUES (6, 1, 6, 1, 1, 1, 1);
INSERT INTO `sgstt`.`PERMISO` (`idPERMISO`, `idPERFIL`, `idMODULO`, `LISTAR`, `CREAR`, `ACTUALIZAR`, `ELIMINAR`) VALUES (7, 1, 7, 1, 1, 1, 1);
INSERT INTO `sgstt`.`PERMISO` (`idPERMISO`, `idPERFIL`, `idMODULO`, `LISTAR`, `CREAR`, `ACTUALIZAR`, `ELIMINAR`) VALUES (8, 1, 8, 1, 1, 1, 1);
INSERT INTO `sgstt`.`PERMISO` (`idPERMISO`, `idPERFIL`, `idMODULO`, `LISTAR`, `CREAR`, `ACTUALIZAR`, `ELIMINAR`) VALUES (9, 1, 9, 1, 1, 1, 1);
INSERT INTO `sgstt`.`PERMISO` (`idPERMISO`, `idPERFIL`, `idMODULO`, `LISTAR`, `CREAR`, `ACTUALIZAR`, `ELIMINAR`) VALUES (10, 1, 10, 1, 1, 1, 1);
INSERT INTO `sgstt`.`PERMISO` (`idPERMISO`, `idPERFIL`, `idMODULO`, `LISTAR`, `CREAR`, `ACTUALIZAR`, `ELIMINAR`) VALUES (11, 1, 11, 1, 1, 1, 1);
INSERT INTO `sgstt`.`PERMISO` (`idPERMISO`, `idPERFIL`, `idMODULO`, `LISTAR`, `CREAR`, `ACTUALIZAR`, `ELIMINAR`) VALUES (12, 1, 12, 1, 1, 1, 1);
INSERT INTO `sgstt`.`PERMISO` (`idPERMISO`, `idPERFIL`, `idMODULO`, `LISTAR`, `CREAR`, `ACTUALIZAR`, `ELIMINAR`) VALUES (13, 1, 13, 1, 1, 1, 1);

COMMIT;

-- -----------------------------------------------------
-- Data for table `sgstt`.`Destinos`
-- -----------------------------------------------------
START TRANSACTION;
USE `sgstt`;
INSERT INTO `sgstt`.`Destinos` (`idDestinos`, `NOMBRE`, `LATITUD`, `LONGITUD`, `ESTADO`) VALUES (1, 'AEROPUERTO LAN', '1', '1', 1);
INSERT INTO `sgstt`.`Destinos` (`idDestinos`, `NOMBRE`, `LATITUD`, `LONGITUD`, `ESTADO`) VALUES (2, 'HOTEL SHERATON', '2', '2', 1);
INSERT INTO `sgstt`.`Destinos` (`idDestinos`, `NOMBRE`, `LATITUD`, `LONGITUD`, `ESTADO`) VALUES (3, 'HOTEL MARRIOT', '1', '2', 1);
INSERT INTO `sgstt`.`Destinos` (`idDestinos`, `NOMBRE`, `LATITUD`, `LONGITUD`, `ESTADO`) VALUES (4, 'HOTEL CONQUISTADORES', '1', '2', 1);

COMMIT;

-- -----------------------------------------------------
-- Data for table `sgstt`.`servicio_destinos`
-- -----------------------------------------------------
START TRANSACTION;
USE `sgstt`;
INSERT INTO `sgstt`.`servicio_destinos` (`servicio_idservicio`, `Destinos_idDestinos`) VALUES (1, 1);
INSERT INTO `sgstt`.`servicio_destinos` (`servicio_idservicio`, `Destinos_idDestinos`) VALUES (1, 2);
INSERT INTO `sgstt`.`servicio_destinos` (`servicio_idservicio`, `Destinos_idDestinos`) VALUES (2, 1);
INSERT INTO `sgstt`.`servicio_destinos` (`servicio_idservicio`, `Destinos_idDestinos`) VALUES (2, 3);
INSERT INTO `sgstt`.`servicio_destinos` (`servicio_idservicio`, `Destinos_idDestinos`) VALUES (3, 1);
INSERT INTO `sgstt`.`servicio_destinos` (`servicio_idservicio`, `Destinos_idDestinos`) VALUES (3, 4);

COMMIT;
