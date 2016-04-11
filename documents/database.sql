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
  `nombre` VARCHAR(60) NULL ,
  `apellido` VARCHAR(80) NULL ,
  `dni` VARCHAR(8) NULL,
  `direccion` VARCHAR(200) NULL  ,
  `distrito` VARCHAR(80) NULL  ,
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
  `fecha` DATETIME  NOT NULL,
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
  `descripcion2` VARCHAR(45) NULL ,
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
  `horas` double(10,2) NOT NULL ,
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
  `razonsocial` VARCHAR(80) NULL ,
  `direccion` VARCHAR(200) NULL ,
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
  `fecha_creacion` DATETIME NOT NULL,
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
  `precio_servicio_igv` DECIMAL(12,2) NULL ,
  `precio_total_servicio` DECIMAL(12,2) NULL ,
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

 