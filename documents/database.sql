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
  `estado` TINYINT(1) NOT NULL DEFAULT 1 ,
  PRIMARY KEY (`idtipo_servicio`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sgstt`.`sede`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sgstt`.`sede` ;

CREATE  TABLE IF NOT EXISTS `sgstt`.`sede` (
  `idsede` INT NOT NULL AUTO_INCREMENT ,
  `descripcion` VARCHAR(200) NOT NULL ,
  PRIMARY KEY (`idsede`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sgstt`.`trasladista`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sgstt`.`trasladista` ;

CREATE  TABLE IF NOT EXISTS `sgstt`.`trasladista` (
  `idtrasladista` INT NOT NULL AUTO_INCREMENT ,
  `idsede` INT NOT NULL ,
  `nombre` VARCHAR(60) NULL DEFAULT NULL ,
  `apellido` VARCHAR(80) NULL DEFAULT NULL ,
  `dni` VARCHAR(8) NULL DEFAULT NULL ,
  `direccion` VARCHAR(200) NULL  ,
  `correo` VARCHAR(100) NULL ,
  `telefono` VARCHAR(9) NULL  ,
  `celular` VARCHAR(11) NULL  ,
  `estado` TINYINT(4) NOT NULL DEFAULT 1 ,
  PRIMARY KEY (`idtrasladista`,`idsede`),
  INDEX `fk_trasladista_sede1` (`idsede` ASC) ,
  CONSTRAINT `fk_trasladista_sede1`
    FOREIGN KEY (`idsede` )
    REFERENCES `sgstt`.`sede` (`idsede` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `sgstt`.`chofer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sgstt`.`chofer` ;

CREATE  TABLE IF NOT EXISTS `sgstt`.`chofer` (
  `idchofer` INT NOT NULL AUTO_INCREMENT ,
  `idsede` INT NOT NULL ,
  `nombre` VARCHAR(45) NULL ,
  `apellido` VARCHAR(45) NULL ,
  `dni` VARCHAR(45) NULL ,
  `celular` VARCHAR(45) NULL ,
  `brevete` VARCHAR(45) NULL ,
  `fecha` DATETIME NOT NULL ,
  `categoria` VARCHAR(45) NULL ,
  `clave` VARCHAR(45) NOT NULL DEFAULT '12345678'  ,
  `estado` TINYINT(1) NOT NULL DEFAULT 1 ,
  `idempresa` INT NOT NULL, 
  PRIMARY KEY (`idchofer`, `idsede`) ,
  INDEX `fk_chofer_sede1` (`idsede` ASC) ,
  INDEX `fk_chofer_idempresa1` (`idempresa` ASC) ,
  CONSTRAINT `fk_chofer_sede1`
    FOREIGN KEY (`idsede` )
    REFERENCES `sgstt`.`sede` (`idsede` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
CONSTRAINT `fk_chofer_idempresa1`
    FOREIGN KEY (`idempresa` )
    REFERENCES `sgstt`.`empresa` (`idempresa` )
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
  `idsede` INT NOT NULL ,
  `descripcion` VARCHAR(45) NULL ,
  `placa` VARCHAR(7) NULL ,
  `estado` TINYINT(1) NOT NULL DEFAULT 1 ,
  `año_fabricacion` VARCHAR(4) NULL ,
  `capacidad_max` VARCHAR(3) NULL ,
  `capacidad_recomendada` VARCHAR(3) NULL ,
  `color` VARCHAR(25) NULL ,
  `idtipo_vehiculo` INT NOT NULL ,
  `marca_idmarca` INT NOT NULL ,
  `fecha_registro` DATETIME NULL ,
  `fecha_modificacion` DATETIME NULL ,
  PRIMARY KEY (`idvehiculo`, `idsede`) ,
  INDEX `descripcion` (`descripcion` ASC) ,
  CONSTRAINT `fk_vehiculo_marca1`
    FOREIGN KEY (`marca_idmarca` )
    REFERENCES `sgstt`.`marca` (`idmarca` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_vehiculo_tipo vehiculo1`
    FOREIGN KEY (`idtipo_vehiculo` )
    REFERENCES `sgstt`.`tipo_vehiculo` (`idtipo_vehiculo` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_vehiculo_sede1`
    FOREIGN KEY (`idsede` )
    REFERENCES `sgstt`.`sede` (`idsede` )
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
  `idsede` INT NOT NULL ,
  `descripcion` VARCHAR(45) NOT NULL ,
  `origen` VARCHAR(45) NULL ,
  `destino` VARCHAR(45) NULL ,
  `horario` VARCHAR(45) NULL ,
  `estado` TINYINT(1) NOT NULL DEFAULT 1 ,
  `idaerolinea` INT NOT NULL ,
  PRIMARY KEY (`idvuelo`, `idaerolinea`) ,
  INDEX `fk_vuelo_aerolinea1_idx` (`idaerolinea` ASC) ,
  CONSTRAINT `fk_vuelo_aerolinea1`
    FOREIGN KEY (`idaerolinea` )
    REFERENCES `sgstt`.`aerolinea` (`idaerolinea` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_vuelo_sede1`
    FOREIGN KEY (`idsede` )
    REFERENCES `sgstt`.`sede` (`idsede` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `sgstt`.`tipo_servicio_has_vehiculo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sgstt`.`tipo_servicio_has_vehiculo` ;

CREATE  TABLE IF NOT EXISTS `sgstt`.`tipo_servicio_has_vehiculo` (
  `tipo_servicio_idtipo_servicio` INT NOT NULL AUTO_INCREMENT ,
  `vehiculo_idvehiculo` INT NOT NULL ,
  PRIMARY KEY (`tipo_servicio_idtipo_servicio`, `vehiculo_idvehiculo`) ,
  INDEX `fk_tipo_servicio_has_vehiculo_vehiculo1_idx` (`vehiculo_idvehiculo` ASC) ,
  INDEX `fk_tipo_servicio_has_vehiculo_tipo_servicio1_idx` (`tipo_servicio_idtipo_servicio` ASC) ,
  CONSTRAINT `fk_tipo_servicio_has_vehiculo_tipo_servicio1`
    FOREIGN KEY (`tipo_servicio_idtipo_servicio` )
    REFERENCES `sgstt`.`tipo_servicio` (`idtipo_servicio` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tipo_servicio_has_vehiculo_vehiculo1`
    FOREIGN KEY (`vehiculo_idvehiculo` )
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
  `idsede` INT NOT NULL ,
  `descripcion` VARCHAR(300) NOT NULL ,
  `estado` TINYINT(1) NOT NULL DEFAULT 1 ,
  `idtipo_servicio` INT NOT NULL ,
  PRIMARY KEY (`idservicio`, `idsede`) ,
  INDEX `fk_servicio_tipo_servicio1_idx` (`idtipo_servicio` ASC) ,
  INDEX `fk_servicio_sede1` (`idsede` ASC) ,
  CONSTRAINT `fk_servicio_tipo_servicio1`
    FOREIGN KEY (`idtipo_servicio` )
    REFERENCES `sgstt`.`tipo_servicio` (`idtipo_servicio` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_servicio_sede1`
    FOREIGN KEY (`idsede` )
    REFERENCES `sgstt`.`sede` (`idsede` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sgstt`.`tarifa`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sgstt`.`tarifa` ;

CREATE  TABLE IF NOT EXISTS `sgstt`.`tarifa` (
  `idtarifa` INT NOT NULL AUTO_INCREMENT ,
  `idsede` INT NOT NULL ,
  `horas` VARCHAR(45) NULL ,
  `descripcion` VARCHAR(45) NULL ,
  `precio` DECIMAL(10,2) NULL ,
  `idtipo_vehiculo` INT NOT NULL ,
  `idservicio` INT NOT NULL ,
  `estado` TINYINT(1) NOT NULL DEFAULT 1 ,
  `fecha_registro` DATETIME NULL ,
  `fecha_modificacion` DATETIME NULL ,
  PRIMARY KEY (`idtarifa`, `idsede` ) ,
  INDEX `fk_tarifa_tipo_vehiculo1_idx` (`idtipo_vehiculo` ASC) ,
  INDEX `fk_tarifa_servicio1_idx` (`idservicio` ASC) ,
  INDEX `fk_tarifa_sede1_idx` (`idsede` ASC) ,
  CONSTRAINT `fk_tarifa_tipo_vehiculo1`
    FOREIGN KEY (`idtipo_vehiculo` )
    REFERENCES `sgstt`.`tipo_vehiculo` (`idtipo_vehiculo` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tarifa_servicio1`
    FOREIGN KEY (`idservicio` )
    REFERENCES `sgstt`.`servicio` (`idservicio` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_idsede_sede1`
    FOREIGN KEY (`idsede`)
    REFERENCES `sgstt`.`sede` (`idsede` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
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
-- Table `sgstt`.`empresa`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sgstt`.`empresa` ;

CREATE  TABLE IF NOT EXISTS `sgstt`.`empresa` (
  `idempresa` INT NOT NULL AUTO_INCREMENT ,
  `idsede` INT NOT NULL ,
  `razon_social` VARCHAR(45) NULL ,
  `ruc` VARCHAR(45) NULL ,
  `centrocosto` VARCHAR(45) NULL ,
  `telefono` VARCHAR(45) NULL ,
  `celular` VARCHAR(45) NULL ,
  `correo` VARCHAR(45) NULL ,
  `estado` TINYINT(1) NOT NULL DEFAULT 1 ,
  PRIMARY KEY (`idempresa`, `idsede` ),
  INDEX `fk_empresa_sede1_idx` (`idsede` ASC) ,
  CONSTRAINT `fk_empresa_sede1`
    FOREIGN KEY (`idsede`)
    REFERENCES `sgstt`.`sede` (`idsede` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `sgstt`.`tipo_cliente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sgstt`.`tipo_cliente` ;

CREATE  TABLE IF NOT EXISTS `sgstt`.`tipo_cliente` (
  `id_tipocliente` INT NOT NULL AUTO_INCREMENT ,
  `tipo_cliente` VARCHAR(45) NULL ,
  PRIMARY KEY (`id_tipocliente`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sgstt`.`cliente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sgstt`.`cliente` ;

CREATE  TABLE IF NOT EXISTS `sgstt`.`cliente` (
  `idcliente` INT NOT NULL AUTO_INCREMENT ,
  `idsede` INT NOT NULL ,
  `nombre` VARCHAR(45) NULL ,
  `numerodocumento` VARCHAR(12) NULL ,
  `razonsocial` VARCHAR(45) NULL ,
  `direccion` VARCHAR(45) NULL ,
  `estado` TINYINT(1) NOT NULL DEFAULT 1 ,
  `tipo_documento` VARCHAR(50) NULL ,
  `correo` VARCHAR(45) NULL ,
  `id_tipocliente` INT NOT NULL ,
  PRIMARY KEY (`idcliente`, `idsede`) ,
  INDEX `fk_cliente_tipo_cliente1_idx` (`id_tipocliente` ASC) ,
  CONSTRAINT `fk_cliente_tipo_cliente1`
    FOREIGN KEY (`id_tipocliente` )
    REFERENCES `sgstt`.`tipo_cliente` (`id_tipocliente` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
   CONSTRAINT `fk_cliente_sede1`
    FOREIGN KEY (`idsede` )
    REFERENCES `sgstt`.`sede` (`idsede` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)  
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `sgstt`.`empleado`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sgstt`.`empleado` ;

CREATE  TABLE IF NOT EXISTS `sgstt`.`empleado` (
  `idempleado` INT NOT NULL AUTO_INCREMENT ,
  `idsede` INT NOT NULL ,
  `nombre` VARCHAR(45) NOT NULL ,
  `apellidos` VARCHAR(45) NOT NULL ,
  `dni` VARCHAR(8) NOT NULL ,
  `telefono` VARCHAR(10) NOT NULL ,
  `celular` VARCHAR(10) NOT NULL ,
  `correo` VARCHAR(40) NOT NULL ,
  `estado` TINYINT(1) NOT NULL DEFAULT 1 ,
  PRIMARY KEY (`idempleado`, `idsede`), 
  CONSTRAINT `fk_empleado_sede1`
    FOREIGN KEY (`idsede` )
    REFERENCES `sgstt`.`sede` (`idsede` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sgstt`.`file`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sgstt`.`file` ;

CREATE  TABLE IF NOT EXISTS `sgstt`.`file` (
  `idfile` INT NOT NULL AUTO_INCREMENT ,
  `idcliente` INT NOT NULL ,
  `idempleado` INT NOT NULL ,
  `pax` VARCHAR(80) NOT NULL ,
  `cuenta` VARCHAR(80) NOT NULL ,
  `fecha_registro` DATETIME NOT NULL ,
  `fecha_modificacion` DATETIME NOT NULL ,
  `nro_correlativo` VARCHAR(45) NULL ,
  `estado` TINYINT(1) NOT NULL DEFAULT 1 ,
  PRIMARY KEY (`idfile`, `idcliente`, `idempleado`) ,
  INDEX `fk_file_cliente1_idx` (`idcliente` ASC) ,
  INDEX `fk_file_empleado1_idx` (`idempleado` ASC) ,
  CONSTRAINT `fk_file_cliente1`
    FOREIGN KEY (`idcliente` )
    REFERENCES `sgstt`.`cliente` (`idcliente` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_file_empleado1`
    FOREIGN KEY (`idempleado` )
    REFERENCES `sgstt`.`empleado` (`idempleado` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sgstt`.`venta_directa`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sgstt`.`venta_directa` ;

CREATE  TABLE IF NOT EXISTS `sgstt`.`venta_directa` (
  `idventa` INT NOT NULL AUTO_INCREMENT ,
  `idcliente` INT NOT NULL ,
  `serie` VARCHAR(10) NOT NULL DEFAULT 'VTA' ,
  `fecha_creacion` DATE NOT NULL,
  PRIMARY KEY (`idventa`, `idcliente`) ,
  INDEX `fk_venta_directa_cliente1` (`idcliente` ASC) ,
  CONSTRAINT `fk_venta_directa_cliente1`
    FOREIGN KEY (`idcliente` )
    REFERENCES `sgstt`.`cliente` (`idcliente` )
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
  `descripcion` VARCHAR(80) NULL ,
  `num_personas` INT NOT NULL ,
  `fecha` DATETIME NOT NULL ,
  `externalizado` VARCHAR(2) NOT NULL DEFAULT 'NO' ,
  `precio_servicio` DECIMAL(12,2) NULL ,
  `descuento` DECIMAL(12,2) NOT NULL DEFAULT 0.00 ,
  `adicional` DECIMAL(12,2) NOT NULL DEFAULT 0.00 ,
  `gravada` TINYINT(1) NOT NULL DEFAULT 1 ,
  `dias_viaje` INT NULL ,
  `pax` VARCHAR(80) NULL ,
  `cuenta` VARCHAR(80) NULL ,
  `comentario` VARCHAR(80) NULL ,
  `estado` TINYINT(1) NOT NULL DEFAULT 1 ,
  `estado_SERVICIO` VARCHAR(60) NULL ,
  `fecha_registro` DATETIME NOT NULL ,
  `fecha_modificacion` DATETIME NOT NULL ,
  `idvuelo` INT NULL ,
  `idchofer` INT NULL ,
  `idtrasladista` INT NULL ,
  `idvehiculo` INT NULL ,
  `idtipo_vehiculo` INT NOT NULL,
  `idfile` INT NULL ,
  `idventa` INT NULL ,
  PRIMARY KEY (`idservicio_detalle`, `idservicio`) ,
  INDEX `fk_servicio_detalle_trasladista1_idx` (`idtrasladista` ASC) ,
  INDEX `fk_servicio_detalle_servicio1_idx` (`idservicio` ASC) ,
  INDEX `fk_servicio_detalle_vuelo1_idx` (`idvuelo` ASC) ,
  INDEX `fk_servicio_detalle_chofer1_idx` (`idchofer` ASC) ,
  INDEX `fk_servicio_detalle_vehiculo1_idx` (`idvehiculo` ASC) ,
  INDEX `fk_servicio_detalle_file1` (`idfile` ASC) ,
  INDEX `fk_servicio_detalle_venta_directa1` (`idventa` ASC) ,
  CONSTRAINT `fk_servicio_detalle_trasladista1`
    FOREIGN KEY (`idtrasladista` )
    REFERENCES `sgstt`.`trasladista` (`idtrasladista` )
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
  CONSTRAINT `fk_servicio_detalle_file1`
    FOREIGN KEY (`idfile` )
    REFERENCES `sgstt`.`file` (`idfile` )
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
  `idsede` INT NOT NULL ,
  `idtipo_incidencia` INT NOT NULL ,
  `idservicio_detalle` INT NOT NULL ,
  `descripcion` VARCHAR(45) NULL ,
  `estado_INCIDENCIA` VARCHAR(60) NULL ,
  `fecha_registro` DATETIME NOT NULL ,
  `fecha_modificacion` DATETIME NOT NULL ,
  `estado` TINYINT(1) NOT NULL DEFAULT 1 ,
  PRIMARY KEY (`idincidencia`, `idservicio_detalle`, `idsede`) ,
  INDEX `fk_incidencia_tipo_incidencia1_idx` (`idtipo_incidencia` ASC) ,
  INDEX `fk_incidencia_servicio_detalle1_idx` (`idservicio_detalle` ASC) ,
  CONSTRAINT `fk_incidencia_tipo_incidencia1`
    FOREIGN KEY (`idtipo_incidencia` )
    REFERENCES `sgstt`.`tipo_incidencia` (`idtipo_incidencia` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_incidencia_servicio_detalle1`
    FOREIGN KEY (`idservicio_detalle` )
    REFERENCES `sgstt`.`servicio_detalle` (`idservicio_detalle` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_incidencia_sede1`
    FOREIGN KEY (`idsede` )
    REFERENCES `sgstt`.`sede` (`idsede` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `sgstt`.`perfil`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sgstt`.`perfil` ;

CREATE  TABLE IF NOT EXISTS `sgstt`.`perfil` (
  `idperfil` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(200) NOT NULL ,
  `estado` TINYINT(1) NOT NULL DEFAULT 1 ,
  PRIMARY KEY (`idperfil`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sgstt`.`usuario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sgstt`.`usuario` ;

CREATE  TABLE IF NOT EXISTS `sgstt`.`usuario` (
  `idusuario` INT NOT NULL AUTO_INCREMENT ,
  `idperfil` INT NOT NULL ,
  `idempleado` INT NOT NULL ,
  `idsede` INT NOT NULL ,
  `nick` VARCHAR(20) NOT NULL ,
  `clave` VARCHAR(20) NOT NULL ,
  `estado` TINYINT(1) NOT NULL DEFAULT 1 ,
  PRIMARY KEY (`idusuario`, `idperfil`, `idempleado`, `idsede`) ,
  INDEX `fk_usuario_perfil1_idx` (`idperfil` ASC) ,
  INDEX `fk_usuario_empleado1_idx` (`idempleado` ASC) ,
  INDEX `fk_usuario_sede1` (`idsede` ASC) ,
  CONSTRAINT `fk_usuario_perfil1`
    FOREIGN KEY (`idperfil` )
    REFERENCES `sgstt`.`perfil` (`idperfil` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_empleado1`
    FOREIGN KEY (`idempleado` )
    REFERENCES `sgstt`.`empleado` (`idempleado` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_sede1`
    FOREIGN KEY (`idsede` )
    REFERENCES `sgstt`.`sede` (`idsede` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sgstt`.`modulo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sgstt`.`modulo` ;

CREATE  TABLE IF NOT EXISTS `sgstt`.`modulo` (
  `idmodulo` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(100) NOT NULL ,
  `url` VARCHAR(50) NOT NULL ,
  `listar` TINYINT(1) NOT NULL ,
  `crear` TINYINT(1) NOT NULL ,
  `actualizar` TINYINT(1) NOT NULL ,
  `eliminar` TINYINT(1) NOT NULL ,
  `estado` TINYINT(1) NOT NULL DEFAULT 1 ,
  PRIMARY KEY (`idmodulo`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sgstt`.`permiso`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sgstt`.`permiso` ;

CREATE  TABLE IF NOT EXISTS `sgstt`.`permiso` (
  `idpermiso` INT NOT NULL AUTO_INCREMENT ,
  `idperfil` INT NOT NULL ,
  `idmodulo` INT NOT NULL ,
  `listar` TINYINT(1) NULL ,
  `crear` TINYINT(1) NULL ,
  `actualizar` TINYINT(1) NULL ,
  `eliminar` TINYINT(1) NULL ,
  PRIMARY KEY (`idpermiso`, `idperfil`, `idmodulo`) ,
  INDEX `fk_permiso_perfil1_idx` (`idperfil` ASC) ,
  INDEX `fk_permiso_modulo1_idx` (`idmodulo` ASC) ,
  CONSTRAINT `fk_permiso_perfil1`
    FOREIGN KEY (`idperfil` )
    REFERENCES `sgstt`.`perfil` (`idperfil` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_permiso_modulo1`
    FOREIGN KEY (`idmodulo` )
    REFERENCES `sgstt`.`modulo` (`idmodulo` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sgstt`.`destinos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sgstt`.`destinos` ;

CREATE  TABLE IF NOT EXISTS `sgstt`.`destinos` (
  `iddestinos` INT NOT NULL AUTO_INCREMENT ,
  `idsede` INT NOT NULL ,
  `razonsocial` VARCHAR(300)  NULL ,
  `razoncomercial` VARCHAR(300)  NULL ,
  `ruc` VARCHAR(300)  NULL ,
  `direccion` VARCHAR(300)  NULL ,
  `telefono` VARCHAR(300)  NULL ,
  `web` VARCHAR(300)  NULL ,
  `ubigeo` VARCHAR(300) NOT NULL ,
  `latitud` VARCHAR(50) NULL ,
  `longitud` VARCHAR(50) NULL ,
  `tipo_destino` VARCHAR(50) NULL ,
  `estado` TINYINT(1) NOT NULL DEFAULT 1 ,
  PRIMARY KEY (`iddestinos`, `idsede`),
  CONSTRAINT `fk_destinos_sede1`
    FOREIGN KEY (`idsede` )
    REFERENCES `sgstt`.`sede` (`idsede` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;




-- -----------------------------------------------------
-- Table `sgstt`.`servicio_destinos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sgstt`.`servicio_destinos` ;

CREATE  TABLE IF NOT EXISTS `sgstt`.`servicio_destinos` (
  `servicio_idservicio` INT NOT NULL ,
  `destinos_iddestinos` INT NOT NULL ,
  PRIMARY KEY (`servicio_idservicio`, `destinos_iddestinos`) ,
  INDEX `fk_servicio_has_destinos_destinos1` (`destinos_iddestinos` ASC) ,
  INDEX `fk_servicio_has_destinos_servicio1` (`servicio_idservicio` ASC) ,
  CONSTRAINT `fk_servicio_has_destinos_servicio1`
    FOREIGN KEY (`servicio_idservicio` )
    REFERENCES `sgstt`.`servicio` (`idservicio` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_servicio_has_destinos_destinos1`
    FOREIGN KEY (`destinos_iddestinos` )
    REFERENCES `sgstt`.`destinos` (`iddestinos` )
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
INSERT INTO `sgstt`.`tipo_servicio` (`idtipo_servicio`, `descripcion`, `estado`) VALUES (1, 'Traslado', 1);
INSERT INTO `sgstt`.`tipo_servicio` (`idtipo_servicio`, `descripcion`, `estado`) VALUES (2, 'Tour/Excursion', 1);
INSERT INTO `sgstt`.`tipo_servicio` (`idtipo_servicio`, `descripcion`, `estado`) VALUES (3, 'Viaje', 1);
INSERT INTO `sgstt`.`tipo_servicio` (`idtipo_servicio`, `descripcion`, `estado`) VALUES (4, 'Servicio Adicional', 1);

COMMIT;

-- -----------------------------------------------------
-- Data for table `sgstt`.`sede`
-- -----------------------------------------------------
START TRANSACTION;
USE `sgstt`;
INSERT INTO `sgstt`.`sede` (`idsede`, `descripcion`) VALUES (1, 'LIMA');
INSERT INTO `sgstt`.`sede` (`idsede`, `descripcion`) VALUES (2, 'CUSCO');

COMMIT;

-- -----------------------------------------------------
-- Data for table `sgstt`.`trasladista`
-- -----------------------------------------------------
START TRANSACTION;
USE `sgstt`;
INSERT INTO `sgstt`.`trasladista` (`idtrasladista`,`idsede`, `nombre`, `apellido`, `dni`, `direccion`, `correo`, `telefono`, `celular`, `estado`) VALUES (1, 1, 'Margarita', 'Stuard', '00000000', 'Domeyer 128 Dpto 502 ', 'No disponible', '7437434', '992096541', 1);
INSERT INTO `sgstt`.`trasladista` (`idtrasladista`,`idsede`, `nombre`, `apellido`, `dni`, `direccion`, `correo`, `telefono`, `celular`, `estado`) VALUES (2, 1, 'Victor', 'Aranda', '00000000', 'Av. El laurel rosa 411, Dpto 502 Los sauces', 'No disponible', '5457854', '965874123', 1);
INSERT INTO `sgstt`.`trasladista` (`idtrasladista`,`idsede`, `nombre`, `apellido`, `dni`, `direccion`, `correo`, `telefono`, `celular`, `estado`) VALUES (3, 1, 'Silvia', 'de Vettor', '00000000', 'Ram�n Castilla 418 Urb. Aurora', 'No disponible', '7437434', '987654345', 1);
INSERT INTO `sgstt`.`trasladista` (`idtrasladista`,`idsede`, `nombre`, `apellido`, `dni`, `direccion`, `correo`, `telefono`, `celular`, `estado`) VALUES (4, 1, 'Ursula', 'Collas', '00000000', 'Calle. Alfredo silva 142, Casa 115', 'No disponible', '5457854', '965874123', 1);
INSERT INTO `sgstt`.`trasladista` (`idtrasladista`,`idsede`, `nombre`, `apellido`, `dni`, `direccion`, `correo`, `telefono`, `celular`, `estado`) VALUES (5, 1, 'Nelida', 'Manrique', '00000000', 'Calle. Manco Capac 421-Dpto 102 ', 'No disponible', '7437434', '987654345', 1);
INSERT INTO `sgstt`.`trasladista` (`idtrasladista`,`idsede`, `nombre`, `apellido`, `dni`, `direccion`, `correo`, `telefono`, `celular`, `estado`) VALUES (6, 1, 'Franz', 'Alarcon', '00000000', 'Av. Grau 341 ñ Dpto 602', 'No disponible', '5457854', '965874123', 1);
INSERT INTO `sgstt`.`trasladista` (`idtrasladista`,`idsede`, `nombre`, `apellido`, `dni`, `direccion`, `correo`, `telefono`, `celular`, `estado`) VALUES (7, 1, 'Nieves', 'Echegaray', '00000000', 'Parque echenique 741 Dpto. 501', 'No disponible', '7437434', '987654345', 1);
INSERT INTO `sgstt`.`trasladista` (`idtrasladista`,`idsede`, `nombre`, `apellido`, `dni`, `direccion`, `correo`, `telefono`, `celular`, `estado`) VALUES (8, 1, 'Oscar', 'Von Bishopsahussen', '00000000', 'Av. Castilla con Av. Ayacucho G in 17 - Urbanizaci�n La Capullana', 'No disponible', '5457854', '965874123', 1);
INSERT INTO `sgstt`.`trasladista` (`idtrasladista`,`idsede`, `nombre`, `apellido`, `dni`, `direccion`, `correo`, `telefono`, `celular`, `estado`) VALUES (9, 1, 'Ernesto', 'Riedner', '00000000', 'Jr. Fernando castrat #320', 'No disponible', '7437434', '987654345', 1);
INSERT INTO `sgstt`.`trasladista` (`idtrasladista`,`idsede`, `nombre`, `apellido`, `dni`, `direccion`, `correo`, `telefono`, `celular`, `estado`) VALUES (10, 1, 'Guillermo', 'Torres', '00000000', 'Enrique Barr�n N� 845 ñ Dpto. 202 ñ Santa Beatriz / Referencia al frente del parque de las aguas.', 'No disponible', '5457854', '965874123', 1);
INSERT INTO `sgstt`.`trasladista` (`idtrasladista`,`idsede`, `nombre`, `apellido`, `dni`, `direccion`, `correo`, `telefono`, `celular`, `estado`) VALUES (11, 1, 'Mariana', 'Garcia', '00000000', 'Calle La Pen�nsula Mz C1 Lt 21 Urb. La Ensenada', 'No disponible', '7437434', '987654345', 1);
INSERT INTO `sgstt`.`trasladista` (`idtrasladista`,`idsede`, `nombre`, `apellido`, `dni`, `direccion`, `correo`, `telefono`, `celular`, `estado`) VALUES (12, 1, 'Karina', 'Bartens', '00000000', 'Jr. El escorial F-3 urb comopus', 'No disponible', '5457854', '965874123', 1);
INSERT INTO `sgstt`.`trasladista` (`idtrasladista`,`idsede`, `nombre`, `apellido`, `dni`, `direccion`, `correo`, `telefono`, `celular`, `estado`) VALUES (13, 2, 'Karina', 'Bartens', '00000000', 'Jr. El escorial F-3 urb comopus', 'No disponible', '5457854', '965874123', 1);

COMMIT;

-- -----------------------------------------------------
-- Data for table `sgstt`.`empresa`
-- -----------------------------------------------------
START TRANSACTION;
USE `sgstt`;
INSERT INTO `sgstt`.`empresa` (`idempresa`,`idsede`, `razon_social`, `ruc`,`centrocosto`, `telefono`, `celular`, `correo`, `estado`) VALUES (1, 1, 'TRANSLIVIK', ' ',"VT-00", ' ', ' ', ' ',1);
INSERT INTO `sgstt`.`empresa` (`idempresa`,`idsede`, `razon_social`, `ruc`,`centrocosto`, `telefono`, `celular`, `correo`, `estado`) VALUES (2, 1, 'TRANSP.BOCANEGRA', ' ',"VT-01", ' ', ' ', ' ',1);
INSERT INTO `sgstt`.`empresa` (`idempresa`,`idsede`, `razon_social`, `ruc`,`centrocosto`, `telefono`, `celular`, `correo`, `estado`) VALUES (3, 1, 'TRANSP.CESPEDES', ' ',"VT-02", ' ', ' ', ' ',1);
INSERT INTO `sgstt`.`empresa` (`idempresa`,`idsede`, `razon_social`, `ruc`,`centrocosto`, `telefono`, `celular`, `correo`, `estado`) VALUES (4, 1, 'TRANSP.MOVIL TOURS', ' ',"VT-03", ' ', ' ', ' ',1);
INSERT INTO `sgstt`.`empresa` (`idempresa`,`idsede`, `razon_social`, `ruc`,`centrocosto`, `telefono`, `celular`, `correo`, `estado`) VALUES (5, 1, 'TRANSP.TAN', ' ',"VT-04", ' ', ' ', ' ',1);
INSERT INTO `sgstt`.`empresa` (`idempresa`,`idsede`, `razon_social`, `ruc`,`centrocosto`, `telefono`, `celular`, `correo`, `estado`) VALUES (6, 1, 'TRANSP.ARANDA', ' ',"VT-05", ' ', ' ', ' ',1);
INSERT INTO `sgstt`.`empresa` (`idempresa`,`idsede`, `razon_social`, `ruc`,`centrocosto`, `telefono`, `celular`, `correo`, `estado`) VALUES (7, 1, 'TRANSP.3 REYES', ' ',"VT-06", ' ', ' ', ' ',1);
INSERT INTO `sgstt`.`empresa` (`idempresa`,`idsede`, `razon_social`, `ruc`,`centrocosto`, `telefono`, `celular`, `correo`, `estado`) VALUES (8, 1, 'TRANSP.TARUKA TOURS', ' ',"VT-07", ' ', ' ', ' ',1);
INSERT INTO `sgstt`.`empresa` (`idempresa`,`idsede`, `razon_social`, `ruc`,`centrocosto`, `telefono`, `celular`, `correo`, `estado`) VALUES (9, 1, 'TRANSP.A & V TOUR', ' ',"VT-08", ' ', ' ', ' ',1);
INSERT INTO `sgstt`.`empresa` (`idempresa`,`idsede`, `razon_social`, `ruc`,`centrocosto`, `telefono`, `celular`, `correo`, `estado`) VALUES (10, 1, 'TRANSP.TRANSPERU', ' ',"VT-09", ' ', ' ', ' ',1);
INSERT INTO `sgstt`.`empresa` (`idempresa`,`idsede`, `razon_social`, `ruc`,`centrocosto`, `telefono`, `celular`, `correo`, `estado`) VALUES (11, 1, 'TRANSP.D1', ' ',"VT-11", ' ', ' ', ' ',1);
INSERT INTO `sgstt`.`empresa` (`idempresa`,`idsede`, `razon_social`, `ruc`,`centrocosto`, `telefono`, `celular`, `correo`, `estado`) VALUES (12, 1, 'TRANSP.DC TRAVEL', ' ',"VT-11", ' ', ' ', ' ',1);
INSERT INTO `sgstt`.`empresa` (`idempresa`,`idsede`, `razon_social`, `ruc`,`centrocosto`, `telefono`, `celular`, `correo`, `estado`) VALUES (13, 1, 'TRANSP.DIOSES', ' ',"VT-12", ' ', ' ', ' ',1);
INSERT INTO `sgstt`.`empresa` (`idempresa`,`idsede`, `razon_social`, `ruc`,`centrocosto`, `telefono`, `celular`, `correo`, `estado`) VALUES (14, 1, 'TRANSP.CARRILLO', ' ',"VT-13", ' ', ' ', ' ',1);
INSERT INTO `sgstt`.`empresa` (`idempresa`,`idsede`, `razon_social`, `ruc`,`centrocosto`, `telefono`, `celular`, `correo`, `estado`) VALUES (15, 1, 'TRANSP.TURISMO CAR', ' ',"VT-14", ' ', ' ', ' ',1);
INSERT INTO `sgstt`.`empresa` (`idempresa`,`idsede`, `razon_social`, `ruc`,`centrocosto`, `telefono`, `celular`, `correo`, `estado`) VALUES (16, 1, 'TRANSP.WILLIAM', ' ',"VT-15", ' ', ' ', ' ',1);
INSERT INTO `sgstt`.`empresa` (`idempresa`,`idsede`, `razon_social`, `ruc`,`centrocosto`, `telefono`, `celular`, `correo`, `estado`) VALUES (17, 1, 'TRANP.MANCHEGO', ' ',"VT-16", ' ', ' ', ' ',1);
INSERT INTO `sgstt`.`empresa` (`idempresa`,`idsede`, `razon_social`, `ruc`,`centrocosto`, `telefono`, `celular`, `correo`, `estado`) VALUES (18, 1, 'TRANSP.TRANSZELA', ' ',"VT-17", ' ', ' ', ' ',1);
INSERT INTO `sgstt`.`empresa` (`idempresa`,`idsede`, `razon_social`, `ruc`,`centrocosto`, `telefono`, `celular`, `correo`, `estado`) VALUES (19, 1, 'TRANSP.YESKA', ' ',"VT-18", ' ', ' ', ' ',1);
INSERT INTO `sgstt`.`empresa` (`idempresa`,`idsede`, `razon_social`, `ruc`,`centrocosto`, `telefono`, `celular`, `correo`, `estado`) VALUES (20, 1, 'TRANSP.ANDES', ' ',"VT-19", ' ', ' ', ' ',1);
INSERT INTO `sgstt`.`empresa` (`idempresa`,`idsede`, `razon_social`, `ruc`,`centrocosto`, `telefono`, `celular`, `correo`, `estado`) VALUES (21, 1, 'TRANSP.SAMANIEGO', ' ',"VT-20", ' ', ' ', ' ',1);
INSERT INTO `sgstt`.`empresa` (`idempresa`,`idsede`, `razon_social`, `ruc`,`centrocosto`, `telefono`, `celular`, `correo`, `estado`) VALUES (22, 1, 'INVERSIONES KINTARO', ' ',"VT-22", ' ', ' ', ' ',1);
INSERT INTO `sgstt`.`empresa` (`idempresa`,`idsede`, `razon_social`, `ruc`,`centrocosto`, `telefono`, `celular`, `correo`, `estado`) VALUES (23, 1, 'PERU MAGIC TOURS', ' ',"VT-23", ' ', ' ', ' ',1);
INSERT INTO `sgstt`.`empresa` (`idempresa`,`idsede`, `razon_social`, `ruc`,`centrocosto`, `telefono`, `celular`, `correo`, `estado`) VALUES (24, 1, 'TRANSP.WILKAMAR', ' ',"VT-24", ' ', ' ', ' ',1);
INSERT INTO `sgstt`.`empresa` (`idempresa`,`idsede`, `razon_social`, `ruc`,`centrocosto`, `telefono`, `celular`, `correo`, `estado`) VALUES (25, 1, 'TRANSP.LONGA', ' ',"VT-25", ' ', ' ', ' ',1);
INSERT INTO `sgstt`.`empresa` (`idempresa`,`idsede`, `razon_social`, `ruc`,`centrocosto`, `telefono`, `celular`, `correo`, `estado`) VALUES (26, 1, 'TRANSP. CMV', ' ',"VT-26", ' ', ' ', ' ',1);
INSERT INTO `sgstt`.`empresa` (`idempresa`,`idsede`, `razon_social`, `ruc`,`centrocosto`, `telefono`, `celular`, `correo`, `estado`) VALUES (27, 1, 'TRANSP.TRANSMARTIN', ' ',"VT-27", ' ', ' ', ' ',1);
INSERT INTO `sgstt`.`empresa` (`idempresa`,`idsede`, `razon_social`, `ruc`,`centrocosto`, `telefono`, `celular`, `correo`, `estado`) VALUES (28, 1, 'TRANSP.WI�ATOUR', ' ',"VT-28", ' ', ' ', ' ',1);
INSERT INTO `sgstt`.`empresa` (`idempresa`,`idsede`, `razon_social`, `ruc`,`centrocosto`, `telefono`, `celular`, `correo`, `estado`) VALUES (29, 1, 'TRANSP.VSM', ' ',"VT-29", ' ', ' ', ' ',1);
INSERT INTO `sgstt`.`empresa` (`idempresa`,`idsede`, `razon_social`, `ruc`,`centrocosto`, `telefono`, `celular`, `correo`, `estado`) VALUES (30, 1, 'TRANSPTRANSP.EDUFER.VALLE', ' ',"VT-30", ' ', ' ', ' ',1);

INSERT INTO `sgstt`.`empresa` (`idempresa`,`idsede`, `razon_social`, `ruc`,`centrocosto`, `telefono`, `celular`, `correo`, `estado`) VALUES (31, 2, 'TRANSLIVIK', ' ',"VTC-00", ' ', ' ', ' ',1);
INSERT INTO `sgstt`.`empresa` (`idempresa`,`idsede`, `razon_social`, `ruc`,`centrocosto`, `telefono`, `celular`, `correo`, `estado`) VALUES (32, 2, 'TRANSP.MOUNTAIN TRAVEL', ' ',"VTC-01", ' ', ' ', ' ',1);
INSERT INTO `sgstt`.`empresa` (`idempresa`,`idsede`, `razon_social`, `ruc`,`centrocosto`, `telefono`, `celular`, `correo`, `estado`) VALUES (33, 2, 'TRANSP.TUFILS', ' ',"VTC-02", ' ', ' ', ' ',1);
INSERT INTO `sgstt`.`empresa` (`idempresa`,`idsede`, `razon_social`, `ruc`,`centrocosto`, `telefono`, `celular`, `correo`, `estado`) VALUES (34, 2, 'TRANSP.PERU ANDES', ' ',"VTC-03", ' ', ' ', ' ',1);
INSERT INTO `sgstt`.`empresa` (`idempresa`,`idsede`, `razon_social`, `ruc`,`centrocosto`, `telefono`, `celular`, `correo`, `estado`) VALUES (35, 2, 'TRANSP.PATR TRAVEL', ' ',"VTC-04", ' ', ' ', ' ',1);
INSERT INTO `sgstt`.`empresa` (`idempresa`,`idsede`, `razon_social`, `ruc`,`centrocosto`, `telefono`, `celular`, `correo`, `estado`) VALUES (36, 2, 'TRANSP.NENFIZ', ' ',"VTC-05", ' ', ' ', ' ',1);
INSERT INTO `sgstt`.`empresa` (`idempresa`,`idsede`, `razon_social`, `ruc`,`centrocosto`, `telefono`, `celular`, `correo`, `estado`) VALUES (37, 2, 'TRANSP.HERMANOS QUISPE', ' ',"VTC-06", ' ', ' ', ' ',1);
INSERT INTO `sgstt`.`empresa` (`idempresa`,`idsede`, `razon_social`, `ruc`,`centrocosto`, `telefono`, `celular`, `correo`, `estado`) VALUES (38, 2, 'TRANSP.YESKA TOURS', ' ',"VTC-07", ' ', ' ', ' ',1);
INSERT INTO `sgstt`.`empresa` (`idempresa`,`idsede`, `razon_social`, `ruc`,`centrocosto`, `telefono`, `celular`, `correo`, `estado`) VALUES (39, 2, 'TRANSP.VS TOUR', ' ',"VTC-08", ' ', ' ', ' ',1);
INSERT INTO `sgstt`.`empresa` (`idempresa`,`idsede`, `razon_social`, `ruc`,`centrocosto`, `telefono`, `celular`, `correo`, `estado`) VALUES (40, 2, 'TRANSP.CUBAC', ' ',"VTC-09", ' ', ' ', ' ',1);
INSERT INTO `sgstt`.`empresa` (`idempresa`,`idsede`, `razon_social`, `ruc`,`centrocosto`, `telefono`, `celular`, `correo`, `estado`) VALUES (41, 2, 'TRANSP.RUMISUR', ' ',"VTC-11", ' ', ' ', ' ',1);
INSERT INTO `sgstt`.`empresa` (`idempresa`,`idsede`, `razon_social`, `ruc`,`centrocosto`, `telefono`, `celular`, `correo`, `estado`) VALUES (42, 2, 'TRANSP.AVALOS', ' ',"VTC-12", ' ', ' ', ' ',1);
INSERT INTO `sgstt`.`empresa` (`idempresa`,`idsede`, `razon_social`, `ruc`,`centrocosto`, `telefono`, `celular`, `correo`, `estado`) VALUES (43, 2, 'TRANSP.CUSI TOURS', ' ',"VTC-13", ' ', ' ', ' ',1);
INSERT INTO `sgstt`.`empresa` (`idempresa`,`idsede`, `razon_social`, `ruc`,`centrocosto`, `telefono`, `celular`, `correo`, `estado`) VALUES (44, 2, 'TRANSP.ROSARIO TOURS', ' ',"VTC-14",  ' ', ' ', ' ',1);
INSERT INTO `sgstt`.`empresa` (`idempresa`,`idsede`, `razon_social`, `ruc`,`centrocosto`, `telefono`, `celular`, `correo`, `estado`) VALUES (45, 2, 'TRANSP.ALO URUBAMBA', ' ',"VTC-15",  ' ', ' ', ' ',1);


-- -----------------------------------------------------
-- Data for table `sgstt`.`chofer`
-- -----------------------------------------------------
START TRANSACTION;
USE `sgstt`;
INSERT INTO `sgstt`.`chofer` (`idchofer`, `idsede`, `nombre`, `apellido`, `dni`, `celular`, `brevete`, `categoria`, `clave`,`fecha`, `estado`,`idempresa`)  VALUES (1, 2, 'JAIME', 'AGUILAR EGOAVIL', '23885693', ' ',' ','A1', '12345678',"2015-11-07 00:00:00", 1,1);
INSERT INTO `sgstt`.`chofer` (`idchofer`, `idsede`, `nombre`, `apellido`, `dni`, `celular`, `brevete`, `categoria`, `clave`,`fecha`, `estado`,`idempresa`)  VALUES (2, 2, 'CESAR AMADO', 'ARELLANOS MU�OZ', '25662462', ' ',' ', 'A2', '12345678',"2015-11-07 00:00:00", 1,1);
INSERT INTO `sgstt`.`chofer` (`idchofer`, `idsede`, `nombre`, `apellido`, `dni`, `celular`, `brevete`, `categoria`, `clave`,`fecha`, `estado`,`idempresa`)  VALUES (3, 1, 'MARIO HERNAN', 'CUADROS HUAPAYA', '25577045', ' ',' ', 'A3', '12345678',"2015-11-07 00:00:00", 1,1);
INSERT INTO `sgstt`.`chofer` (`idchofer`, `idsede`, `nombre`, `apellido`, `dni`, `celular`, `brevete`, `categoria`, `clave`,`fecha`, `estado`,`idempresa`)  VALUES (4, 1, 'PEPE', 'DAMIAN JURO', '10550499', ' ',' ', 'A1', '12345678',"2015-11-07 00:00:00", 1,1);
INSERT INTO `sgstt`.`chofer` (`idchofer`, `idsede`, `nombre`, `apellido`, `dni`, `celular`, `brevete`, `categoria`, `clave`,`fecha`, `estado`,`idempresa`)  VALUES (5, 1, 'KATTY DORIS', 'ESCOBAR PUMACALLAO', '07884541', ' ',' ', 'A2', '12345678',"2015-11-07 00:00:00", 1,1);
INSERT INTO `sgstt`.`chofer` (`idchofer`, `idsede`, `nombre`, `apellido`, `dni`, `celular`, `brevete`, `categoria`, `clave`,`fecha`, `estado`,`idempresa`)  VALUES (6, 1, 'CARLOS ALBERTO', 'HERRERA NAVARRO', '10630551', ' ',' ', 'A3', '12345678',"2015-11-07 00:00:00", 1,1);
INSERT INTO `sgstt`.`chofer` (`idchofer`, `idsede`, `nombre`, `apellido`, `dni`, `celular`, `brevete`, `categoria`, `clave`,`fecha`, `estado`,`idempresa`)  VALUES (7, 1, 'JOSE EDUARDO', 'HUAPALLA BALCAZAR', '10144415', ' ',' ', 'A1', '12345678',"2015-11-07 00:00:00", 1,1);
INSERT INTO `sgstt`.`chofer` (`idchofer`, `idsede`, `nombre`, `apellido`, `dni`, `celular`, `brevete`, `categoria`, `clave`,`fecha`, `estado`,`idempresa`)  VALUES (8, 1, 'RODOLFO CESAR', 'LAZO CALDERON', '25717877', ' ',' ', 'A2', '12345678',"2015-11-07 00:00:00", 1,1);
INSERT INTO `sgstt`.`chofer` (`idchofer`, `idsede`, `nombre`, `apellido`, `dni`, `celular`, `brevete`, `categoria`, `clave`,`fecha`, `estado`,`idempresa`)  VALUES (9, 1, 'JOSE LUIS', 'NU�EZ CUENCA ROJAS', '09461980', ' ',' ', 'A3', '12345678',"2015-11-07 00:00:00", 1,1);
INSERT INTO `sgstt`.`chofer` (`idchofer`, `idsede`, `nombre`, `apellido`, `dni`, `celular`, `brevete`, `categoria`, `clave`,`fecha`, `estado`,`idempresa`)  VALUES (10, 1, 'ADRIAN', 'TICONA APAZA', '10520991', ' ',' ', 'A1', '12345678',"2015-11-07 00:00:00", 1,1);
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
INSERT INTO `sgstt`.`tipo_vehiculo` (`idtipo_vehiculo`, `nombre`, `capacidad`) VALUES (4, 'Sprinter Corta', 40);
INSERT INTO `sgstt`.`tipo_vehiculo` (`idtipo_vehiculo`, `nombre`, `capacidad`) VALUES (5, 'Van H1', 10);
INSERT INTO `sgstt`.`tipo_vehiculo` (`idtipo_vehiculo`, `nombre`, `capacidad`) VALUES (6, 'Van Toyota', 10);
INSERT INTO `sgstt`.`tipo_vehiculo` (`idtipo_vehiculo`, `nombre`, `capacidad`) VALUES (7, 'Bus-30 Max', 30);
INSERT INTO `sgstt`.`tipo_vehiculo` (`idtipo_vehiculo`, `nombre`, `capacidad`) VALUES (8, 'Bus-24 Max', 30);
COMMIT;

-- -----------------------------------------------------
-- Data for table `sgstt`.`vehiculo`
-- -----------------------------------------------------
START TRANSACTION;
USE `sgstt`;
INSERT INTO `sgstt`.`vehiculo` (`idvehiculo`, `idsede`, `descripcion`, `placa`, `estado`, `año_fabricacion`, `capacidad_max`, `capacidad_recomendada`, `color`, `idtipo_vehiculo`, `marca_idmarca`, `fecha_registro`, `fecha_modificacion`) VALUES (1, 1, 'V-01', 'B6F-962', 1, '2006', '12', '10', 'negro', 1, 4, '2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO `sgstt`.`vehiculo` (`idvehiculo`, `idsede`, `descripcion`, `placa`, `estado`, `año_fabricacion`, `capacidad_max`, `capacidad_recomendada`, `color`, `idtipo_vehiculo`, `marca_idmarca`, `fecha_registro`, `fecha_modificacion`) VALUES (2, 2, 'V-04', 'B3Z-954', 1, '2009', '40', '36', 'plata', 4, 2, '2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO `sgstt`.`vehiculo` (`idvehiculo`, `idsede`, `descripcion`, `placa`, `estado`, `año_fabricacion`, `capacidad_max`, `capacidad_recomendada`, `color`, `idtipo_vehiculo`, `marca_idmarca`, `fecha_registro`, `fecha_modificacion`) VALUES (3, 1, 'V-05', 'B6H-966', 1, '2009', '50', '45', 'plata', 5, 5, '2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO `sgstt`.`vehiculo` (`idvehiculo`, `idsede`, `descripcion`, `placa`, `estado`, `año_fabricacion`, `capacidad_max`, `capacidad_recomendada`, `color`, `idtipo_vehiculo`, `marca_idmarca`, `fecha_registro`, `fecha_modificacion`) VALUES (4, 1, 'V-06', 'A3H-968', 1, '2010', '12', '10', 'negro', 4, 2, '2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO `sgstt`.`vehiculo` (`idvehiculo`, `idsede`, `descripcion`, `placa`, `estado`, `año_fabricacion`, `capacidad_max`, `capacidad_recomendada`, `color`, `idtipo_vehiculo`, `marca_idmarca`, `fecha_registro`, `fecha_modificacion`) VALUES (5, 2, 'V-08', 'B8P-788', 1, '2012', '40', '36', 'plata', 4, 4, '2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO `sgstt`.`vehiculo` (`idvehiculo`, `idsede`, `descripcion`, `placa`, `estado`, `año_fabricacion`, `capacidad_max`, `capacidad_recomendada`, `color`, `idtipo_vehiculo`, `marca_idmarca`, `fecha_registro`, `fecha_modificacion`) VALUES (6, 1, 'V-09', 'B0F-958', 1, '2012', '50', '45', 'plata', 2, 3, '2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO `sgstt`.`vehiculo` (`idvehiculo`, `idsede`, `descripcion`, `placa`, `estado`, `año_fabricacion`, `capacidad_max`, `capacidad_recomendada`, `color`, `idtipo_vehiculo`, `marca_idmarca`, `fecha_registro`, `fecha_modificacion`) VALUES (7, 1, 'V-10', 'C3H-964', 1, '2012', '12', '10', 'negro', 2, 1, '2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO `sgstt`.`vehiculo` (`idvehiculo`, `idsede`, `descripcion`, `placa`, `estado`, `año_fabricacion`, `capacidad_max`, `capacidad_recomendada`, `color`, `idtipo_vehiculo`, `marca_idmarca`, `fecha_registro`, `fecha_modificacion`) VALUES (8, 1, 'V-11', 'C3E-953', 1, '2013', '40', '36', 'plata', 3, 3, '2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO `sgstt`.`vehiculo` (`idvehiculo`, `idsede`, `descripcion`, `placa`, `estado`, `año_fabricacion`, `capacidad_max`, `capacidad_recomendada`, `color`, `idtipo_vehiculo`, `marca_idmarca`, `fecha_registro`, `fecha_modificacion`) VALUES (9, 1, 'V-12', 'C5J-959', 1, '2013', '50', '45', 'plata', 4, 2, '2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO `sgstt`.`vehiculo` (`idvehiculo`, `idsede`, `descripcion`, `placa`, `estado`, `año_fabricacion`, `capacidad_max`, `capacidad_recomendada`, `color`, `idtipo_vehiculo`, `marca_idmarca`, `fecha_registro`, `fecha_modificacion`) VALUES (10, 1, 'V-13', 'C6Q-967', 1, '2014', '12', '10', 'negro', 2, 1, '2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO `sgstt`.`vehiculo` (`idvehiculo`, `idsede`, `descripcion`, `placa`, `estado`, `año_fabricacion`, `capacidad_max`, `capacidad_recomendada`, `color`, `idtipo_vehiculo`, `marca_idmarca`, `fecha_registro`, `fecha_modificacion`) VALUES (11, 1, 'V-14', 'C6T-963', 1, '2014', '40', '36', 'plata', 1, 4, '2015-05-27 19:56:47', '2015-05-27 19:56:47');
COMMIT;

-- -----------------------------------------------------
-- Data for table `sgstt`.`aerolinea`
-- -----------------------------------------------------
START TRANSACTION;
USE `sgstt`;
INSERT INTO `sgstt`.`aerolinea` (`idaerolinea`, `descripcion`) VALUES (1, 'Aero Transporte');
INSERT INTO `sgstt`.`aerolinea` (`idaerolinea`, `descripcion`) VALUES (2, 'Aerolineas Argentinas');
INSERT INTO `sgstt`.`aerolinea` (`idaerolinea`, `descripcion`) VALUES (3, 'AeroMexico');
INSERT INTO `sgstt`.`aerolinea` (`idaerolinea`, `descripcion`) VALUES (4, 'AeroSur');
INSERT INTO `sgstt`.`aerolinea` (`idaerolinea`, `descripcion`) VALUES (5, 'Air Canada');
INSERT INTO `sgstt`.`aerolinea` (`idaerolinea`, `descripcion`) VALUES (6, 'Air Europa');
INSERT INTO `sgstt`.`aerolinea` (`idaerolinea`, `descripcion`) VALUES (7, 'Air France');
INSERT INTO `sgstt`.`aerolinea` (`idaerolinea`, `descripcion`) VALUES (8, 'Alitalia');
INSERT INTO `sgstt`.`aerolinea` (`idaerolinea`, `descripcion`) VALUES (9, 'American Airlines');
INSERT INTO `sgstt`.`aerolinea` (`idaerolinea`, `descripcion`) VALUES (10, 'Avianca');
INSERT INTO `sgstt`.`aerolinea` (`idaerolinea`, `descripcion`) VALUES (11, 'Copa Airlines');
INSERT INTO `sgstt`.`aerolinea` (`idaerolinea`, `descripcion`) VALUES (12, 'Delta Airlines');
INSERT INTO `sgstt`.`aerolinea` (`idaerolinea`, `descripcion`) VALUES (13, 'Iberia');
INSERT INTO `sgstt`.`aerolinea` (`idaerolinea`, `descripcion`) VALUES (14, 'KLM');
INSERT INTO `sgstt`.`aerolinea` (`idaerolinea`, `descripcion`) VALUES (15, 'Lan Airlines');
INSERT INTO `sgstt`.`aerolinea` (`idaerolinea`, `descripcion`) VALUES (16, 'Lan Peru');
INSERT INTO `sgstt`.`aerolinea` (`idaerolinea`, `descripcion`) VALUES (17, 'LC Peru');
INSERT INTO `sgstt`.`aerolinea` (`idaerolinea`, `descripcion`) VALUES (18, 'Peruvian Airlines');
INSERT INTO `sgstt`.`aerolinea` (`idaerolinea`, `descripcion`) VALUES (19, 'Sky Airline');
INSERT INTO `sgstt`.`aerolinea` (`idaerolinea`, `descripcion`) VALUES (20, 'Spirit Airlines');
INSERT INTO `sgstt`.`aerolinea` (`idaerolinea`, `descripcion`) VALUES (21, 'Star Peru');
INSERT INTO `sgstt`.`aerolinea` (`idaerolinea`, `descripcion`) VALUES (22, 'Taca Peru');
INSERT INTO `sgstt`.`aerolinea` (`idaerolinea`, `descripcion`) VALUES (23, 'TAM');
INSERT INTO `sgstt`.`aerolinea` (`idaerolinea`, `descripcion`) VALUES (24, 'United');


COMMIT;

-- -----------------------------------------------------
-- Data for table `sgstt`.`vuelo`
-- -----------------------------------------------------
START TRANSACTION;
USE `sgstt`;
INSERT INTO `sgstt`.`vuelo` (`idvuelo`, `idsede`, `descripcion`, `origen`, `destino`, `horario`, `estado`,`idaerolinea`) VALUES (1, 1, 'AV141', 'BOGOTA', 'LIMA', NULL, 1, 1);
INSERT INTO `sgstt`.`vuelo` (`idvuelo`, `idsede`, `descripcion`, `origen`, `destino`, `horario`, `estado`, `idaerolinea`) VALUES (2, 1,'LA2027', 'CARACAS', 'LIMA', NULL, 1, 2);

COMMIT;

-- -----------------------------------------------------
-- Data for table `sgstt`.`servicio`
-- -----------------------------------------------------
START TRANSACTION;
USE `sgstt`;
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (1, 1, 'APTO-LIMA-MIRAFLORES-SAN ISIDRO', 1, 1);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (2, 1, 'APTO-SURCO-LA MOLINA', 1, 1);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (3, 1, 'RESTAURANT (LIMA-SAN ISIDRO-MIRAFLORES)', 1, 1);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (4, 1, 'RECOJO DE TRASLADISTA', 1, 1);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (5, 1, 'RECOJO Y DEJADA DE TRASLADISTA', 1, 1);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (6, 1, 'APTO - HOTEL EL PUEBLO', 1, 1);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (7, 1, 'MOVIL- ORMEÑO-CRUZ DEL SUR S.I./HOTEL', 1, 1);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (8, 1, 'PUERTO CALLAO/APTO', 1, 1);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (9, 1, 'PUERTO CALLAO/ MIRAFLORES O SAN ISIDRO', 1, 1);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (10, 1, 'ASISTENCIA', 1, 1);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (11, 1, 'CITY TOUR (COLONIAL Y MODERNO)', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (12, 1, 'UN MUSEO O COMPRAS', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (13, 1, 'CITY + MUSEO O COMPRAS', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (14, 1, 'CITY + RESTAURANT + MUSEO O COMPRAS', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (15, 1, 'DOS MUSEOS', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (16, 1, 'RUINAS (PACHACAMAC,PURUCHUCO)', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (17, 1, 'RUINAS + MUSEO O RESTAURANT', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (18, 1, 'RUINAS + RESTAURANT + CITY + MUSEO', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (19, 1, 'ISLAS PALOMINO (RT)', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (20, 1, 'LIMA - PARACAS O ICA', 1, 3);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (21, 1, 'LIMA - NAZCA', 1, 3);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (22, 1, 'LIMA - AREQUIPA - HUARAZ O HUANCAYO', 1, 3);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (23, 1, 'LIMA - AREQUIPA Serie Polish - Philiberth', 1, 3);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (24, 1, 'FULL DAY PARACAS O ICA', 1, 3);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (25, 1, 'FULL DAY CARAL', 1, 3);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (26, 1, 'VIATICOS POR CADA CHOFER X DIA', 1, 3);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (27, 1, 'LIMA-ASIA', 1, 3);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (28, 1, 'LIMA/AREQUIPA S.MILLER', 1, 3);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (29, 1, 'LIM/NAZCA/LIMA 2 DIAS S. MILLER', 1, 3);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (30, 1, 'LIM/NAZCA/LIMA 3 DIAS S. MILLER', 1, 3);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (31, 1, 'LIMA-CARAL-BARRANCA-SECHIN-TRUJILLO', 1, 3);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (32, 1, 'CITY BY NIGHT', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (33, 1, 'FUENTES MAGICAS DE AGUA', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (34, 1, 'FUENTES MAGICAS DE AGUA', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (35, 1, 'FUENTES MAGICAS + CENA SHOW', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (36, 1, 'CITY BY NIGH + CENA SHOW', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (37, 1, 'CITY BY NIGHT + F. MAGICAS+CENA SHOW', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (38, 1, 'CITY + MUSEO P.OSMA', 1, 2);

INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (39, 2, 'APTO / HOTEL O VICIVERSA', 1, 1);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (40, 2, 'HOTEL / ESTACION O VICIVERSA', 1, 1);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (41, 2, 'HOTEL / TERMINAL TERRESTRE O VICIVERSA', 1, 1);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (42, 2, 'CUSCO / ESTACION POROY O VICIVERSA', 1, 1);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (43, 2, 'CUSCO/URUBAMBA-YUCAY O VICIVERSA', 1, 1);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (44, 2, 'CUSCO / ESTACION OLLANTA O VICIVERSA', 1, 1);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (45, 2, 'CUSCO/ESTACION OLLANTA/CUSCO', 1, 1);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (46, 2, 'HTL / RESTAURANT / HTL', 1, 1);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (47, 2, 'SERVICIO A DISPOSICION POR HORAS', 1, 1);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (48, 2, 'RUINAS O CIUDAD', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (49, 2, 'COMBINADA', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (50, 2, 'PISAC MARKET', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (51, 2, 'PISAC MERCADO + RUINAS', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (52, 2, 'CHINCHERO', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (53, 2, 'MORAY + SALINERAS', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (54, 2, 'OLLANTA RUINAS', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (55, 2, 'PIQUILLACTA + ANDAHUAYLILLAS', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (56, 2, 'PISAC MARKET + OLLANTA (F/D VALLE)', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (57, 2, 'PISAC MK + P.RUINAS + OLLANTA', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (58, 2, 'PISAC MK + OLLANTA  + CHINCHERO', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (59, 2, 'PISAC + OLLANTA+ O/N + TRF.ESTAC.OLLANTA', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (60, 2, 'PISAC + OLLANTA + WILLOC + PATACANCHA', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (61, 2, 'PISAC + MORAY + SALINERAS', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (62, 2, 'PISAC + OLLANTA + MORAY + SALINERAS', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (63, 2, 'PIQUILLACTA + ANDAHUAYLILLAS + TIPON', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (64, 2, 'INTI RAYMI', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (65, 2, 'CUSCO / PUNO O VICIVERSA', 1, 3);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (66, 2, 'CUSCO / PUNO O VICIVERSA CON SILLUSTANI EN RUTA', 1, 3);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (67, 2, 'PUNO / AREQUIPA O VICIVERSA', 1, 3);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (68, 2, 'PUNO/AREQUIPA O VICIVERSA CON SILLUSTANI EN RUTA', 1, 3);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (69, 2, 'APTO/HTL O VICEVERSA (MALETAS)', 1, 4);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (70, 2, 'APTO/URUBAMBA O VICIVERSA (MALETAS)', 1, 4);

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
-- Data for table `sgstt`.`tipo_cliente`
-- -----------------------------------------------------
START TRANSACTION;
USE `sgstt`;
INSERT INTO `sgstt`.`tipo_cliente` (`id_tipocliente`, `tipo_cliente`) VALUES (1, 'NATURAL');
INSERT INTO `sgstt`.`tipo_cliente` (`id_tipocliente`, `tipo_cliente`) VALUES (2, 'JURIDICO');

COMMIT;

-- -----------------------------------------------------
-- Data for table `sgstt`.`cliente`
-- -----------------------------------------------------
START TRANSACTION;
USE `sgstt`;
INSERT INTO `sgstt`.`cliente` (`idcliente`, `idsede`, `numerodocumento`, `razonsocial`, `estado`, `tipo_documento`, `id_tipocliente`) VALUES ('1', '1', '10401371015', 'CHAU LEGUA CARLOS ALBERTO', '1', 'RUC', '2');            
INSERT INTO `sgstt`.`cliente` (`idcliente`, `idsede`, `numerodocumento`, `razonsocial`, `estado`, `tipo_documento`, `id_tipocliente`) VALUES ('2', '1', '20100132592', 'TOYOTA DEL PERU SA', '1', 'RUC', '2');                    
INSERT INTO `sgstt`.`cliente` (`idcliente`, `idsede`, `numerodocumento`, `razonsocial`, `estado`, `tipo_documento`, `id_tipocliente`) VALUES ('3', '1', '20100939887', 'SETOURS S.A.', '1', 'RUC', '2'); 
INSERT INTO `sgstt`.`cliente` (`idcliente`, `idsede`, `numerodocumento`, `razonsocial`, `estado`, `tipo_documento`, `id_tipocliente`) VALUES ('4', '1', '20102021674', 'DINERS TRAVEL PERU S.A.', '1', 'RUC', '2');               
INSERT INTO `sgstt`.`cliente` (`idcliente`, `idsede`, `numerodocumento`, `razonsocial`, `estado`, `tipo_documento`, `id_tipocliente`) VALUES ('5', '1', '20106740004', 'VULCO PERU SA', '1', 'RUC', '2');                         
INSERT INTO `sgstt`.`cliente` (`idcliente`, `idsede`, `numerodocumento`, `razonsocial`, `estado`, `tipo_documento`, `id_tipocliente`) VALUES ('6', '1', '20107972090', 'INST. DE INGENIEROS DE MINAS DEL PERU', '1', 'RUC', '2'); 
INSERT INTO `sgstt`.`cliente` (`idcliente`, `idsede`, `numerodocumento`, `razonsocial`, `estado`, `tipo_documento`, `id_tipocliente`) VALUES ('7', '1', '20383207691', 'ISA AUTOS EIRL', '1', 'RUC', '2');                        
INSERT INTO `sgstt`.`cliente` (`idcliente`, `idsede`, `numerodocumento`, `razonsocial`, `estado`, `tipo_documento`, `id_tipocliente`) VALUES ('8', '1', '20478194405', 'TRAVELMAX SAC', '1', 'RUC', '2');                         
INSERT INTO `sgstt`.`cliente` (`idcliente`, `idsede`, `numerodocumento`, `razonsocial`, `estado`, `tipo_documento`, `id_tipocliente`) VALUES ('9', '1', '20490431048', 'LATNINA TRAVEL S.A.C', '1', 'RUC', '2');                 
INSERT INTO `sgstt`.`cliente` (`idcliente`, `idsede`, `numerodocumento`, `razonsocial`, `estado`, `tipo_documento`, `id_tipocliente`) VALUES ('10', '1', '20503516706', 'A & V TOUR TRANSPORTE Y TRANSPORTE EI.RL', '1', 'RUC', '2');  
INSERT INTO `sgstt`.`cliente` (`idcliente`, `idsede`, `numerodocumento`, `razonsocial`, `estado`, `tipo_documento`, `id_tipocliente`) VALUES ('11', '1', '20504329551', 'PERU MAGIC TOURS S.A.C', '1', 'RUC', '2');                
INSERT INTO `sgstt`.`cliente` (`idcliente`, `idsede`, `numerodocumento`, `razonsocial`, `estado`, `tipo_documento`, `id_tipocliente`) VALUES ('12', '1', '20510644965', 'VAMOS EXPEDITIONS S.A.C.', '1', 'RUC', '2');              
INSERT INTO `sgstt`.`cliente` (`idcliente`, `idsede`, `numerodocumento`, `razonsocial`, `estado`, `tipo_documento`, `id_tipocliente`) VALUES ('13', '1', '20510815522', 'AERODIANA SAC', '1', 'RUC', '2');                         
INSERT INTO `sgstt`.`cliente` (`idcliente`, `idsede`, `numerodocumento`, `razonsocial`, `estado`, `tipo_documento`, `id_tipocliente`) VALUES ('14', '1', '20511752397', 'PERU EXPERIENCES BELMOND SA', '1', 'RUC', '2');           
INSERT INTO `sgstt`.`cliente` (`idcliente`, `idsede`, `numerodocumento`, `razonsocial`, `estado`, `tipo_documento`, `id_tipocliente`) VALUES ('15', '1', '20514782157', 'MIRAFLORES TRAVEL Y TURISMO SAC', '1', 'RUC', '2');       
INSERT INTO `sgstt`.`cliente` (`idcliente`, `idsede`, `numerodocumento`, `razonsocial`, `estado`, `tipo_documento`, `id_tipocliente`) VALUES ('16', '1', '20517746046', 'OPECOVI SAC', '1', 'RUC', '2');                           
INSERT INTO `sgstt`.`cliente` (`idcliente`, `idsede`, `numerodocumento`, `razonsocial`, `estado`, `tipo_documento`, `id_tipocliente`) VALUES ('17', '1', '20519070198', 'VENTAS Y SERVICIOS MULTI SAC', '1', 'RUC', '2');          
INSERT INTO `sgstt`.`cliente` (`idcliente`, `idsede`, `numerodocumento`, `razonsocial`, `estado`, `tipo_documento`, `id_tipocliente`) VALUES ('18', '1', '20519249678', 'SERVICIOS DE TRANSPORTES TURISTICOS TANG', '1', 'RUC', '2');  
INSERT INTO `sgstt`.`cliente` (`idcliente`, `idsede`, `numerodocumento`, `razonsocial`, `estado`, `tipo_documento`, `id_tipocliente`) VALUES ('19', '1', '20522075095', 'TRANSPORTES TURISTICO BOCANEGRA', '1', 'RUC', '2');       
INSERT INTO `sgstt`.`cliente` (`idcliente`, `idsede`, `numerodocumento`, `razonsocial`, `estado`, `tipo_documento`, `id_tipocliente`) VALUES ('20', '1', '20522266516', 'DISERSUD SAC', '1', 'RUC', '2');                          
INSERT INTO `sgstt`.`cliente` (`idcliente`, `idsede`, `numerodocumento`, `razonsocial`, `estado`, `tipo_documento`, `id_tipocliente`) VALUES ('21', '1', '20527405921', 'CUSCOCOACHING EIRL', '1', 'RUC', '2');                    
INSERT INTO `sgstt`.`cliente` (`idcliente`, `idsede`, `numerodocumento`, `razonsocial`, `estado`, `tipo_documento`, `id_tipocliente`) VALUES ('22', '1', '20534373032', 'MARGARITAS TRAVEL SERVICE EIRL', '1', 'RUC', '2');        
INSERT INTO `sgstt`.`cliente` (`idcliente`, `idsede`, `numerodocumento`, `razonsocial`, `estado`, `tipo_documento`, `id_tipocliente`) VALUES ('23', '1', '20544549961', 'GRUPO PROMETEO S.A.C.', '1', 'RUC', '2');                 
INSERT INTO `sgstt`.`cliente` (`idcliente`, `idsede`, `numerodocumento`, `razonsocial`, `estado`, `tipo_documento`, `id_tipocliente`) VALUES ('24', '1', '20547556781', 'LIMA TODAY SAC', '1', 'RUC', '2');                        
INSERT INTO `sgstt`.`cliente` (`idcliente`, `idsede`, `numerodocumento`, `razonsocial`, `estado`, `tipo_documento`, `id_tipocliente`) VALUES ('25', '1', '20553668370', 'TRANSPACIFIC INVERSIONES SAC', '1', 'RUC', '2');          
INSERT INTO `sgstt`.`cliente` (`idcliente`, `idsede`, `numerodocumento`, `razonsocial`, `estado`, `tipo_documento`, `id_tipocliente`) VALUES ('26', '1', '20554545743', 'CORPORACION PRIMAX SA', '1', 'RUC', '2');                 
INSERT INTO `sgstt`.`cliente` (`idcliente`, `idsede`, `numerodocumento`, `razonsocial`, `estado`, `tipo_documento`, `id_tipocliente`) VALUES ('27', '1', '20554994033', 'KALA ENTERTAINMENT SAC', '1', 'RUC', '2');                
INSERT INTO `sgstt`.`cliente` (`idcliente`, `idsede`, `numerodocumento`, `razonsocial`, `estado`, `tipo_documento`, `id_tipocliente`) VALUES ('28', '1', '20555511117', 'PERU AUDIO TOURS SAC', '1', 'RUC', '2');                  
INSERT INTO `sgstt`.`cliente` (`idcliente`, `idsede`, `numerodocumento`, `razonsocial`, `estado`, `tipo_documento`, `id_tipocliente`) VALUES ('29', '1', '20563260573', 'INVERSIONES KINTARO', '1', 'RUC', '2');                   


COMMIT;

-- -----------------------------------------------------
-- Data for table `sgstt`.`empleado`
-- -----------------------------------------------------
START TRANSACTION;
USE `sgstt`;
INSERT INTO `sgstt`.`empleado` (`idempleado`,`idsede`, `nombre`, `apellidos`, `dni`, `telefono`, `celular`, `correo`, `estado`) VALUES (1, 1, 'Sistema', 'Administrador Lima', '11111111', '11111111', '11111111', '11111111', 1);
INSERT INTO `sgstt`.`empleado` (`idempleado`,`idsede`, `nombre`, `apellidos`, `dni`, `telefono`, `celular`, `correo`, `estado`) VALUES (2, 2, 'Sistema', 'Administrador Cusco', '11111111', '11111111', '11111111', '11111111', 1);

COMMIT;

-- -----------------------------------------------------
-- Data for table `sgstt`.`perfil`
-- -----------------------------------------------------
START TRANSACTION;
USE `sgstt`;
INSERT INTO `sgstt`.`perfil` (`idperfil`, `nombre`, `estado`) VALUES (1, 'Administrador del Sistema', 1);
INSERT INTO `sgstt`.`perfil` (`idperfil`, `nombre`, `estado`) VALUES (2, 'Gerente Administrativo', 1);
INSERT INTO `sgstt`.`perfil` (`idperfil`, `nombre`, `estado`) VALUES (3, 'Encargador de Servicios', 1);

COMMIT;

-- -----------------------------------------------------
-- Data for table `sgstt`.`usuario`
-- -----------------------------------------------------
START TRANSACTION;
USE `sgstt`;
INSERT INTO `sgstt`.`usuario` (`idusuario`, `idperfil`, `idempleado`, `idsede`, `nick`, `clave`, `estado`) VALUES (1, 1, 1, 1, 'admin-lima', 'admin1234', 1);
INSERT INTO `sgstt`.`usuario` (`idusuario`, `idperfil`, `idempleado`, `idsede`, `nick`, `clave`, `estado`) VALUES (2, 1, 2, 2, 'admin-cusco', 'admin1234', 1);


COMMIT;

-- -----------------------------------------------------
-- Data for table `sgstt`.`modulo`
-- -----------------------------------------------------
START TRANSACTION;
USE `sgstt`;

INSERT INTO `sgstt`.`modulo` (`idmodulo`, `nombre`, `url`, `listar`, `crear`, `actualizar`, `eliminar`, `estado`) VALUES (1, 'Administrar Clientes', 'cliente', 1, 1, 1, 1, 1);
INSERT INTO `sgstt`.`modulo` (`idmodulo`, `nombre`, `url`, `listar`, `crear`, `actualizar`, `eliminar`, `estado`) VALUES (2, 'Administrar Choferes', 'chofer', 1, 1, 1, 1, 1);
INSERT INTO `sgstt`.`modulo` (`idmodulo`, `nombre`, `url`, `listar`, `crear`, `actualizar`, `eliminar`, `estado`) VALUES (3, 'Administrar Cuentas', 'cuenta', 1, 1, 1, 1, 1);
INSERT INTO `sgstt`.`modulo` (`idmodulo`, `nombre`, `url`, `listar`, `crear`, `actualizar`, `eliminar`, `estado`) VALUES (4, 'Administrar Destinos', 'destino', 1, 1, 1, 1, 1);
INSERT INTO `sgstt`.`modulo` (`idmodulo`, `nombre`, `url`, `listar`, `crear`, `actualizar`, `eliminar`, `estado`) VALUES (5, 'Administrar Empleados', 'empleado', 1, 1, 1, 1, 1);
INSERT INTO `sgstt`.`modulo` (`idmodulo`, `nombre`, `url`, `listar`, `crear`, `actualizar`, `eliminar`, `estado`) VALUES (6, 'Administrar Files', 'file', 1, 1, 1, 1, 1);
INSERT INTO `sgstt`.`modulo` (`idmodulo`, `nombre`, `url`, `listar`, `crear`, `actualizar`, `eliminar`, `estado`) VALUES (7, 'Administrar VTA Directa', 'venta', 1, 0, 0, 0, 1);
INSERT INTO `sgstt`.`modulo` (`idmodulo`, `nombre`, `url`, `listar`, `crear`, `actualizar`, `eliminar`, `estado`) VALUES (8, 'Administrar Incidencias', 'incidencia', 1, 1, 1, 1, 1);
INSERT INTO `sgstt`.`modulo` (`idmodulo`, `nombre`, `url`, `listar`, `crear`, `actualizar`, `eliminar`, `estado`) VALUES (9, 'Administrar Modulos', 'modulo', 1, 1, 1, 1, 1);
INSERT INTO `sgstt`.`modulo` (`idmodulo`, `nombre`, `url`, `listar`, `crear`, `actualizar`, `eliminar`, `estado`) VALUES (10, 'Administrar Ordenes', 'ordenServicio', 1, 1, 1, 1, 1);
INSERT INTO `sgstt`.`modulo` (`idmodulo`, `nombre`, `url`, `listar`, `crear`, `actualizar`, `eliminar`, `estado`) VALUES (11, 'Administrar Perfiles', 'perfil', 1, 1, 1, 1, 1);
INSERT INTO `sgstt`.`modulo` (`idmodulo`, `nombre`, `url`, `listar`, `crear`, `actualizar`, `eliminar`, `estado`) VALUES (12, 'Administrar Servicios', 'servicio', 1, 1, 1, 1, 1);
INSERT INTO `sgstt`.`modulo` (`idmodulo`, `nombre`, `url`, `listar`, `crear`, `actualizar`, `eliminar`, `estado`) VALUES (13, 'Administrar Tarifario', 'tarifa', 1, 1, 1, 1, 1);
INSERT INTO `sgstt`.`modulo` (`idmodulo`, `nombre`, `url`, `listar`, `crear`, `actualizar`, `eliminar`, `estado`) VALUES (14, 'Administrar Trasladistas', 'trasladista', 1, 1, 1, 1, 1);
INSERT INTO `sgstt`.`modulo` (`idmodulo`, `nombre`, `url`, `listar`, `crear`, `actualizar`, `eliminar`, `estado`) VALUES (15, 'Administrar Transportista', 'empresa', 1, 1, 1, 1, 1);
INSERT INTO `sgstt`.`modulo` (`idmodulo`, `nombre`, `url`, `listar`, `crear`, `actualizar`, `eliminar`, `estado`) VALUES (16, 'Administrar Tipo Servicios', 'tipoServicio', 1, 1, 1, 1, 1);
INSERT INTO `sgstt`.`modulo` (`idmodulo`, `nombre`, `url`, `listar`, `crear`, `actualizar`, `eliminar`, `estado`) VALUES (17, 'Administrar Vehiculos', 'vehiculo', 1, 1, 1, 1, 1);
INSERT INTO `sgstt`.`modulo` (`idmodulo`, `nombre`, `url`, `listar`, `crear`, `actualizar`, `eliminar`, `estado`) VALUES (18, 'Administrar Vuelos', 'vuelo', 1, 1, 1, 1, 1);

COMMIT;

-- -----------------------------------------------------
-- Data for table `sgstt`.`permiso`
-- -----------------------------------------------------
START TRANSACTION;
USE `sgstt`;
INSERT INTO `sgstt`.`permiso` (`idpermiso`, `idperfil`, `idmodulo`, `listar`, `crear`, `actualizar`, `eliminar`) VALUES (1, 1, 1, 1, 1, 1, 1);
INSERT INTO `sgstt`.`permiso` (`idpermiso`, `idperfil`, `idmodulo`, `listar`, `crear`, `actualizar`, `eliminar`) VALUES (2, 1, 2, 1, 1, 1, 1);
INSERT INTO `sgstt`.`permiso` (`idpermiso`, `idperfil`, `idmodulo`, `listar`, `crear`, `actualizar`, `eliminar`) VALUES (3, 1, 3, 1, 1, 1, 1);
INSERT INTO `sgstt`.`permiso` (`idpermiso`, `idperfil`, `idmodulo`, `listar`, `crear`, `actualizar`, `eliminar`) VALUES (4, 1, 4, 1, 1, 1, 1);
INSERT INTO `sgstt`.`permiso` (`idpermiso`, `idperfil`, `idmodulo`, `listar`, `crear`, `actualizar`, `eliminar`) VALUES (5, 1, 5, 1, 1, 1, 1);
INSERT INTO `sgstt`.`permiso` (`idpermiso`, `idperfil`, `idmodulo`, `listar`, `crear`, `actualizar`, `eliminar`) VALUES (6, 1, 6, 1, 1, 1, 1);
INSERT INTO `sgstt`.`permiso` (`idpermiso`, `idperfil`, `idmodulo`, `listar`, `crear`, `actualizar`, `eliminar`) VALUES (7, 1, 7, 1, 0, 0, 0);
INSERT INTO `sgstt`.`permiso` (`idpermiso`, `idperfil`, `idmodulo`, `listar`, `crear`, `actualizar`, `eliminar`) VALUES (8, 1, 8, 1, 1, 1, 1);
INSERT INTO `sgstt`.`permiso` (`idpermiso`, `idperfil`, `idmodulo`, `listar`, `crear`, `actualizar`, `eliminar`) VALUES (9, 1, 9, 1, 1, 1, 1);
INSERT INTO `sgstt`.`permiso` (`idpermiso`, `idperfil`, `idmodulo`, `listar`, `crear`, `actualizar`, `eliminar`) VALUES (10, 1, 10, 1, 1, 1, 1);
INSERT INTO `sgstt`.`permiso` (`idpermiso`, `idperfil`, `idmodulo`, `listar`, `crear`, `actualizar`, `eliminar`) VALUES (11, 1, 11, 1, 1, 1, 1);
INSERT INTO `sgstt`.`permiso` (`idpermiso`, `idperfil`, `idmodulo`, `listar`, `crear`, `actualizar`, `eliminar`) VALUES (12, 1, 12, 1, 1, 1, 1);
INSERT INTO `sgstt`.`permiso` (`idpermiso`, `idperfil`, `idmodulo`, `listar`, `crear`, `actualizar`, `eliminar`) VALUES (13, 1, 13, 1, 1, 1, 1);
INSERT INTO `sgstt`.`permiso` (`idpermiso`, `idperfil`, `idmodulo`, `listar`, `crear`, `actualizar`, `eliminar`) VALUES (14, 1, 14, 1, 1, 1, 1);
INSERT INTO `sgstt`.`permiso` (`idpermiso`, `idperfil`, `idmodulo`, `listar`, `crear`, `actualizar`, `eliminar`) VALUES (15, 1, 15, 1, 1, 1, 1);
INSERT INTO `sgstt`.`permiso` (`idpermiso`, `idperfil`, `idmodulo`, `listar`, `crear`, `actualizar`, `eliminar`) VALUES (16, 1, 16, 1, 1, 1, 1);
INSERT INTO `sgstt`.`permiso` (`idpermiso`, `idperfil`, `idmodulo`, `listar`, `crear`, `actualizar`, `eliminar`) VALUES (49, 1, 17, 1, 1, 1, 1);
INSERT INTO `sgstt`.`permiso` (`idpermiso`, `idperfil`, `idmodulo`, `listar`, `crear`, `actualizar`, `eliminar`) VALUES (52, 1, 18, 1, 1, 1, 1);

INSERT INTO `sgstt`.`permiso` (`idpermiso`, `idperfil`, `idmodulo`, `listar`, `crear`, `actualizar`, `eliminar`) VALUES (17, 2, 1, 1, 1, 1, 1);
INSERT INTO `sgstt`.`permiso` (`idpermiso`, `idperfil`, `idmodulo`, `listar`, `crear`, `actualizar`, `eliminar`) VALUES (18, 2, 2, 1, 1, 1, 1);
INSERT INTO `sgstt`.`permiso` (`idpermiso`, `idperfil`, `idmodulo`, `listar`, `crear`, `actualizar`, `eliminar`) VALUES (19, 2, 3, 0, 0, 0, 0);
INSERT INTO `sgstt`.`permiso` (`idpermiso`, `idperfil`, `idmodulo`, `listar`, `crear`, `actualizar`, `eliminar`) VALUES (20, 2, 4, 1, 1, 1, 1);
INSERT INTO `sgstt`.`permiso` (`idpermiso`, `idperfil`, `idmodulo`, `listar`, `crear`, `actualizar`, `eliminar`) VALUES (21, 2, 5, 1, 1, 1, 1);
INSERT INTO `sgstt`.`permiso` (`idpermiso`, `idperfil`, `idmodulo`, `listar`, `crear`, `actualizar`, `eliminar`) VALUES (22, 2, 6, 0, 0, 0, 0);
INSERT INTO `sgstt`.`permiso` (`idpermiso`, `idperfil`, `idmodulo`, `listar`, `crear`, `actualizar`, `eliminar`) VALUES (23, 2, 7, 1, 0, 0, 0);
INSERT INTO `sgstt`.`permiso` (`idpermiso`, `idperfil`, `idmodulo`, `listar`, `crear`, `actualizar`, `eliminar`) VALUES (24, 2, 8, 1, 1, 1, 1);
INSERT INTO `sgstt`.`permiso` (`idpermiso`, `idperfil`, `idmodulo`, `listar`, `crear`, `actualizar`, `eliminar`) VALUES (25, 2, 9, 0, 0, 0, 0);
INSERT INTO `sgstt`.`permiso` (`idpermiso`, `idperfil`, `idmodulo`, `listar`, `crear`, `actualizar`, `eliminar`) VALUES (26, 2, 10, 1, 1, 1, 1);
INSERT INTO `sgstt`.`permiso` (`idpermiso`, `idperfil`, `idmodulo`, `listar`, `crear`, `actualizar`, `eliminar`) VALUES (27, 2, 11, 0, 0, 0, 0);
INSERT INTO `sgstt`.`permiso` (`idpermiso`, `idperfil`, `idmodulo`, `listar`, `crear`, `actualizar`, `eliminar`) VALUES (28, 2, 12, 1, 1, 1, 1);
INSERT INTO `sgstt`.`permiso` (`idpermiso`, `idperfil`, `idmodulo`, `listar`, `crear`, `actualizar`, `eliminar`) VALUES (29, 2, 13, 1, 1, 1, 1);
INSERT INTO `sgstt`.`permiso` (`idpermiso`, `idperfil`, `idmodulo`, `listar`, `crear`, `actualizar`, `eliminar`) VALUES (30, 2, 14, 1, 1, 1, 1);
INSERT INTO `sgstt`.`permiso` (`idpermiso`, `idperfil`, `idmodulo`, `listar`, `crear`, `actualizar`, `eliminar`) VALUES (31, 2, 15, 1, 1, 1, 1);
INSERT INTO `sgstt`.`permiso` (`idpermiso`, `idperfil`, `idmodulo`, `listar`, `crear`, `actualizar`, `eliminar`) VALUES (32, 2, 16, 1, 1, 1, 1);
INSERT INTO `sgstt`.`permiso` (`idpermiso`, `idperfil`, `idmodulo`, `listar`, `crear`, `actualizar`, `eliminar`) VALUES (50, 2, 17, 1, 1, 1, 1);
INSERT INTO `sgstt`.`permiso` (`idpermiso`, `idperfil`, `idmodulo`, `listar`, `crear`, `actualizar`, `eliminar`) VALUES (53, 2, 18, 1, 1, 1, 1);

INSERT INTO `sgstt`.`permiso` (`idpermiso`, `idperfil`, `idmodulo`, `listar`, `crear`, `actualizar`, `eliminar`) VALUES (33, 3, 1, 1, 1, 1, 0);
INSERT INTO `sgstt`.`permiso` (`idpermiso`, `idperfil`, `idmodulo`, `listar`, `crear`, `actualizar`, `eliminar`) VALUES (34, 3, 2, 1, 1, 0, 0);
INSERT INTO `sgstt`.`permiso` (`idpermiso`, `idperfil`, `idmodulo`, `listar`, `crear`, `actualizar`, `eliminar`) VALUES (35, 3, 3, 0, 0, 0, 0);
INSERT INTO `sgstt`.`permiso` (`idpermiso`, `idperfil`, `idmodulo`, `listar`, `crear`, `actualizar`, `eliminar`) VALUES (36, 3, 4, 1, 1, 1, 0);
INSERT INTO `sgstt`.`permiso` (`idpermiso`, `idperfil`, `idmodulo`, `listar`, `crear`, `actualizar`, `eliminar`) VALUES (37, 3, 5, 1, 1, 1, 0);
INSERT INTO `sgstt`.`permiso` (`idpermiso`, `idperfil`, `idmodulo`, `listar`, `crear`, `actualizar`, `eliminar`) VALUES (38, 3, 6, 0, 0, 0, 0);
INSERT INTO `sgstt`.`permiso` (`idpermiso`, `idperfil`, `idmodulo`, `listar`, `crear`, `actualizar`, `eliminar`) VALUES (39, 3, 7, 1, 0, 0, 0);
INSERT INTO `sgstt`.`permiso` (`idpermiso`, `idperfil`, `idmodulo`, `listar`, `crear`, `actualizar`, `eliminar`) VALUES (40, 3, 8, 1, 1, 0, 0);
INSERT INTO `sgstt`.`permiso` (`idpermiso`, `idperfil`, `idmodulo`, `listar`, `crear`, `actualizar`, `eliminar`) VALUES (41, 3, 9, 0, 0, 0, 0);
INSERT INTO `sgstt`.`permiso` (`idpermiso`, `idperfil`, `idmodulo`, `listar`, `crear`, `actualizar`, `eliminar`) VALUES (42, 3, 10, 1, 1, 1, 1);
INSERT INTO `sgstt`.`permiso` (`idpermiso`, `idperfil`, `idmodulo`, `listar`, `crear`, `actualizar`, `eliminar`) VALUES (43, 3, 11, 0, 0, 0, 0);
INSERT INTO `sgstt`.`permiso` (`idpermiso`, `idperfil`, `idmodulo`, `listar`, `crear`, `actualizar`, `eliminar`) VALUES (44, 3, 12, 1, 1, 1, 0);
INSERT INTO `sgstt`.`permiso` (`idpermiso`, `idperfil`, `idmodulo`, `listar`, `crear`, `actualizar`, `eliminar`) VALUES (45, 3, 13, 1, 1, 0, 0);
INSERT INTO `sgstt`.`permiso` (`idpermiso`, `idperfil`, `idmodulo`, `listar`, `crear`, `actualizar`, `eliminar`) VALUES (46, 3, 14, 1, 1, 0, 0);
INSERT INTO `sgstt`.`permiso` (`idpermiso`, `idperfil`, `idmodulo`, `listar`, `crear`, `actualizar`, `eliminar`) VALUES (47, 3, 15, 1, 1, 0, 0);
INSERT INTO `sgstt`.`permiso` (`idpermiso`, `idperfil`, `idmodulo`, `listar`, `crear`, `actualizar`, `eliminar`) VALUES (48, 3, 16, 1, 1, 0, 0);
INSERT INTO `sgstt`.`permiso` (`idpermiso`, `idperfil`, `idmodulo`, `listar`, `crear`, `actualizar`, `eliminar`) VALUES (51, 3, 17, 1, 1, 0, 0);
INSERT INTO `sgstt`.`permiso` (`idpermiso`, `idperfil`, `idmodulo`, `listar`, `crear`, `actualizar`, `eliminar`) VALUES (54, 3, 18, 1, 1, 0, 0);

COMMIT;

-- -----------------------------------------------------
-- Data for table `sgstt`.`destinos`
-- -----------------------------------------------------
START TRANSACTION;
USE `sgstt`;
INSERT INTO `sgstt`.`destinos` (`iddestinos`,`idsede`, `razonsocial`,`razoncomercial`,`ruc`,`direccion`,`telefono`,`web`,`ubigeo`,`latitud`, `longitud`,`tipo_destino`, `estado`)  VALUES (1, 1,'AEROPUERTO LAN','AEROPUERTO LAN','RUC21335523','AEROPUERTO LAN','AEROPUERTO LAN','LAN', 'AEROPUERTO LAN', '1', '1','Hotel', 1);
INSERT INTO `sgstt`.`destinos` (`iddestinos`,`idsede`, `razonsocial`,`razoncomercial`,`ruc`,`direccion`,`telefono`,`web`,`ubigeo`,`latitud`, `longitud`,`tipo_destino`, `estado`)  VALUES (2, 1,'HOTEL SHERATON','HOTEL SHERATON','RUC21335523','HOTEL SHERATON','HOTEL SHERATON','HOTEL SHERATON','HOTEL SHERATON', '2', '2','Hotel', 1);
INSERT INTO `sgstt`.`destinos` (`iddestinos`,`idsede`, `razonsocial`,`razoncomercial`,`ruc`,`direccion`,`telefono`,`web`,`ubigeo`,`latitud`, `longitud`,`tipo_destino`, `estado`)  VALUES (3, 1,'HOTEL MARRIOT', 'HOTEL MARRIOT','RUC21335523', 'HOTEL MARRIOT', 'HOTEL MARRIOT', 'HOTEL MARRIOT', 'HOTEL MARRIOT', '1', '2','Hotel', 1);
INSERT INTO `sgstt`.`destinos` (`iddestinos`,`idsede`, `razonsocial`,`razoncomercial`,`ruc`,`direccion`,`telefono`,`web`,`ubigeo`,`latitud`, `longitud`,`tipo_destino`, `estado`)  VALUES (4, 2,'HOTEL CONQUISTADORES','HOTEL CONQUISTADORES','RUC21335523','HOTEL CONQUISTADORES','HOTEL CONQUISTADORES','HOTEL CONQUISTADORES','HOTEL CONQUISTADORES', '1', '2','Hotel', 1);

COMMIT;

-- -----------------------------------------------------
-- Data for table `sgstt`.`servicio_destinos`
-- -----------------------------------------------------
START TRANSACTION;
USE `sgstt`;
INSERT INTO `sgstt`.`servicio_destinos` (`servicio_idservicio`, `destinos_iddestinos`) VALUES (1, 1);
INSERT INTO `sgstt`.`servicio_destinos` (`servicio_idservicio`, `destinos_iddestinos`) VALUES (1, 2);
INSERT INTO `sgstt`.`servicio_destinos` (`servicio_idservicio`, `destinos_iddestinos`) VALUES (2, 1);
INSERT INTO `sgstt`.`servicio_destinos` (`servicio_idservicio`, `destinos_iddestinos`) VALUES (2, 3);
INSERT INTO `sgstt`.`servicio_destinos` (`servicio_idservicio`, `destinos_iddestinos`) VALUES (3, 1);
INSERT INTO `sgstt`.`servicio_destinos` (`servicio_idservicio`, `destinos_iddestinos`) VALUES (3, 4);

COMMIT;
