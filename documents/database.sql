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
  `horas` VARCHAR(10) NOT NULL ,
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
  `idcliente` INT NOT NULL,
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
INSERT INTO `sgstt`.`trasladista` (`idtrasladista`,`idsede`, `nombre`, `apellido`, `dni`, `direccion`, `correo`, `telefono`, `celular`, `estado`) VALUES (3, 1, 'Silvia', 'de Vettor', '00000000', 'Ramï¿½n Castilla 418 Urb. Aurora', 'No disponible', '7437434', '987654345', 1);
INSERT INTO `sgstt`.`trasladista` (`idtrasladista`,`idsede`, `nombre`, `apellido`, `dni`, `direccion`, `correo`, `telefono`, `celular`, `estado`) VALUES (4, 1, 'Ursula', 'Collas', '00000000', 'Calle. Alfredo silva 142, Casa 115', 'No disponible', '5457854', '965874123', 1);
INSERT INTO `sgstt`.`trasladista` (`idtrasladista`,`idsede`, `nombre`, `apellido`, `dni`, `direccion`, `correo`, `telefono`, `celular`, `estado`) VALUES (5, 1, 'Nelida', 'Manrique', '00000000', 'Calle. Manco Capac 421-Dpto 102 ', 'No disponible', '7437434', '987654345', 1);
INSERT INTO `sgstt`.`trasladista` (`idtrasladista`,`idsede`, `nombre`, `apellido`, `dni`, `direccion`, `correo`, `telefono`, `celular`, `estado`) VALUES (6, 1, 'Franz', 'Alarcon', '00000000', 'Av. Grau 341 Ã± Dpto 602', 'No disponible', '5457854', '965874123', 1);
INSERT INTO `sgstt`.`trasladista` (`idtrasladista`,`idsede`, `nombre`, `apellido`, `dni`, `direccion`, `correo`, `telefono`, `celular`, `estado`) VALUES (7, 1, 'Nieves', 'Echegaray', '00000000', 'Parque echenique 741 Dpto. 501', 'No disponible', '7437434', '987654345', 1);
INSERT INTO `sgstt`.`trasladista` (`idtrasladista`,`idsede`, `nombre`, `apellido`, `dni`, `direccion`, `correo`, `telefono`, `celular`, `estado`) VALUES (8, 1, 'Oscar', 'Von Bishopsahussen', '00000000', 'Av. Castilla con Av. Ayacucho G in 17 - Urbanizaciï¿½n La Capullana', 'No disponible', '5457854', '965874123', 1);
INSERT INTO `sgstt`.`trasladista` (`idtrasladista`,`idsede`, `nombre`, `apellido`, `dni`, `direccion`, `correo`, `telefono`, `celular`, `estado`) VALUES (9, 1, 'Ernesto', 'Riedner', '00000000', 'Jr. Fernando castrat #320', 'No disponible', '7437434', '987654345', 1);
INSERT INTO `sgstt`.`trasladista` (`idtrasladista`,`idsede`, `nombre`, `apellido`, `dni`, `direccion`, `correo`, `telefono`, `celular`, `estado`) VALUES (10, 1, 'Guillermo', 'Torres', '00000000', 'Enrique Barrï¿½n Nï¿½ 845 Ã± Dpto. 202 Ã± Santa Beatriz / Referencia al frente del parque de las aguas.', 'No disponible', '5457854', '965874123', 1);
INSERT INTO `sgstt`.`trasladista` (`idtrasladista`,`idsede`, `nombre`, `apellido`, `dni`, `direccion`, `correo`, `telefono`, `celular`, `estado`) VALUES (11, 1, 'Mariana', 'Garcia', '00000000', 'Calle La Penï¿½nsula Mz C1 Lt 21 Urb. La Ensenada', 'No disponible', '7437434', '987654345', 1);
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
INSERT INTO `sgstt`.`empresa` (`idempresa`,`idsede`, `razon_social`, `ruc`,`centrocosto`, `telefono`, `celular`, `correo`, `estado`) VALUES (28, 1, 'TRANSP.WIï¿½ATOUR', ' ',"VT-28", ' ', ' ', ' ',1);
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
INSERT INTO `sgstt`.`chofer` (`idchofer`, `idsede`, `nombre`, `apellido`, `dni`, `celular`, `brevete`, `categoria`, `clave`,`fecha`, `estado`,`idempresa`)  VALUES (2, 2, 'CESAR AMADO', 'ARELLANOS MUï¿½OZ', '25662462', ' ',' ', 'A2', '12345678',"2015-11-07 00:00:00", 1,1);
INSERT INTO `sgstt`.`chofer` (`idchofer`, `idsede`, `nombre`, `apellido`, `dni`, `celular`, `brevete`, `categoria`, `clave`,`fecha`, `estado`,`idempresa`)  VALUES (3, 1, 'MARIO HERNAN', 'CUADROS HUAPAYA', '25577045', ' ',' ', 'A3', '12345678',"2015-11-07 00:00:00", 1,1);
INSERT INTO `sgstt`.`chofer` (`idchofer`, `idsede`, `nombre`, `apellido`, `dni`, `celular`, `brevete`, `categoria`, `clave`,`fecha`, `estado`,`idempresa`)  VALUES (4, 1, 'PEPE', 'DAMIAN JURO', '10550499', ' ',' ', 'A1', '12345678',"2015-11-07 00:00:00", 1,1);
INSERT INTO `sgstt`.`chofer` (`idchofer`, `idsede`, `nombre`, `apellido`, `dni`, `celular`, `brevete`, `categoria`, `clave`,`fecha`, `estado`,`idempresa`)  VALUES (5, 1, 'KATTY DORIS', 'ESCOBAR PUMACALLAO', '07884541', ' ',' ', 'A2', '12345678',"2015-11-07 00:00:00", 1,1);
INSERT INTO `sgstt`.`chofer` (`idchofer`, `idsede`, `nombre`, `apellido`, `dni`, `celular`, `brevete`, `categoria`, `clave`,`fecha`, `estado`,`idempresa`)  VALUES (6, 1, 'CARLOS ALBERTO', 'HERRERA NAVARRO', '10630551', ' ',' ', 'A3', '12345678',"2015-11-07 00:00:00", 1,1);
INSERT INTO `sgstt`.`chofer` (`idchofer`, `idsede`, `nombre`, `apellido`, `dni`, `celular`, `brevete`, `categoria`, `clave`,`fecha`, `estado`,`idempresa`)  VALUES (7, 1, 'JOSE EDUARDO', 'HUAPALLA BALCAZAR', '10144415', ' ',' ', 'A1', '12345678',"2015-11-07 00:00:00", 1,1);
INSERT INTO `sgstt`.`chofer` (`idchofer`, `idsede`, `nombre`, `apellido`, `dni`, `celular`, `brevete`, `categoria`, `clave`,`fecha`, `estado`,`idempresa`)  VALUES (8, 1, 'RODOLFO CESAR', 'LAZO CALDERON', '25717877', ' ',' ', 'A2', '12345678',"2015-11-07 00:00:00", 1,1);
INSERT INTO `sgstt`.`chofer` (`idchofer`, `idsede`, `nombre`, `apellido`, `dni`, `celular`, `brevete`, `categoria`, `clave`,`fecha`, `estado`,`idempresa`)  VALUES (9, 1, 'JOSE LUIS', 'NUï¿½EZ CUENCA ROJAS', '09461980', ' ',' ', 'A3', '12345678',"2015-11-07 00:00:00", 1,1);
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
INSERT INTO `sgstt`.`tipo_vehiculo` (`idtipo_vehiculo`, `nombre`, `capacidad`) VALUES (1, 'Automovil', 5);
INSERT INTO `sgstt`.`tipo_vehiculo` (`idtipo_vehiculo`, `nombre`, `capacidad`) VALUES (2, 'Bus', 30);
INSERT INTO `sgstt`.`tipo_vehiculo` (`idtipo_vehiculo`, `nombre`, `capacidad`) VALUES (3, 'Bus-24 Max', 30);
INSERT INTO `sgstt`.`tipo_vehiculo` (`idtipo_vehiculo`, `nombre`, `capacidad`) VALUES (4, 'Bus-30 Max', 30);
INSERT INTO `sgstt`.`tipo_vehiculo` (`idtipo_vehiculo`, `nombre`, `capacidad`) VALUES (5, 'Mini Bus', 20);
INSERT INTO `sgstt`.`tipo_vehiculo` (`idtipo_vehiculo`, `nombre`, `capacidad`) VALUES (6, 'Sprinter Larga', 35);
INSERT INTO `sgstt`.`tipo_vehiculo` (`idtipo_vehiculo`, `nombre`, `capacidad`) VALUES (7, 'Sprinter Corta', 40);
INSERT INTO `sgstt`.`tipo_vehiculo` (`idtipo_vehiculo`, `nombre`, `capacidad`) VALUES (8, 'Van', 10);

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
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (1, 1, 0, 'APTO-LIMA-MIRAFLORES-SAN ISIDRO', 1, 1);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (2, 1, 0, 'APTO-SURCO-LA MOLINA', 1, 1);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (3, 1, 0, 'RESTAURANT (LIMA-SAN ISIDRO-MIRAFLORES)', 1, 1);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (4, 1, 0, 'RECOJO DE TRASLADISTA', 1, 1);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (5, 1, 0, 'RECOJO Y DEJADA DE TRASLADISTA', 1, 1);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (6, 1, 0, 'APTO - HOTEL EL PUEBLO', 1, 1);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (7, 1, 0, 'MOVIL- ORMEÃ‘O-CRUZ DEL SUR S.I./HOTEL', 1, 1);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (8, 1, 0, 'PUERTO CALLAO/APTO', 1, 1);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (9, 1, 0, 'PUERTO CALLAO/ MIRAFLORES O SAN ISIDRO', 1, 1);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (10, 1, 0, 'ASISTENCIA', 1, 1);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (11, 1, 0, 'CITY TOUR (COLONIAL Y MODERNO)', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (12, 1, 0, 'UN MUSEO O COMPRAS', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (13, 1, 0, 'CITY + MUSEO O COMPRAS', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (14, 1, 0, 'CITY + RESTAURANT + MUSEO O COMPRAS', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (15, 1, 0, 'DOS MUSEOS', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (16, 1, 0, 'RUINAS (PACHACAMAC,PURUCHUCO)', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (17, 1, 0, 'RUINAS + MUSEO O RESTAURANT', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (18, 1, 0, 'RUINAS + RESTAURANT + CITY + MUSEO', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (19, 1, 0, 'DISPOSICION O HORA ADICIONAL', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (20, 1, 0, 'ISLAS PALOMINO (RT)', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (21, 1, 0, 'LIMA - PARACAS O ICA', 1, 3);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (22, 1, 0, 'LIMA - NAZCA', 1, 3);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (23, 1, 0, 'LIMA - AREQUIPA - HUARAZ O HUANCAYO', 1, 3);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (24, 1, 0, 'LIMA - AREQUIPA Serie Polish - Philiberth', 1, 3);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (25, 1, 0, 'FULL DAY PARACAS O ICA', 1, 3);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (26, 1, 0, 'FULL DAY CARAL', 1, 3);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (27, 1, 0, 'VIATICOS POR CADA CHOFER X DIA', 1, 3);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (28, 1, 0, 'LIMA-ASIA', 1, 3);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (29, 1, 0, 'LIMA/AREQUIPA S.MILLER', 1, 3);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (30, 1, 0, 'LIM/NAZCA/LIMA 2 DIAS S. MILLER', 1, 3);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (31, 1, 0, 'LIM/NAZCA/LIMA 3 DIAS S. MILLER', 1, 3);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (32, 1, 0, 'LIMA-CARAL-BARRANCA-SECHIN-TRUJILLO', 1, 3);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (33, 1, 0, 'CITY BY NIGHT', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (34, 1, 0, 'FUENTES MAGICAS DE AGUA', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (35, 1, 0, 'FUENTES MAGICAS DE AGUA', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (36, 1, 0, 'FUENTES MAGICAS + CENA SHOW', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (37, 1, 0, 'CITY BY NIGH + CENA SHOW', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (38, 1, 0, 'CITY BY NIGHT + F. MAGICAS+CENA SHOW', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (39, 1, 0, 'CITY + MUSEO P.OSMA', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (40, 1, 0, 'APTO - LIMA - MIRAFLORES O SAN ISIDRO - ART OF TRAVEL', 1, 4);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (41, 1, 0, 'CITY + MUSEO O COMPRAS - ART OF TRAVEL', 1, 4);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (42, 1, 0, 'DISPOSICION POR HORA 1H/18KM - ART OF TRAVEL', 1, 4);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (43, 1, 0, 'DISPOSICION POR HORA 3H/18KM - ART OF TRAVEL', 1, 4);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (44, 1, 0, 'DISPOSICION POR HORA 4H/18KM - ART OF TRAVEL', 1, 4);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (45, 1, 0, ' LIMA PARACAS  O VICEVERSA - ART OF TRAVEL', 1, 4);



INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (46, 2, 0, 'APTO / HOTEL O VICIVERSA', 1, 1);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (47, 2, 0, 'HOTEL / ESTACION O VICIVERSA', 1, 1);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (48, 2, 0, 'HOTEL / TERMINAL TERRESTRE O VICIVERSA', 1, 1);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (49, 2, 0, 'CUSCO / ESTACION POROY O VICIVERSA', 1, 1);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (50, 2, 0, 'CUSCO/URUBAMBA-YUCAY O VICIVERSA', 1, 1);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (51, 2, 0, 'CUSCO / ESTACION OLLANTA O VICIVERSA', 1, 1);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (52, 2, 0, 'CUSCO/ESTACION OLLANTA/CUSCO', 1, 1);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (53, 2, 0, 'HTL / RESTAURANT / HTL', 1, 1);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (54, 2, 0, 'SERVICIO A DISPOSICION POR HORAS', 1, 1);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (55, 2, 0, 'RUINAS O CIUDAD', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (56, 2, 0, 'COMBINADA', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (57, 2, 0, 'PISAC MARKET', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (58, 2, 0, 'PISAC MERCADO + RUINAS', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (59, 2, 0, 'CHINCHERO', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (60, 2, 0, 'MORAY + SALINERAS', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (61, 2, 0, 'OLLANTA RUINAS', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (62, 2, 0, 'PIQUILLACTA + ANDAHUAYLILLAS', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (63, 2, 0, 'PISAC MARKET + OLLANTA (F/D VALLE)', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (64, 2, 0, 'PISAC MK + P.RUINAS + OLLANTA', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (65, 2, 0, 'PISAC MK + OLLANTA  + CHINCHERO', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (66, 2, 0, 'PISAC + OLLANTA+ O/N + TRF.ESTAC.OLLANTA', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (67, 2, 0, 'PISAC + OLLANTA + WILLOC + PATACANCHA', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (68, 2, 0, 'PISAC + MORAY + SALINERAS', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (69, 2, 0, 'PISAC + OLLANTA + MORAY + SALINERAS', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (70, 2, 0, 'PIQUILLACTA + ANDAHUAYLILLAS + TIPON', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (71, 2, 0, 'INTI RAYMI', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (72, 2, 0, 'CUSCO / PUNO O VICIVERSA', 1, 3);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (73, 2, 0, 'CUSCO / PUNO O VICIVERSA CON SILLUSTANI EN RUTA', 1, 3);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (74, 2, 0, 'PUNO / AREQUIPA O VICIVERSA', 1, 3);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (75, 2, 0, 'PUNO/AREQUIPA O VICIVERSA CON SILLUSTANI EN RUTA', 1, 3);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (76, 2, 0, 'APTO/HTL O VICEVERSA (MALETAS)', 1, 4);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (77, 2, 0, 'APTO/URUBAMBA O VICIVERSA (MALETAS)', 1, 4);

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


INSERT INTO destinos VALUES (1,1,'Costa del Sol S.A.','Costa del Sol Wyndham Lima Airport',20231843460,'Av. Elmer Faucett s/n - Callao','+51 (01)711-2000/+51 (01)711-2020','www.costadelsolperu.com/peru/hotels/lima/','LIMA',NULL,NULL,'Hotel',1);
INSERT INTO destinos VALUES (2,1,'Consorcio Hotelero Las Palmeras S.A.C.','Radisson Decapolis Miraflores',20505466919,'Av. 28 de Julio 151 - Miraflores','+51 (01)625-1200/+51 (01)625-1201','www.radisson.com/miraflorespe/','LIMA',NULL,NULL,'Hotel',1);
INSERT INTO destinos VALUES (3,1,'Figtur S.A.','Business Tower',20303368877,'Av. Guardia Civil 727 Corpac San Isidro - Lima','+51 (01) 319-5300','www.bth.pe','LIMA',NULL,NULL,'Hotel',1);
INSERT INTO destinos VALUES (4,1,'Consorcio Hotelero Las Palmeras S.A.C.','Radisson & Suites San Isidro',20505466919,'Av. Las Palmeras 240 San Isidro - Lima','+51 (01)422-3887','www.radisson.com/sanisidrope/','LIMA',NULL,NULL,'Hotel',1);
INSERT INTO destinos VALUES (5,1,'Monte Real Inversiones Turisticas S.A.','Monte Real',20419343871,'Calle 27 de Noviembre 169-189 Miraflores - Lima','+51 (01)241-4100/+51 (01)445-6309','www.montereal.com.pe/lang1/','LIMA',NULL,NULL,'Hotel',1);
INSERT INTO destinos VALUES (6,1,'Servicios e Inversiones Crisol S.A.C.','Allpa & Suites',20513437600,'Calle Atahualpa 199 - Miraflores','+51 (01)206-8800','www.allpahotel.com','LIMA',NULL,NULL,'Hotel',1);
INSERT INTO destinos VALUES (7,1,'Thunderbird Hotel Las Americas S.A.','Thunderbird Fiesta & Casino',20516381311,'Av. Alcanfores 475 Miraflores','+51 (01)616-3131','http://www.thunderbirdhotels.com/english/miraflores-hotel/hotel-casino-fiesta-miraflores-en-lima-peru.html','LIMA',NULL,NULL,'Hotel',1);
INSERT INTO destinos VALUES (8,1,'Hotel Estelar del Peru S.A.C.','Estelar Apartamentos Bellavista',20518738314,'Bellavista 216 -  Miraflores','+51 (1)630-7700','http://www.Hoteltelar.com/eng/estelar-apartamentos-bellavista-lima-peru/','LIMA',NULL,NULL,'Hotel',1);
INSERT INTO destinos VALUES (9,1,'Empresa de Servicios Turísticos Colon S.A.C.','Miraflores Colón Hotel',20462041587,'Jr. Colón 600 Esq. c/ Juan Fanning - Miraflores','(01)610-0900/(01)444-2000','www.miraflorescolonhotel.com','LIMA',NULL,NULL,'Hotel',1);
INSERT INTO destinos VALUES (10,1,'Maneras y Contactos Turísticos S.A.','Pukara Hostal',20308164129,'Calle Gonzales Larrañaga 130 - San Antonio - Miraflores','(01)445-2754/(01)445-4203','www.hostalpukara.com.pe/pukaraen.html','LIMA',NULL,NULL,'Hotel',1);
INSERT INTO destinos VALUES (11,1,'Sociedad Inmobiliaria y de Hotel Gran Larco S.A.','Ibis Lima Larco',20518766873,'Av. José Larco 1140 - Miraflores','+51 (01)634-8888','www.ibis.com/gb/hotel-6971-ibis-larco-miraflores/','LIMA',NULL,NULL,'Hotel',1);
INSERT INTO destinos VALUES (12,1,'Nessus Hotel Peru S.A.','Casa Andina Select Miraflores',20505670443,'Calle Schell 452 - Miraflores','+51 (01) 2139710/+51( 01 )4167500','www.casa-andina.com/select-miraflores/?lang=en','LIMA',NULL,NULL,'Hotel',1);
INSERT INTO destinos VALUES (13,1,'Sociedad de Desarrollo de Hotel Peruanos S.A.','Novotel',20513215887,'Calle Antequera 777 Piso 2 â€“ Lima','(01)315-9999','www.novotel.com','LIMA',NULL,NULL,'Hotel',1);
INSERT INTO destinos VALUES (14,1,'Grupo El Dorado','Grupo El Dorado',20329398642,'Av. José Pardo NÂ° 541, Of. # 201 - Miraflores',NULL,'www.grupo-dorado.com','LIMA',NULL,NULL,'Hotel',1);
INSERT INTO destinos VALUES (15,1,'HOTEL EL TAMBO S.A.C.','EL TAMBO PERÃš',20551529933,'Av. La Paz # 1276 - Miraflores','+51 (01) 219-4080','www.eltamboperu.com','LIMA',NULL,NULL,'Hotel',1);
INSERT INTO destinos VALUES (16,1,'Inversiones Nacionales de Turismo S.A.','Libertador Lima Westin',20114803228,'Calle Las Begonias 450 - San Isidro','+51 (01) 201-5000/+51 (01) 518-6510','www.westinlima.com.pe/en','LIMA',NULL,NULL,'Hotel',1);
INSERT INTO destinos VALUES (17,1,'Nuevo Mundo Lima Hotel S.A.C.','NM Lima',20538129616,'Av. Pardo y Aliaga NÂ° 300 San Isidro','+51 (01)612-1000','www.nmlimahotel.com/index-en.aspx','LIMA',NULL,NULL,'Hotel',1);
INSERT INTO destinos VALUES (18,1,'Inversiones La Rioja S.A.','JW Marriott Lima',20334766714,'Malecón de la Reserva 615 - Miraflores','+51 (01)217-7000','www.jwmarriottlima.com','LIMA',NULL,NULL,'Hotel',1);
INSERT INTO destinos VALUES (19,1,'Los Portales S.A.','Country Club Lima',20301837896,'Los Eucaliptos 590 - San Isidro','+51 (01)611-9000/+51 (01)611-9001','www.hotelcountry.com/default-en.html','LIMA',NULL,NULL,'Hotel',1);
INSERT INTO destinos VALUES (20,1,'Corporacion el Golf S.A.','Los Delfines',20136957253,'Los Eucaliptos 555 - San Isidro','(01)215-7000','www.losdelfineshotel.com/default-en.html','LIMA',NULL,NULL,'Hotel',1);
INSERT INTO destinos VALUES (21,1,'Belmond Peru S.A.','Belmond Miraflores Park',20334539149,'es Av. Armendariz 480 Int 501 Urb. Armendariz, Lima - Lima - Miraflores','+51 (01)610-4000','www.miraflorespark.com','LIMA',NULL,NULL,'Hotel',1);
INSERT INTO destinos VALUES (22,1,'Inmobiliaria de Turismo S.A.','Sonesta El Olivar',20136847237,'Pancho fierro 194 - San Isidro','+51 (01)712-6000/+51 (01)712-6050','www.sonesta.com/lima/','LIMA',NULL,NULL,'Hotel',1);
INSERT INTO destinos VALUES (23,1,'Inversiones Brade S.A.','Double Tree El Pardo',20303972821,'Jr. Independencia 141 - Miraflores','+51 (01)617-1000/+51 (01)241-0410','www.doubletreeelpardo.com.pe','LIMA',NULL,NULL,'Hotel',1);
INSERT INTO destinos VALUES (24,1,'Inversiones Don Quijote S.A.C.','Crowne Plaza',20297386531,'Av. Alfredo Benavides 330 - Miraflores','+51 (01)610-0700','www.crowneplaza.com','LIMA',NULL,NULL,'Hotel',1);
INSERT INTO destinos VALUES (25,1,'Hotelera Costa del Pacifico S.A.','SwissÃ´tel Lima',20297885538,'Vía Central 150 Centro Empresarial Real - San Isidro','+51 (01)611-4400','www.swissotel.com/lima','LIMA',NULL,NULL,'Hotel',1);
INSERT INTO destinos VALUES (26,1,'Corporación Hotelera Metor S.A.','MeliÃ¡',20386303003,'Av. Salaverry 2599 - San Isidro','+51 (01) 411-9000/+51  0800-51570','http://www.melia.com/en/hotels/peru/lima/melia-lima/index.html','LIMA',NULL,NULL,'Hotel',1);
INSERT INTO destinos VALUES (27,1,'Hotel Sheraton del Peru S.A.','Sheraton Lima & Convention Center',20100032610,'Av. Paseo de la República 170 - Lima','+51 (01)315-5000','www.sheraton.com.pe/english.php','LIMA',NULL,NULL,'Hotel',1);
INSERT INTO destinos VALUES (28,1,'Solidez Empresarial S.A','Royal Park',20459980963,'Av. Camino Real 1050 - San Isidro','(01)215-1616','www.royalparkhotel.com.pe','LIMA',NULL,NULL,'Hotel',1);
INSERT INTO destinos VALUES (29,1,'Hotelera El Pinar S.A.C.','Suites del Bosque',20526998279,'Av. Paz Soldan 165 - San Isidro','+51 (01)616-2121','www.suitesdelbosque.com','LIMA',NULL,NULL,'Hotel',1);
INSERT INTO destinos VALUES (30,1,'Hotelera el Bosque S.A.C.','Plaza del Bosque Apart',20507380515,'Av. Paz Soldan 190 - San Isidro','+51 (01)616-1818','www.plazadelbosque.com','LIMA',NULL,NULL,'Hotel',1);
INSERT INTO destinos VALUES (31,1,'Polo Service S.A.C.','El Polo Apart Hotel & Suites',20333712505,'Av. La Encalada 1515 - Monterrico - Surco','+51 (01)434-2323','http://www.hotelelpolo.com/index.html','LIMA',NULL,NULL,'Hotel',1);
INSERT INTO destinos VALUES (32,1,'Suites El Golf Los Incas S.A.','Golf Los Incas',20348851251,'Av. Cerros de Camacho NÂ° 500 Santiago de Surco','+51 (01)709-0000','www.golfincahotel.com','LIMA',NULL,NULL,'Hotel',1);
INSERT INTO destinos VALUES (33,1,'Hotel Estelar del Peru S.A.C.','Estelar Miraflores',20518738314,'Av. Benavides 415 - Miraflores','+51 (01)630-7777','www.Hoteltelar.com/en/destinos/peru/lima/miraflores','LIMA',NULL,NULL,'Hotel',1);
INSERT INTO destinos VALUES (34,1,'Inversiones Nacionales de Turismo S.A.','Libertador Lima',20114803228,'Jr. Los Eucaliptos 550 - San isidro','+51 (01)518-6300/+51 (01)421-6666','www.libertador.com.pe/en/libertador/lima/','LIMA',NULL,NULL,'Hotel',1);
INSERT INTO destinos VALUES (35,1,'Miraflores de Turismo S.A.C.','San Agustín Exclusive',20101000975,'Calle San Martín 550 - Miraflores','(01)319-0060/(01)203-2840','www.Hotelsanagustin.com.pe/hotels/lima/miraflores/exclusive/','LIMA',NULL,NULL,'Hotel',1);
INSERT INTO destinos VALUES (36,1,'Cartir Peru S.R.L.','Jose Antonio Lima',20100910129,'Av. 28 de Julio 398 - Miraflores','+51 (01)445-7743/+51 (01)445-5228','www.Hoteljoseantonio.com/en/lima/presentacion/','LIMA',NULL,NULL,'Hotel',1);
INSERT INTO destinos VALUES (37,1,'Cartir Peru S.R.L.','Jose Antonio Executive',20100910129,'Calle Colon 325 - Miraflores','+51 (01)445-5592/+51 (01)445-5228','www.Hoteljoseantonio.com/en/executive/presentacion/','LIMA',NULL,NULL,'Hotel',1);
INSERT INTO destinos VALUES (38,1,'Nessus Hotel Peru S.A.','Casa Andina Private Collection - Miraflores',20505670443,'Calle La Paz 463 - Miraflores','+51 (01)213-9710/+51 (01)213-4300','www.casa-andina.com/casa-andina-private-collection-miraflores/?lang=en','LIMA',NULL,NULL,'Hotel',1);
INSERT INTO destinos VALUES (39,1,'Turismo Costa Sur S.A.','El Condado',20118504055,'Alcanfores 425 - Miraflores','(01)444-0306','www.condado.com.pe/pages/index.php?p_idioma&p_idioma=eng','LIMA',NULL,NULL,'Hotel',1);
INSERT INTO destinos VALUES (40,1,'Foresta Hotel S.A.C.','Foresta & Suites',20337151702,'Av. Libertadores 490 - San Isidro','+51 (01)630-0000 AX: 101 / 102/+51 (01)630-0003','www.foresta-hotel.pe','LIMA',NULL,NULL,'Hotel',1);
INSERT INTO destinos VALUES (41,1,'Q.P. Hotels S.A.C.','QP Hotels Lima',20515298127,'Av. Jorge Chavez 206 â€“ Miraflores','+51 (01)319-2929/+51 9490-78640','http://qphotels.com/location/index/lg/EN','LIMA',NULL,NULL,'Hotel',1);
INSERT INTO destinos VALUES (42,1,'Nessus Hotel Peru S.A.','Casa Andina Classic - Miraflores Centro',20505670443,'Av. Petit Thouars 5444 - Miraflores','+51 (01)213-9710/+51 (01)447-0263','www.casa-andina.com/classic-miraflores-centro/?lang=en','LIMA',NULL,NULL,'Hotel',1);
INSERT INTO destinos VALUES (43,1,'Inmobiliaria de Turismo S.A.','Sonesta Posadas del Inca Miraflores',20136847237,'Av. Alcanfores 329 - Miraflores','+51 (01)241-7688/+51 (01)447-3822','www.sonesta.com/Miraflores/','LIMA',NULL,NULL,'Hotel',1);
INSERT INTO destinos VALUES (44,1,'Nessus Hotel Peru S.A.','Casa Andina Classic - Miraflores San Antonio',20505670443,'Av. 28 de Julio 1088 - Miraflores','+51 (01)213-9710/+51 (01)241-4050','www.casa-andina.com/classic-miraflores-san-antonio/?lang=en','LIMA',NULL,NULL,'Hotel',1);
INSERT INTO destinos VALUES (45,1,'Corporacion Hotelera del Pacifico S.A.','Leon de Oro',20383145997,'Av La Paz 930 - Miraflores','(01)242-6200','www.leondeoroperu.com/Index_Eng.html','LIMA',NULL,NULL,'Hotel',1);
INSERT INTO destinos VALUES (46,1,'Hotelera Los Girasoles S.A.C.','Girasoles',20372362252,'Av. Diez Canseco 696 - Miraflores','+51 (01)446-6075/+51 (01)241-1119','www.losgirasoleshotel.com','LIMA',NULL,NULL,'Hotel',1);
INSERT INTO destinos VALUES (47,1,'San Agustin Colonial S.A.C.','San Agustín Colonial',20512375015,'Av. Comandante Espinar 310 - Miraflores','+51 (01)241-7471/+51 (01)203-2840','www.Hotelsanagustin.com.pe/hotels/lima/miraflores/colonial/','LIMA',NULL,NULL,'Hotel',1);
INSERT INTO destinos VALUES (48,1,'Faraona Servicios Hoteleros S.A.','Faraona',20330573857,'Manuel Bonilla 185  Miraflores','(01)446-9414','www.faraonagrandhotel.com','LIMA',NULL,NULL,'Hotel',1);
INSERT INTO destinos VALUES (49,1,'Hotel Restaurant La Hacienda S.A.','La Hacienda',20125772227,'Av. 28 de Julio 511 - Miraflores','(01)213-1000','Hotellahacienda.com/en/','LIMA',NULL,NULL,'Hotel',1);
INSERT INTO destinos VALUES (50,1,'Inversiones Turisticas Santa Maria S.A.C.','Mariel',20512936653,'Gral. Suarez 240 - Miraflores','+51 (01)444-2829','www.mariel-hotel.com','LIMA',NULL,NULL,'Hotel',1);
INSERT INTO destinos VALUES (51,1,'Edificios y Construcciones Santa Patricia S.A.','Sol de Oro',20110545798,'Calle San Martín 305 - Miraflores','+51 (01)446-9876/+51 (01)447-0967','www.soldeoro.com.pe','LIMA',NULL,NULL,'Hotel',1);
INSERT INTO destinos VALUES (52,1,'Inversiones Pimi S.A.C.','Del Pilar Miraflores',20508159863,'Pje. Martir Olaya 141 - Miraflores','(01)712-0712/(01)242-7999','www.delpilarmirafloreshotel.com/lan/eng/indexa.php','LIMA',NULL,NULL,'Hotel',1);
INSERT INTO destinos VALUES (53,1,'Turismo Boulevard S.A.C.','Boulevard',20262342710,'Av. Pardo 771 - Miraflores','(01)444-6562/(01)444-6563','www.hotelboulevard.com.pe','LIMA',NULL,NULL,'Hotel',1);
INSERT INTO destinos VALUES (54,1,'Monteluna S.A.C.','Antara',20492673120,'Alcanfores 450 - Miraflores','+51 (01) 444-4505/+51 (01) 444-3533','www.antarahotel.com/eng/','LIMA',NULL,NULL,'Hotel',1);
INSERT INTO destinos VALUES (55,1,'Hotelera Antigua S.A.C.','Antigua Miraflores',20266548584,'Av. Grau 350 Miraflores','+51 (01)201-2060','www.antiguamiraflores.com','LIMA',NULL,NULL,'Hotel',1);
INSERT INTO destinos VALUES (56,1,'Turicom S.A.','Ariosto',20100313627,'Av. La Paz 769 - Miraflores','(01)444-1414','www.hotelariosto.com.pe/eng/','LIMA',NULL,NULL,'Hotel',1);
INSERT INTO destinos VALUES (57,1,'Turismo Los Algarrobos S.A.','Los Tallanes',20134081229,'Av. Jorge Basadre NÂ° 325 - San Isidro','(01)221-0001','www.hoteltallanes.com.pe/eng/','LIMA',NULL,NULL,'Hotel',1);
INSERT INTO destinos VALUES (58,1,'Inver Hotel S.A.C.','Roosevelt & Suites',20304581337,'Av. Alvarez Calderón 194 (esquina Miguel Dasso) - San Isidro','(01)418-0000/(01)717-6025','www.hotelroosevelt.com/index.php/en/home','LIMA',NULL,NULL,'Hotel',1);
INSERT INTO destinos VALUES (59,1,'María Eliza Silva Hidalgo','Gran Hotel Bolivar',10094835106,'Jr. De la Union 958 - Plaza San Martin','+51 (01)619-7171','www.granhotelbolivar.com.pe/ingles/','LIMA',NULL,NULL,'Hotel',1);
INSERT INTO destinos VALUES (60,1,'Tecnocasa S.A.','Santa Cruz',20507715479,'Av. Santa Cruz 1347 - Miraflores','+51 (01)241-3724','http://www.hotelsantacruz.com/?p=1','LIMA',NULL,NULL,'Hotel',1);
INSERT INTO destinos VALUES (61,1,'Inversiones Turisticas Maury S.A.C.','Maury',20428632380,'Jr. Ucayali 201 - Esquina con Jr. Carabaya - Centro','+51 (01)428-8188/+51 (01)428-3185','www.hotelmaury.com','LIMA',NULL,NULL,'Hotel',1);
INSERT INTO destinos VALUES (62,1,'Inversiones Porta Coeli S.A.','Carmel',20291478761,'Calle Atahualpa 152 - Miraflores','+51 (01)241-8672/+51 (01)241-8672','www.hotelcarmel.com.pe','LIMA',NULL,NULL,'Hotel',1);
INSERT INTO destinos VALUES (63,1,'EMF S.A.','La Paz Apart Hotel',20303274970,'Av. La Paz 679 - Miraflores','(01)242-9350','www.lapazaparthotel.com/index2.html','LIMA',NULL,NULL,'Hotel',1);
INSERT INTO destinos VALUES (64,1,'Compañia de Inversiones Turísticas Costa del Sol S.A.','La Castellana',20108787130,'Calle Grimaldo del Solar 222 - Miraflores','(01)444-3530/(01)444-4662','www.castellanahotel.com/english/','LIMA',NULL,NULL,'Hotel',1);
INSERT INTO destinos VALUES (65,1,'Inversiones Tulip E.I.R.L.','Habitat',20514352730,'Calle Piura 105 - Miraflores','+51 (01)242-2222/+51 (01)243-4310','www.habitathotelperu.com','LIMA',NULL,NULL,'Hotel',1);
INSERT INTO destinos VALUES (66,1,'Inversiones Generales Libra S.A.C.','Britania Miraflores',20512675752,'Calle Independencia 211 esq. 2 de Mayo - Miraflores','+51 (01)203-3900','www.hbritaniamiraflores.com/index-i.html','LIMA',NULL,NULL,'Hotel',1);
INSERT INTO destinos VALUES (67,1,'Inversiones Turísticas P & M S.A.','Ferre',20492182061,'Diego Ferré 235 - Miraflores','(01)446-7276/(01)447-3456','www.hotelferremiraflores.com','LIMA',NULL,NULL,'Hotel',1);
INSERT INTO destinos VALUES (68,1,'Sociedad de Desarrollo de Hotel Peruanos S.A.','Novotel Lima',20513215887,'Av. Victor Andres Belaunde 198 - San Isidro','+51 (01)315-9999/+51 (01)315-9925','www.novotel.com/gb/hotel-6339-novotel-lima/','LIMA',NULL,NULL,'Hotel',1);
INSERT INTO destinos VALUES (69,1,'Turismo Costa Sur S.A.','El Condado Apart',20118504055,'Alcanfores 465 - 425 - Miraflores','(01)444-0306','www.condado.com.pe/pages/index.php?p_idioma&p_idioma=eng','LIMA',NULL,NULL,'Hotel',1);
INSERT INTO destinos VALUES (70,1,'Inversiones Turisticas Cuellar S.A.C.','Duo Boutique',20492914771,'Calle Francisco Valle Riestra 576 - San Isidro','(01)628-3245/(01)628-3246','www.duohotelperu.com/en-us/','LIMA',NULL,NULL,'Hotel',1);
INSERT INTO destinos VALUES (71,1,'Secondhomeperu S.A.C.','Second Home',20512472568,'Domeyer 366 - Barranco','+51 (01)247-5522/+51 9444-41671','www.secondhomeperu.com','LIMA',NULL,NULL,'Hotel',1);
INSERT INTO destinos VALUES (72,1,'100pre Feliz S.A.C.','Nobility',20379719440,'Av.. Roosevelt 6461 (Ex Republica de Panama) - Miraflores','+51 (01)660-2018/+51 (01)660-2266','www.hotelnobility.com','LIMA',NULL,NULL,'Hotel',1);
INSERT INTO destinos VALUES (73,1,'Atton San Isidro S.A.C.','Atton San Isidro',20538571912,'Av. Jorge Basadre 595, San Isidro','+51 (01)208-1200/+51 (01)208-1227','www.atton.com/default-es.html','LIMA',NULL,NULL,'Hotel',1);
INSERT INTO destinos VALUES (74,1,'Inversiones Metropolis E.I.R.L.','Regency',20299996272,'Av. Angamos Oeste - 843 - Miraflores','(01)242-2310/(01)715-5868','www.hotelregency.com.pe','LIMA',NULL,NULL,'Hotel',1);
INSERT INTO destinos VALUES (75,1,'Teguise Turistica Perú S.A.','San Agustín Riviera',20256983479,'Av. Inca Garcilaso de la Vega 981 - Cercado','(01)424-9438/(01)203-2840','www.Hotelsanagustin.com.pe/hotels/lima/riviera/','LIMA',NULL,NULL,'Hotel',1);
INSERT INTO destinos VALUES (76,1,'Consorcio Hotelero Las Palmeras S.A.C.','Radisson',20505466919,'Av. 28 de Julio 151 Miraflores','(01)625-1200 / 422-3887','www.radisson.com','LIMA',NULL,NULL,'Hotel',1);
INSERT INTO destinos VALUES (77,1,'Hotelería Peruana S.A.C.','Tierra Viva Miraflores Larco',20536047906,'Calle Bolívar 176 â€“ 180. Miraflores','+51 (01)370 9080','tierravivaHotel.com/hotels/tierra-viva-miraflores-larco/','LIMA',NULL,NULL,'Hotel',1);
INSERT INTO destinos VALUES (78,1,'Forum Inversiones S.A.C.','Dazzler Lima',20523025521,'Av. José Pardo 879 - Miraflores','(01)634-4000','www.dazzlerlima.com/en/','LIMA',NULL,NULL,'Hotel',1);
INSERT INTO destinos VALUES (79,1,'Q.P. Hotels S.A.C.','QP Hotels',20515298127,'Av. Jorge Chavez 206 â€“ Miraflores','+51 (01)319-2900','www.qphotels.com','LIMA',NULL,NULL,'Hotel',1);
INSERT INTO destinos VALUES (80,1,'Thunderbird Hotel Las Americas S.A.','Thunderbird Hotels Pardo',20516381311,'Calle General Borgoño 116 - Miraflores','+51 (01)616-3141','http://www.thunderbirdhotels.com/english/miraflores-hotel/hotel-pardo-miraflores-lima-peru.html','LIMA',NULL,NULL,'Hotel',1);
INSERT INTO destinos VALUES (81,1,'Hotel Restaurant La Hacienda S.A.','La Hacienda Hotel & Casino',20125772227,'Av. 28 de Julio 511 - Miraflores','(01)213-1000','Hotellahacienda.com/en/hotel-miraflores/','LIMA',NULL,NULL,'Hotel',1);
INSERT INTO destinos VALUES (82,1,'La Casa de Barranco S.A.C.','B Arts Boutique',20536180657,'Av. SÃ¡enz Peña 204 - Barranco','+51 (01)700-5106/+51 (01)206-0800','www.hotelb.pe','LIMA',NULL,NULL,'Hotel',1);
INSERT INTO destinos VALUES (83,1,'I & G Hispania S.A.C.','Hilton Lima Miraflores',20550025176,'Av. La Paz 1099 - Miraflores','+51 (01)200-8000','www.lima.hilton.com','LIMA',NULL,NULL,'Hotel',1);
INSERT INTO destinos VALUES (84,1,'Ineisa E.I.R.L.','Arawi',20504550177,'Calle Colón 223 - Miraflores','+51 (01)446-7676','www.arawihotels.com','LIMA',NULL,NULL,'Hotel',1);
INSERT INTO destinos VALUES (85,1,'Top Rank Hotel S.A.C','Four Points by Sheraton Miraflores',20552281838,'Calle Alcanfores 290 Miraflores','+51 (01)206-1100','www.fourpointsmiraflores.com','LIMA',NULL,NULL,'Hotel',1);
INSERT INTO destinos VALUES (86,1,'Boperu S.A.C.','Quinta Miraflores Boutique',20524788129,'Av. 28 de Julio 844 Miraflores','+51 (01)446-5147','www.quintamiraflores.com/en/','LIMA',NULL,NULL,'Hotel',1);
INSERT INTO destinos VALUES (87,1,'Ponhua Servicios Turisticos S.R.L.','Manhattan Inn Airport',20167950893,'Jr. Luna Pizarro 168 - Urb. La Colonial - Callao','+51 (01)464-5811','http://www.hmanhattan.com/','LIMA',NULL,NULL,'Hotel',1);
INSERT INTO destinos VALUES (88,1,'Thunderbird Hotel Las Americas S.A.','Thunderbird Carrera',20516381311,'Jirón Velarde 123, Lince','+51 (01)619-5200','http://www.thunderbirdhotels.com/english/miraflores-hotel/hotel-carrera-lince-lima-peru.html','LIMA',NULL,NULL,'Hotel',1);
INSERT INTO destinos VALUES (89,1,'Bartleby S.A.C.','De Autor',20563115646,'Av. 28 De Julio Nro. 562 Dpto. B Urb. Miraflores (Entre la Av. Larco con 28 de Julio) Lima - Lima - Miraflores','+51 (01) 6818074/+51 997 527 535','http://www.hoteldeautor.com/','LIMA',NULL,NULL,'Hotel',1);
INSERT INTO destinos VALUES (90,1,'Inversiones La Rioja','Courtyard Lima',20334766714,'Calle Shell n.Â°400, Miraflores','+51 (01)217-7000','http://www.espanol.marriott.com/hotels/travel/limlm-courtyard-lima-miraflores/','LIMA',NULL,NULL,'Hotel',1);
INSERT INTO destinos VALUES (91,1,'COSTA DEL SOL S A','Costa del Sol Wyndham Salaverry',20231843460,'Av. Salaverry 3052 Magdalena','+51 (01)711-2000','http://www.wyndham.com/hotels/peru/lima/wyndham-costa-del-sol-lima-salaverry/hotel-overview','LIMA',NULL,NULL,'Hotel',1);
INSERT INTO destinos VALUES (92,1,'Thunderbird Hotel Las Americas S.A.','El Pueblo Thunderbird Resorts',20516381311,'Carretera Central Km 10 - Santa Clara','(01)612-6400','www.thunderbirdhotels.com/english/','LIMA',NULL,NULL,'Hotel',1);
INSERT INTO destinos VALUES (93,1,'Turismo El Tambo S.A.C.','El Tambo I',20515601164,'Av. La Paz # 1276 - Miraflores','+51 (01)219-4080','http://www.eltamboperu.com/hotel-lima-peru/english/the-hotel.html','LIMA',NULL,NULL,'Hotel',1);
INSERT INTO destinos VALUES (94,1,'Hotel El Tambo S.A.C.','El Tambo II',20551529933,'Av. La Paz # 720 - Miraflores','+51 (01) 2000100','http://www.eltamboperu.com/english/the-hotel.html','LIMA',NULL,NULL,'Hotel',1);
INSERT INTO destinos VALUES (95,1,'Inversiones Independencia S.A.C.','Limaq',20517656217,'Cl. Los Cóndores 112 - Bellavista - Callao','+51 (01) 606 4446/+51 998 144 498','www.hotellimaq.com','LIMA',NULL,NULL,'Hotel',1);
INSERT INTO destinos VALUES (96,1,'Swiss Management S.A.C.','Ananay Hotel San Isidro',20333684021,'Calle Lizardo Alzamora 260, San Isidro 15076, Perú','+51 (01) 421-7790/+51 978000075','http://www.ananay-hotels.com/hotel-san-isidro','LIMA',NULL,NULL,'Hotel',1);
INSERT INTO destinos VALUES (97,1,'Sitio Arqueológico Caral','Sitio Arqueológico Caral',NULL,'Alt. Km 184 Panamericana Norte-Valle Supe (con un desvio de 23km)','(01)205-2500 AX 517/(01)332-5380','www.caralperu.gob.pe','LIMA',NULL,NULL,'Museo',1);
INSERT INTO destinos VALUES (98,1,'Circuito Magico Del Agua','Circuito Magico Del Agua',NULL,'Av. Petit Thouars esq. Jr. Madre de Dios','+51 (01) 3303052/+51 (01) 4248831','http://www.parquedelareserva.com.pe/','LIMA',NULL,NULL,'Museo',1);
INSERT INTO destinos VALUES (99,1,'Fortaleza de Real Felipe','Fortaleza de Real Felipe',NULL,'Plaza Independencia, Callao','(01)429-0532',NULL,'LIMA',NULL,NULL,'Museo',1);
INSERT INTO destinos VALUES (100,1,'Casona Riva AgÃ¼ero','Casona Riva Aguero',NULL,'Jr. Camana 459 s/n','+51 (01) 6266600  AX 6601- 6600','ira.pucp.edu.pe/informacion-turistica','LIMA',NULL,NULL,'Museo',1);
INSERT INTO destinos VALUES (101,1,'Iglesia La Merced','Iglesia La Merced',NULL,'Jr. De La Union NÂº621','+51 (01) 4278199',NULL,'LIMA',NULL,NULL,'Museo',1);
INSERT INTO destinos VALUES (102,1,'Iglesia de Las Nazarenas','Iglesia de Las Nazarenas',NULL,'Interseccion del Jr. Huancavelica y la Av. Tacna','(01)423-5718',NULL,'LIMA',NULL,NULL,'Museo',1);
INSERT INTO destinos VALUES (103,1,'Casa Osambela','Casa Osambela',NULL,'Jr. Conde de Superunda 298 â€“ Lima','+51 (01) 4277987',NULL,'LIMA',NULL,NULL,'Museo',1);
INSERT INTO destinos VALUES (104,1,'Complejo Arqueológico Cerro Sechín y Museo de Siti','Complejo Arqueológico Cerro Sechín y Museo de Siti',NULL,'5 km al sureste de la localidad de Casma','+51 (043) 721521','http://www.arqueotur.org','LIMA',NULL,NULL,'Museo',1);
INSERT INTO destinos VALUES (105,1,'Museo Palacio Arzobispal de Lima','Museo Palacio Arzobispal de Lima',20535536130,'Plaza de Armas s/n - Lima','+51 (01) 4275790','www.palacioarzobispaldelima.com','LIMA',NULL,NULL,'Museo',1);
INSERT INTO destinos VALUES (106,1,'Club Nacional','Club Nacional',20100261562,'Jr De La Unión Nro 1016 - El Cercado','(01)330-2366',NULL,'LIMA',NULL,NULL,'Museo',1);
INSERT INTO destinos VALUES (107,1,'Casa García Alvarado','Casa García Alvarado',20100964997,'Av. Larco 311 - Miraflores','+51 (01) 4441272/+51 (01) 2415960','www.casa-garcia-alvarado.com','LIMA',NULL,NULL,'Museo',1);
INSERT INTO destinos VALUES (108,1,'Ministerio de Relaciones Exteriores','Palacio de Torre Tagle',20131380101,'Jr. Ucayali 363 - Lima','+51 (01) 2042654',NULL,'LIMA',NULL,NULL,'Museo',1);
INSERT INTO destinos VALUES (109,1,'-','Palacio de Gobierno',NULL,'Plaza de Armas - Lima','+51 (01) 2043384',NULL,'LIMA',NULL,NULL,'Museo',1);
INSERT INTO destinos VALUES (110,1,'Municipalidad de Lima','Municipalidad de Lima',20131380951,'MUNICIPALIDAD METROPOLITANA DE LIMA','+51 (01) 3151481',NULL,'LIMA',NULL,NULL,'Museo',1);
INSERT INTO destinos VALUES (111,1,'Colegio Militar Leoncio Prado','Colegio Militar Leoncio Prado',20167343652,'Av.Costanera 1541 - La Perla - Callao','+51 (01) 4204120/+51 (01) 4576067','www.leoncioprado.org','LIMA',NULL,NULL,'Museo',1);
INSERT INTO destinos VALUES (112,1,'-','Teatro Municipal (Municipalidad de Lima)',NULL,'Jr. Huancavelica 332, Lima 1','+51 (01) 4274918/+51 (01) 3151300',NULL,'LIMA',NULL,NULL,'Museo',1);
INSERT INTO destinos VALUES (113,1,'Asociación civil Casa Taller Delfín','Casa Taller Delfín',20512492241,'Domeyer 366 -  Barranco','(01)247-5522/9901-28960','www.secondhomeperu.com','LIMA',NULL,NULL,'Museo',1);
INSERT INTO destinos VALUES (114,1,'Casa Belén','Casa Belén',NULL,'Av. General Orbegoso NÂº 698 Breña','+51 (01) 4238623','www.casabelenperu.org','LIMA',NULL,NULL,'Museo',1);
INSERT INTO destinos VALUES (115,1,'INC (Instituto Nacional de Cultura)','INC (Instituto Nacional de Cultura) - Lima',NULL,'Av. Javier Prado Este 2465, San Borja','(01)476-9933','inc.perucultural.org.pe','LIMA',NULL,NULL,'Museo',1);
INSERT INTO destinos VALUES (116,1,'Catedral De Lima','Catedral de Lima',NULL,'Plaza Mayor s/n Lima','(01)426-7056/(01)427-9647',NULL,'LIMA',NULL,NULL,'Museo',1);
INSERT INTO destinos VALUES (117,1,'Iglesia San Francisco','Iglesia San Francisco',NULL,'Esq. Lampa & Ancash','+51(01) 4271381/+51(01) 4267377','www.museocatacumbas.com','LIMA',NULL,NULL,'Museo',1);
INSERT INTO destinos VALUES (118,1,'Iglesia Santo Domingo','Iglesia Santo Domingo',NULL,'Jr. CamanÃ¡ 170 - Cercado de Lima','+51 (01)426-5521/+51 9845-05668','www.conventosantodomingolima.org','LIMA',NULL,NULL,'Museo',1);
INSERT INTO destinos VALUES (119,1,'Iglesia San Pedro','Iglesia San Pedro',NULL,'Jr. AzÃ¡ngaro 451 y Ucayali - Cercado','+51 (01) 4283017/+51 (01) 4283010','www.sanpedrodelima.org','LIMA',NULL,NULL,'Museo',1);
INSERT INTO destinos VALUES (120,1,'Convento de Los Descalzos','Convento de Los Descalzos',NULL,'Manco CÃ¡pac 202 - Rímac','(01)481-0441',NULL,'LIMA',NULL,NULL,'Museo',1);
INSERT INTO destinos VALUES (121,1,'Casa De Santa Rosa','Casa de Santa Rosa',NULL,'Av. Tacna 1ra cuadra - Lima','+51(01) 4251279',NULL,'LIMA',NULL,NULL,'Museo',1);
INSERT INTO destinos VALUES (122,1,'Casona San Marcos','Casona San Marcos',NULL,'Av. NicolÃ¡s de Piérola 1222 - Parque Universitario','+51(01) 6197000 EXT 5206','www.ccsm-unmsm.edu.pe','LIMA',NULL,NULL,'Museo',1);
INSERT INTO destinos VALUES (123,1,'Museo de la Inquisicion y del Congreso','Museo de la Inquisicion y del Congreso',NULL,'Jr. Junin 58 - Lima','+51(01) 3117777  EXT:5160','www.congreso.gob.pe/museo.htm','LIMA',NULL,NULL,'Museo',1);
INSERT INTO destinos VALUES (124,1,'-','Museo Nacional de Arqueología, Antropología e Hist',NULL,'Plaza Bolivar s/n Pueblo Libre - Lima','+51(01) 4635070/+51(01) 4632009','museonacional.perucultural.org.pe','LIMA',NULL,NULL,'Museo',1);
INSERT INTO destinos VALUES (125,1,'Asociacion Rafael Larco Hoyle','Museo Larco Herrera',20418628821,'Av. Bolivar 1515 Pueblo Libre','(01)461-1835/(01)461-1312','www.museolarco.org','LIMA',NULL,NULL,'Museo',1);
INSERT INTO destinos VALUES (126,1,'Fundacion Miguel Mujica Gallo','Museo Oro del Perú',20213555180,'Av. Alonso de Molina No. 1100 Monterrico Surco','(01)345-1292/(01)345-1787','www.museoroperu.com.pe','LIMA',NULL,NULL,'Museo',1);
INSERT INTO destinos VALUES (127,1,'Fortaleza Real Felipe','Fortaleza Real Felipe',NULL,'Plaza Independencia (inicio Av. Saen Peña) - Lima','+51 (01) 4290532',NULL,'LIMA',NULL,NULL,'Museo',1);
INSERT INTO destinos VALUES (128,1,'Museo de La Nación','Museo de La Nación',20161048683,'Javier Prado Este 2465 San Borja - Lima','+51 (01) 4769873',NULL,'LIMA',NULL,NULL,'Museo',1);
INSERT INTO destinos VALUES (129,1,'Museo Enrico Poli','Museo Enrico Poli',NULL,'Lord Cochrane 466 Miraflores - Lima','+51 (01) 4222437',NULL,'LIMA',NULL,NULL,'Museo',1);
INSERT INTO destinos VALUES (130,1,'Museo Amano','Museo Amano',20131260891,'Calle Retiro 160 Miraflores - Lima','+51 (01) 441-2909','http://www.fundacionmuseoamano.org.pe/','LIMA',NULL,NULL,'Museo',1);
INSERT INTO destinos VALUES (131,1,'-','Museo Pedro de Osma',NULL,'Av. Pedro de Osma 421 - Barranco','+51 (01) 4670063/+51 (01) 4670141','www.museopedrodeosma.org','LIMA',NULL,NULL,'Museo',1);
INSERT INTO destinos VALUES (132,1,'Museo de Arte de Lima','Museo de Arte de Lima',NULL,'Paseo Colón 125 - Lima (acceso por el Parque de la Exposición)','+51 (01) 2040000','www.mali.pe','LIMA',NULL,NULL,'Museo',1);
INSERT INTO destinos VALUES (133,1,'-','Museo Raimondi',NULL,'Av. La Fontana 755 La Molina - Lima','+51 (01) 6149700 AX 132/+51 (01) 3496092','www.museoraimondi.org.pe','LIMA',NULL,NULL,'Museo',1);
INSERT INTO destinos VALUES (134,1,'Museo del Banco Central de Reserva del Perú','Museo del Banco Central de Reserva del Perú',NULL,'Esq. Lampa & Ucayali - Lima','+51 (01) 6132000 EXT:2655','museobcr.perucultural.org.pe','LIMA',NULL,NULL,'Museo',1);
INSERT INTO destinos VALUES (135,1,'Patronato Del Museo De Historia Natural','Museo de Historia Natural',20503442231,'AV. Arenales 1256 - Jesús María','+51 (01) 471-0117/+51 (01) 470-7918','museohn.unmsm.edu.pe','LIMA',NULL,NULL,'Museo',1);
INSERT INTO destinos VALUES (136,1,'Museo de Sitio Huaca Pucllana','Museo de Sitio Huaca Pucllana',NULL,'Gnral. Borgoño 800 Miraflores - Lima','+51 (01) 6177138/+51 (01) 4458695','pucllana.perucultural.org.pe','LIMA',NULL,NULL,'Museo',1);
INSERT INTO destinos VALUES (137,1,'Museo de Sitio de Pachacamac','Museo de Sitio de Pachacamac',NULL,'Panamericana Sur Km 31 Lurín - Lima','+51 (01) 4300168','www.mcultura.gob.pe','LIMA',NULL,NULL,'Museo',1);
INSERT INTO destinos VALUES (138,1,'Museo De Sitio Arturo Jimenez Borja - Puruchuco','Museo de Sitio Arturo Jimenez Borja - Puruchuco',NULL,'Carretera central km 4.5 - Ate','+51(01) 4942641','museopuruchuco.perucultural.org.pe','LIMA',NULL,NULL,'Museo',1);
INSERT INTO destinos VALUES (139,1,'Museo de Sitio Huaca Huallamarca','Museo de Sitio Huaca Huallamarca',NULL,'NicolÃ¡s de Ribera 201 San Isidro - Lima','+51 ( 01) 2224124',NULL,'LIMA',NULL,NULL,'Museo',1);
INSERT INTO destinos VALUES (140,1,'Morgan Morgan Vda. De Solari Mari Elizabeth','Galería Las Pallas',10066689242,'Cajamarca 212 - Barranco','+51 (01) 477-4629/+51 999 740 174','www.laspallasperu.com','LIMA',NULL,NULL,'Museo',1);
INSERT INTO destinos VALUES (141,1,'Central Interegional de Artesanos del Perú - C.I.A.P.','Galería-Café K''Antu',20138768431,'Av. Grau 323 - Barranco','+51 (01) 2528647/+51 992 681 419','http://asociacion.ciap.org/rubrique.php?id_rubrique=116&lang=es','LIMA',NULL,NULL,'Museo',1);
INSERT INTO destinos VALUES (142,1,'Laberinto S.A.C.','Galería Dédalo',20507767193,'Paseo SÃ¡enz Peña 295 - Barranco','+51 (01) 652-5400/+51 (01) 652-5398','www.dedalomarket.com','LIMA',NULL,NULL,'Museo',1);
INSERT INTO destinos VALUES (143,1,'Bridge Of Hope','Bridge Of Hope',NULL,'Jr. José María Plaza 155 Jesús María - Lima','(01)333-0152/(01)333-0407','www.fairtradeperu.com','LIMA',NULL,NULL,'Museo',1);
INSERT INTO destinos VALUES (144,1,'-','Pantanos de Villa',NULL,'Alt. Km. 19 Panamericana Sur (en el Pte. Villa) - Lima','(01)254-7611',NULL,'LIMA',NULL,NULL,'Museo',1);
INSERT INTO destinos VALUES (145,1,'Casa Aliaga S.R.L.','Casa Aliaga',20509848263,'Jr. De la Union 224 - Cercado','(01)427-7736','www.casadealiaga.com','LIMA',NULL,NULL,'Museo',1);
INSERT INTO destinos VALUES (146,1,'-','Palacio Arzobispal',NULL,'Plaza Mayor s/n - Lima','+51 (01) 4275790','www.palacioarzobispaldelima.com','LIMA',NULL,NULL,'Museo',1);
INSERT INTO destinos VALUES (147,1,'Artesanos Don Bosco','Artesanos Don Bosco',20463339342,'Av. San Martin 135 - Barranco (a 2 cdras del Puente de los Suspiros)','(01)713-1344','www.artesanosdonbosco.com','LIMA',NULL,NULL,'Museo',1);
INSERT INTO destinos VALUES (148,1,'Andes Textiles Peru S.A.C.','Galeria Wayra',20545929571,'Calle Bolognesi 494 â€“ Miraflores','+51 (01)446-3775','www.wayrashop.com','LIMA',NULL,NULL,'Museo',1);
INSERT INTO destinos VALUES (149,1,'Asociación Mario Testino - MATE','MATE',20535886971,'Av. Pedro de Osma 409, Barranco','+51 (01) 251-7755','www.mate.pe','LIMA',NULL,NULL,'Museo',1);
INSERT INTO destinos VALUES (150,1,'-','Reserva Nacional de Islas Islotes y Puntas Guaneras - RNSIIPG',NULL,'Calle 17 NÂº 355 Urb. El Palomar San Isidro','+51 (01)717-7534','http://www.sernanp.gob.pe/sernanp/zonaturismoi.jsp?ID=76','LIMA',NULL,NULL,'Museo',1);
INSERT INTO destinos VALUES (151,1,'La Rosa Nautica S.A.','La Rosa Nautica',20111035378,'Espigón 4 Circuito de Playas - Miraflores','(01)445-0149/(01)447-0057','www.larosanautica.com','LIMA',NULL,NULL,'Restaurant',1);
INSERT INTO destinos VALUES (152,1,'La Dama Juana S.A.C.','La Dama Juana',20511360804,'Av. República de PanamÃ¡ 230 - Barranco','+51 (01) 2487547/+51 981 044 718','www.ladamajuana.com.pe/home1.html','LIMA',NULL,NULL,'Restaurant',1);
INSERT INTO destinos VALUES (153,1,'Giamen S.A.C.','Mangos',20424718361,'CC Larcomar-Malecón de la Reserva 610 Tda. 4-02 - Miraflores','(01)242-6779/(01)242-8110','www.mangosperu.com','LIMA',NULL,NULL,'Restaurant',1);
INSERT INTO destinos VALUES (154,1,'Inversiones Brade S.A.','Junius',20303972821,'Jr. Independencia 125 - Miraflores','(01)617-1000 AX: 203/(01)617-1000 AX: 278','www.junius.com.pe','LIMA',NULL,NULL,'Restaurant',1);
INSERT INTO destinos VALUES (155,1,'Vivaldino Perú S.A.C.','Vivaldino Larcomar',20553201951,'Malecón de la Reserva 610. Tienda 152-154. C.C. Larcomar Miraflores','(01)255-7224/975 151 284','www.vivaldino.com','LIMA',NULL,NULL,'Restaurant',1);
INSERT INTO destinos VALUES (156,1,'El Senorio de Sulco E.I.R.L.','El Señorio de Sulco',20109586286,'Malecón Cisneros 1470 - Miraflores','(01)441-0183/(01)441-0389','www.senoriodesulco.com','LIMA',NULL,NULL,'Restaurant',1);
INSERT INTO destinos VALUES (157,1,'Restaurant Huaca Pucllana S.A.C.','Huaca Pucllana',20500732891,'General Borgoño cuadra 8 s/n - Miraflores','(01)445-4042','www.resthuacapucllana.com/en/','LIMA',NULL,NULL,'Restaurant',1);
INSERT INTO destinos VALUES (158,1,'Inversiones Maysen S.A.C','Costa Verde',20504590632,'Playa Barranquito s/n Circuito de playas - Barranco','(01)247-1244/(01)247-9110','www.restaurantecostaverde.com/costaverde_portada.php?lan=en','LIMA',NULL,NULL,'Restaurant',1);
INSERT INTO destinos VALUES (159,1,'Inversiones y Negocios del Norte S.A.C.','Fiesta Gourmet Lima',20306470338,'Av. Reducto 1278 - Miraflores','(01)242-9009','www.restaurantfiestagourmet.com/flash/restaurante.html','LIMA',NULL,NULL,'Restaurant',1);
INSERT INTO destinos VALUES (160,1,'Pollos El Cerro S.A.','Pardo''s Chicken - Surco',20337093826,'Av. El Golf Los Incas 498 Urb. Monterrico-Surco','(01)617-2806/(01)437-1580','www.pardoschicken.com.pe','LIMA',NULL,NULL,'Restaurant',1);
INSERT INTO destinos VALUES (161,1,'Fong Wen I Wan','Chifa Fu Jou',10093446793,'Av. Aurelio Miroquesada cuadra 8 s/n, 3er piso dentro del Real Club de Lima San Isidro','+51 (01)221-3133/+51 (01)422-8482','www.chifafujou.com','LIMA',NULL,NULL,'Restaurant',1);
INSERT INTO destinos VALUES (162,1,'Serv Turist y  Estructur del  Pacifico Sur S.A.','Brujas de Cachiche',20166329451,'Calle  Bolognesi 472 - Miraflores','+51 (01)447-1883/+51 (01)447-1133','www.brujasdecachiche.com.pe/en','LIMA',NULL,NULL,'Restaurant',1);
INSERT INTO destinos VALUES (163,1,'Cinco millas S.A.C.','Astrid & Gastón',20509076945,'Av. Paz SoldÃ¡n 290 - San Isidro','+51 (01)441-5757/+51 (01)442-2777','http://www.astridygaston.com','LIMA',NULL,NULL,'Restaurant',1);
INSERT INTO destinos VALUES (164,1,'Liquid Company S.A.C.','Scena',20507397752,'Francisco de Paula Camino 280 - Miraflores','(01)445-9688/(01)241-8184','www.scena.com.pe','LIMA',NULL,NULL,'Restaurant',1);
INSERT INTO destinos VALUES (165,1,'Crisantemo Gourmet S.A.C.','Centolla',20538474046,'Av Arnaldo Marquez 1629, Jesús María 15072 (Alt. 16 de Gral. Garzón','((01) 636 6354','www.centollarestaurante.com.pe','LIMA',NULL,NULL,'Restaurant',1);
INSERT INTO destinos VALUES (166,1,'Pak Fok S.A.','Pak Fok',20513696290,'Av Malecón de la Reserva 610 (Larcomar) tda 102-103 - Miraflores','(01)241-1333','www.pakfok.galeon.com','LIMA',NULL,NULL,'Restaurant',1);
INSERT INTO destinos VALUES (167,1,'Jose Antonio S.R.L.','Jose Antonio - San Isidro',20100327849,'Jr. Bernardo Monteagudo 200 - San Isidro','(01)264-0188/(01)264-3284','www.joseantonio.com.pe','LIMA',NULL,NULL,'Restaurant',1);
INSERT INTO destinos VALUES (168,1,'Inversiones Capricornio 25 S.R.L.','Jose Antonio - Chacarilla',20505080131,'Av. La Floresta 124 Esquina con Av. Primavera','(01)372-6868/(01)372-7288','www.joseantonio.com.pe','LIMA',NULL,NULL,'Restaurant',1);
INSERT INTO destinos VALUES (169,1,'Queirolo de Barbieri S.A.C.','El Bolivariano',20112750798,'Calle Rosa Toledo NÂ° 289 - 291 - Pueblo Libre','+51 (01) 261-9565/+51 (01) 463-0434','www.elbolivariano.com','LIMA',NULL,NULL,'Restaurant',1);
INSERT INTO destinos VALUES (170,1,'Café del Museo S.A.C.','Café del Museo Larco Herrera',20513257610,'Av. Bolivar 1515 - Pueblo Libre','(01)461-1312/(01)461-1835','www.museolarco.org/cafedelmuseo/index_eng.html','LIMA',NULL,NULL,'Restaurant',1);
INSERT INTO destinos VALUES (171,1,'BDD S.A.C.','Embarcadero',20503257336,'Fleming 181 - Urb. Higuereta - Santiago de Surco','+51 (01) 4483166/-','www.embarcadero41.com','LIMA',NULL,NULL,'Restaurant',1);
INSERT INTO destinos VALUES (172,1,'MAREQ S.A.C.','El Rocoto',20538566081,'Av. Federico Villareal 360 - Miraflores','(01)222-3175/(01)448-3040','http://www.elrocoto.com.pe/local_miraflores.php','LIMA',NULL,NULL,'Restaurant',1);
INSERT INTO destinos VALUES (173,1,'MAREA ALTA S.A.','SPONDYLUS',20430129326,'Av. Caminos del Inca 1899 Las Gardenias-Surco','+51 (01) 2753188/+51 998 199 509','-','LIMA',NULL,NULL,'Restaurant',1);
INSERT INTO destinos VALUES (174,1,'FUNDACION CORPORACION RUSTICA','RUSTICA',20557123106,'Pq. Municipal 105 - Barranco','+51 (01) 2479385/-','-','LIMA',NULL,NULL,'Restaurant',1);
INSERT INTO destinos VALUES (175,1,'Antigua Taberna Queirolo S.A.C.','Antigua Taberna Queirolo',20100906105,'Av. San Martin Nro. 1090 - Pueblo Libre','(01)460-0441/(01)463-1008','www.antiguatabernaqueirolo.com','LIMA',NULL,NULL,'Restaurant',1);
INSERT INTO destinos VALUES (176,1,'100pre Feliz S.A.C.','Wa Lok - Cercado de Lima',20379719440,'Jr. Paruro 864 - 878 - Cercado de Lima','+51 (01) 427-2750','www.walok.com.pe/?lang=en#','LIMA',NULL,NULL,'Restaurant',1);
INSERT INTO destinos VALUES (177,1,'INVERSIONES RESTAURANT SONIA S.A.C.','Sonia Cevicheria',20460965501,'Calle Santa Rosa Nr. 173 - Chorrillos','+51 (01) 4673788/+51 (01) 2516693','www.restaurantsonia.com','LIMA',NULL,NULL,'Restaurant',1);
INSERT INTO destinos VALUES (178,1,'Besso Laura Susana','Paso Obligado',15516127446,'Av. Manuel Valle MZ. G  Lt. 10 -  Pachacamac','(01)430-4178',NULL,'LIMA',NULL,NULL,'Restaurant',1);
INSERT INTO destinos VALUES (179,1,'Casa Hacienda los Ficus S.A.C.','Hacienda los Ficus',20515771671,'Valle de Lurin - Lima','(01)444-4022/(01)444-3979','www.haciendalosficus.com/01PagInicioIN.html','LIMA',NULL,NULL,'Restaurant',1);
INSERT INTO destinos VALUES (180,1,'Anticuchos del Perú S.A.C.','Panchita',20514680401,'Av. Dos de Mayo 298 - Miraflores','(01)242-5957',NULL,'LIMA',NULL,NULL,'Restaurant',1);
INSERT INTO destinos VALUES (181,1,'Restaurante Royal S.A.','Royal',20253023628,'Av. Guillermo Prescott 231 - San Isidro','+51 (01)422-9547/+51 (01)421-0814','www.restauranteroyal.com/en/index.php','LIMA',NULL,NULL,'Restaurant',1);
INSERT INTO destinos VALUES (182,1,'100pre Feliz S.A.C.','Wa Lok - Miraflores',20379719440,'Av. Angamos Oeste 700 - Miraflores','+51 (01) 4471329/+51 (01) 4471314','www.walok.com.pe/?lang=en#','LIMA',NULL,NULL,'Restaurant',1);
INSERT INTO destinos VALUES (183,1,'Gresco S.A.C.','Cala',20252796623,'Circuito vial Costa Verde - Playa Barranquito - Barranco','(01)252-9187/9982-47326','www.calarestaurante.com','LIMA',NULL,NULL,'Restaurant',1);
INSERT INTO destinos VALUES (184,1,'Hacienda Mamacona S.A.C.','Hacienda Mamacona',20502800711,'Alameda Mamacona s/n - Lurín','+51 (01) 2957461/994 186 995','www.haciendamamacona.com.pe','LIMA',NULL,NULL,'Restaurant',1);
INSERT INTO destinos VALUES (185,1,'Eterno Retorno S.A.C.','Amor Amar',20521370042,'Jr. Garcia y Garcia 175 - Barranco','+51 (01) 6199595/+51 (01) 6511112','www.amoramar.com','LIMA',NULL,NULL,'Restaurant',1);
INSERT INTO destinos VALUES (186,1,'Servicios Comerciales y Turisticos Ayacucho S.A.C.','El Parquetito',20110431601,'Calle Lima 373 - Miraflores','(01)444-0490','www.elparquetito.com','LIMA',NULL,NULL,'Restaurant',1);
INSERT INTO destinos VALUES (187,1,'Asociación de las Trabajadoras Misioneras de La Inmaculada Concepción LÂ´EAU Vive Del Perú','L`EAU Vive',20108713870,'Jr. Ucayali 370 Lima - Lima','(01)427-5612',NULL,'LIMA',NULL,NULL,'Restaurant',1);
INSERT INTO destinos VALUES (188,1,'Food Service Investment S.A.C.','Maido',20492015165,'Calle San Martín 399 -  Esq Colón -  Miraflores','(01)444-2568','www.maido.pe/en/index.php','LIMA',NULL,NULL,'Restaurant',1);
INSERT INTO destinos VALUES (189,1,'Bravo Restobar S.A.C.','Bravo Restobar',20512198563,'Av. Conquistadores 1005 - San Isidro','(01)221-5700','www.bravorestobar.com/html/','LIMA',NULL,NULL,'Restaurant',1);
INSERT INTO destinos VALUES (190,1,'Danica Miraflores S.A.C.','DÃ¡nica',20536088335,'Av. Armendariz 524 - Miraflores','(01)446-2135/(01)445-8743','www.danica.pe','LIMA',NULL,NULL,'Restaurant',1);
INSERT INTO destinos VALUES (191,1,'Enotours Peru S.A.C.','Trentino',20520582283,'Calle Antonio Polo NÂ° 886 - Pueblo Libre','(01)261-1590/(01)461-8082','www.trentino.com.pe','LIMA',NULL,NULL,'Restaurant',1);
INSERT INTO destinos VALUES (192,1,'Restaurant La Fonda de los Suspiros S.A.C.','La Fonda de los Suspiros',20507259953,'Av. Pedro de Osma 102 - Barranco - Lima','(01)247-2547','www.lafondadelossuspiros.com','LIMA',NULL,NULL,'Restaurant',1);
INSERT INTO destinos VALUES (193,1,'Alimentos Latinos S.A.C.','El Mercado',20518773578,'Av. Hipolito Unanue NÂ° 203 -  Miraflores','(01)221-1322','www.rafaelosterling.com/intro.html','LIMA',NULL,NULL,'Restaurant',1);
INSERT INTO destinos VALUES (194,1,'Cangre Food S.A.C.','Mantra',20513913908,'Av.Benavides 1761 Urb. San Antonio - Miraflores','(01)445-0127/9955-55457','www.mantraperu.com','LIMA',NULL,NULL,'Restaurant',1);
INSERT INTO destinos VALUES (195,1,'Cadepa S.A.C.','Café de la Paz',20100588995,'Calle Lima 361 - Miraflores','(01)241-6043','www.cafedelapazperu.com','LIMA',NULL,NULL,'Restaurant',1);
INSERT INTO destinos VALUES (196,1,'Libre Albedrio S.A.C.','Pescados Capitales',20502773136,'Av. La Mar 1337 - Miraflores','(01)421-8808','www.pescadoscapitales.com','LIMA',NULL,NULL,'Restaurant',1);
INSERT INTO destinos VALUES (197,1,'Inversiones EMC Gourmet S.A.C.','Lima 27',20516949377,'Calle Santa Luisa 295, San Isidro','(01)421-9084/(01)21-5822','http://www.lima27.com/','LIMA',NULL,NULL,'Restaurant',1);
INSERT INTO destinos VALUES (198,1,'Restaurante Cordano S.R.L.','Cordano',20100437865,'Jr. Ancash 202 - Lima','(01)427-0181','www.restaurantcordano.com','LIMA',NULL,NULL,'Restaurant',1);
INSERT INTO destinos VALUES (199,1,'Inversiones Eivissa S.A.C.','Chala',20513033002,'Bajada de Baños Nro 343 - Barranco','(01)252-8515','www.chala.com.pe','LIMA',NULL,NULL,'Restaurant',1);
INSERT INTO destinos VALUES (200,1,'Salon Capon','Salon Capon',20512925538,'Jr. Paruro 819 Barrio Chino - Cercado de Lima','(01)426-9286','www.saloncapon.com','LIMA',NULL,NULL,'Restaurant',1);
INSERT INTO destinos VALUES (201,1,'Loy Sing S.A.C.','Madam Tusan',20518792360,'Av. Santa Cruz 859, Miraflores','(01)505-5090',NULL,'LIMA',NULL,NULL,'Restaurant',1);
INSERT INTO destinos VALUES (202,1,'Puerto Madero S.A.C.','La Bistecca',20510886209,'Av Los Conquistadores 1048, San Isidro','(01)421 7555/(01)421 1523','http://www.labisteccalima.com/','LIMA',NULL,NULL,'Restaurant',1);
INSERT INTO destinos VALUES (203,1,'Cinco Millas S.A.C.','La Barra Casa Moreyra',20509076945,'Av. Paz SoldÃ¡n 290 - San Isidro','(01)442-2774/(01)442-2777','http://www.astridygaston.com','LIMA',NULL,NULL,'Restaurant',1);
INSERT INTO destinos VALUES (204,1,'Karla Watson Uriarte','Catering KW',10079714661,'Calle Domingo Ponte 1189 - Magdalena del Mar','+51 (01) 460 6208/+51 995 995 966',NULL,'LIMA',NULL,NULL,'Restaurant',1);
INSERT INTO destinos VALUES (205,1,'Inversiones Lima 5909 S.A.C','Chifa Internacional',20502704835,'Av. Republica de PanamÃ¡ 5915 Lima - Miraflores','(01)445-3242','www.chifainternacional.com','LIMA',NULL,NULL,'Restaurant',1);
INSERT INTO destinos VALUES (206,1,'Orient- Express Peru S.A.','Mesa 18 - Miraflores Park',20334539149,'Av. Malecón de la Reserva 1035 - Miraflores','(01)610-4000','www.mesa18restaurant.com/web/mesa18/index.jsp','LIMA',NULL,NULL,'Restaurant',1);
INSERT INTO destinos VALUES (207,1,'Casa Aliaga S.R.L.','Casa Aliaga',20509848263,'Jr. De la Union 224 - Cercado','(01)427-7736','www.casadealiaga.com/index.php?idIdioma=en_EN','LIMA',NULL,NULL,'Restaurant',1);
INSERT INTO destinos VALUES (208,1,'Pedro Miguel S.A.C.','Malabar Restaurant & Bar',20507660712,'Av. Camino Real 101','(01)440-9094/(01)440-5300','malabar.com.pe','LIMA',NULL,NULL,'Restaurant',1);
INSERT INTO destinos VALUES (209,1,'Transgourmet S.A.C.','La Décima',20524459818,'Av. Emilio Cavenecia 190 San Isidro','(01)440-2977/(01)222-1036','www.ladecima.pe','LIMA',NULL,NULL,'Restaurant',1);
INSERT INTO destinos VALUES (210,1,'Asociación Casa Garcia Alvarado','Casa Garcia Alvarado',20516788268,'Cal. Esperanza 138 (alt de la cuadra 3 de Larco)- Miraflores','+51 (01) 4477772','www.casa-garcia-alvarado.com/history.html','LIMA',NULL,NULL,'Restaurant',1);
INSERT INTO destinos VALUES (211,1,'Serviperb S.R.L.','La Rana Verde',20101428819,'Parque GÃ¡lvez s/n La Punta - Callao','(01)429-5279/(01)429-8453',NULL,'LIMA',NULL,NULL,'Restaurant',1);
INSERT INTO destinos VALUES (212,1,'Inversiones Viramar S.A.C.','Central Restaurante',20517895980,'Calle Santa Isabel 376 - Miraflores','+51 (01) 242- 8515/+51 (01 )242-8575','centralrestaurante.com.pe/en/index.php','LIMA',NULL,NULL,'Restaurant',1);
INSERT INTO destinos VALUES (213,1,'La Tiendecita Blanca S.A.','La Tiendecita Blanca',20100317967,'Av. Larco 111 - Miraflores','(01)445-1412/(01)445-9797','www.latiendecitablanca.com.pe/index_eng.htm','LIMA',NULL,NULL,'Restaurant',1);
INSERT INTO destinos VALUES (214,1,'Pollos El Acantilado S.A.','Pardo''s Chicken - Larcomar',20430040180,'Malecón de La Reserva 610 CC Larcomar Tda 238','+51 (01)447-8023/(01)437-1580','www.pardoschicken.com.pe','LIMA',NULL,NULL,'Restaurant',1);
INSERT INTO destinos VALUES (215,1,'AAR & Asociados S.A.C.','Portofino',20514933384,'Malecon de la Rserva 610 tda 155 2do nivel - Miraflores','(01)447-2194','www.restauranteportofino.com.pe','LIMA',NULL,NULL,'Restaurant',1);
INSERT INTO destinos VALUES (216,1,'El Guayabo S.A.C.','Pardo''s Chicken - Costa verde',20537916461,'Av. Costa Verde s/n playa las Cascadas-Barranquito','(01)437-1580','www.pardoschicken.com.pe','LIMA',NULL,NULL,'Restaurant',1);
INSERT INTO destinos VALUES (217,1,'WYCH Inversiones S.A.C.','Pardo''s Chicken - Centro Historico Lima',20425476115,'Pasaje Santa Rosa 153 - Lima','(01)437-1580','www.pardoschicken.com.pe','LIMA',NULL,NULL,'Restaurant',1);
INSERT INTO destinos VALUES (218,1,'Fiesta Restaurant Gourmet','Fiesta Restaurant Gourmet',NULL,'Av. Reducto 1278 - Miraflores','(01)242-9009','www.restaurantfiestagourmet.com','LIMA',NULL,NULL,'Restaurant',1);
INSERT INTO destinos VALUES (219,1,'Jose Antonio Restaurants','Jose Antonio Restaurants',NULL,'Jr. Bernardo Monteagudo 200 - San Isidro',NULL,'www.joseantonio.com.pe','LIMA',NULL,NULL,'Restaurant',1);
INSERT INTO destinos VALUES (220,1,'Jaime Marimon Cruz','Los Hornitos de Azpitia',10402403689,'Valle de Mala-Azpitia en la bodega de Piscos','9890-47020','www.Loshornitosdeazpitia.com.pe','LIMA',NULL,NULL,'Restaurant',1);
INSERT INTO destinos VALUES (221,1,'Inversiones Eivissa S.A.C.','Picas',20513033002,'Jr. Bajada de los Baños 340 - Barranco','(01)247-6150/(01)252-8095','www.picas.com.pe','LIMA',NULL,NULL,'Restaurant',1);
INSERT INTO destinos VALUES (222,1,'Rudani Inversiones S.A.C','La Cuadra de Salvador',20549879277,'Centenario 105, Barranco (esquina con Av. Grau)','+51 (01) 247 8670/+51 989 817 299','http://www.lacuadradesalvador.com/quienes-somos.html','LIMA',NULL,NULL,'Restaurant',1);
INSERT INTO destinos VALUES (223,1,'Inversiones Nacionales de Turismo S.A.','Maras - Libertador Lima Westin',20114803228,'Calle Las Begonias 450 - San Isidro','(01)201-5000/(01)518-6510','www.westinlima.com.pe/en','LIMA',NULL,NULL,'Restaurant',1);
INSERT INTO destinos VALUES (224,1,'Desarrollo Gastronómico S.A.C.','El Cortijo',20549252126,'Calle Montero Rosas 121, Barranco','+51 (01) 2519133','http://www.elcortijo.com.pe','LIMA',NULL,NULL,'Restaurant',1);
INSERT INTO destinos VALUES (225,1,'AAP CORPORACION S.A.C.','Alfresco',20549253360,'Malecón Balta 790 -Miraflores','+51 (01) 242-8960','http://www.restaurantealfresco.com','LIMA',NULL,NULL,'Restaurant',1);
INSERT INTO destinos VALUES (226,1,'Rafael Osterling Lima','Rafael Osterling Lima',10093995037,'San Martin 300, Miraflores','+51 (01)242-4149/+51 (01)242-4231','http://www.rafaelosterling.pe/en/lima.html','LIMA',NULL,NULL,'Restaurant',1);
INSERT INTO destinos VALUES (227,1,'Inversiones Honda Yaki S.A.C.','Sukha Asian Cuisine',20521923661,'calle Dos de Mayo 694 - Miraflores','+51 (1) 7193763','http://sukha.pe/sukharest/','LIMA',NULL,NULL,'Restaurant',1);
INSERT INTO destinos VALUES (228,1,'Comercial OWN S.A.','Pardos Chicken - Benavides',20100313201,'Av. Benavides 730 â€“ Miraflores','+51 (01) 444-2126','http://www.pardoschicken.pe/','LIMA',NULL,NULL,'Restaurant',1);
INSERT INTO destinos VALUES (229,1,'Plaza San Martín','Plaza San Martín',20550057451,'Av. Nicolas de Pierola 938 of 304 Cercado de Lima','+51 (01) 717-8493/+51 984 724 740','www.restauranteplazasanmartin.com','LIMA',NULL,NULL,'Restaurant',1);
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






INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(1, 1,0,'OW',28,8,1,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(2, 1,0,'OW',49,7,1,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(3, 1,0,'OW',79,5,1,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(4, 1,0,'OW',124,2,1,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(5, 1,0,'OW',33,8,2,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(6, 1,0,'OW',55,7,2,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(7, 1,0,'OW',94,5,2,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(8, 1,0,'OW',133,2,2,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(9, 1,3,'RT',44,8,3,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(10, 1,3,'RT',64,7,3,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(11, 1,3,'RT',103,5,3,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(12, 1,3,'RT',150,2,3,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(13, 1,0,'OW',10,8,4,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(14, 1,0,'OW',10,7,4,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(15, 1,0,'OW',15,5,4,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(16, 1,0,'OW',154,2,4,1,'2015-05-27 19:56:47');  
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(17, 1,0,'RT',20,8,5,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(18, 1,0,'RT',20,7,5,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(19, 1,0,'RT',30,5,5,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(20, 1,0,'RT',30,2,5,1,'2015-05-27 19:56:47');   
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(21, 1,0,'OW',55,8,6,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(22, 1,0,'OW',77,7,6,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(23, 1,0,'OW',155,5,6,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(24, 1,0,'OW',205,2,6,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(25, 1,0,'OW',23,8,7,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(26, 1,0,'OW',46,7,7,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(27, 1,0,'OW',75,5,7,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(28, 1,0,'OW',109,2,7,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(29, 1,0,'OW',39,8,8,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(30, 1,0,'OW',64,7,8,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(31, 1,0,'OW',103,5,8,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(32, 1,0,'OW',159,2,8,1,'2015-05-27 19:56:47');  
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(33, 1,0,'OW',33,8,9,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(34, 1,0,'OW',50,7,9,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(35, 1,0,'OW',83,5,9,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(36, 1,0,'OW',125,2,9,1,'2015-05-27 19:56:47');    
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(37, 1,0,'RT',28,8,10,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(38, 1,0,'RT',28,7,10,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(39, 1,0,'RT',28,5,10,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(40, 1,0,'RT',28,2,10,1,'2015-05-27 19:56:47'); 
    
  
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(41, 1,4,'Sin Descripcion',44,8,11,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(42, 1,4,'Sin Descripcion',58,7,11,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(43, 1,4,'Sin Descripcion',120,5,11,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(44, 1,4,'Sin Descripcion',170,2,11,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(45, 1,4,'Sin Descripcion',44,8,12,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(46, 1,4,'Sin Descripcion',58,7,12,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(47, 1,4,'Sin Descripcion',120,5,12,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(48, 1,4,'Sin Descripcion',170,2,12,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(49, 1,4.5,'Sin Descripcion',55,8,13,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(50, 1,4.5,'Sin Descripcion',76,7,13,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(51, 1,4.5,'Sin Descripcion',130,5,13,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(52, 1,4.5,'Sin Descripcion',235,2,13,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(53, 1,8,'Sin Descripcion',112,8,14,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(54, 1,8,'Sin Descripcion',145,7,14,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(55, 1,8,'Sin Descripcion',250,5,14,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(56, 1,8,'Sin Descripcion',413,2,14,1,'2015-05-27 19:56:47');  
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(57, 1,4.5,'Sin Descripcion',56,8,15,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(58, 1,4.5,'Sin Descripcion',75,7,15,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(59, 1,4.5,'Sin Descripcion',130,5,15,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(60, 1,4.5,'Sin Descripcion',215,2,15,1,'2015-05-27 19:56:47'); 
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(61, 1,4.5,'Sin Descripcion',75,8,16,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(62, 1,4.5,'Sin Descripcion',99,7,16,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(63, 1,4.5,'Sin Descripcion',193,5,16,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(64, 1,4.5,'Sin Descripcion',286,2,16,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(65, 1,5,'Sin Descripcion',91,8,17,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(66, 1,5,'Sin Descripcion',121,7,17,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(67, 1,5,'Sin Descripcion',286,5,17,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(68, 1,5,'Sin Descripcion',333,2,17,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(69, 1,8,'Sin Descripcion',146,8,18,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(70, 1,8,'Sin Descripcion',193,7,18,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(71, 1,8,'Sin Descripcion',347,5,18,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(72, 1,8,'Sin Descripcion',509,2,18,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(73, 1,1,'Sin Descripcion',17,8,19,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(74, 1,1,'Sin Descripcion',25,7,19,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(75, 1,1,'Sin Descripcion',35,5,19,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(76, 1,1,'Sin Descripcion',55,2,19,1,'2015-05-27 19:56:47');  
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(77, 1,5,'Sin Descripcion',56,8,20,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(78, 1,5,'Sin Descripcion',96,7,20,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(79, 1,5,'Sin Descripcion',140,5,20,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(80, 1,5,'Sin Descripcion',240,2,20,1,'2015-05-27 19:56:47'); 

  
  
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(81, 1,0,'Sin Descripcion',230,8,21,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(82, 1,0,'Sin Descripcion',314,7,21,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(83, 1,0,'Sin Descripcion',470,5,21,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(84, 1,0,'Sin Descripcion',638,2,21,1,'2015-05-27 19:56:47');

INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(85, 1,0,'Sin Descripcion',260,8,22,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(86, 1,0,'Sin Descripcion',359,7,22,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(87, 1,0,'Sin Descripcion',560,5,22,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(88, 1,0,'Sin Descripcion',715,2,22,1,'2015-05-27 19:56:47');

INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(89, 1,0,'Sin Descripcion',280,8,23,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(90, 1,0,'Sin Descripcion',338,7,23,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(91, 1,0,'Sin Descripcion',600,5,23,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(92, 1,0,'Sin Descripcion',770,2,23,1,'2015-05-27 19:56:47');
  
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(93, 1,0,'Sin Descripcion',294,8,24,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(94, 1,0,'Sin Descripcion',355,7,24,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(95, 1,0,'Sin Descripcion',630,5,24,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(96, 1,0,'Sin Descripcion',809,2,24,1,'2015-05-27 19:56:47');  
  
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(97, 1,0,'Sin Descripcion',332,8,25,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(98, 1,0,'Sin Descripcion',456,7,25,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(99, 1,0,'Sin Descripcion',695,5,25,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(100, 1,0,'Sin Descripcion',945,2,25,1,'2015-05-27 19:56:47'); 
  
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(101, 1,0,'Sin Descripcion',282,8,26,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(102, 1,0,'Sin Descripcion',432,7,26,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(103, 1,0,'Sin Descripcion',660,5,26,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(104, 1,0,'Sin Descripcion',896,2,26,1,'2015-05-27 19:56:47');

INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(105, 1,0,'Sin Descripcion',25,8,27,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(106, 1,0,'Sin Descripcion',25,7,27,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(107, 1,0,'Sin Descripcion',25,5,27,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(108, 1,0,'Sin Descripcion',25,2,27,1,'2015-05-27 19:56:47');

INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(109, 1,0,'RT',155,8,28,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(110, 1,0,'RT',180,7,28,1,'2015-05-27 19:56:47');
  
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(111, 1,0,'Sin Descripcion',729,8,29,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(112, 1,0,'Sin Descripcion',948,7,29,1,'2015-05-27 19:56:47');

INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(113, 1,0,'Sin Descripcion',398,8,30,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(114, 1,0,'Sin Descripcion',517,7,30,1,'2015-05-27 19:56:47');
   
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(115, 1,0,'Sin Descripcion',551,8,31,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(116, 1,0,'Sin Descripcion',716,7,31,1,'2015-05-27 19:56:47');
   
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(117, 1,0,'Sin Descripcion',259,8,32,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(118, 1,0,'Sin Descripcion',342,7,32,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(119, 1,0,'Sin Descripcion',585,5,32,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(120, 1,0,'Sin Descripcion',748,2,32,1,'2015-05-27 19:56:47');  
  
  
  
  
  
  
  
  
  
  
  
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(121, 1,3,'Sin Descripcion',40,8,33,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(122, 1,3,'Sin Descripcion',55,7,33,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(123, 1,3,'Sin Descripcion',90,5,33,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(124, 1,3,'Sin Descripcion',150,2,33,1,'2015-05-27 19:56:47');

INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(125, 1,3,'Sin Descripcion',40,8,34,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(126, 1,3,'Sin Descripcion',55,7,34,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(127, 1,3,'Sin Descripcion',90,5,34,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(128, 1,3,'Sin Descripcion',150,2,34,1,'2015-05-27 19:56:47');

INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(129, 1,4,'Sin Descripcion',56,8,35,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(130, 1,4,'Sin Descripcion',75,7,35,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(131, 1,4,'Sin Descripcion',105,5,35,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(132, 1,4,'Sin Descripcion',200,2,35,1,'2015-05-27 19:56:47');
  
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(133, 1,4,'Sin Descripcion',50,8,36,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(134, 1,4,'Sin Descripcion',70,7,36,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(135, 1,4,'Sin Descripcion',100,5,36,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(136, 1,4,'Sin Descripcion',210,2,36,1,'2015-05-27 19:56:47');  
  
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(137, 1,4,'Sin Descripcion',56,8,37,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(138, 1,4,'Sin Descripcion',75,7,37,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(139, 1,4,'Sin Descripcion',105,5,37,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(140, 1,4,'Sin Descripcion',260,2,37,1,'2015-05-27 19:56:47'); 
  
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(141, 1,5,'Sin Descripcion',85,8,38,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(142, 1,5,'Sin Descripcion',110,7,38,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(143, 1,5,'Sin Descripcion',155,5,38,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(144, 1,5,'Sin Descripcion',260,2,38,1,'2015-05-27 19:56:47');

INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(145, 1,4,'Sin Descripcion',50,8,39,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(146, 1,4,'Sin Descripcion',67,7,39,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(147, 1,4,'Sin Descripcion',125,5,39,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(148, 1,4,'Sin Descripcion',203,2,39,1,'2015-05-27 19:56:47');  
  
  
  
  
  
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(149, 1,0,'Sin Descripcion',75,1,40,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(150, 1,5,'Sin Descripcion',252,1,41,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(151, 1,1,'Sin Descripcion',54,1,42,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(152, 1,3,'Sin Descripcion',50,1,43,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(153, 1,4,'Sin Descripcion',45,1,44,1,'2015-05-27 19:56:47');
INSERT INTO `sgstt`.`tarifa` (`idtarifa`, `idsede`, `horas`, `descripcion`, `precio`, `idtipo_vehiculo`, `idservicio`, `estado`, `fecha_registro`) VALUES(154, 1,0,'Full Day',1180,1,45,1,'2015-05-27 19:56:47');  
    
 