SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

DROP SCHEMA IF EXISTS `SGSTT` ;
CREATE SCHEMA IF NOT EXISTS `SGSTT` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `SGSTT` ;

-- -----------------------------------------------------
-- Table `SGSTT`.`tipo_servicio`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SGSTT`.`tipo_servicio` ;

CREATE  TABLE IF NOT EXISTS `SGSTT`.`tipo_servicio` (
  `idtipo_servicio` INT NOT NULL AUTO_INCREMENT ,
  `descripcion` VARCHAR(45) NULL ,
  `ESTADO` TINYINT(1) NOT NULL DEFAULT 1 ,
  PRIMARY KEY (`idtipo_servicio`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SGSTT`.`trasladista`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SGSTT`.`trasladista` ;

CREATE  TABLE IF NOT EXISTS `SGSTT`.`trasladista` (
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
-- Table `SGSTT`.`Sede`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SGSTT`.`Sede` ;

CREATE  TABLE IF NOT EXISTS `SGSTT`.`Sede` (
  `idSede` INT NOT NULL AUTO_INCREMENT ,
  `descripcion` VARCHAR(200) NOT NULL ,
  PRIMARY KEY (`idSede`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SGSTT`.`chofer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SGSTT`.`chofer` ;

CREATE  TABLE IF NOT EXISTS `SGSTT`.`chofer` (
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
    REFERENCES `SGSTT`.`Sede` (`idSede` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SGSTT`.`marca`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SGSTT`.`marca` ;

CREATE  TABLE IF NOT EXISTS `SGSTT`.`marca` (
  `idmarca` INT NOT NULL AUTO_INCREMENT ,
  `nombreMarca` VARCHAR(45) NULL ,
  PRIMARY KEY (`idmarca`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SGSTT`.`tipo_vehiculo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SGSTT`.`tipo_vehiculo` ;

CREATE  TABLE IF NOT EXISTS `SGSTT`.`tipo_vehiculo` (
  `idtipo_vehiculo` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(45) NULL ,
  `capacidad` INT NULL ,
  PRIMARY KEY (`idtipo_vehiculo`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SGSTT`.`vehiculo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SGSTT`.`vehiculo` ;

CREATE  TABLE IF NOT EXISTS `SGSTT`.`vehiculo` (
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
    REFERENCES `SGSTT`.`marca` (`idmarca` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_vehículo_tipo vehiculo1`
    FOREIGN KEY (`idtipo_vehiculo` )
    REFERENCES `SGSTT`.`tipo_vehiculo` (`idtipo_vehiculo` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_vehiculo_Sede1`
    FOREIGN KEY (`idSede` )
    REFERENCES `SGSTT`.`Sede` (`idSede` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SGSTT`.`aerolinea`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SGSTT`.`aerolinea` ;

CREATE  TABLE IF NOT EXISTS `SGSTT`.`aerolinea` (
  `idaerolinea` INT NOT NULL AUTO_INCREMENT ,
  `descripcion` VARCHAR(45) NULL ,
  PRIMARY KEY (`idaerolinea`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SGSTT`.`vuelo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SGSTT`.`vuelo` ;

CREATE  TABLE IF NOT EXISTS `SGSTT`.`vuelo` (
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
    REFERENCES `SGSTT`.`aerolinea` (`idaerolinea` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SGSTT`.`tipo_servicio_has_vehículo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SGSTT`.`tipo_servicio_has_vehículo` ;

CREATE  TABLE IF NOT EXISTS `SGSTT`.`tipo_servicio_has_vehículo` (
  `tipo_servicio_idtipo_servicio` INT NOT NULL AUTO_INCREMENT ,
  `vehículo_idvehículo` INT NOT NULL ,
  PRIMARY KEY (`tipo_servicio_idtipo_servicio`, `vehículo_idvehículo`) ,
  INDEX `fk_tipo_servicio_has_vehículo_vehículo1_idx` (`vehículo_idvehículo` ASC) ,
  INDEX `fk_tipo_servicio_has_vehículo_tipo_servicio1_idx` (`tipo_servicio_idtipo_servicio` ASC) ,
  CONSTRAINT `fk_tipo_servicio_has_vehículo_tipo_servicio1`
    FOREIGN KEY (`tipo_servicio_idtipo_servicio` )
    REFERENCES `SGSTT`.`tipo_servicio` (`idtipo_servicio` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tipo_servicio_has_vehículo_vehículo1`
    FOREIGN KEY (`vehículo_idvehículo` )
    REFERENCES `SGSTT`.`vehiculo` (`idvehiculo` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SGSTT`.`servicio`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SGSTT`.`servicio` ;

CREATE  TABLE IF NOT EXISTS `SGSTT`.`servicio` (
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
    REFERENCES `SGSTT`.`tipo_servicio` (`idtipo_servicio` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_servicio_Sede1`
    FOREIGN KEY (`idSede` )
    REFERENCES `SGSTT`.`Sede` (`idSede` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SGSTT`.`tarifa`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SGSTT`.`tarifa` ;

CREATE  TABLE IF NOT EXISTS `SGSTT`.`tarifa` (
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
    REFERENCES `SGSTT`.`tipo_vehiculo` (`idtipo_vehiculo` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tarifa_servicio1`
    FOREIGN KEY (`idservicio` )
    REFERENCES `SGSTT`.`servicio` (`idservicio` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SGSTT`.`cobro`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SGSTT`.`cobro` ;

CREATE  TABLE IF NOT EXISTS `SGSTT`.`cobro` (
  `idcobro` INT NOT NULL ,
  `descuento` VARCHAR(45) NULL ,
  `adicional` VARCHAR(45) NULL ,
  `neto` VARCHAR(45) NULL ,
  `total` VARCHAR(45) NULL ,
  PRIMARY KEY (`idcobro`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SGSTT`.`modelo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SGSTT`.`modelo` ;

CREATE  TABLE IF NOT EXISTS `SGSTT`.`modelo` (
  `idmodelo` INT NOT NULL AUTO_INCREMENT ,
  `nombreModelo` VARCHAR(45) NULL ,
  `marca_idmarca` INT NOT NULL ,
  PRIMARY KEY (`idmodelo`, `marca_idmarca`) ,
  INDEX `fk_modelo_marca1_idx` (`marca_idmarca` ASC) ,
  CONSTRAINT `fk_modelo_marca1`
    FOREIGN KEY (`marca_idmarca` )
    REFERENCES `SGSTT`.`marca` (`idmarca` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SGSTT`.`tipo_incidencia`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SGSTT`.`tipo_incidencia` ;

CREATE  TABLE IF NOT EXISTS `SGSTT`.`tipo_incidencia` (
  `idtipo_incidencia` INT NOT NULL AUTO_INCREMENT ,
  `descripcion` VARCHAR(45) NULL ,
  PRIMARY KEY (`idtipo_incidencia`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SGSTT`.`estado_incidencia`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SGSTT`.`estado_incidencia` ;

CREATE  TABLE IF NOT EXISTS `SGSTT`.`estado_incidencia` (
  `idestado_incidencia` INT NOT NULL AUTO_INCREMENT ,
  `descripcion` VARCHAR(45) NULL ,
  PRIMARY KEY (`idestado_incidencia`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SGSTT`.`empresa`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SGSTT`.`empresa` ;

CREATE  TABLE IF NOT EXISTS `SGSTT`.`empresa` (
  `idempresa` INT NOT NULL AUTO_INCREMENT ,
  `razon_social` VARCHAR(45) NULL ,
  `ruc` VARCHAR(45) NULL ,
  `telefono` VARCHAR(45) NULL ,
  `celular` VARCHAR(45) NULL ,
  `correo` VARCHAR(45) NULL ,
  PRIMARY KEY (`idempresa`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SGSTT`.`empresa_chofer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SGSTT`.`empresa_chofer` ;

CREATE  TABLE IF NOT EXISTS `SGSTT`.`empresa_chofer` (
  `idempresa_chofer` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(60) NULL ,
  `apellido` VARCHAR(60) NULL ,
  `dni` VARCHAR(8) NULL ,
  `empresa_idempresa` INT NOT NULL ,
  PRIMARY KEY (`idempresa_chofer`) ,
  INDEX `fk_empresa_chofer_empresa1_idx` (`empresa_idempresa` ASC) ,
  CONSTRAINT `fk_empresa_chofer_empresa1`
    FOREIGN KEY (`empresa_idempresa` )
    REFERENCES `SGSTT`.`empresa` (`idempresa` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SGSTT`.`empresa_vehiculo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SGSTT`.`empresa_vehiculo` ;

CREATE  TABLE IF NOT EXISTS `SGSTT`.`empresa_vehiculo` (
  `idempresa_vehiculo` INT NOT NULL AUTO_INCREMENT ,
  `marca` VARCHAR(25) NULL ,
  `placa` VARCHAR(16) NULL ,
  `empresa_idempresa` INT NOT NULL ,
  PRIMARY KEY (`idempresa_vehiculo`) ,
  INDEX `fk_empresa_vehiculo_empresa1_idx` (`empresa_idempresa` ASC) ,
  CONSTRAINT `fk_empresa_vehiculo_empresa1`
    FOREIGN KEY (`empresa_idempresa` )
    REFERENCES `SGSTT`.`empresa` (`idempresa` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SGSTT`.`Tipo_Cliente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SGSTT`.`Tipo_Cliente` ;

CREATE  TABLE IF NOT EXISTS `SGSTT`.`Tipo_Cliente` (
  `id_TipoCliente` INT NOT NULL AUTO_INCREMENT ,
  `Tipo_Cliente` VARCHAR(45) NULL ,
  PRIMARY KEY (`id_TipoCliente`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SGSTT`.`Cliente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SGSTT`.`Cliente` ;

CREATE  TABLE IF NOT EXISTS `SGSTT`.`Cliente` (
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
    REFERENCES `SGSTT`.`Tipo_Cliente` (`id_TipoCliente` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SGSTT`.`EMPLEADO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SGSTT`.`EMPLEADO` ;

CREATE  TABLE IF NOT EXISTS `SGSTT`.`EMPLEADO` (
  `idEMPLEADO` INT NOT NULL AUTO_INCREMENT ,
  `NOMBRE` VARCHAR(45) NOT NULL ,
  `APELLIDOS` VARCHAR(45) NOT NULL ,
  `DNI` VARCHAR(8) NOT NULL ,
  PRIMARY KEY (`idEMPLEADO`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SGSTT`.`File`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SGSTT`.`File` ;

CREATE  TABLE IF NOT EXISTS `SGSTT`.`File` (
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
    REFERENCES `SGSTT`.`Cliente` (`idCliente` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_File_EMPLEADO1`
    FOREIGN KEY (`idEMPLEADO` )
    REFERENCES `SGSTT`.`EMPLEADO` (`idEMPLEADO` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SGSTT`.`venta_directa`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SGSTT`.`venta_directa` ;

CREATE  TABLE IF NOT EXISTS `SGSTT`.`venta_directa` (
  `idventa` INT NOT NULL AUTO_INCREMENT ,
  `serie` VARCHAR(10) NOT NULL DEFAULT 'VTA' ,
  PRIMARY KEY (`idventa`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SGSTT`.`servicio_detalle`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SGSTT`.`servicio_detalle` ;

CREATE  TABLE IF NOT EXISTS `SGSTT`.`servicio_detalle` (
  `idservicio_detalle` INT NOT NULL AUTO_INCREMENT ,
  `idservicio` INT NOT NULL ,
  `num_personas` INT NOT NULL ,
  `FECHA` DATETIME NOT NULL ,
  `externalizado` VARCHAR(2) NOT NULL DEFAULT 'NO' ,
  `PRECIO_SERVICIO` DECIMAL(12,2) NULL ,
  `DESCUENTO` DECIMAL(12,2) NULL ,
  `ADICIONAL` DECIMAL(12,2) NULL ,
  `GRAVADA` TINYINT(1) NOT NULL DEFAULT 1 ,
  `DIAS_VIAJE` INT NULL ,
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
    REFERENCES `SGSTT`.`trasladista` (`idtrasladista` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_servicio_detalle_cobro1`
    FOREIGN KEY (`idcobro` )
    REFERENCES `SGSTT`.`cobro` (`idcobro` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_servicio_detalle_servicio1`
    FOREIGN KEY (`idservicio` )
    REFERENCES `SGSTT`.`servicio` (`idservicio` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_servicio_detalle_vuelo1`
    FOREIGN KEY (`idvuelo` )
    REFERENCES `SGSTT`.`vuelo` (`idvuelo` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_servicio_detalle_chofer1`
    FOREIGN KEY (`idchofer` )
    REFERENCES `SGSTT`.`chofer` (`idchofer` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_servicio_detalle_vehiculo1`
    FOREIGN KEY (`idvehiculo` )
    REFERENCES `SGSTT`.`vehiculo` (`idvehiculo` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_servicio_detalle_empresa_chofer1`
    FOREIGN KEY (`idempresa_chofer` )
    REFERENCES `SGSTT`.`empresa_chofer` (`idempresa_chofer` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_servicio_detalle_empresa_vehiculo1`
    FOREIGN KEY (`idempresa_vehiculo` )
    REFERENCES `SGSTT`.`empresa_vehiculo` (`idempresa_vehiculo` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_servicio_detalle_File1`
    FOREIGN KEY (`idFile` )
    REFERENCES `SGSTT`.`File` (`idFile` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_servicio_detalle_venta_directa1`
    FOREIGN KEY (`idventa` )
    REFERENCES `SGSTT`.`venta_directa` (`idventa` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SGSTT`.`incidencia`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SGSTT`.`incidencia` ;

CREATE  TABLE IF NOT EXISTS `SGSTT`.`incidencia` (
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
    REFERENCES `SGSTT`.`tipo_incidencia` (`idtipo_incidencia` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_incidencia_estado_incidencia1`
    FOREIGN KEY (`idestado_incidencia` )
    REFERENCES `SGSTT`.`estado_incidencia` (`idestado_incidencia` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_incidencia_servicio_detalle1`
    FOREIGN KEY (`idservicio_detalle` )
    REFERENCES `SGSTT`.`servicio_detalle` (`idservicio_detalle` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SGSTT`.`PERFIL`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SGSTT`.`PERFIL` ;

CREATE  TABLE IF NOT EXISTS `SGSTT`.`PERFIL` (
  `idPERFIL` INT NOT NULL AUTO_INCREMENT ,
  `NOMBRE` VARCHAR(200) NOT NULL ,
  `ESTADO` TINYINT(1) NOT NULL DEFAULT 1 ,
  PRIMARY KEY (`idPERFIL`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SGSTT`.`USUARIO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SGSTT`.`USUARIO` ;

CREATE  TABLE IF NOT EXISTS `SGSTT`.`USUARIO` (
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
    REFERENCES `SGSTT`.`PERFIL` (`idPERFIL` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_USUARIO_EMPLEADO1`
    FOREIGN KEY (`idEMPLEADO` )
    REFERENCES `SGSTT`.`EMPLEADO` (`idEMPLEADO` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_USUARIO_Sede1`
    FOREIGN KEY (`idSede` )
    REFERENCES `SGSTT`.`Sede` (`idSede` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SGSTT`.`MODULO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SGSTT`.`MODULO` ;

CREATE  TABLE IF NOT EXISTS `SGSTT`.`MODULO` (
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
-- Table `SGSTT`.`PERMISO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SGSTT`.`PERMISO` ;

CREATE  TABLE IF NOT EXISTS `SGSTT`.`PERMISO` (
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
    REFERENCES `SGSTT`.`PERFIL` (`idPERFIL` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PERMISO_MODULO1`
    FOREIGN KEY (`idMODULO` )
    REFERENCES `SGSTT`.`MODULO` (`idMODULO` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SGSTT`.`Destinos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SGSTT`.`Destinos` ;

CREATE  TABLE IF NOT EXISTS `SGSTT`.`Destinos` (
  `idDestinos` INT NOT NULL AUTO_INCREMENT ,
  `NOMBRE` VARCHAR(300) NOT NULL ,
  `LATITUD` VARCHAR(50) NULL ,
  `LONGITUD` VARCHAR(50) NULL ,
  `ESTADO` TINYINT(1) NOT NULL DEFAULT 1 ,
  PRIMARY KEY (`idDestinos`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SGSTT`.`servicio_destinos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SGSTT`.`servicio_destinos` ;

CREATE  TABLE IF NOT EXISTS `SGSTT`.`servicio_destinos` (
  `servicio_idservicio` INT NOT NULL ,
  `Destinos_idDestinos` INT NOT NULL ,
  PRIMARY KEY (`servicio_idservicio`, `Destinos_idDestinos`) ,
  INDEX `fk_servicio_has_Destinos_Destinos1` (`Destinos_idDestinos` ASC) ,
  INDEX `fk_servicio_has_Destinos_servicio1` (`servicio_idservicio` ASC) ,
  CONSTRAINT `fk_servicio_has_Destinos_servicio1`
    FOREIGN KEY (`servicio_idservicio` )
    REFERENCES `SGSTT`.`servicio` (`idservicio` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_servicio_has_Destinos_Destinos1`
    FOREIGN KEY (`Destinos_idDestinos` )
    REFERENCES `SGSTT`.`Destinos` (`idDestinos` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `SGSTT`.`tipo_servicio`
-- -----------------------------------------------------
START TRANSACTION;
USE `SGSTT`;
INSERT INTO `SGSTT`.`tipo_servicio` (`idtipo_servicio`, `descripcion`, `ESTADO`) VALUES (1, 'TRASLADO', 1);
INSERT INTO `SGSTT`.`tipo_servicio` (`idtipo_servicio`, `descripcion`, `ESTADO`) VALUES (2, 'EXCURSION', 1);
INSERT INTO `SGSTT`.`tipo_servicio` (`idtipo_servicio`, `descripcion`, `ESTADO`) VALUES (3, 'VIAJE', 1);

COMMIT;

-- -----------------------------------------------------
-- Data for table `SGSTT`.`trasladista`
-- -----------------------------------------------------
START TRANSACTION;
USE `SGSTT`;
INSERT INTO `SGSTT`.`trasladista` (`idtrasladista`, `nombre`, `apellido`, `dni`, `direccion`, `correo`, `telefono`, `celular`, `estado`) VALUES (0001, 'Juan', 'Sotelo', '44598764', 'J r Laroc', 'cjjccckl', '7437434', '987654345', 1);
INSERT INTO `SGSTT`.`trasladista` (`idtrasladista`, `nombre`, `apellido`, `dni`, `direccion`, `correo`, `telefono`, `celular`, `estado`) VALUES (0002, 'Manuel', 'Saravia', '12547698', 'Arequipa 45', 'cfdfdsf', '5457854', '965874123', 1);

COMMIT;

-- -----------------------------------------------------
-- Data for table `SGSTT`.`Sede`
-- -----------------------------------------------------
START TRANSACTION;
USE `SGSTT`;
INSERT INTO `SGSTT`.`Sede` (`idSede`, `descripcion`) VALUES (1, 'LIMA');
INSERT INTO `SGSTT`.`Sede` (`idSede`, `descripcion`) VALUES (2, 'CUSCO');

COMMIT;

-- -----------------------------------------------------
-- Data for table `SGSTT`.`chofer`
-- -----------------------------------------------------
START TRANSACTION;
USE `SGSTT`;
INSERT INTO `SGSTT`.`chofer` (`idchofer`, `idSede`, `nombre`, `apellido`, `dni`, `categoria`, `ESTADO`) VALUES (1, 1, 'Ruben', 'Ramirezz', '72502828', 'A1', 1);
INSERT INTO `SGSTT`.`chofer` (`idchofer`, `idSede`, `nombre`, `apellido`, `dni`, `categoria`, `ESTADO`) VALUES (2, 1, 'Oscar', 'Mendivil', '09876543', 'A2', 1);
INSERT INTO `SGSTT`.`chofer` (`idchofer`, `idSede`, `nombre`, `apellido`, `dni`, `categoria`, `ESTADO`) VALUES (3, 1, 'Robert', 'Manrique', '12457896', 'A3', 1);

COMMIT;

-- -----------------------------------------------------
-- Data for table `SGSTT`.`marca`
-- -----------------------------------------------------
START TRANSACTION;
USE `SGSTT`;
INSERT INTO `SGSTT`.`marca` (`idmarca`, `nombreMarca`) VALUES (1, 'ZZZ');
INSERT INTO `SGSTT`.`marca` (`idmarca`, `nombreMarca`) VALUES (2, 'YYY');

COMMIT;

-- -----------------------------------------------------
-- Data for table `SGSTT`.`tipo_vehiculo`
-- -----------------------------------------------------
START TRANSACTION;
USE `SGSTT`;
INSERT INTO `SGSTT`.`tipo_vehiculo` (`idtipo_vehiculo`, `nombre`, `capacidad`) VALUES (1, 'SPRINTER L.', 20);
INSERT INTO `SGSTT`.`tipo_vehiculo` (`idtipo_vehiculo`, `nombre`, `capacidad`) VALUES (2, 'MINI-BUS', 10);

COMMIT;

-- -----------------------------------------------------
-- Data for table `SGSTT`.`vehiculo`
-- -----------------------------------------------------
START TRANSACTION;
USE `SGSTT`;
INSERT INTO `SGSTT`.`vehiculo` (`idvehiculo`, `idSede`, `descripcion`, `placa`, `ESTADO`, `año_fabricacion`, `capacidad_max`, `capacidad_recomendada`, `color`, `idtipo_vehiculo`, `marca_idmarca`, `fecha_registro`, `fecha_modificacion`) VALUES (1, 1, 'VAN-H1', '123-agb', 1, '2010', '12', '10', 'negro', 1, 1, '2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO `SGSTT`.`vehiculo` (`idvehiculo`, `idSede`, `descripcion`, `placa`, `ESTADO`, `año_fabricacion`, `capacidad_max`, `capacidad_recomendada`, `color`, `idtipo_vehiculo`, `marca_idmarca`, `fecha_registro`, `fecha_modificacion`) VALUES (2, 1, 'Sprinter-2', 'abc-789', 1, '2012', '40', '36', 'plata', 1, 1, '2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO `SGSTT`.`vehiculo` (`idvehiculo`, `idSede`, `descripcion`, `placa`, `ESTADO`, `año_fabricacion`, `capacidad_max`, `capacidad_recomendada`, `color`, `idtipo_vehiculo`, `marca_idmarca`, `fecha_registro`, `fecha_modificacion`) VALUES (3, 1, 'Bus-3', '345-ret', 1, '2009', '50', '45', NULL, 1, 1, '2015-05-27 19:56:47', '2015-05-27 19:56:47');

COMMIT;

-- -----------------------------------------------------
-- Data for table `SGSTT`.`aerolinea`
-- -----------------------------------------------------
START TRANSACTION;
USE `SGSTT`;
INSERT INTO `SGSTT`.`aerolinea` (`idaerolinea`, `descripcion`) VALUES (1, 'Avianca');
INSERT INTO `SGSTT`.`aerolinea` (`idaerolinea`, `descripcion`) VALUES (2, 'LAN-Peru');
INSERT INTO `SGSTT`.`aerolinea` (`idaerolinea`, `descripcion`) VALUES (3, 'LAN-Chile');

COMMIT;

-- -----------------------------------------------------
-- Data for table `SGSTT`.`vuelo`
-- -----------------------------------------------------
START TRANSACTION;
USE `SGSTT`;
INSERT INTO `SGSTT`.`vuelo` (`idvuelo`, `descripcion`, `origen`, `destino`, `horario`, `idaerolinea`) VALUES (1, 'AV141', 'BOGOTA', 'LIMA', NULL, 1);
INSERT INTO `SGSTT`.`vuelo` (`idvuelo`, `descripcion`, `origen`, `destino`, `horario`, `idaerolinea`) VALUES (2, 'LA2027', 'CARACAS', 'LIMA', NULL, 2);

COMMIT;

-- -----------------------------------------------------
-- Data for table `SGSTT`.`servicio`
-- -----------------------------------------------------
START TRANSACTION;
USE `SGSTT`;
INSERT INTO `SGSTT`.`servicio` (`idservicio`, `idSede`, `descripcion`, `ESTADO`, `idtipo_servicio`) VALUES (1, 1, 'APTO - LIMA - SHERATON', 1, 1);
INSERT INTO `SGSTT`.`servicio` (`idservicio`, `idSede`, `descripcion`, `ESTADO`, `idtipo_servicio`) VALUES (2, 1, 'APTO - MIRAFLORES - MARRIOT', 1, 1);
INSERT INTO `SGSTT`.`servicio` (`idservicio`, `idSede`, `descripcion`, `ESTADO`, `idtipo_servicio`) VALUES (3, 1, 'APTO - SAN ISIDRO - CONQUISTADORES', 1, 1);

COMMIT;

-- -----------------------------------------------------
-- Data for table `SGSTT`.`tipo_incidencia`
-- -----------------------------------------------------
START TRANSACTION;
USE `SGSTT`;
INSERT INTO `SGSTT`.`tipo_incidencia` (`idtipo_incidencia`, `descripcion`) VALUES (1, 'Demora Pasajeros');
INSERT INTO `SGSTT`.`tipo_incidencia` (`idtipo_incidencia`, `descripcion`) VALUES (2, 'Horas adicionales');

COMMIT;

-- -----------------------------------------------------
-- Data for table `SGSTT`.`estado_incidencia`
-- -----------------------------------------------------
START TRANSACTION;
USE `SGSTT`;
INSERT INTO `SGSTT`.`estado_incidencia` (`idestado_incidencia`, `descripcion`) VALUES (1, 'pendiente');
INSERT INTO `SGSTT`.`estado_incidencia` (`idestado_incidencia`, `descripcion`) VALUES (2, 'atendida');

COMMIT;

-- -----------------------------------------------------
-- Data for table `SGSTT`.`empresa`
-- -----------------------------------------------------
START TRANSACTION;
USE `SGSTT`;
INSERT INTO `SGSTT`.`empresa` (`idempresa`, `razon_social`, `ruc`, `telefono`, `celular`, `correo`) VALUES (1, 'TARAKATOURS', NULL, NULL, NULL, NULL);

COMMIT;

-- -----------------------------------------------------
-- Data for table `SGSTT`.`empresa_chofer`
-- -----------------------------------------------------
START TRANSACTION;
USE `SGSTT`;
INSERT INTO `SGSTT`.`empresa_chofer` (`idempresa_chofer`, `nombre`, `apellido`, `dni`, `empresa_idempresa`) VALUES (1, 'Rodrigo', 'Rosas', '12345678', 1);

COMMIT;

-- -----------------------------------------------------
-- Data for table `SGSTT`.`empresa_vehiculo`
-- -----------------------------------------------------
START TRANSACTION;
USE `SGSTT`;
INSERT INTO `SGSTT`.`empresa_vehiculo` (`idempresa_vehiculo`, `marca`, `placa`, `empresa_idempresa`) VALUES (1, 'hyundai', '124-afg', 1);

COMMIT;

-- -----------------------------------------------------
-- Data for table `SGSTT`.`Tipo_Cliente`
-- -----------------------------------------------------
START TRANSACTION;
USE `SGSTT`;
INSERT INTO `SGSTT`.`Tipo_Cliente` (`id_TipoCliente`, `Tipo_Cliente`) VALUES (1, 'NATURAL');
INSERT INTO `SGSTT`.`Tipo_Cliente` (`id_TipoCliente`, `Tipo_Cliente`) VALUES (2, 'JURIDICO');

COMMIT;

-- -----------------------------------------------------
-- Data for table `SGSTT`.`Cliente`
-- -----------------------------------------------------
START TRANSACTION;
USE `SGSTT`;
INSERT INTO `SGSTT`.`Cliente` (`idCliente`, `Nombre`, `NumeroDocumento`, `RazonSocial`, `Direccion`, `ESTADO`, `TIPO_DOCUMENTO`, `Correo`, `id_TipoCliente`) VALUES (1, '', NULL, 'GEBECO', NULL, 1, 'RUC', NULL, 2);
INSERT INTO `SGSTT`.`Cliente` (`idCliente`, `Nombre`, `NumeroDocumento`, `RazonSocial`, `Direccion`, `ESTADO`, `TIPO_DOCUMENTO`, `Correo`, `id_TipoCliente`) VALUES (2, '', NULL, 'AVS', NULL, 1, 'RUC', NULL, 2);
INSERT INTO `SGSTT`.`Cliente` (`idCliente`, `Nombre`, `NumeroDocumento`, `RazonSocial`, `Direccion`, `ESTADO`, `TIPO_DOCUMENTO`, `Correo`, `id_TipoCliente`) VALUES (3, '', NULL, 'SETOURS', NULL, 1, 'RUC', NULL, 2);

COMMIT;

-- -----------------------------------------------------
-- Data for table `SGSTT`.`EMPLEADO`
-- -----------------------------------------------------
START TRANSACTION;
USE `SGSTT`;
INSERT INTO `SGSTT`.`EMPLEADO` (`idEMPLEADO`, `NOMBRE`, `APELLIDOS`, `DNI`) VALUES (1, 'Sistema', 'Administrador', 'admin');

COMMIT;

-- -----------------------------------------------------
-- Data for table `SGSTT`.`PERFIL`
-- -----------------------------------------------------
START TRANSACTION;
USE `SGSTT`;
INSERT INTO `SGSTT`.`PERFIL` (`idPERFIL`, `NOMBRE`, `ESTADO`) VALUES (1, 'Administrador del Sistema', 1);
INSERT INTO `SGSTT`.`PERFIL` (`idPERFIL`, `NOMBRE`, `ESTADO`) VALUES (2, 'Encargador de Servicios', 1);

COMMIT;

-- -----------------------------------------------------
-- Data for table `SGSTT`.`USUARIO`
-- -----------------------------------------------------
START TRANSACTION;
USE `SGSTT`;
INSERT INTO `SGSTT`.`USUARIO` (`idUSUARIO`, `idPERFIL`, `idEMPLEADO`, `idSede`, `NICK`, `CLAVE`, `ESTADO`) VALUES (1, 1, 1, 1, 'admin', 'admin1234', 1);

COMMIT;

-- -----------------------------------------------------
-- Data for table `SGSTT`.`MODULO`
-- -----------------------------------------------------
START TRANSACTION;
USE `SGSTT`;
INSERT INTO `SGSTT`.`MODULO` (`idMODULO`, `NOMBRE`, `URL`, `LISTAR`, `CREAR`, `ACTUALIZAR`, `ELIMINAR`, `ESTADO`) VALUES (1, 'Administrar Perfil', 'perfil', 1, 1, 1, 1, 1);
INSERT INTO `SGSTT`.`MODULO` (`idMODULO`, `NOMBRE`, `URL`, `LISTAR`, `CREAR`, `ACTUALIZAR`, `ELIMINAR`, `ESTADO`) VALUES (2, 'Administrar Modulos', 'modulo', 1, 0, 1, 0, 1);
INSERT INTO `SGSTT`.`MODULO` (`idMODULO`, `NOMBRE`, `URL`, `LISTAR`, `CREAR`, `ACTUALIZAR`, `ELIMINAR`, `ESTADO`) VALUES (3, 'Administrar Cuenta', 'cuenta', 1, 1, 1, 1, 1);
INSERT INTO `SGSTT`.`MODULO` (`idMODULO`, `NOMBRE`, `URL`, `LISTAR`, `CREAR`, `ACTUALIZAR`, `ELIMINAR`, `ESTADO`) VALUES (4, 'Administrar File', 'file', 1, 1, 1, 1, 1);
INSERT INTO `SGSTT`.`MODULO` (`idMODULO`, `NOMBRE`, `URL`, `LISTAR`, `CREAR`, `ACTUALIZAR`, `ELIMINAR`, `ESTADO`) VALUES (5, 'Administrar Orden Servicios', 'ordenServicio', 1, 1, 1, 1, 1);
INSERT INTO `SGSTT`.`MODULO` (`idMODULO`, `NOMBRE`, `URL`, `LISTAR`, `CREAR`, `ACTUALIZAR`, `ELIMINAR`, `ESTADO`) VALUES (6, 'Administrar Tarifario', 'tarifa', 1, 1, 1, 1, 1);
INSERT INTO `SGSTT`.`MODULO` (`idMODULO`, `NOMBRE`, `URL`, `LISTAR`, `CREAR`, `ACTUALIZAR`, `ELIMINAR`, `ESTADO`) VALUES (7, 'Administrar Vehiculo', 'vehiculo', 1, 1, 1, 1, 1);
INSERT INTO `SGSTT`.`MODULO` (`idMODULO`, `NOMBRE`, `URL`, `LISTAR`, `CREAR`, `ACTUALIZAR`, `ELIMINAR`, `ESTADO`) VALUES (8, 'Administrar Incidencia', 'incidencia', 1, 1, 1, 1, 1);
INSERT INTO `SGSTT`.`MODULO` (`idMODULO`, `NOMBRE`, `URL`, `LISTAR`, `CREAR`, `ACTUALIZAR`, `ELIMINAR`, `ESTADO`) VALUES (9, 'Administrar Choferes', 'chofer', 1, 1, 1, 1, 1);
INSERT INTO `SGSTT`.`MODULO` (`idMODULO`, `NOMBRE`, `URL`, `LISTAR`, `CREAR`, `ACTUALIZAR`, `ELIMINAR`, `ESTADO`) VALUES (10, 'Administrar Cliente', 'cliente', 1, 1, 1, 1, 1);
INSERT INTO `SGSTT`.`MODULO` (`idMODULO`, `NOMBRE`, `URL`, `LISTAR`, `CREAR`, `ACTUALIZAR`, `ELIMINAR`, `ESTADO`) VALUES (11, 'Administrar Destino', 'destino', 1, 1, 1, 1, 1);
INSERT INTO `SGSTT`.`MODULO` (`idMODULO`, `NOMBRE`, `URL`, `LISTAR`, `CREAR`, `ACTUALIZAR`, `ELIMINAR`, `ESTADO`) VALUES (12, 'Administrar Tipo Servicio', 'tipoServicio', 1, 1, 1, 1, 1);
INSERT INTO `SGSTT`.`MODULO` (`idMODULO`, `NOMBRE`, `URL`, `LISTAR`, `CREAR`, `ACTUALIZAR`, `ELIMINAR`, `ESTADO`) VALUES (13, 'Administrar Servicios', 'servicio', 1, 1, 1, 1, 1);

COMMIT;

-- -----------------------------------------------------
-- Data for table `SGSTT`.`PERMISO`
-- -----------------------------------------------------
START TRANSACTION;
USE `SGSTT`;
INSERT INTO `SGSTT`.`PERMISO` (`idPERMISO`, `idPERFIL`, `idMODULO`, `LISTAR`, `CREAR`, `ACTUALIZAR`, `ELIMINAR`) VALUES (1, 1, 1, 1, 1, 1, 1);
INSERT INTO `SGSTT`.`PERMISO` (`idPERMISO`, `idPERFIL`, `idMODULO`, `LISTAR`, `CREAR`, `ACTUALIZAR`, `ELIMINAR`) VALUES (2, 1, 2, 1, 0, 1, 0);
INSERT INTO `SGSTT`.`PERMISO` (`idPERMISO`, `idPERFIL`, `idMODULO`, `LISTAR`, `CREAR`, `ACTUALIZAR`, `ELIMINAR`) VALUES (3, 1, 3, 1, 1, 1, 1);
INSERT INTO `SGSTT`.`PERMISO` (`idPERMISO`, `idPERFIL`, `idMODULO`, `LISTAR`, `CREAR`, `ACTUALIZAR`, `ELIMINAR`) VALUES (4, 1, 4, 1, 1, 1, 1);
INSERT INTO `SGSTT`.`PERMISO` (`idPERMISO`, `idPERFIL`, `idMODULO`, `LISTAR`, `CREAR`, `ACTUALIZAR`, `ELIMINAR`) VALUES (5, 1, 5, 1, 1, 1, 1);
INSERT INTO `SGSTT`.`PERMISO` (`idPERMISO`, `idPERFIL`, `idMODULO`, `LISTAR`, `CREAR`, `ACTUALIZAR`, `ELIMINAR`) VALUES (6, 1, 6, 1, 1, 1, 1);
INSERT INTO `SGSTT`.`PERMISO` (`idPERMISO`, `idPERFIL`, `idMODULO`, `LISTAR`, `CREAR`, `ACTUALIZAR`, `ELIMINAR`) VALUES (7, 1, 7, 1, 1, 1, 1);
INSERT INTO `SGSTT`.`PERMISO` (`idPERMISO`, `idPERFIL`, `idMODULO`, `LISTAR`, `CREAR`, `ACTUALIZAR`, `ELIMINAR`) VALUES (8, 1, 8, 1, 1, 1, 1);
INSERT INTO `SGSTT`.`PERMISO` (`idPERMISO`, `idPERFIL`, `idMODULO`, `LISTAR`, `CREAR`, `ACTUALIZAR`, `ELIMINAR`) VALUES (9, 1, 9, 1, 1, 1, 1);
INSERT INTO `SGSTT`.`PERMISO` (`idPERMISO`, `idPERFIL`, `idMODULO`, `LISTAR`, `CREAR`, `ACTUALIZAR`, `ELIMINAR`) VALUES (10, 1, 10, 1, 1, 1, 1);
INSERT INTO `SGSTT`.`PERMISO` (`idPERMISO`, `idPERFIL`, `idMODULO`, `LISTAR`, `CREAR`, `ACTUALIZAR`, `ELIMINAR`) VALUES (11, 1, 11, 1, 1, 1, 1);
INSERT INTO `SGSTT`.`PERMISO` (`idPERMISO`, `idPERFIL`, `idMODULO`, `LISTAR`, `CREAR`, `ACTUALIZAR`, `ELIMINAR`) VALUES (12, 1, 12, 1, 1, 1, 1);
INSERT INTO `SGSTT`.`PERMISO` (`idPERMISO`, `idPERFIL`, `idMODULO`, `LISTAR`, `CREAR`, `ACTUALIZAR`, `ELIMINAR`) VALUES (13, 1, 13, 1, 1, 1, 1);

COMMIT;

-- -----------------------------------------------------
-- Data for table `SGSTT`.`Destinos`
-- -----------------------------------------------------
START TRANSACTION;
USE `SGSTT`;
INSERT INTO `SGSTT`.`Destinos` (`idDestinos`, `NOMBRE`, `LATITUD`, `LONGITUD`, `ESTADO`) VALUES (1, 'AEROPUERTO LAN', '1', '1', 1);
INSERT INTO `SGSTT`.`Destinos` (`idDestinos`, `NOMBRE`, `LATITUD`, `LONGITUD`, `ESTADO`) VALUES (2, 'HOTEL SHERATON', '2', '2', 1);
INSERT INTO `SGSTT`.`Destinos` (`idDestinos`, `NOMBRE`, `LATITUD`, `LONGITUD`, `ESTADO`) VALUES (3, 'HOTEL MARRIOT', '1', '2', 1);
INSERT INTO `SGSTT`.`Destinos` (`idDestinos`, `NOMBRE`, `LATITUD`, `LONGITUD`, `ESTADO`) VALUES (4, 'HOTEL CONQUISTADORES', '1', '2', 1);

COMMIT;

-- -----------------------------------------------------
-- Data for table `SGSTT`.`servicio_destinos`
-- -----------------------------------------------------
START TRANSACTION;
USE `SGSTT`;
INSERT INTO `SGSTT`.`servicio_destinos` (`servicio_idservicio`, `Destinos_idDestinos`) VALUES (1, 1);
INSERT INTO `SGSTT`.`servicio_destinos` (`servicio_idservicio`, `Destinos_idDestinos`) VALUES (1, 2);
INSERT INTO `SGSTT`.`servicio_destinos` (`servicio_idservicio`, `Destinos_idDestinos`) VALUES (2, 1);
INSERT INTO `SGSTT`.`servicio_destinos` (`servicio_idservicio`, `Destinos_idDestinos`) VALUES (2, 3);
INSERT INTO `SGSTT`.`servicio_destinos` (`servicio_idservicio`, `Destinos_idDestinos`) VALUES (3, 1);
INSERT INTO `SGSTT`.`servicio_destinos` (`servicio_idservicio`, `Destinos_idDestinos`) VALUES (3, 4);

COMMIT;
