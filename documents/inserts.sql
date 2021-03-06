
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
INSERT INTO sede VALUES (1, 'LIMA');
INSERT INTO sede VALUES (2, 'CUSCO');

COMMIT;

-- -----------------------------------------------------
-- Data for table `sgstt`.`trasladista`
-- -----------------------------------------------------
START TRANSACTION;
USE `sgstt`;

INSERT INTO trasladista VALUES (1,1,'Margarita Stuard','','','Domeyer 128 Dpto 502 ','Barranco','','',992096541,1);
INSERT INTO trasladista VALUES (2,1,'Victor Aranda','','','Av. El laurel rosa 411, Dpto 502 Los sauces ','Surquillo','','',998704588,1);
INSERT INTO trasladista VALUES (3,1,'Silvia de Vettor','','','Ram�n Castilla 418 Urb. Aurora ','Miraflores','','',998584090,1);
INSERT INTO trasladista VALUES (4,1,'Ursula Collas','','','Calle. Alfredo silva 142, Casa 115 ','Barranco','','',987483384,1);
INSERT INTO trasladista VALUES (5,1,'Nelida Manrique','','','Calle. Manco Capac 421-Dpto 102 ','Miraflores','','',999606328,1);
INSERT INTO trasladista VALUES (6,1,'Franz Alarcon','','','Av. Grau 341 � Dpto 602 ','Miraflores','','',997918429,1);
INSERT INTO trasladista VALUES (7,1,'Nieves echegaray','','','Parque echenique 741 Dpto. 501','Pueblo Libre','','',989204566,1);
INSERT INTO trasladista VALUES (8,1,'Oscar Von Bishopsahussen','','','Av. Castilla con Av. Ayacucho G in 17 - Urbanizaci�n La Capullana ','Suco','','',941998805,1);
INSERT INTO trasladista VALUES (9,1,'Ernesto Riedner','','','Jr. Fernando castrat #320  ','Surco','','',999094224,1);
INSERT INTO trasladista VALUES (10,1,'Guillermo Torres','','','Enrique Barr�n N� 845 � Dpto. 202 � Santa Beatriz','Lima','','',999734773,1);
INSERT INTO trasladista VALUES (11,1,'Mariana Garcia','','','Calle La Pen�nsula Mz C1 Lt 21 Urb. La Ensenada ','La Molina','',989767036,951316074,1);
INSERT INTO trasladista VALUES (12,1,'Karina Bartens','','','Jr. El escorial F-3 urb comopus','Surco','',992708308,951421407,1);
INSERT INTO trasladista VALUES (13,1,'Ena cabrera','','','Jr. Bolognesi 647- B - Miraflores','Miraflores','','',998448799,1);
INSERT INTO trasladista VALUES (14,1,'sandra casas','','','Calle buenaventura Aguirre 348 Dpto 402 ','Barranco','','',991722833,1);
INSERT INTO trasladista VALUES (15,1,'Kika Caballero','','','Alameda monte Umbroso 285 Alt. Cdra 2 de precursores ','Surco','','',999709039,1);
INSERT INTO trasladista VALUES (16,1,'Alberto Gomez','','','Av. Santa cruz 753 ','Jesus Maria','',514247963,999981716,1);
INSERT INTO trasladista VALUES (17,1,'Miguel Casta�eda','','','Bruselas 201 los sauces ','Surquillo','','',995035770,1);
INSERT INTO trasladista VALUES (18,1,'Elisa Paredes','','','Jr. General Borgo�a 120 Int. 1003 ','Pueblo Libre','','',992770563,1);
INSERT INTO trasladista VALUES (19,1,'Mirtha Cabanillas','','','Av. Newton # 7263 Urb. Sol de oro ','Los Olivos','','',995885002,1);
INSERT INTO trasladista VALUES (20,1,'sheyla carpio','','','Los Zorzales 224 - santa cecilia - Bellavista','Callao','','',986642977,1);
INSERT INTO trasladista VALUES (21,1,'Mariela castro','','','Jr. Chacas Urb. Mercurio 891','Los Olivos','','',940276733,1);
INSERT INTO trasladista VALUES (22,1,'Abel Pardo','','','Av. Nicolas arriola 779 - A Urb Santa catalina ','La Victoria','','',993910786,1);
INSERT INTO trasladista VALUES (23,1,'Claudia Vasquez','','','Av. Grau 454 Dpto. 703 ','Miraflores','','',997627051,1);
INSERT INTO trasladista VALUES (24,1,'Desiree Godefroy','','','Reynaldo Vivanco 1444 Dpto. 3A  ','Surco','',999584351,98902927,1);
INSERT INTO trasladista VALUES (25,1,'Omar Araya','','','Urb. Mayorazgo 3er etapa Mz M dpto. 106-c ','Ate','','',996914361,1);
INSERT INTO trasladista VALUES (26,1,'Beatriz Gonzales','','','Calle los alisos 100 Urb. Alto de los ficus','Santa Anita','','',997515115,1);
INSERT INTO trasladista VALUES (27,1,'Maria Montes','','','Jr. Marte 367','Pueblo Libre','','',975404820,1);
INSERT INTO trasladista VALUES (28,1,'Efrain Vidalon','','','Calle Green 176 - La calera de la Merced ','Surquillo','',993464622,993563115,1);
INSERT INTO trasladista VALUES (29,1,'Michael Sauerteig ','','','Calle Tiepolo 143 - Dpto 401 ','San Borja','','',949520496,1);
INSERT INTO trasladista VALUES (30,1,'Francisco Bringas','','','Puerta del Sol 380 - La Castellana','Surco','',940495752,997893524,1);
INSERT INTO trasladista VALUES (31,1,'Jean Pierre Neciosup ','','','Av Sebastian Lorente 1045 Cercado de Lima','Lima','',997017486,991197472,1);
INSERT INTO trasladista VALUES (32,1,'Daniel Poppe ','','','c/ Sinchi Roca 2532, dep 802','Lince','','',971115001,1);
INSERT INTO trasladista VALUES (33,1,'Ronald Morales','','','Calle Los Conquistadores  MZ D Lt 3. Urbanizaci�n Sanchez Cerro.','Surco','','',986470544,1);
INSERT INTO trasladista VALUES (34,1,'Klaus Hippauf','','','Calle Isla de Gallo 197 - Dpto. 303','San Miguel','',987716929,993028794,1);
INSERT INTO trasladista VALUES (35,1,'Carlo Barberis','','','Berlin 828 Dpto 301 ','Miraflores','','',994458720,1);
INSERT INTO trasladista VALUES (36,1,'Carlos Ayala','','','Calle Las dalias E 19 - Urb. Filadelphia 4ta Etapa ','San Martin','',993506427,976719287,1);
INSERT INTO trasladista VALUES (37,1,'Marco Sarmento','','','Calle lima 252- block 3k dpto. 302 ','Barranco','','',987431108,1);
INSERT INTO trasladista VALUES (38,1,'Eduardo Aguilar','','','Jr. Zorritos 1399 Bloque 60 Dpto 303 Cercado de Lima','Lima','','',991813541,1);
INSERT INTO trasladista VALUES (39,1,'Zoraya Carty','','','Jr. Angaraes 574 Int. 1 - Lima','Lima','','',997520513,1);
INSERT INTO trasladista VALUES (40,1,'Romain wermeister','','','Calle  Mariscal Sucre 321 dpt 12 ','Miraflores','','',987103367,1);


COMMIT;

-- -----------------------------------------------------
-- Data for table `sgstt`.`empresa`
-- -----------------------------------------------------
START TRANSACTION;
USE `sgstt`;
INSERT INTO `sgstt`.`empresa` (`idempresa`,`idsede`, `razon_social`, `ruc`,`centrocosto`, `telefono`, `celular`, `correo`, `estado`) VALUES (1, 1, 'TRANSLIVIK', '',"VT-00", '', '', '',1);
INSERT INTO `sgstt`.`empresa` (`idempresa`,`idsede`, `razon_social`, `ruc`,`centrocosto`, `telefono`, `celular`, `correo`, `estado`) VALUES (2, 1, 'TRANSP.BOCANEGRA', '',"VT-01", '', '', '',1);
INSERT INTO `sgstt`.`empresa` (`idempresa`,`idsede`, `razon_social`, `ruc`,`centrocosto`, `telefono`, `celular`, `correo`, `estado`) VALUES (3, 1, 'TRANSP.CESPEDES', '',"VT-02", '', '', '',1);
INSERT INTO `sgstt`.`empresa` (`idempresa`,`idsede`, `razon_social`, `ruc`,`centrocosto`, `telefono`, `celular`, `correo`, `estado`) VALUES (4, 1, 'TRANSP.MOVIL TOURS', '',"VT-03", '', '', '',1);
INSERT INTO `sgstt`.`empresa` (`idempresa`,`idsede`, `razon_social`, `ruc`,`centrocosto`, `telefono`, `celular`, `correo`, `estado`) VALUES (5, 1, 'TRANSP.TAN', '',"VT-04", '', '', '',1);
INSERT INTO `sgstt`.`empresa` (`idempresa`,`idsede`, `razon_social`, `ruc`,`centrocosto`, `telefono`, `celular`, `correo`, `estado`) VALUES (6, 1, 'TRANSP.ARANDA', '',"VT-05", '', '', '',1);
INSERT INTO `sgstt`.`empresa` (`idempresa`,`idsede`, `razon_social`, `ruc`,`centrocosto`, `telefono`, `celular`, `correo`, `estado`) VALUES (7, 1, 'TRANSP.3 REYES', '',"VT-06", '', '', '',1);
INSERT INTO `sgstt`.`empresa` (`idempresa`,`idsede`, `razon_social`, `ruc`,`centrocosto`, `telefono`, `celular`, `correo`, `estado`) VALUES (8, 1, 'TRANSP.TARUKA TOURS', '',"VT-07", '', '', '',1);
INSERT INTO `sgstt`.`empresa` (`idempresa`,`idsede`, `razon_social`, `ruc`,`centrocosto`, `telefono`, `celular`, `correo`, `estado`) VALUES (9, 1, 'TRANSP.A & V TOUR', '',"VT-08", '', '', '',1);
INSERT INTO `sgstt`.`empresa` (`idempresa`,`idsede`, `razon_social`, `ruc`,`centrocosto`, `telefono`, `celular`, `correo`, `estado`) VALUES (10, 1, 'TRANSP.TRANSPERU', '',"VT-09", '', '', '',1);
INSERT INTO `sgstt`.`empresa` (`idempresa`,`idsede`, `razon_social`, `ruc`,`centrocosto`, `telefono`, `celular`, `correo`, `estado`) VALUES (11, 1, 'TRANSP.D1', '',"VT-11", '', '', '',1);
INSERT INTO `sgstt`.`empresa` (`idempresa`,`idsede`, `razon_social`, `ruc`,`centrocosto`, `telefono`, `celular`, `correo`, `estado`) VALUES (12, 1, 'TRANSP.DC TRAVEL', '',"VT-11", '', '', '',1);
INSERT INTO `sgstt`.`empresa` (`idempresa`,`idsede`, `razon_social`, `ruc`,`centrocosto`, `telefono`, `celular`, `correo`, `estado`) VALUES (13, 1, 'TRANSP.DIOSES', '',"VT-12", '', '', '',1);
INSERT INTO `sgstt`.`empresa` (`idempresa`,`idsede`, `razon_social`, `ruc`,`centrocosto`, `telefono`, `celular`, `correo`, `estado`) VALUES (14, 1, 'TRANSP.CARRILLO', '',"VT-13", '', '', '',1);
INSERT INTO `sgstt`.`empresa` (`idempresa`,`idsede`, `razon_social`, `ruc`,`centrocosto`, `telefono`, `celular`, `correo`, `estado`) VALUES (15, 1, 'TRANSP.TURISMO CAR', '',"VT-14", '', '', '',1);
INSERT INTO `sgstt`.`empresa` (`idempresa`,`idsede`, `razon_social`, `ruc`,`centrocosto`, `telefono`, `celular`, `correo`, `estado`) VALUES (16, 1, 'TRANSP.WILLIAM', '',"VT-15", '', '', '',1);
INSERT INTO `sgstt`.`empresa` (`idempresa`,`idsede`, `razon_social`, `ruc`,`centrocosto`, `telefono`, `celular`, `correo`, `estado`) VALUES (17, 1, 'TRANP.MANCHEGO', '',"VT-16", '', '', '',1);
INSERT INTO `sgstt`.`empresa` (`idempresa`,`idsede`, `razon_social`, `ruc`,`centrocosto`, `telefono`, `celular`, `correo`, `estado`) VALUES (18, 1, 'TRANSP.TRANSZELA', '',"VT-17", '', '', '',1);
INSERT INTO `sgstt`.`empresa` (`idempresa`,`idsede`, `razon_social`, `ruc`,`centrocosto`, `telefono`, `celular`, `correo`, `estado`) VALUES (19, 1, 'TRANSP.YESKA', '',"VT-18", '', '', '',1);
INSERT INTO `sgstt`.`empresa` (`idempresa`,`idsede`, `razon_social`, `ruc`,`centrocosto`, `telefono`, `celular`, `correo`, `estado`) VALUES (20, 1, 'TRANSP.ANDES', '',"VT-19", '', '', '',1);
INSERT INTO `sgstt`.`empresa` (`idempresa`,`idsede`, `razon_social`, `ruc`,`centrocosto`, `telefono`, `celular`, `correo`, `estado`) VALUES (21, 1, 'TRANSP.SAMANIEGO', '',"VT-20", '', '', '',1);
INSERT INTO `sgstt`.`empresa` (`idempresa`,`idsede`, `razon_social`, `ruc`,`centrocosto`, `telefono`, `celular`, `correo`, `estado`) VALUES (22, 1, 'INVERSIONES KINTARO', '',"VT-22", '', '', '',1);
INSERT INTO `sgstt`.`empresa` (`idempresa`,`idsede`, `razon_social`, `ruc`,`centrocosto`, `telefono`, `celular`, `correo`, `estado`) VALUES (23, 1, 'PERU MAGIC TOURS', '',"VT-23", '', '', '',1);
INSERT INTO `sgstt`.`empresa` (`idempresa`,`idsede`, `razon_social`, `ruc`,`centrocosto`, `telefono`, `celular`, `correo`, `estado`) VALUES (24, 1, 'TRANSP.WILKAMAR', '',"VT-24", '', '', '',1);
INSERT INTO `sgstt`.`empresa` (`idempresa`,`idsede`, `razon_social`, `ruc`,`centrocosto`, `telefono`, `celular`, `correo`, `estado`) VALUES (25, 1, 'TRANSP.LONGA', '',"VT-25", '', '', '',1);
INSERT INTO `sgstt`.`empresa` (`idempresa`,`idsede`, `razon_social`, `ruc`,`centrocosto`, `telefono`, `celular`, `correo`, `estado`) VALUES (26, 1, 'TRANSP. CMV', '',"VT-26", '', '', '',1);
INSERT INTO `sgstt`.`empresa` (`idempresa`,`idsede`, `razon_social`, `ruc`,`centrocosto`, `telefono`, `celular`, `correo`, `estado`) VALUES (27, 1, 'TRANSP.TRANSMARTIN', '',"VT-27", '', '', '',1);
INSERT INTO `sgstt`.`empresa` (`idempresa`,`idsede`, `razon_social`, `ruc`,`centrocosto`, `telefono`, `celular`, `correo`, `estado`) VALUES (28, 1, 'TRANSP.WI�ATOUR', '',"VT-28", '', '', '',1);
INSERT INTO `sgstt`.`empresa` (`idempresa`,`idsede`, `razon_social`, `ruc`,`centrocosto`, `telefono`, `celular`, `correo`, `estado`) VALUES (29, 1, 'TRANSP.VSM', '',"VT-29", '', '', '',1);
INSERT INTO `sgstt`.`empresa` (`idempresa`,`idsede`, `razon_social`, `ruc`,`centrocosto`, `telefono`, `celular`, `correo`, `estado`) VALUES (30, 1, 'TRANSPTRANSP.EDUFER.VALLE', '',"VT-30", '', '', '',1);

INSERT INTO `sgstt`.`empresa` (`idempresa`,`idsede`, `razon_social`, `ruc`,`centrocosto`, `telefono`, `celular`, `correo`, `estado`) VALUES (31, 2, 'TRANSLIVIK', '',"VTC-00", '', '', '',1);
INSERT INTO `sgstt`.`empresa` (`idempresa`,`idsede`, `razon_social`, `ruc`,`centrocosto`, `telefono`, `celular`, `correo`, `estado`) VALUES (32, 2, 'TRANSP.MOUNTAIN TRAVEL', '',"VTC-01", '', '', '',1);
INSERT INTO `sgstt`.`empresa` (`idempresa`,`idsede`, `razon_social`, `ruc`,`centrocosto`, `telefono`, `celular`, `correo`, `estado`) VALUES (33, 2, 'TRANSP.TUFILS', '',"VTC-02", '', '', '',1);
INSERT INTO `sgstt`.`empresa` (`idempresa`,`idsede`, `razon_social`, `ruc`,`centrocosto`, `telefono`, `celular`, `correo`, `estado`) VALUES (34, 2, 'TRANSP.PERU ANDES', '',"VTC-03", '', '', '',1);
INSERT INTO `sgstt`.`empresa` (`idempresa`,`idsede`, `razon_social`, `ruc`,`centrocosto`, `telefono`, `celular`, `correo`, `estado`) VALUES (35, 2, 'TRANSP.PATR TRAVEL', '',"VTC-04", '', '', '',1);
INSERT INTO `sgstt`.`empresa` (`idempresa`,`idsede`, `razon_social`, `ruc`,`centrocosto`, `telefono`, `celular`, `correo`, `estado`) VALUES (36, 2, 'TRANSP.NENFIZ', '',"VTC-05", '', '', '',1);
INSERT INTO `sgstt`.`empresa` (`idempresa`,`idsede`, `razon_social`, `ruc`,`centrocosto`, `telefono`, `celular`, `correo`, `estado`) VALUES (37, 2, 'TRANSP.HERMANOS QUISPE', '',"VTC-06", '', '', '',1);
INSERT INTO `sgstt`.`empresa` (`idempresa`,`idsede`, `razon_social`, `ruc`,`centrocosto`, `telefono`, `celular`, `correo`, `estado`) VALUES (38, 2, 'TRANSP.YESKA TOURS', '',"VTC-07", '', '', '',1);
INSERT INTO `sgstt`.`empresa` (`idempresa`,`idsede`, `razon_social`, `ruc`,`centrocosto`, `telefono`, `celular`, `correo`, `estado`) VALUES (39, 2, 'TRANSP.VS TOUR', '',"VTC-08", '', '', '',1);
INSERT INTO `sgstt`.`empresa` (`idempresa`,`idsede`, `razon_social`, `ruc`,`centrocosto`, `telefono`, `celular`, `correo`, `estado`) VALUES (40, 2, 'TRANSP.CUBAC', '',"VTC-09", '', '', '',1);
INSERT INTO `sgstt`.`empresa` (`idempresa`,`idsede`, `razon_social`, `ruc`,`centrocosto`, `telefono`, `celular`, `correo`, `estado`) VALUES (41, 2, 'TRANSP.RUMISUR', '',"VTC-11", '', '', '',1);
INSERT INTO `sgstt`.`empresa` (`idempresa`,`idsede`, `razon_social`, `ruc`,`centrocosto`, `telefono`, `celular`, `correo`, `estado`) VALUES (42, 2, 'TRANSP.AVALOS', '',"VTC-12", '', '', '',1);
INSERT INTO `sgstt`.`empresa` (`idempresa`,`idsede`, `razon_social`, `ruc`,`centrocosto`, `telefono`, `celular`, `correo`, `estado`) VALUES (43, 2, 'TRANSP.CUSI TOURS', '',"VTC-13", '', '', '',1);
INSERT INTO `sgstt`.`empresa` (`idempresa`,`idsede`, `razon_social`, `ruc`,`centrocosto`, `telefono`, `celular`, `correo`, `estado`) VALUES (44, 2, 'TRANSP.ROSARIO TOURS', '',"VTC-14",  '', '', '',1);
INSERT INTO `sgstt`.`empresa` (`idempresa`,`idsede`, `razon_social`, `ruc`,`centrocosto`, `telefono`, `celular`, `correo`, `estado`) VALUES (45, 2, 'TRANSP.ALO URUBAMBA', '',"VTC-15",  '', '', '',1);


-- -----------------------------------------------------
-- Data for table `sgstt`.`chofer`
-- -----------------------------------------------------
START TRANSACTION;
USE `sgstt`;
INSERT INTO `chofer` VALUES (1,2,'JAIME','AGUILAR EGOAVIL','23885693','','','2015-11-07 00:00:00','A1','12345678',1,1),
(2,2,'CESAR AMADO','ARELLANOS MU�OZ','25662462','','','2015-11-07 00:00:00','A2','12345678',1,1),
(3,1,'MARIO HERNAN','CUADROS HUAPAYA','25577045','987-511-873','Q25577045','1970-07-13 00:00:00','A-3C','12345678',1,1),
(4,1,'PEPE','DAMIAN JURO','10550499','987-511-874','Q10550499','1974-04-29 00:00:00','A-3C','12345678',1,1),
(5,1,'KATTY DORIS','ESCOBAR PUMACALLAO','07884541','989-214-673','Q07884541','1974-03-15 00:00:00','A- 2B','12345678',1,1),
(6,1,'CARLOS ALBERTO','HERRERA NAVARRO','10630551','987-545-125','Q10630551','1977-03-15 00:00:00','A-3C','12345678',1,1),
(7,1,'JOSE EDUARDO','HUAPALLA BALCAZAR','10144415','997-517-962','Q10144415','2015-11-07 00:00:00','A-2B','12345678',1,1),
(8,1,'RODOLFO CESAR','LAZO CALDERON','25717877','989-214-674','Q25717877','1972-08-18 00:00:00','A-3C','12345678',1,1),
(9,1,'JOSE LUIS','NU�EZ CUENCA ROJAS','09461980','984-126-764','Q0946980','1971-04-25 00:00:00','A-3A','12345678',1,1),
(10,1,'ADRIAN','TICONA APAZA','10520991','987-511-872','K10520991','1968-01-17 00:00:00','A-3C','12345678',1,1),
(11,1,'RAUL ANIBAL','TORRES GARAY','08667068','987-596-639','Q08667068','1967-04-07 00:00:00','A-3C','12345678',1,1);
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
INSERT INTO `sgstt`.`vehiculo` (`idvehiculo`, `idsede`, `descripcion`, `descripcion2`, `placa`, `estado`, `yearfabricacion`, `capacidad_max`, `capacidad_recomendada`, `color`, `idtipo_vehiculo`, `marca_idmarca`, `fecha_registro`, `fecha_modificacion`) VALUES (1, 1, 'V-01', 'SCANIA1', 'B6F-962', 1, '2006', '12', '10', 'negro', 2, 4, '2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO `sgstt`.`vehiculo` (`idvehiculo`, `idsede`, `descripcion`, `descripcion2`, `placa`, `estado`, `yearfabricacion`, `capacidad_max`, `capacidad_recomendada`, `color`, `idtipo_vehiculo`, `marca_idmarca`, `fecha_registro`, `fecha_modificacion`) VALUES (2, 2, 'V-04', 'H1-1', 'B3Z-954', 1, '2009', '40', '36', 'plata', 8, 2, '2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO `sgstt`.`vehiculo` (`idvehiculo`, `idsede`, `descripcion`, `descripcion2`, `placa`, `estado`, `yearfabricacion`, `capacidad_max`, `capacidad_recomendada`, `color`, `idtipo_vehiculo`, `marca_idmarca`, `fecha_registro`, `fecha_modificacion`) VALUES (3, 1, 'V-05', 'TOYOTA', 'B6H-966', 1, '2009', '50', '45', 'plata', 8, 5, '2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO `sgstt`.`vehiculo` (`idvehiculo`, `idsede`, `descripcion`, `descripcion2`, `placa`, `estado`, `yearfabricacion`, `capacidad_max`, `capacidad_recomendada`, `color`, `idtipo_vehiculo`, `marca_idmarca`, `fecha_registro`, `fecha_modificacion`) VALUES (4, 1, 'V-06', 'H1-2', 'A3H-968', 1, '2010', '12', '10', 'negro', 8, 2, '2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO `sgstt`.`vehiculo` (`idvehiculo`, `idsede`, `descripcion`, `descripcion2`, `placa`, `estado`, `yearfabricacion`, `capacidad_max`, `capacidad_recomendada`, `color`, `idtipo_vehiculo`, `marca_idmarca`, `fecha_registro`, `fecha_modificacion`) VALUES (5, 2, 'V-08', 'H1-3', 'B8P-788', 1, '2012', '40', '36', 'plata', 8, 4, '2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO `sgstt`.`vehiculo` (`idvehiculo`, `idsede`, `descripcion`, `descripcion2`, `placa`, `estado`, `yearfabricacion`, `capacidad_max`, `capacidad_recomendada`, `color`, `idtipo_vehiculo`, `marca_idmarca`, `fecha_registro`, `fecha_modificacion`) VALUES (6, 1, 'V-09', 'MERCEDES2', 'B0F-958', 1, '2012', '50', '45', 'plata', 5, 3, '2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO `sgstt`.`vehiculo` (`idvehiculo`, `idsede`, `descripcion`, `descripcion2`, `placa`, `estado`, `yearfabricacion`, `capacidad_max`, `capacidad_recomendada`, `color`, `idtipo_vehiculo`, `marca_idmarca`, `fecha_registro`, `fecha_modificacion`) VALUES (7, 1, 'V-10', 'HINO1', 'C3H-964', 1, '2012', '12', '10', 'negro', 5, 1, '2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO `sgstt`.`vehiculo` (`idvehiculo`, `idsede`, `descripcion`, `descripcion2`, `placa`, `estado`, `yearfabricacion`, `capacidad_max`, `capacidad_recomendada`, `color`, `idtipo_vehiculo`, `marca_idmarca`, `fecha_registro`, `fecha_modificacion`) VALUES (8, 1, 'V-11', 'SPRINTER', 'C3E-953', 1, '2013', '40', '36', 'plata', 6, 3, '2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO `sgstt`.`vehiculo` (`idvehiculo`, `idsede`, `descripcion`, `descripcion2`, `placa`, `estado`, `yearfabricacion`, `capacidad_max`, `capacidad_recomendada`, `color`, `idtipo_vehiculo`, `marca_idmarca`, `fecha_registro`, `fecha_modificacion`) VALUES (9, 1, 'V-12', 'H1-4', 'C5J-959', 1, '2013', '50', '45', 'plata', 8, 2, '2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO `sgstt`.`vehiculo` (`idvehiculo`, `idsede`, `descripcion`, `descripcion2`, `placa`, `estado`, `yearfabricacion`, `capacidad_max`, `capacidad_recomendada`, `color`, `idtipo_vehiculo`, `marca_idmarca`, `fecha_registro`, `fecha_modificacion`) VALUES (10, 1, 'V-13', 'HINO2', 'C6Q-967', 1, '2014', '12', '10', 'negro', 5, 1, '2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO `sgstt`.`vehiculo` (`idvehiculo`, `idsede`, `descripcion`, `descripcion2`, `placa`, `estado`, `yearfabricacion`, `capacidad_max`, `capacidad_recomendada`, `color`, `idtipo_vehiculo`, `marca_idmarca`, `fecha_registro`, `fecha_modificacion`) VALUES (11, 1, 'V-14', 'SCANIA2', 'C6T-963', 1, '2014', '40', '36', 'plata', 2, 4, '2015-05-27 19:56:47', '2015-05-27 19:56:47');
COMMIT;

-- -----------------------------------------------------
-- Data for table `sgstt`.`aerolinea`
-- -----------------------------------------------------
START TRANSACTION;
USE `sgstt`;
INSERT INTO aerolinea VALUES (1,'AEROLINEAS ARGENTINAS');
INSERT INTO aerolinea VALUES (2,'AIR CANADA');
INSERT INTO aerolinea VALUES (3,'AMERICAN AIRLINES');
INSERT INTO aerolinea VALUES (4,'AVIANCA');
INSERT INTO aerolinea VALUES (5,'BRITYSS AIRWAYS');
INSERT INTO aerolinea VALUES (6,'Copa Airlines');
INSERT INTO aerolinea VALUES (7,'Iberia');
INSERT INTO aerolinea VALUES (8,'KLM');
INSERT INTO aerolinea VALUES (9,'LAN');
INSERT INTO aerolinea VALUES (10,'LAN PERU');
INSERT INTO aerolinea VALUES (11,'LC BUSRE');
INSERT INTO aerolinea VALUES (12,'PERUVIAN');
INSERT INTO aerolinea VALUES (13,'QANTAS');
INSERT INTO aerolinea VALUES (14,'STAR PERU');
INSERT INTO aerolinea VALUES (15,'TAM  ');
INSERT INTO aerolinea VALUES (16,'TAME');
INSERT INTO aerolinea VALUES (17,'UNITED AIRLINES');



COMMIT;

-- -----------------------------------------------------
-- Data for table `sgstt`.`vuelo`
-- -----------------------------------------------------
START TRANSACTION;
USE `sgstt`;
INSERT INTO vuelo VALUES (1,1,'AR1364','EZE/LIM','',1,1);
INSERT INTO vuelo VALUES (2,1,'AC1946','YYZ/LIM','',1,2);
INSERT INTO vuelo VALUES (3,1,'AC1946','CCS/LIM','',1,2);
INSERT INTO vuelo VALUES (4,1,'UX075','MAD/LIM','',1,2);
INSERT INTO vuelo VALUES (5,1,'UX075','MAD/LIM','',1,2);
INSERT INTO vuelo VALUES (6,1,'AF480','CDG/LIM','',1,2);
INSERT INTO vuelo VALUES (7,1,'AF483','LIM/CDG','',1,2);
INSERT INTO vuelo VALUES (8,1,'AA1558','LIM/MIA','',1,3);
INSERT INTO vuelo VALUES (9,1,'AA7267','LIM/MIA','',1,3);
INSERT INTO vuelo VALUES (10,1,'AA7268','MIA/LIM','',1,3);
INSERT INTO vuelo VALUES (11,1,'AA917','MIA/LIM','',1,3);
INSERT INTO vuelo VALUES (12,1,'AA918','LIM/MIA','',1,3);
INSERT INTO vuelo VALUES (13,1,'AA972','MIA/LIM','',1,3);
INSERT INTO vuelo VALUES (14,1,'AA972','MIA/LIM','',1,3);
INSERT INTO vuelo VALUES (15,1,'AA980','DFW/LIM','',1,3);
INSERT INTO vuelo VALUES (16,1,'AA980','DFW/LIM','',1,3);
INSERT INTO vuelo VALUES (17,1,'AA988','LIM/DFW','',1,3);
INSERT INTO vuelo VALUES (18,1,'AV024','LIM/BGT','',1,4);
INSERT INTO vuelo VALUES (19,1,'AV025','BGT/LIM','',1,4);
INSERT INTO vuelo VALUES (20,1,'AV130','LIM/BGT','',1,4);
INSERT INTO vuelo VALUES (21,1,'AV131','BGT/LIM','',1,4);
INSERT INTO vuelo VALUES (22,1,'AV133','BGT/LIM','',1,4);
INSERT INTO vuelo VALUES (23,1,'AV140','LIM/BGT','',1,4);
INSERT INTO vuelo VALUES (24,1,'AV141','BGT/LIM','',1,4);
INSERT INTO vuelo VALUES (25,1,'AV142','LIM/BGT','',1,4);
INSERT INTO vuelo VALUES (26,1,'AV147','BGT/LIM','',1,4);
INSERT INTO vuelo VALUES (27,1,'AV6646','GRU/LIM','',1,4);
INSERT INTO vuelo VALUES (28,1,'AV7388','UIO/LIIM','',1,4);
INSERT INTO vuelo VALUES (29,1,'AV7389','LIM/UIO','',1,4);
INSERT INTO vuelo VALUES (30,1,'AV7390','GYE/LIM','',1,4);
INSERT INTO vuelo VALUES (31,1,'AV800','JUL/LIM','',1,4);
INSERT INTO vuelo VALUES (32,1,'AV803','CUZ/LIM','',1,4);
INSERT INTO vuelo VALUES (33,2,'AV803','CUZ/LIM','',1,4);
INSERT INTO vuelo VALUES (34,1,'AV806','CUZ/LIM','',1,4);
INSERT INTO vuelo VALUES (35,2,'AV806','CUZ/LIM','',1,4);
INSERT INTO vuelo VALUES (36,1,'AV807','LIM/CUZ','',1,4);
INSERT INTO vuelo VALUES (37,2,'AV807','LIM/CUZ','',1,4);
INSERT INTO vuelo VALUES (38,1,'AV808','CUZ/LIM','',1,4);
INSERT INTO vuelo VALUES (39,2,'AV808','CUZ/LIM','',1,4);
INSERT INTO vuelo VALUES (40,1,'AV809','LIM/CUZ','',1,4);
INSERT INTO vuelo VALUES (41,2,'AV809','LIM/CUZ','',1,4);
INSERT INTO vuelo VALUES (42,1,'AV809','CUZ/LIM','',1,4);
INSERT INTO vuelo VALUES (43,2,'AV809','CUZ/LIM','',1,4);
INSERT INTO vuelo VALUES (44,1,'AV809','LIM/PEM','',1,4);
INSERT INTO vuelo VALUES (45,1,'AV825','PIU/LIM','',1,4);
INSERT INTO vuelo VALUES (46,1,'AV830','CUZ/LIM','',1,4);
INSERT INTO vuelo VALUES (47,2,'AV830','CUZ/LIM','',1,4);
INSERT INTO vuelo VALUES (48,1,'AV836','CUZ/LIM','',1,4);
INSERT INTO vuelo VALUES (49,2,'AV836','CUZ/LIM','',1,4);
INSERT INTO vuelo VALUES (50,1,'AV924','LIM/CCS','',1,4);
INSERT INTO vuelo VALUES (51,1,'AV925','CCS/LIM','',1,4);
INSERT INTO vuelo VALUES (52,1,'AV929','SAL/LIM','',1,4);
INSERT INTO vuelo VALUES (53,1,'AV962','CUZ/LIM','',1,4);
INSERT INTO vuelo VALUES (54,2,'AV962','CUZ/LIM','',1,4);
INSERT INTO vuelo VALUES (55,1,'AV963','LIM/EZE','',1,4);
INSERT INTO vuelo VALUES (56,1,'AV964','EZE/LIM','',1,4);
INSERT INTO vuelo VALUES (57,1,'AV966','EZE/LIM','',1,4);
INSERT INTO vuelo VALUES (58,1,'AV967','LIM/EZE','',1,4);
INSERT INTO vuelo VALUES (59,1,'BA5037','MIA/LIM','',1,5);
INSERT INTO vuelo VALUES (60,1,'BA5050','LIM/MIA','',1,5);
INSERT INTO vuelo VALUES (61,1,'CM0436','LIM/PTY','',1,6);
INSERT INTO vuelo VALUES (62,1,'CM492','LIM/PTY','',1,6);
INSERT INTO vuelo VALUES (63,1,'CM493','PTY/LIM','',1,6);
INSERT INTO vuelo VALUES (64,1,'CM760','LIM/PTY','',1,6);
INSERT INTO vuelo VALUES (65,1,'CM760','LIM/PTY','',1,6);
INSERT INTO vuelo VALUES (66,1,'CM761','PTY/LIM','',1,6);
INSERT INTO vuelo VALUES (67,1,'DL150','LIM/ATL','',1,6);
INSERT INTO vuelo VALUES (68,1,'DL151','ATL/LIM','',1,6);
INSERT INTO vuelo VALUES (69,1,'IB6650','LIM/MAD','',1,7);
INSERT INTO vuelo VALUES (70,1,'IB6651','MAD/LIM','',1,7);
INSERT INTO vuelo VALUES (71,1,'IB7758','LIM/MAD','',1,7);
INSERT INTO vuelo VALUES (72,1,'IB7759','MAD/LIM','',1,7);
INSERT INTO vuelo VALUES (73,1,'KL743','AMS/LIM','',1,8);
INSERT INTO vuelo VALUES (74,1,'KL744','LIM/AMS','',1,8);
INSERT INTO vuelo VALUES (75,1,'LA2117','LIM/AQP','',1,9);
INSERT INTO vuelo VALUES (76,1,'LA 2180','AYA/LIM','',1,9);
INSERT INTO vuelo VALUES (77,1,'LA1449','UIO/LIM','',1,9);
INSERT INTO vuelo VALUES (78,1,'LA1480','LIM/UIO','',1,9);
INSERT INTO vuelo VALUES (79,1,'LA1481','UIO/LIM','',1,9);
INSERT INTO vuelo VALUES (80,1,'LA1630','LIM/GYE','',1,9);
INSERT INTO vuelo VALUES (81,1,'LA1631','GYE/LIM','',1,9);
INSERT INTO vuelo VALUES (82,1,'LA2004','CUZ/LIM','',1,9);
INSERT INTO vuelo VALUES (83,1,'LA2010','CUZ/LIM','',1,9);
INSERT INTO vuelo VALUES (84,1,'LA2011','LIM/CUZ','',1,9);
INSERT INTO vuelo VALUES (85,1,'LA2020','CUZ/LIM','',1,9);
INSERT INTO vuelo VALUES (86,1,'LA2021','LIM/CUZ','',1,9);
INSERT INTO vuelo VALUES (87,1,'LA2022','CUZ/LIM','',1,9);
INSERT INTO vuelo VALUES (88,1,'LA2023','LIM/CUZ','',1,9);
INSERT INTO vuelo VALUES (89,1,'LA2024','CUZ/LIM','',1,9);
INSERT INTO vuelo VALUES (90,1,'LA2026','CUZ/LIM','',1,9);
INSERT INTO vuelo VALUES (91,1,'LA2027','LIM/CUZ','',1,9);
INSERT INTO vuelo VALUES (92,1,'LA2030','CUZ/LIM','',1,9);
INSERT INTO vuelo VALUES (93,1,'LA2031','LIM/CUZ','',1,9);
INSERT INTO vuelo VALUES (94,1,'LA2034','CUZLIM','',1,9);
INSERT INTO vuelo VALUES (95,1,'LA2035','LIM/CUZ','',1,9);
INSERT INTO vuelo VALUES (96,1,'LA2035','LIM/CUZ','',1,9);
INSERT INTO vuelo VALUES (97,1,'LA2037','LIM/CUZ','',1,9);
INSERT INTO vuelo VALUES (98,1,'LA2041','LIM/CUZ','',1,9);
INSERT INTO vuelo VALUES (99,1,'LA2042','CUZ/LIM','',1,9);
INSERT INTO vuelo VALUES (100,1,'LA2043','LIM/CUZ','',1,9);
INSERT INTO vuelo VALUES (101,1,'LA2045','LIM/CUZ','',1,9);
INSERT INTO vuelo VALUES (102,1,'LA2045','LIM/CUZ','',1,9);
INSERT INTO vuelo VALUES (103,1,'LA2046','CUZ/LIM','',1,9);
INSERT INTO vuelo VALUES (104,1,'LA2047','LIM/CUZ','',1,9);
INSERT INTO vuelo VALUES (105,1,'LA2050','CUZ/LIM','',1,9);
INSERT INTO vuelo VALUES (106,1,'LA2062','CUZ/LIM','',1,9);
INSERT INTO vuelo VALUES (107,1,'LA2063','LIM/CUZ','',1,9);
INSERT INTO vuelo VALUES (108,1,'LA2067','LIM/CUZ','',1,9);
INSERT INTO vuelo VALUES (109,1,'LA2069','LIM/CUZ','',1,9);
INSERT INTO vuelo VALUES (110,2,'LA2004','CUZ/LIM','',1,9);
INSERT INTO vuelo VALUES (111,2,'LA2010','CUZ/LIM','',1,9);
INSERT INTO vuelo VALUES (112,2,'LA2011','LIM/CUZ','',1,9);
INSERT INTO vuelo VALUES (113,2,'LA2020','CUZ/LIM','',1,9);
INSERT INTO vuelo VALUES (114,2,'LA2021','LIM/CUZ','',1,9);
INSERT INTO vuelo VALUES (115,2,'LA2022','CUZ/LIM','',1,9);
INSERT INTO vuelo VALUES (116,2,'LA2023','LIM/CUZ','',1,9);
INSERT INTO vuelo VALUES (117,2,'LA2024','CUZ/LIM','',1,9);
INSERT INTO vuelo VALUES (118,2,'LA2026','CUZ/LIM','',1,9);
INSERT INTO vuelo VALUES (119,2,'LA2027','LIM/CUZ','',1,9);
INSERT INTO vuelo VALUES (120,2,'LA2030','CUZ/LIM','',1,9);
INSERT INTO vuelo VALUES (121,2,'LA2031','LIM/CUZ','',1,9);
INSERT INTO vuelo VALUES (122,2,'LA2034','CUZLIM','',1,9);
INSERT INTO vuelo VALUES (123,2,'LA2035','LIM/CUZ','',1,9);
INSERT INTO vuelo VALUES (124,2,'LA2035','LIM/CUZ','',1,9);
INSERT INTO vuelo VALUES (125,2,'LA2037','LIM/CUZ','',1,9);
INSERT INTO vuelo VALUES (126,2,'LA2041','LIM/CUZ','',1,9);
INSERT INTO vuelo VALUES (127,2,'LA2042','CUZ/LIM','',1,9);
INSERT INTO vuelo VALUES (128,2,'LA2043','LIM/CUZ','',1,9);
INSERT INTO vuelo VALUES (129,2,'LA2045','LIM/CUZ','',1,9);
INSERT INTO vuelo VALUES (130,2,'LA2045','LIM/CUZ','',1,9);
INSERT INTO vuelo VALUES (131,2,'LA2046','CUZ/LIM','',1,9);
INSERT INTO vuelo VALUES (132,2,'LA2047','LIM/CUZ','',1,9);
INSERT INTO vuelo VALUES (133,2,'LA2050','CUZ/LIM','',1,9);
INSERT INTO vuelo VALUES (134,2,'LA2062','CUZ/LIM','',1,9);
INSERT INTO vuelo VALUES (135,2,'LA2063','LIM/CUZ','',1,9);
INSERT INTO vuelo VALUES (136,2,'LA2067','LIM/CUZ','',1,9);
INSERT INTO vuelo VALUES (137,2,'LA2069','LIM/CUZ','',1,9);
INSERT INTO vuelo VALUES (138,1,'LA2075','LIM/PEM','',1,9);
INSERT INTO vuelo VALUES (139,1,'LA2076','PEM/LIM','',1,9);
INSERT INTO vuelo VALUES (140,1,'LA2077','LIM/CUZ','',1,9);
INSERT INTO vuelo VALUES (141,2,'LA2077','LIM/CUZ','',1,9);
INSERT INTO vuelo VALUES (142,1,'LA2092','JUL/LIM','',1,9);
INSERT INTO vuelo VALUES (143,1,'LA2096','JUL/LIM','',1,9);
INSERT INTO vuelo VALUES (144,1,'LA2097','LIM/JUL','',1,9);
INSERT INTO vuelo VALUES (145,1,'LA2104','AQP/LIM','',1,9);
INSERT INTO vuelo VALUES (146,1,'LA2105','LIMN/AQP','',1,9);
INSERT INTO vuelo VALUES (147,2,'LA2105','LIMN/AQP','',1,9);
INSERT INTO vuelo VALUES (148,1,'LA2121','JUL/LIM','',1,9);
INSERT INTO vuelo VALUES (149,1,'LA2123','LIM/CUZ','',1,9);
INSERT INTO vuelo VALUES (150,2,'LA2123','LIM/CUZ','',1,9);
INSERT INTO vuelo VALUES (151,1,'LA2124','AQP/LIM','',1,9);
INSERT INTO vuelo VALUES (152,1,'LA2125','LIM/AQP','',1,9);
INSERT INTO vuelo VALUES (153,1,'LA2143','LIM/AQP','',1,9);
INSERT INTO vuelo VALUES (154,1,'LA2147','LIM/AQP','',1,9);
INSERT INTO vuelo VALUES (155,1,'LA2159','LIM/AQP','',1,9);
INSERT INTO vuelo VALUES (156,1,'LA2203','TRU/LIM','',1,9);
INSERT INTO vuelo VALUES (157,1,'LA2206','LIM/TRU','',1,9);
INSERT INTO vuelo VALUES (158,1,'LA2207','TRU/LIM','',1,9);
INSERT INTO vuelo VALUES (159,1,'LA2276','LIM/PCS','',1,9);
INSERT INTO vuelo VALUES (160,1,'LA2279','CIX/LIM','',1,9);
INSERT INTO vuelo VALUES (161,1,'LA2330','LIM/TBP','',1,9);
INSERT INTO vuelo VALUES (162,1,'LA2331','TBP/LIM','',1,9);
INSERT INTO vuelo VALUES (163,1,'LA2370','LIM/IQT','',1,9);
INSERT INTO vuelo VALUES (164,1,'LA2375','IQT/LIM','',1,9);
INSERT INTO vuelo VALUES (165,1,'LA2376','LIM/IQT','',1,9);
INSERT INTO vuelo VALUES (166,1,'LA2377','IQT/LIM','',1,9);
INSERT INTO vuelo VALUES (167,1,'LA2379','IQT/LIM','',1,9);
INSERT INTO vuelo VALUES (168,1,'LA2380','LIM/IQT','',1,9);
INSERT INTO vuelo VALUES (169,1,'LA2380','LIM/IQT','',1,9);
INSERT INTO vuelo VALUES (170,1,'LA2381','IQT/LIM','',1,9);
INSERT INTO vuelo VALUES (171,1,'LA2382','LIM/IQT','',1,9);
INSERT INTO vuelo VALUES (172,1,'LA2424','EZE/LIM','',1,9);
INSERT INTO vuelo VALUES (173,1,'LA2442','IGU/LIM','',1,9);
INSERT INTO vuelo VALUES (174,1,'LA2443','LIM/IGU','',1,9);
INSERT INTO vuelo VALUES (175,1,'LA2534','LIM/JKF','',1,9);
INSERT INTO vuelo VALUES (176,1,'LA2535','NYC/LIM','',1,9);
INSERT INTO vuelo VALUES (177,1,'LA2567','LPB/LIM','',1,9);
INSERT INTO vuelo VALUES (178,1,'LA2567','LIM/VVI','',1,9);
INSERT INTO vuelo VALUES (179,1,'LA2569','LPB/LIM','',1,9);
INSERT INTO vuelo VALUES (180,1,'LA2569','LPB/LIM','',1,9);
INSERT INTO vuelo VALUES (181,1,'LA2569','LPB/LIM','',1,9);
INSERT INTO vuelo VALUES (182,1,'LA2582','LIM/BGT','',1,9);
INSERT INTO vuelo VALUES (183,1,'LA2583','BGT/LIM','',1,9);
INSERT INTO vuelo VALUES (184,1,'LA2596','LIM/IAH','',1,9);
INSERT INTO vuelo VALUES (185,1,'LA2597','HAV/LIM','',1,9);
INSERT INTO vuelo VALUES (186,1,'LA2598','LIM/CUN','',1,9);
INSERT INTO vuelo VALUES (187,1,'LA2599','CUN/LIM','',1,9);
INSERT INTO vuelo VALUES (188,1,'LA2600','LIM/BGT','',1,9);
INSERT INTO vuelo VALUES (189,1,'LA2604','LIM/LAX','',1,9);
INSERT INTO vuelo VALUES (190,1,'LA2605','LAX/LIM','',1,9);
INSERT INTO vuelo VALUES (191,1,'LA2632','SCL/LIM','',1,9);
INSERT INTO vuelo VALUES (192,1,'LA2640','SCL/LIM','',1,9);
INSERT INTO vuelo VALUES (193,1,'LA2654','SCL/LIM','',1,9);
INSERT INTO vuelo VALUES (194,1,'LA2706','LIM/MAD','',1,9);
INSERT INTO vuelo VALUES (195,1,'LA2707','MAD/LIM','',1,9);
INSERT INTO vuelo VALUES (196,1,'LA2709','LIM/MAD','',1,9);
INSERT INTO vuelo VALUES (197,1,'LA2764','GRU/LIM','',1,9);
INSERT INTO vuelo VALUES (198,1,'LA2766','GRU/LIM','',1,9);
INSERT INTO vuelo VALUES (199,1,'LA2767','LIM/GRU','',1,9);
INSERT INTO vuelo VALUES (200,1,'LA2902','CUZ/LIM','',1,9);
INSERT INTO vuelo VALUES (201,2,'LA2902','CUZ/LIM','',1,9);
INSERT INTO vuelo VALUES (202,1,'LA4600','EZE/LIM','',1,9);
INSERT INTO vuelo VALUES (203,1,'LA4600','IGU/LIM','',1,9);
INSERT INTO vuelo VALUES (204,1,'LA4600','EZE/LIM','',1,9);
INSERT INTO vuelo VALUES (205,1,'LA4601','LIM/EZE','',1,9);
INSERT INTO vuelo VALUES (206,1,'LA530','SCL/LIM','',1,9);
INSERT INTO vuelo VALUES (207,1,'LA531','LIM/SCL','',1,9);
INSERT INTO vuelo VALUES (208,1,'LA600','SCL/LIM','',1,9);
INSERT INTO vuelo VALUES (209,1,'LA600','LIM/LAX','',1,9);
INSERT INTO vuelo VALUES (210,1,'LA601','LAX/LIM','',1,9);
INSERT INTO vuelo VALUES (211,1,'LA601','LIM/SCL','',1,9);
INSERT INTO vuelo VALUES (212,1,'LA601','LAX/LIM','',1,9);
INSERT INTO vuelo VALUES (213,1,'LA631','LIM/SCL','',1,9);
INSERT INTO vuelo VALUES (214,1,'LA632','SCL/LIM','',1,9);
INSERT INTO vuelo VALUES (215,1,'LA634','SCL/LIM','',1,9);
INSERT INTO vuelo VALUES (216,1,'LA637','LIM/SCL','',1,9);
INSERT INTO vuelo VALUES (217,1,'LA6400','EZE/LIM','',1,9);
INSERT INTO vuelo VALUES (218,1,'LA642','SCL/LIM','',1,9);
INSERT INTO vuelo VALUES (219,1,'LA6445','LIM/SCL','',1,9);
INSERT INTO vuelo VALUES (220,1,'LP2010','CUZ/LIM','',1,10);
INSERT INTO vuelo VALUES (221,1,'LP2023','LIM/CUZ','',1,10);
INSERT INTO vuelo VALUES (222,1,'LP2026','CUZ/LIM','',1,10);
INSERT INTO vuelo VALUES (223,1,'LP2037','LIM/CUZ','',1,10);
INSERT INTO vuelo VALUES (224,1,'LP2040','CUZ/LIM','',1,10);
INSERT INTO vuelo VALUES (225,1,'LP2042','CUZ/LIM','',1,10);
INSERT INTO vuelo VALUES (226,1,'LP2045','LIM/CUZ','',1,10);
INSERT INTO vuelo VALUES (227,2,'LP2010','CUZ/LIM','',1,10);
INSERT INTO vuelo VALUES (228,2,'LP2023','LIM/CUZ','',1,10);
INSERT INTO vuelo VALUES (229,2,'LP2026','CUZ/LIM','',1,10);
INSERT INTO vuelo VALUES (230,2,'LP2037','LIM/CUZ','',1,10);
INSERT INTO vuelo VALUES (231,2,'LP2040','CUZ/LIM','',1,10);
INSERT INTO vuelo VALUES (232,2,'LP2042','CUZ/LIM','',1,10);
INSERT INTO vuelo VALUES (233,2,'LP2045','LIM/CUZ','',1,10);
INSERT INTO vuelo VALUES (234,1,'LP2105','LIM/AQP','',1,10);
INSERT INTO vuelo VALUES (235,1,'LP2122','JUL/LIM','',1,10);
INSERT INTO vuelo VALUES (236,1,'LP601','LIM/SCL','',1,10);
INSERT INTO vuelo VALUES (237,1,'W42134','CUZ/LIM','',1,11);
INSERT INTO vuelo VALUES (238,1,'P9 219','LIM/CUZ','',1,12);
INSERT INTO vuelo VALUES (239,1,'P9 215','CUZ/LIM','',1,12);
INSERT INTO vuelo VALUES (240,2,'W42134','CUZ/LIM','',1,11);
INSERT INTO vuelo VALUES (241,2,'P9 219','LIM/CUZ','',1,12);
INSERT INTO vuelo VALUES (242,2,'P9 215','CUZ/LIM','',1,12);
INSERT INTO vuelo VALUES (243,1,'QF3942','LIM/SCL','',1,13);
INSERT INTO vuelo VALUES (244,1,'QF3945','SCL/LIM','',1,13);
INSERT INTO vuelo VALUES (245,1,'2I 1117','LIM/CUZ','',1,14);
INSERT INTO vuelo VALUES (246,2,'2I 1117','LIM/CUZ','',1,14);
INSERT INTO vuelo VALUES (247,1,'2I 1182','PEM/LIM','',1,14);
INSERT INTO vuelo VALUES (248,1,'JJ8066','GRU/LIM','',1,15);
INSERT INTO vuelo VALUES (249,1,'JJ8224','GRU/LIM','',1,15);
INSERT INTO vuelo VALUES (250,1,'EQ515','UIO/LIM','',1,16);
INSERT INTO vuelo VALUES (251,1,'UA1005','LIM/EWR','',1,17);
INSERT INTO vuelo VALUES (252,1,'UA854','IAH/LIM','',1,17);
INSERT INTO vuelo VALUES (253,1,'UA855','LIM/IAH','',1,17);
INSERT INTO vuelo VALUES (254,1,'UA854','IAH/LIM','',1,17);


COMMIT;

-- -----------------------------------------------------
-- Data for table `sgstt`.`servicio`
-- -----------------------------------------------------
START TRANSACTION;
USE `sgstt`;
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (1, 1, 3, 'APTO-LIMA-MIRAFLORES-SAN ISIDRO', 1, 1);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (2, 1, 4, 'APTO-SURCO-LA MOLINA', 1, 1);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (3, 1, 4, 'RESTAURANT (LIMA-SAN ISIDRO-MIRAFLORES)', 1, 1);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (4, 1, 1, 'RECOJO DE TRASLADISTA', 1, 1);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (5, 1, 2, 'RECOJO Y DEJADA DE TRASLADISTA', 1, 1);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (6, 1, 4, 'APTO - HOTEL EL PUEBLO', 1, 1);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (7, 1, 2, 'MOVIL- ORMEÑO-CRUZ DEL SUR S.I./HOTEL', 1, 1);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (8, 1, 4, 'PUERTO CALLAO/APTO', 1, 1);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (9, 1, 3, 'PUERTO CALLAO/ MIRAFLORES O SAN ISIDRO', 1, 1);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (10, 1, 3, 'ASISTENCIA', 1, 1);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (11, 1, 4, 'CITY TOUR (COLONIAL Y MODERNO)', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (12, 1, 4, 'UN MUSEO O COMPRAS', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (13, 1, 5, 'CITY + MUSEO O COMPRAS', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (14, 1, 9, 'CITY + RESTAURANT + MUSEO O COMPRAS', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (15, 1, 5, 'DOS MUSEOS', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (16, 1, 5, 'RUINAS (PACHACAMAC,PURUCHUCO)', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (17, 1, 6, 'RUINAS + MUSEO O RESTAURANT', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (18, 1, 9, 'RUINAS + RESTAURANT + CITY + MUSEO', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (19, 1, 1, 'DISPOSICION O HORA ADICIONAL', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (20, 1, 6, 'ISLAS PALOMINO (RT)', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (21, 1, 12, 'LIMA - PARACAS O ICA', 1, 3);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (22, 1, 12, 'LIMA - NAZCA', 1, 3);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (23, 1, 12, 'LIMA - AREQUIPA - HUARAZ O HUANCAYO', 1, 3);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (24, 1, 12, 'LIMA - AREQUIPA Serie Polish - Philiberth', 1, 3);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (25, 1, 14, 'FULL DAY PARACAS O ICA', 1, 3);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (26, 1, 14, 'FULL DAY CARAL', 1, 3);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (27, 1, 0, 'VIATICOS POR CADA CHOFER X DIA', 1, 3);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (28, 1, 10, 'LIMA-ASIA', 1, 3);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (29, 1, 12, 'LIMA/AREQUIPA S.MILLER', 1, 3);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (30, 1, 12, 'LIM/NAZCA/LIMA 2 DIAS S. MILLER', 1, 3);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (31, 1, 12, 'LIM/NAZCA/LIMA 3 DIAS S. MILLER', 1, 3);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (32, 1, 12, 'LIMA-CARAL-BARRANCA-SECHIN-TRUJILLO', 1, 3);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (33, 1, 4, 'CITY BY NIGHT', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (34, 1, 4, 'FUENTES MAGICAS DE AGUA', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (35, 1, 5, 'FUENTES MAGICAS DE AGUA', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (36, 1, 5, 'FUENTES MAGICAS + CENA SHOW', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (37, 1, 5, 'CITY BY NIGH + CENA SHOW', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (38, 1, 6, 'CITY BY NIGHT + F. MAGICAS+CENA SHOW', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (39, 1, 5, 'CITY + MUSEO P.OSMA', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (40, 1, 0, 'APTO - LIMA - MIRAFLORES O SAN ISIDRO - ART OF TRAVEL', 1, 4);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (41, 1, 5, 'CITY + MUSEO O COMPRAS - ART OF TRAVEL', 1, 4);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (42, 1, 1, 'DISPOSICION POR HORA 1H/18KM - ART OF TRAVEL', 1, 4);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (43, 1, 1, 'DISPOSICION POR HORA 3H/18KM - ART OF TRAVEL', 1, 4);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (44, 1, 1, 'DISPOSICION POR HORA 4H/18KM - ART OF TRAVEL', 1, 4);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (45, 1, 12, ' LIMA PARACAS  O VICEVERSA - ART OF TRAVEL', 1, 4);

INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (78, 1, 3, 'APTO - LIMA - MIRAFLORES O SAN ISIDRO C.COUCHING', 1, 1);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (79, 1, 4, 'RESTAURANT ( LIMA - SAN ISIDRO O MIRAFLORES) C.COUCHING', 1, 1);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (80, 1, 4, 'CITY TOUR (COLONIAL Y MODERNO) CUSCO COUCHING', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (81, 1, 4, 'UN MUSEO O COMPRAS CUSCO COUCHING', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (82, 1, 12, 'LIMA - PARACAS O ICA� x D�A (M�nimo 2 d�as). CUSCO COUCHING', 1, 3);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (83, 1, 12, 'FULL DAY PARACAS O ICA CUSCO COUCHING', 1, 3);




INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (46, 2, 2, 'APTO / HOTEL O VICIVERSA', 1, 1);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (47, 2, 2, 'HOTEL / ESTACION O VICIVERSA', 1, 1);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (48, 2, 2, 'HOTEL / TERMINAL TERRESTRE O VICIVERSA', 1, 1);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (49, 2, 2.5, 'CUSCO / ESTACION POROY O VICIVERSA', 1, 1);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (50, 2, 4, 'CUSCO/URUBAMBA-YUCAY O VICIVERSA', 1, 1);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (51, 2, 2, 'CUSCO / ESTACION OLLANTA O VICIVERSA', 1, 1);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (52, 2, 5, 'CUSCO/ESTACION OLLANTA/CUSCO', 1, 1);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (53, 2, 3, 'HTL / RESTAURANT / HTL', 1, 1);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (54, 2, 1, 'SERVICIO A DISPOSICION POR HORAS', 1, 1);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (55, 2, 3, 'RUINAS O CIUDAD', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (56, 2, 4, 'COMBINADA', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (57, 2, 5, 'PISAC MARKET', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (58, 2, 5, 'PISAC MERCADO + RUINAS', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (59, 2, 5, 'CHINCHERO', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (60, 2, 5, 'MORAY + SALINERAS', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (61, 2, 6, 'OLLANTA RUINAS', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (62, 2, 6, 'PIQUILLACTA + ANDAHUAYLILLAS', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (63, 2, 10, 'PISAC MARKET + OLLANTA (F/D VALLE)', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (64, 2, 10, 'PISAC MK + P.RUINAS + OLLANTA', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (65, 2, 10, 'PISAC MK + OLLANTA  + CHINCHERO', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (66, 2, 10, 'PISAC + OLLANTA+ O/N + TRF.ESTAC.OLLANTA', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (67, 2, 10, 'PISAC + OLLANTA + WILLOC + PATACANCHA', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (68, 2, 10, 'PISAC + MORAY + SALINERAS', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (69, 2, 10, 'PISAC + OLLANTA + MORAY + SALINERAS', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (70, 2, 10, 'PIQUILLACTA + ANDAHUAYLILLAS + TIPON', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (71, 2, 8, 'INTI RAYMI', 1, 2);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (72, 2, 18, 'CUSCO / PUNO O VICIVERSA', 1, 3);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (73, 2, 20, 'CUSCO / PUNO O VICIVERSA CON SILLUSTANI EN RUTA', 1, 3);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (74, 2, 18, 'PUNO / AREQUIPA O VICIVERSA', 1, 3);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (75, 2, 20, 'PUNO/AREQUIPA O VICIVERSA CON SILLUSTANI EN RUTA', 1, 3);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (76, 2, 2, 'APTO/HTL O VICEVERSA (MALETAS)', 1, 4);
INSERT INTO `sgstt`.`servicio` (`idservicio`, `idsede`, `horas`, `descripcion`, `estado`, `idtipo_servicio`) VALUES (77, 2, 4, 'APTO/URUBAMBA O VICIVERSA (MALETAS)', 1, 4);
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
INSERT INTO cliente VALUES (1,1,'','','AUSTRAL EDUCATION GROUP S. p.A.','Enrique Fister Norte 196 Las Condes,Santiago 7550087 Chile',1,'RUC','',2);
INSERT INTO cliente VALUES (2,1,'','20100939887','SETOURS S.A.','Av.Comandante Espinar 229 Miraflores Lima Lima',1,'RUC','',2);
INSERT INTO cliente VALUES (3,1,'','20511598371','TARUKA TORUS EIRL','AV.CAYETANO HEREDIA Nro. 400 JESUS MARIA LIMA LIMA',1,'RUC','',2);
INSERT INTO cliente VALUES (4,1,'','20515463349','EVOLUTION TREKS SAC','AV LARCO 345 OFICINA M-14 MIRAFLORES',1,'RUC','',2);
INSERT INTO cliente VALUES (5,1,'','20519070198','VENTAS Y SERVICIOS MULTI SAC','Calle los Tulipanes Mz 20 Lt 7 Urb.Musa La Molina',1,'RUC','',2);
INSERT INTO cliente VALUES (6,1,'','20383207691','ISA AUTOS EIRL','Av.Intihuatana 431-103 Surco',1,'RUC','',2);
INSERT INTO cliente VALUES (7,1,'','20102021674','DINERS TRAVEL PERU S.A.','Av. La Encalada 928 Santiago de Surco-Lima-Lima',1,'RUC','',2);
INSERT INTO cliente VALUES (8,1,'','20554994033','KALA ENTERTAINMENT`S','Prol.Cuzco 1286 Dpto. 3 San Miguel',1,'RUC','',2);
INSERT INTO cliente VALUES (9,1,'','20522075095','TRANSPORTE TURISTICO BOCANEGRA S.A.C.','Calle Chicama 233 Dpto.301 Urb.Maranga San Miguel',1,'RUC','',2);
INSERT INTO cliente VALUES (10,1,'','20341841357','LAN PERU  S.A.','Av. Jose Pardo 513 Miraflores Lima Lima',1,'RUC','',2);
INSERT INTO cliente VALUES (11,1,'','20256697549','CHAMACO S.A.','Av.Las Artes 1375 Of. 101 San Borla Lima-Lima',1,'RUC','',2);
INSERT INTO cliente VALUES (12,1,'','20503516706','A & V TOUR TRANSPORTE Y TURISMO EIRL','Calle Moquegua 196 2da. Etapa La Molina',1,'RUC','',2);
INSERT INTO cliente VALUES (13,1,'','20563260573','INVERSIONES KINTARO SAC','Calle Andres A. Caceres 321 Moyopampa SJL',1,'RUC','',2);
INSERT INTO cliente VALUES (14,1,'','20452605776','TRANSPORTES Y SERVICIOS TURISTICOS SUISPER S.A.C.','Residencial San Felipe Block 7-B Dpto.125 J.Maria Lima Lima',1,'RUC','',2);
INSERT INTO cliente VALUES (15,1,'','20519305501','TELEZOL SAC','Malecon Cisneros 980 Dpto. 401 Miraflores Lima',1,'RUC','',2);
INSERT INTO cliente VALUES (16,1,'','20504329551','PERU MAGIC TOURS SAC','Calle  Gustavo Adolfo Becquer 138 Urb.Valdiviezo SMP LIMA LIMA',1,'RUC','',2);
INSERT INTO cliente VALUES (17,1,'','20511752397','PERU EXPERIENCES BELMOND S.A.','AV.ARMENDARIZ Nro. 480 INT.501 URB.ARMENDARIZ LIM-LIMA- MIRAFLORES',1,'RUC','',2);
INSERT INTO cliente VALUES (18,1,'','20517746046','OPECOVI SAC','Av. Del Parque Norte 1160 Of. 501 San Borja.',1,'RUC','',2);
INSERT INTO cliente VALUES (19,1,'','20509318892','TRANSPERU TRANSPORTE TURISTICO SAC','Av.Parque Rio Surco Nro. 812 Urb.San Borja',1,'RUC','',2);
INSERT INTO cliente VALUES (20,1,'','20537884089','SANDY PERUVIAN TRAVEL SAC','Calle Antequera 155 Of.B San Isidro',1,'RUC','',2);
INSERT INTO cliente VALUES (21,1,'','20100140692','CONDOR TRAVEL S.A.','Calle Mayor Armando Blondet Nro.249 San Borja',1,'RUC','',2);
INSERT INTO cliente VALUES (22,1,'','20111429660','APOTUR','CALLE SAN FERNANDO 287',1,'RUC','',2);
INSERT INTO cliente VALUES (23,1,'','20100110513','COMPA��A MINERA MILPO S.A.A.','Av.San Borja Norte 523 San Borja Lima Peru',1,'RUC','',2);
INSERT INTO cliente VALUES (24,1,'','20307167442','PROMPERU','Republica de Panama 3647 San Isidro',1,'RUC','',2);
INSERT INTO cliente VALUES (25,1,'','20527405921','JOURNEY TRAVEL COMPANY SAC','Calle Union 259 Barranco Lima Lima',1,'RUC','',2);
INSERT INTO cliente VALUES (26,1,'','20267326038','TRANSMARTIN''S TOURS EIRL','Jr La Calesa de La Perricholi Mz N1 La Molina Lima Lima',1,'RUC','',2);
INSERT INTO cliente VALUES (27,1,'','20125637362','TURISMO CAR SAC','CALLE ALFREDO NOVOA CAVA Nro. 338',1,'RUC','',2);
INSERT INTO cliente VALUES (28,1,'','20519070198','VENTAS Y SERVICIOS MULTI SAC','Calle Los Tulipanes Mz 20 Lt. 7 Urb.Musa',1,'RUC','',2);
INSERT INTO cliente VALUES (29,1,'','20136847237','INMOBILIARIA DE TURISMO S.A.','Pancho Fierro 193 San Isidro',1,'RUC','',2);
INSERT INTO cliente VALUES (30,1,'','20527405921','CUSCOCOACHING E.I.R.L.','URBANIZACION LOS NOGALES R-19 SAN SEBASTIAN CUSCO',1,'RUC','',2);
INSERT INTO cliente VALUES (31,1,'','10401371015','CARLOS ALBERTO CHAU LEGUA','Las Semblanzas 185 La Molina Lima-Lima',1,'RUC','',2);
INSERT INTO cliente VALUES (32,1,'','20514782157','MIRAFLORES TRAVEL Y TURISMO S.A.C.','Av.Jose Pardo 138 DPTO. 706 LIMA LIMA MIRAFLORES',1,'RUC','',2);
INSERT INTO cliente VALUES (33,1,'','20553668370','TRANS PACIFIC INVERSIONES S.A.C.','Jr. Castilla 991 Magdalena',1,'RUC','',2);
INSERT INTO cliente VALUES (34,1,'','20519249678','SERVICO DE TRANSPORTE TURISTICO TANG S.A.C.','Jr. Capac Yupanqui 107 Independencia Lima Lima',1,'RUC','',2);
INSERT INTO cliente VALUES (35,1,'','20547556781','LIMA TODAY SAC','Av. Prolongaci�n Matellini Mz M Lote 5 Urb. Santa Leonor, Chorrillos.',1,'RUC','',2);
INSERT INTO cliente VALUES (36,1,'','20490431048','LATNINA TRAVEL S.A.C.','Jr. Lima B-7 Of.509 Barrio Profesional Cusco-Cusco',1,'RUC','',2);
INSERT INTO cliente VALUES (37,1,'','20513215887','SOCIEDAD DE DESARROLLO DEHOTELES PERUANOS S.A.','Av.Victor Andres Belaunde 198 San Isidro',1,'RUC','',2);
INSERT INTO cliente VALUES (38,1,'','20490607189','ARCHAEOLOGY AND BIRDING CUSCO SAC','MZ A DPTO 201 U.V.ZARUMILLA CUSCO',1,'RUC','',2);
INSERT INTO cliente VALUES (39,1,'','20534373032','MARGARITAS TRAVEL SERVICE E.I.R.L.','Calle Fernando Leon de Vivero C7 Subtanjalla Ica',1,'RUC','',2);
INSERT INTO cliente VALUES (40,1,'','20555511117','PERU AUDIO TOURS S.A.C.','CALLE SANTA ISABEL 253 MIRAFLORES',1,'RUC','',2);
INSERT INTO cliente VALUES (41,1,'','20452235073','BUGANVILLA TOURS SAC','Av. La Encalada 928 Santiago de Surco',1,'RUC','',2);
INSERT INTO cliente VALUES (42,1,'','20510644965','VAMOS EXPEDITIONS S.A.C','ALFREDO LEON 114 DPTO.1405 MIRAFLORES',1,'RUC','',2);
INSERT INTO cliente VALUES (43,1,'','20511548943','ALITED INVERSIONES SAC','Calle Francisco del Castillo 370 San Antonio Miraflores',1,'RUC','',2);


COMMIT;

-- -----------------------------------------------------
-- Data for table `sgstt`.`empleado`
-- -----------------------------------------------------
START TRANSACTION;
USE `sgstt`;
INSERT INTO `empleado` VALUES (1,1,'Sistema','Administrador Lima','11111111','11111111','11111111','11111111',1);
INSERT INTO `empleado` VALUES (2,2,'Sistema','Administrador Cusco','11111111','11111111','11111111','11111111',1);
INSERT INTO `empleado` VALUES (3,1,'Jose','Huapalla','12345678','123456789','123456789','123456789',1);
INSERT INTO `empleado` VALUES (4,1,'Willy','Rojas','12345678','123456789','123456789','123456789',1);
INSERT INTO `empleado` VALUES (5,2,'Jose','Huapalla','12345678','12345678','12345678','12345678',1);
INSERT INTO `empleado` VALUES (6,2,'Willy','Rojas','12345678','12345678','12345678','12345678',1);
INSERT INTO `empleado` VALUES (7,1,'setours','lima','12345678','12345678','12345678','12345678',1);
INSERT INTO `empleado` VALUES (8,2,'setours','cusco','12345678','12345678','12345678','12345678',1);

COMMIT;

-- -----------------------------------------------------
-- Data for table `sgstt`.`perfil`
-- -----------------------------------------------------
START TRANSACTION;
USE `sgstt`;
INSERT INTO `sgstt`.`perfil` (`idperfil`, `nombre`, `estado`) VALUES (1, 'Administrador del Sistema', 1);
INSERT INTO `sgstt`.`perfil` (`idperfil`, `nombre`, `estado`) VALUES (2, 'Gerente Administrativo', 1);
INSERT INTO `sgstt`.`perfil` (`idperfil`, `nombre`, `estado`) VALUES (3, 'Encargador de Servicios', 1);
INSERT INTO `sgstt`.`perfil` (`idperfil`, `nombre`, `estado`) VALUES (4, 'Translivik', 1);

COMMIT;

-- -----------------------------------------------------
-- Data for table `sgstt`.`usuario`
-- -----------------------------------------------------
START TRANSACTION;
USE `sgstt`;
INSERT INTO `usuario` VALUES (1,1,1,1,'admin-lima','admin1234',1);
INSERT INTO `usuario` VALUES (2,1,2,2,'admin-cusco','admin1234',1);
INSERT INTO `usuario` VALUES (3,2,3,1,'jose-lima','123456',1);
INSERT INTO `usuario` VALUES (4,2,4,1,'willy-lima','123456',1);
INSERT INTO `usuario` VALUES (5,2,5,2,'jose-cusco','123456',1);
INSERT INTO `usuario` VALUES (6,2,6,2,'willy-cusco','123456',1);
INSERT INTO `usuario` VALUES (7,4,7,1,'setours-lima','123456',1);
INSERT INTO `usuario` VALUES (8,4,8,2,'setours-cusco','123456',1);

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
INSERT INTO `sgstt`.`modulo` (`idmodulo`, `nombre`, `url`, `listar`, `crear`, `actualizar`, `eliminar`, `estado`) VALUES (19, 'Ver Servicios', 'ver_servicios', 1, 1, 1, 1, 1);
INSERT INTO `sgstt`.`modulo` (`idmodulo`, `nombre`, `url`, `listar`, `crear`, `actualizar`, `eliminar`, `estado`) VALUES (20, 'Administrar Facturación', 'facturacion', 1, 1, 1, 1, 1);

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
INSERT INTO `sgstt`.`permiso` (`idpermiso`, `idperfil`, `idmodulo`, `listar`, `crear`, `actualizar`, `eliminar`) VALUES (56, 1, 20, 1, 1, 1, 1);

INSERT INTO `sgstt`.`permiso` (`idpermiso`, `idperfil`, `idmodulo`, `listar`, `crear`, `actualizar`, `eliminar`) VALUES (17, 2, 1, 1, 1, 1, 1);
INSERT INTO `sgstt`.`permiso` (`idpermiso`, `idperfil`, `idmodulo`, `listar`, `crear`, `actualizar`, `eliminar`) VALUES (18, 2, 2, 1, 1, 1, 1);
INSERT INTO `sgstt`.`permiso` (`idpermiso`, `idperfil`, `idmodulo`, `listar`, `crear`, `actualizar`, `eliminar`) VALUES (19, 2, 3, 0, 0, 0, 0);
INSERT INTO `sgstt`.`permiso` (`idpermiso`, `idperfil`, `idmodulo`, `listar`, `crear`, `actualizar`, `eliminar`) VALUES (20, 2, 4, 1, 1, 1, 1);
INSERT INTO `sgstt`.`permiso` (`idpermiso`, `idperfil`, `idmodulo`, `listar`, `crear`, `actualizar`, `eliminar`) VALUES (21, 2, 5, 0, 0, 0, 0);
INSERT INTO `sgstt`.`permiso` (`idpermiso`, `idperfil`, `idmodulo`, `listar`, `crear`, `actualizar`, `eliminar`) VALUES (22, 2, 6, 1, 1, 1, 1);
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
INSERT INTO `sgstt`.`permiso` (`idpermiso`, `idperfil`, `idmodulo`, `listar`, `crear`, `actualizar`, `eliminar`) VALUES (37, 3, 5, 0, 0, 0, 0);
INSERT INTO `sgstt`.`permiso` (`idpermiso`, `idperfil`, `idmodulo`, `listar`, `crear`, `actualizar`, `eliminar`) VALUES (38, 3, 6, 1, 1, 1, 0);
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


INSERT INTO `sgstt`.`permiso` (`idpermiso`, `idperfil`, `idmodulo`, `listar`, `crear`, `actualizar`, `eliminar`) VALUES (55, 4, 19, 1, 0, 0, 0);

COMMIT;

-- -----------------------------------------------------
-- Data for table `sgstt`.`destinos`
-- -----------------------------------------------------
START TRANSACTION;
USE `sgstt`;


INSERT INTO destinos VALUES (1,1,'Costa del Sol S.A.','Costa del Sol Wyndham Lima Airport',20231843460,'Av. Elmer Faucett s/n - Callao','+51 (01)711-2000/+51 (01)711-2020','www.costadelsolperu.com/peru/hotels/lima/','LIMA',' ',' ','Hotel',1);
INSERT INTO destinos VALUES (2,1,'Consorcio Hotelero Las Palmeras S.A.C.','Radisson Decapolis Miraflores',20505466919,'Av. 28 de Julio 151 - Miraflores','+51 (01)625-1200/+51 (01)625-1201','www.radisson.com/miraflorespe/','LIMA',' ',' ','Hotel',1);
INSERT INTO destinos VALUES (3,1,'Figtur S.A.','Business Tower',20303368877,'Av. Guardia Civil 727 Corpac San Isidro - Lima','+51 (01) 319-5300','www.bth.pe','LIMA',' ',' ','Hotel',1);
INSERT INTO destinos VALUES (4,1,'Consorcio Hotelero Las Palmeras S.A.C.','Radisson & Suites San Isidro',20505466919,'Av. Las Palmeras 240 San Isidro - Lima','+51 (01)422-3887','www.radisson.com/sanisidrope/','LIMA',' ',' ','Hotel',1);
INSERT INTO destinos VALUES (5,1,'Monte Real Inversiones Turisticas S.A.','Monte Real',20419343871,'Calle 27 de Noviembre 169-189 Miraflores - Lima','+51 (01)241-4100/+51 (01)445-6309','www.montereal.com.pe/lang1/','LIMA',' ',' ','Hotel',1);
INSERT INTO destinos VALUES (6,1,'Servicios e Inversiones Crisol S.A.C.','Allpa & Suites',20513437600,'Calle Atahualpa 199 - Miraflores','+51 (01)206-8800','www.allpahotel.com','LIMA',' ',' ','Hotel',1);
INSERT INTO destinos VALUES (7,1,'Thunderbird Hotel Las Americas S.A.','Thunderbird Fiesta & Casino',20516381311,'Av. Alcanfores 475 Miraflores','+51 (01)616-3131','http://www.thunderbirdhotels.com/english/miraflores-hotel/hotel-casino-fiesta-miraflores-en-lima-peru.html','LIMA',' ',' ','Hotel',1);
INSERT INTO destinos VALUES (8,1,'Hotel Estelar del Peru S.A.C.','Estelar Apartamentos Bellavista',20518738314,'Bellavista 216 -  Miraflores','+51 (1)630-7700','http://www.Hoteltelar.com/eng/estelar-apartamentos-bellavista-lima-peru/','LIMA',' ',' ','Hotel',1);
INSERT INTO destinos VALUES (9,1,'Empresa de Servicios Tur�sticos Colon S.A.C.','Miraflores Col�n Hotel',20462041587,'Jr. Col�n 600 Esq. c/ Juan Fanning - Miraflores','(01)610-0900/(01)444-2000','www.miraflorescolonhotel.com','LIMA',' ',' ','Hotel',1);
INSERT INTO destinos VALUES (10,1,'Maneras y Contactos Tur�sticos S.A.','Pukara Hostal',20308164129,'Calle Gonzales Larra�aga 130 - San Antonio - Miraflores','(01)445-2754/(01)445-4203','www.hostalpukara.com.pe/pukaraen.html','LIMA',' ',' ','Hotel',1);
INSERT INTO destinos VALUES (11,1,'Sociedad Inmobiliaria y de Hotel Gran Larco S.A.','Ibis Lima Larco',20518766873,'Av. Jos� Larco 1140 - Miraflores','+51 (01)634-8888','www.ibis.com/gb/hotel-6971-ibis-larco-miraflores/','LIMA',' ',' ','Hotel',1);
INSERT INTO destinos VALUES (12,1,'Nessus Hotel Peru S.A.','Casa Andina Select Miraflores',20505670443,'Calle Schell 452 - Miraflores','+51 (01) 2139710/+51( 01 )4167500','www.casa-andina.com/select-miraflores/?lang=en','LIMA',' ',' ','Hotel',1);
INSERT INTO destinos VALUES (13,1,'Sociedad de Desarrollo de Hotel Peruanos S.A.','Novotel',20513215887,'Calle Antequera 777 Piso 2 – Lima','(01)315-9999','www.novotel.com','LIMA',' ',' ','Hotel',1);
INSERT INTO destinos VALUES (14,1,'Grupo El Dorado','Grupo El Dorado',20329398642,'Av. Jos� Pardo N° 541, Of. # 201 - Miraflores',' ','www.grupo-dorado.com','LIMA',' ',' ','Hotel',1);
INSERT INTO destinos VALUES (15,1,'HOTEL EL TAMBO S.A.C.','EL TAMBO PERÚ',20551529933,'Av. La Paz # 1276 - Miraflores','+51 (01) 219-4080','www.eltamboperu.com','LIMA',' ',' ','Hotel',1);
INSERT INTO destinos VALUES (16,1,'Inversiones Nacionales de Turismo S.A.','Libertador Lima Westin',20114803228,'Calle Las Begonias 450 - San Isidro','+51 (01) 201-5000/+51 (01) 518-6510','www.westinlima.com.pe/en','LIMA',' ',' ','Hotel',1);
INSERT INTO destinos VALUES (17,1,'Nuevo Mundo Lima Hotel S.A.C.','NM Lima',20538129616,'Av. Pardo y Aliaga N° 300 San Isidro','+51 (01)612-1000','www.nmlimahotel.com/index-en.aspx','LIMA',' ',' ','Hotel',1);
INSERT INTO destinos VALUES (18,1,'Inversiones La Rioja S.A.','JW Marriott Lima',20334766714,'Malec�n de la Reserva 615 - Miraflores','+51 (01)217-7000','www.jwmarriottlima.com','LIMA',' ',' ','Hotel',1);
INSERT INTO destinos VALUES (19,1,'Los Portales S.A.','Country Club Lima',20301837896,'Los Eucaliptos 590 - San Isidro','+51 (01)611-9000/+51 (01)611-9001','www.hotelcountry.com/default-en.html','LIMA',' ',' ','Hotel',1);
INSERT INTO destinos VALUES (20,1,'Corporacion el Golf S.A.','Los Delfines',20136957253,'Los Eucaliptos 555 - San Isidro','(01)215-7000','www.losdelfineshotel.com/default-en.html','LIMA',' ',' ','Hotel',1);
INSERT INTO destinos VALUES (21,1,'Belmond Peru S.A.','Belmond Miraflores Park',20334539149,'es Av. Armendariz 480 Int 501 Urb. Armendariz, Lima - Lima - Miraflores','+51 (01)610-4000','www.miraflorespark.com','LIMA',' ',' ','Hotel',1);
INSERT INTO destinos VALUES (22,1,'Inmobiliaria de Turismo S.A.','Sonesta El Olivar',20136847237,'Pancho fierro 194 - San Isidro','+51 (01)712-6000/+51 (01)712-6050','www.sonesta.com/lima/','LIMA',' ',' ','Hotel',1);
INSERT INTO destinos VALUES (23,1,'Inversiones Brade S.A.','Double Tree El Pardo',20303972821,'Jr. Independencia 141 - Miraflores','+51 (01)617-1000/+51 (01)241-0410','www.doubletreeelpardo.com.pe','LIMA',' ',' ','Hotel',1);
INSERT INTO destinos VALUES (24,1,'Inversiones Don Quijote S.A.C.','Crowne Plaza',20297386531,'Av. Alfredo Benavides 330 - Miraflores','+51 (01)610-0700','www.crowneplaza.com','LIMA',' ',' ','Hotel',1);
INSERT INTO destinos VALUES (25,1,'Hotelera Costa del Pacifico S.A.','Swissôtel Lima',20297885538,'V�a Central 150 Centro Empresarial Real - San Isidro','+51 (01)611-4400','www.swissotel.com/lima','LIMA',' ',' ','Hotel',1);
INSERT INTO destinos VALUES (26,1,'Corporaci�n Hotelera Metor S.A.','Meliá',20386303003,'Av. Salaverry 2599 - San Isidro','+51 (01) 411-9000/+51  0800-51570','http://www.melia.com/en/hotels/peru/lima/melia-lima/index.html','LIMA',' ',' ','Hotel',1);
INSERT INTO destinos VALUES (27,1,'Hotel Sheraton del Peru S.A.','Sheraton Lima & Convention Center',20100032610,'Av. Paseo de la Rep�blica 170 - Lima','+51 (01)315-5000','www.sheraton.com.pe/english.php','LIMA',' ',' ','Hotel',1);
INSERT INTO destinos VALUES (28,1,'Solidez Empresarial S.A','Royal Park',20459980963,'Av. Camino Real 1050 - San Isidro','(01)215-1616','www.royalparkhotel.com.pe','LIMA',' ',' ','Hotel',1);
INSERT INTO destinos VALUES (29,1,'Hotelera El Pinar S.A.C.','Suites del Bosque',20526998279,'Av. Paz Soldan 165 - San Isidro','+51 (01)616-2121','www.suitesdelbosque.com','LIMA',' ',' ','Hotel',1);
INSERT INTO destinos VALUES (30,1,'Hotelera el Bosque S.A.C.','Plaza del Bosque Apart',20507380515,'Av. Paz Soldan 190 - San Isidro','+51 (01)616-1818','www.plazadelbosque.com','LIMA',' ',' ','Hotel',1);
INSERT INTO destinos VALUES (31,1,'Polo Service S.A.C.','El Polo Apart Hotel & Suites',20333712505,'Av. La Encalada 1515 - Monterrico - Surco','+51 (01)434-2323','http://www.hotelelpolo.com/index.html','LIMA',' ',' ','Hotel',1);
INSERT INTO destinos VALUES (32,1,'Suites El Golf Los Incas S.A.','Golf Los Incas',20348851251,'Av. Cerros de Camacho N° 500 Santiago de Surco','+51 (01)709-0000','www.golfincahotel.com','LIMA',' ',' ','Hotel',1);
INSERT INTO destinos VALUES (33,1,'Hotel Estelar del Peru S.A.C.','Estelar Miraflores',20518738314,'Av. Benavides 415 - Miraflores','+51 (01)630-7777','www.Hoteltelar.com/en/destinos/peru/lima/miraflores','LIMA',' ',' ','Hotel',1);
INSERT INTO destinos VALUES (34,1,'Inversiones Nacionales de Turismo S.A.','Libertador Lima',20114803228,'Jr. Los Eucaliptos 550 - San isidro','+51 (01)518-6300/+51 (01)421-6666','www.libertador.com.pe/en/libertador/lima/','LIMA',' ',' ','Hotel',1);
INSERT INTO destinos VALUES (35,1,'Miraflores de Turismo S.A.C.','San Agust�n Exclusive',20101000975,'Calle San Mart�n 550 - Miraflores','(01)319-0060/(01)203-2840','www.Hotelsanagustin.com.pe/hotels/lima/miraflores/exclusive/','LIMA',' ',' ','Hotel',1);
INSERT INTO destinos VALUES (36,1,'Cartir Peru S.R.L.','Jose Antonio Lima',20100910129,'Av. 28 de Julio 398 - Miraflores','+51 (01)445-7743/+51 (01)445-5228','www.Hoteljoseantonio.com/en/lima/presentacion/','LIMA',' ',' ','Hotel',1);
INSERT INTO destinos VALUES (37,1,'Cartir Peru S.R.L.','Jose Antonio Executive',20100910129,'Calle Colon 325 - Miraflores','+51 (01)445-5592/+51 (01)445-5228','www.Hoteljoseantonio.com/en/executive/presentacion/','LIMA',' ',' ','Hotel',1);
INSERT INTO destinos VALUES (38,1,'Nessus Hotel Peru S.A.','Casa Andina Private Collection - Miraflores',20505670443,'Calle La Paz 463 - Miraflores','+51 (01)213-9710/+51 (01)213-4300','www.casa-andina.com/casa-andina-private-collection-miraflores/?lang=en','LIMA',' ',' ','Hotel',1);
INSERT INTO destinos VALUES (39,1,'Turismo Costa Sur S.A.','El Condado',20118504055,'Alcanfores 425 - Miraflores','(01)444-0306','www.condado.com.pe/pages/index.php?p_idioma&p_idioma=eng','LIMA',' ',' ','Hotel',1);
INSERT INTO destinos VALUES (40,1,'Foresta Hotel S.A.C.','Foresta & Suites',20337151702,'Av. Libertadores 490 - San Isidro','+51 (01)630-0000 AX: 101 / 102/+51 (01)630-0003','www.foresta-hotel.pe','LIMA',' ',' ','Hotel',1);
INSERT INTO destinos VALUES (41,1,'Q.P. Hotels S.A.C.','QP Hotels Lima',20515298127,'Av. Jorge Chavez 206 – Miraflores','+51 (01)319-2929/+51 9490-78640','http://qphotels.com/location/index/lg/EN','LIMA',' ',' ','Hotel',1);
INSERT INTO destinos VALUES (42,1,'Nessus Hotel Peru S.A.','Casa Andina Classic - Miraflores Centro',20505670443,'Av. Petit Thouars 5444 - Miraflores','+51 (01)213-9710/+51 (01)447-0263','www.casa-andina.com/classic-miraflores-centro/?lang=en','LIMA',' ',' ','Hotel',1);
INSERT INTO destinos VALUES (43,1,'Inmobiliaria de Turismo S.A.','Sonesta Posadas del Inca Miraflores',20136847237,'Av. Alcanfores 329 - Miraflores','+51 (01)241-7688/+51 (01)447-3822','www.sonesta.com/Miraflores/','LIMA',' ',' ','Hotel',1);
INSERT INTO destinos VALUES (44,1,'Nessus Hotel Peru S.A.','Casa Andina Classic - Miraflores San Antonio',20505670443,'Av. 28 de Julio 1088 - Miraflores','+51 (01)213-9710/+51 (01)241-4050','www.casa-andina.com/classic-miraflores-san-antonio/?lang=en','LIMA',' ',' ','Hotel',1);
INSERT INTO destinos VALUES (45,1,'Corporacion Hotelera del Pacifico S.A.','Leon de Oro',20383145997,'Av La Paz 930 - Miraflores','(01)242-6200','www.leondeoroperu.com/Index_Eng.html','LIMA',' ',' ','Hotel',1);
INSERT INTO destinos VALUES (46,1,'Hotelera Los Girasoles S.A.C.','Girasoles',20372362252,'Av. Diez Canseco 696 - Miraflores','+51 (01)446-6075/+51 (01)241-1119','www.losgirasoleshotel.com','LIMA',' ',' ','Hotel',1);
INSERT INTO destinos VALUES (47,1,'San Agustin Colonial S.A.C.','San Agust�n Colonial',20512375015,'Av. Comandante Espinar 310 - Miraflores','+51 (01)241-7471/+51 (01)203-2840','www.Hotelsanagustin.com.pe/hotels/lima/miraflores/colonial/','LIMA',' ',' ','Hotel',1);
INSERT INTO destinos VALUES (48,1,'Faraona Servicios Hoteleros S.A.','Faraona',20330573857,'Manuel Bonilla 185  Miraflores','(01)446-9414','www.faraonagrandhotel.com','LIMA',' ',' ','Hotel',1);
INSERT INTO destinos VALUES (49,1,'Hotel Restaurant La Hacienda S.A.','La Hacienda',20125772227,'Av. 28 de Julio 511 - Miraflores','(01)213-1000','Hotellahacienda.com/en/','LIMA',' ',' ','Hotel',1);
INSERT INTO destinos VALUES (50,1,'Inversiones Turisticas Santa Maria S.A.C.','Mariel',20512936653,'Gral. Suarez 240 - Miraflores','+51 (01)444-2829','www.mariel-hotel.com','LIMA',' ',' ','Hotel',1);
INSERT INTO destinos VALUES (51,1,'Edificios y Construcciones Santa Patricia S.A.','Sol de Oro',20110545798,'Calle San Mart�n 305 - Miraflores','+51 (01)446-9876/+51 (01)447-0967','www.soldeoro.com.pe','LIMA',' ',' ','Hotel',1);
INSERT INTO destinos VALUES (52,1,'Inversiones Pimi S.A.C.','Del Pilar Miraflores',20508159863,'Pje. Martir Olaya 141 - Miraflores','(01)712-0712/(01)242-7999','www.delpilarmirafloreshotel.com/lan/eng/indexa.php','LIMA',' ',' ','Hotel',1);
INSERT INTO destinos VALUES (53,1,'Turismo Boulevard S.A.C.','Boulevard',20262342710,'Av. Pardo 771 - Miraflores','(01)444-6562/(01)444-6563','www.hotelboulevard.com.pe','LIMA',' ',' ','Hotel',1);
INSERT INTO destinos VALUES (54,1,'Monteluna S.A.C.','Antara',20492673120,'Alcanfores 450 - Miraflores','+51 (01) 444-4505/+51 (01) 444-3533','www.antarahotel.com/eng/','LIMA',' ',' ','Hotel',1);
INSERT INTO destinos VALUES (55,1,'Hotelera Antigua S.A.C.','Antigua Miraflores',20266548584,'Av. Grau 350 Miraflores','+51 (01)201-2060','www.antiguamiraflores.com','LIMA',' ',' ','Hotel',1);
INSERT INTO destinos VALUES (56,1,'Turicom S.A.','Ariosto',20100313627,'Av. La Paz 769 - Miraflores','(01)444-1414','www.hotelariosto.com.pe/eng/','LIMA',' ',' ','Hotel',1);
INSERT INTO destinos VALUES (57,1,'Turismo Los Algarrobos S.A.','Los Tallanes',20134081229,'Av. Jorge Basadre N° 325 - San Isidro','(01)221-0001','www.hoteltallanes.com.pe/eng/','LIMA',' ',' ','Hotel',1);
INSERT INTO destinos VALUES (58,1,'Inver Hotel S.A.C.','Roosevelt & Suites',20304581337,'Av. Alvarez Calder�n 194 (esquina Miguel Dasso) - San Isidro','(01)418-0000/(01)717-6025','www.hotelroosevelt.com/index.php/en/home','LIMA',' ',' ','Hotel',1);
INSERT INTO destinos VALUES (59,1,'Mar�a Eliza Silva Hidalgo','Gran Hotel Bolivar',10094835106,'Jr. De la Union 958 - Plaza San Martin','+51 (01)619-7171','www.granhotelbolivar.com.pe/ingles/','LIMA',' ',' ','Hotel',1);
INSERT INTO destinos VALUES (60,1,'Tecnocasa S.A.','Santa Cruz',20507715479,'Av. Santa Cruz 1347 - Miraflores','+51 (01)241-3724','http://www.hotelsantacruz.com/?p=1','LIMA',' ',' ','Hotel',1);
INSERT INTO destinos VALUES (61,1,'Inversiones Turisticas Maury S.A.C.','Maury',20428632380,'Jr. Ucayali 201 - Esquina con Jr. Carabaya - Centro','+51 (01)428-8188/+51 (01)428-3185','www.hotelmaury.com','LIMA',' ',' ','Hotel',1);
INSERT INTO destinos VALUES (62,1,'Inversiones Porta Coeli S.A.','Carmel',20291478761,'Calle Atahualpa 152 - Miraflores','+51 (01)241-8672/+51 (01)241-8672','www.hotelcarmel.com.pe','LIMA',' ',' ','Hotel',1);
INSERT INTO destinos VALUES (63,1,'EMF S.A.','La Paz Apart Hotel',20303274970,'Av. La Paz 679 - Miraflores','(01)242-9350','www.lapazaparthotel.com/index2.html','LIMA',' ',' ','Hotel',1);
INSERT INTO destinos VALUES (64,1,'Compa�ia de Inversiones Tur�sticas Costa del Sol S.A.','La Castellana',20108787130,'Calle Grimaldo del Solar 222 - Miraflores','(01)444-3530/(01)444-4662','www.castellanahotel.com/english/','LIMA',' ',' ','Hotel',1);
INSERT INTO destinos VALUES (65,1,'Inversiones Tulip E.I.R.L.','Habitat',20514352730,'Calle Piura 105 - Miraflores','+51 (01)242-2222/+51 (01)243-4310','www.habitathotelperu.com','LIMA',' ',' ','Hotel',1);
INSERT INTO destinos VALUES (66,1,'Inversiones Generales Libra S.A.C.','Britania Miraflores',20512675752,'Calle Independencia 211 esq. 2 de Mayo - Miraflores','+51 (01)203-3900','www.hbritaniamiraflores.com/index-i.html','LIMA',' ',' ','Hotel',1);
INSERT INTO destinos VALUES (67,1,'Inversiones Tur�sticas P & M S.A.','Ferre',20492182061,'Diego Ferr� 235 - Miraflores','(01)446-7276/(01)447-3456','www.hotelferremiraflores.com','LIMA',' ',' ','Hotel',1);
INSERT INTO destinos VALUES (68,1,'Sociedad de Desarrollo de Hotel Peruanos S.A.','Novotel Lima',20513215887,'Av. Victor Andres Belaunde 198 - San Isidro','+51 (01)315-9999/+51 (01)315-9925','www.novotel.com/gb/hotel-6339-novotel-lima/','LIMA',' ',' ','Hotel',1);
INSERT INTO destinos VALUES (69,1,'Turismo Costa Sur S.A.','El Condado Apart',20118504055,'Alcanfores 465 - 425 - Miraflores','(01)444-0306','www.condado.com.pe/pages/index.php?p_idioma&p_idioma=eng','LIMA',' ',' ','Hotel',1);
INSERT INTO destinos VALUES (70,1,'Inversiones Turisticas Cuellar S.A.C.','Duo Boutique',20492914771,'Calle Francisco Valle Riestra 576 - San Isidro','(01)628-3245/(01)628-3246','www.duohotelperu.com/en-us/','LIMA',' ',' ','Hotel',1);
INSERT INTO destinos VALUES (71,1,'Secondhomeperu S.A.C.','Second Home',20512472568,'Domeyer 366 - Barranco','+51 (01)247-5522/+51 9444-41671','www.secondhomeperu.com','LIMA',' ',' ','Hotel',1);
INSERT INTO destinos VALUES (72,1,'100pre Feliz S.A.C.','Nobility',20379719440,'Av.. Roosevelt 6461 (Ex Republica de Panama) - Miraflores','+51 (01)660-2018/+51 (01)660-2266','www.hotelnobility.com','LIMA',' ',' ','Hotel',1);
INSERT INTO destinos VALUES (73,1,'Atton San Isidro S.A.C.','Atton San Isidro',20538571912,'Av. Jorge Basadre 595, San Isidro','+51 (01)208-1200/+51 (01)208-1227','www.atton.com/default-es.html','LIMA',' ',' ','Hotel',1);
INSERT INTO destinos VALUES (74,1,'Inversiones Metropolis E.I.R.L.','Regency',20299996272,'Av. Angamos Oeste - 843 - Miraflores','(01)242-2310/(01)715-5868','www.hotelregency.com.pe','LIMA',' ',' ','Hotel',1);
INSERT INTO destinos VALUES (75,1,'Teguise Turistica Per� S.A.','San Agust�n Riviera',20256983479,'Av. Inca Garcilaso de la Vega 981 - Cercado','(01)424-9438/(01)203-2840','www.Hotelsanagustin.com.pe/hotels/lima/riviera/','LIMA',' ',' ','Hotel',1);
INSERT INTO destinos VALUES (76,1,'Consorcio Hotelero Las Palmeras S.A.C.','Radisson',20505466919,'Av. 28 de Julio 151 Miraflores','(01)625-1200 / 422-3887','www.radisson.com','LIMA',' ',' ','Hotel',1);
INSERT INTO destinos VALUES (77,1,'Hoteler�a Peruana S.A.C.','Tierra Viva Miraflores Larco',20536047906,'Calle Bol�var 176 – 180. Miraflores','+51 (01)370 9080','tierravivaHotel.com/hotels/tierra-viva-miraflores-larco/','LIMA',' ',' ','Hotel',1);
INSERT INTO destinos VALUES (78,1,'Forum Inversiones S.A.C.','Dazzler Lima',20523025521,'Av. Jos� Pardo 879 - Miraflores','(01)634-4000','www.dazzlerlima.com/en/','LIMA',' ',' ','Hotel',1);
INSERT INTO destinos VALUES (79,1,'Q.P. Hotels S.A.C.','QP Hotels',20515298127,'Av. Jorge Chavez 206 – Miraflores','+51 (01)319-2900','www.qphotels.com','LIMA',' ',' ','Hotel',1);
INSERT INTO destinos VALUES (80,1,'Thunderbird Hotel Las Americas S.A.','Thunderbird Hotels Pardo',20516381311,'Calle General Borgo�o 116 - Miraflores','+51 (01)616-3141','http://www.thunderbirdhotels.com/english/miraflores-hotel/hotel-pardo-miraflores-lima-peru.html','LIMA',' ',' ','Hotel',1);
INSERT INTO destinos VALUES (81,1,'Hotel Restaurant La Hacienda S.A.','La Hacienda Hotel & Casino',20125772227,'Av. 28 de Julio 511 - Miraflores','(01)213-1000','Hotellahacienda.com/en/hotel-miraflores/','LIMA',' ',' ','Hotel',1);
INSERT INTO destinos VALUES (82,1,'La Casa de Barranco S.A.C.','B Arts Boutique',20536180657,'Av. Sáenz Pe�a 204 - Barranco','+51 (01)700-5106/+51 (01)206-0800','www.hotelb.pe','LIMA',' ',' ','Hotel',1);
INSERT INTO destinos VALUES (83,1,'I & G Hispania S.A.C.','Hilton Lima Miraflores',20550025176,'Av. La Paz 1099 - Miraflores','+51 (01)200-8000','www.lima.hilton.com','LIMA',' ',' ','Hotel',1);
INSERT INTO destinos VALUES (84,1,'Ineisa E.I.R.L.','Arawi',20504550177,'Calle Col�n 223 - Miraflores','+51 (01)446-7676','www.arawihotels.com','LIMA',' ',' ','Hotel',1);
INSERT INTO destinos VALUES (85,1,'Top Rank Hotel S.A.C','Four Points by Sheraton Miraflores',20552281838,'Calle Alcanfores 290 Miraflores','+51 (01)206-1100','www.fourpointsmiraflores.com','LIMA',' ',' ','Hotel',1);
INSERT INTO destinos VALUES (86,1,'Boperu S.A.C.','Quinta Miraflores Boutique',20524788129,'Av. 28 de Julio 844 Miraflores','+51 (01)446-5147','www.quintamiraflores.com/en/','LIMA',' ',' ','Hotel',1);
INSERT INTO destinos VALUES (87,1,'Ponhua Servicios Turisticos S.R.L.','Manhattan Inn Airport',20167950893,'Jr. Luna Pizarro 168 - Urb. La Colonial - Callao','+51 (01)464-5811','http://www.hmanhattan.com/','LIMA',' ',' ','Hotel',1);
INSERT INTO destinos VALUES (88,1,'Thunderbird Hotel Las Americas S.A.','Thunderbird Carrera',20516381311,'Jir�n Velarde 123, Lince','+51 (01)619-5200','http://www.thunderbirdhotels.com/english/miraflores-hotel/hotel-carrera-lince-lima-peru.html','LIMA',' ',' ','Hotel',1);
INSERT INTO destinos VALUES (89,1,'Bartleby S.A.C.','De Autor',20563115646,'Av. 28 De Julio Nro. 562 Dpto. B Urb. Miraflores (Entre la Av. Larco con 28 de Julio) Lima - Lima - Miraflores','+51 (01) 6818074/+51 997 527 535','http://www.hoteldeautor.com/','LIMA',' ',' ','Hotel',1);
INSERT INTO destinos VALUES (90,1,'Inversiones La Rioja','Courtyard Lima',20334766714,'Calle Shell n.°400, Miraflores','+51 (01)217-7000','http://www.espanol.marriott.com/hotels/travel/limlm-courtyard-lima-miraflores/','LIMA',' ',' ','Hotel',1);
INSERT INTO destinos VALUES (91,1,'COSTA DEL SOL S A','Costa del Sol Wyndham Salaverry',20231843460,'Av. Salaverry 3052 Magdalena','+51 (01)711-2000','http://www.wyndham.com/hotels/peru/lima/wyndham-costa-del-sol-lima-salaverry/hotel-overview','LIMA',' ',' ','Hotel',1);
INSERT INTO destinos VALUES (92,1,'Thunderbird Hotel Las Americas S.A.','El Pueblo Thunderbird Resorts',20516381311,'Carretera Central Km 10 - Santa Clara','(01)612-6400','www.thunderbirdhotels.com/english/','LIMA',' ',' ','Hotel',1);
INSERT INTO destinos VALUES (93,1,'Turismo El Tambo S.A.C.','El Tambo I',20515601164,'Av. La Paz # 1276 - Miraflores','+51 (01)219-4080','http://www.eltamboperu.com/hotel-lima-peru/english/the-hotel.html','LIMA',' ',' ','Hotel',1);
INSERT INTO destinos VALUES (94,1,'Hotel El Tambo S.A.C.','El Tambo II',20551529933,'Av. La Paz # 720 - Miraflores','+51 (01) 2000100','http://www.eltamboperu.com/english/the-hotel.html','LIMA',' ',' ','Hotel',1);
INSERT INTO destinos VALUES (95,1,'Inversiones Independencia S.A.C.','Limaq',20517656217,'Cl. Los C�ndores 112 - Bellavista - Callao','+51 (01) 606 4446/+51 998 144 498','www.hotellimaq.com','LIMA',' ',' ','Hotel',1);
INSERT INTO destinos VALUES (96,1,'Swiss Management S.A.C.','Ananay Hotel San Isidro',20333684021,'Calle Lizardo Alzamora 260, San Isidro 15076, Per�','+51 (01) 421-7790/+51 978000075','http://www.ananay-hotels.com/hotel-san-isidro','LIMA',' ',' ','Hotel',1);
INSERT INTO destinos VALUES (97,1,'Sitio Arqueol�gico Caral','Sitio Arqueol�gico Caral',' ','Alt. Km 184 Panamericana Norte-Valle Supe (con un desvio de 23km)','(01)205-2500 AX 517/(01)332-5380','www.caralperu.gob.pe','LIMA',' ',' ','Museo',1);
INSERT INTO destinos VALUES (98,1,'Circuito Magico Del Agua','Circuito Magico Del Agua',' ','Av. Petit Thouars esq. Jr. Madre de Dios','+51 (01) 3303052/+51 (01) 4248831','http://www.parquedelareserva.com.pe/','LIMA',' ',' ','Museo',1);
INSERT INTO destinos VALUES (99,1,'Fortaleza de Real Felipe','Fortaleza de Real Felipe',' ','Plaza Independencia, Callao','(01)429-0532',' ','LIMA',' ',' ','Museo',1);
INSERT INTO destinos VALUES (100,1,'Casona Riva Agüero','Casona Riva Aguero',' ','Jr. Camana 459 s/n','+51 (01) 6266600  AX 6601- 6600','ira.pucp.edu.pe/informacion-turistica','LIMA',' ',' ','Museo',1);
INSERT INTO destinos VALUES (101,1,'Iglesia La Merced','Iglesia La Merced',' ','Jr. De La Union Nº621','+51 (01) 4278199',' ','LIMA',' ',' ','Museo',1);
INSERT INTO destinos VALUES (102,1,'Iglesia de Las Nazarenas','Iglesia de Las Nazarenas',' ','Interseccion del Jr. Huancavelica y la Av. Tacna','(01)423-5718',' ','LIMA',' ',' ','Museo',1);
INSERT INTO destinos VALUES (103,1,'Casa Osambela','Casa Osambela',' ','Jr. Conde de Superunda 298 – Lima','+51 (01) 4277987',' ','LIMA',' ',' ','Museo',1);
INSERT INTO destinos VALUES (104,1,'Complejo Arqueologico Cerro Sech�n y Museo de Siti','Complejo Arqueologico Cerro Sech�n y Museo de Siti',' ','5 km al sureste de la localidad de Casma','+51 (043) 721521','http://www.arqueotur.org','LIMA',' ',' ','Museo',1);
INSERT INTO destinos VALUES (105,1,'Museo Palacio Arzobispal de Lima','Museo Palacio Arzobispal de Lima',20535536130,'Plaza de Armas s/n - Lima','+51 (01) 4275790','www.palacioarzobispaldelima.com','LIMA',' ',' ','Museo',1);
INSERT INTO destinos VALUES (106,1,'Club Nacional','Club Nacional',20100261562,'Jr De La Uni�n Nro 1016 - El Cercado','(01)330-2366',' ','LIMA',' ',' ','Museo',1);
INSERT INTO destinos VALUES (107,1,'Casa Garc�a Alvarado','Casa Garc�a Alvarado',20100964997,'Av. Larco 311 - Miraflores','+51 (01) 4441272/+51 (01) 2415960','www.casa-garcia-alvarado.com','LIMA',' ',' ','Museo',1);
INSERT INTO destinos VALUES (108,1,'Ministerio de Relaciones Exteriores','Palacio de Torre Tagle',20131380101,'Jr. Ucayali 363 - Lima','+51 (01) 2042654',' ','LIMA',' ',' ','Museo',1);
INSERT INTO destinos VALUES (109,1,'-','Palacio de Gobierno',' ','Plaza de Armas - Lima','+51 (01) 2043384',' ','LIMA',' ',' ','Museo',1);
INSERT INTO destinos VALUES (110,1,'Municipalidad de Lima','Municipalidad de Lima',20131380951,'MUNICIPALIDAD METROPOLITANA DE LIMA','+51 (01) 3151481',' ','LIMA',' ',' ','Museo',1);
INSERT INTO destinos VALUES (111,1,'Colegio Militar Leoncio Prado','Colegio Militar Leoncio Prado',20167343652,'Av.Costanera 1541 - La Perla - Callao','+51 (01) 4204120/+51 (01) 4576067','www.leoncioprado.org','LIMA',' ',' ','Museo',1);
INSERT INTO destinos VALUES (112,1,'-','Teatro Municipal (Municipalidad de Lima)',' ','Jr. Huancavelica 332, Lima 1','+51 (01) 4274918/+51 (01) 3151300',' ','LIMA',' ',' ','Museo',1);
INSERT INTO destinos VALUES (113,1,'Asociaci�n civil Casa Taller Delf�n','Casa Taller Delf�n',20512492241,'Domeyer 366 -  Barranco','(01)247-5522/9901-28960','www.secondhomeperu.com','LIMA',' ',' ','Museo',1);
INSERT INTO destinos VALUES (114,1,'Casa Bel�n','Casa Bel�n',' ','Av. General Orbegoso Nº 698 Bre�a','+51 (01) 4238623','www.casabelenperu.org','LIMA',' ',' ','Museo',1);
INSERT INTO destinos VALUES (115,1,'INC (Instituto Nacional de Cultura)','INC (Instituto Nacional de Cultura) - Lima',' ','Av. Javier Prado Este 2465, San Borja','(01)476-9933','inc.perucultural.org.pe','LIMA',' ',' ','Museo',1);
INSERT INTO destinos VALUES (116,1,'Catedral De Lima','Catedral de Lima',' ','Plaza Mayor s/n Lima','(01)426-7056/(01)427-9647',' ','LIMA',' ',' ','Museo',1);
INSERT INTO destinos VALUES (117,1,'Iglesia San Francisco','Iglesia San Francisco',' ','Esq. Lampa & Ancash','+51(01) 4271381/+51(01) 4267377','www.museocatacumbas.com','LIMA',' ',' ','Museo',1);
INSERT INTO destinos VALUES (118,1,'Iglesia Santo Domingo','Iglesia Santo Domingo',' ','Jr. Camaná 170 - Cercado de Lima','+51 (01)426-5521/+51 9845-05668','www.conventosantodomingolima.org','LIMA',' ',' ','Museo',1);
INSERT INTO destinos VALUES (119,1,'Iglesia San Pedro','Iglesia San Pedro',' ','Jr. Azángaro 451 y Ucayali - Cercado','+51 (01) 4283017/+51 (01) 4283010','www.sanpedrodelima.org','LIMA',' ',' ','Museo',1);
INSERT INTO destinos VALUES (120,1,'Convento de Los Descalzos','Convento de Los Descalzos',' ','Manco Cápac 202 - R�mac','(01)481-0441',' ','LIMA',' ',' ','Museo',1);
INSERT INTO destinos VALUES (121,1,'Casa De Santa Rosa','Casa de Santa Rosa',' ','Av. Tacna 1ra cuadra - Lima','+51(01) 4251279',' ','LIMA',' ',' ','Museo',1);
INSERT INTO destinos VALUES (122,1,'Casona San Marcos','Casona San Marcos',' ','Av. Nicolás de Pi�rola 1222 - Parque Universitario','+51(01) 6197000 EXT 5206','www.ccsm-unmsm.edu.pe','LIMA',' ',' ','Museo',1);
INSERT INTO destinos VALUES (123,1,'Museo de la Inquisicion y del Congreso','Museo de la Inquisicion y del Congreso',' ','Jr. Junin 58 - Lima','+51(01) 3117777  EXT:5160','www.congreso.gob.pe/museo.htm','LIMA',' ',' ','Museo',1);
INSERT INTO destinos VALUES (124,1,'-','Museo Nacional de Arqueolog�a, Antropolog�a e Hist',' ','Plaza Bolivar s/n Pueblo Libre - Lima','+51(01) 4635070/+51(01) 4632009','museonacional.perucultural.org.pe','LIMA',' ',' ','Museo',1);
INSERT INTO destinos VALUES (125,1,'Asociacion Rafael Larco Hoyle','Museo Larco Herrera',20418628821,'Av. Bolivar 1515 Pueblo Libre','(01)461-1835/(01)461-1312','www.museolarco.org','LIMA',' ',' ','Museo',1);
INSERT INTO destinos VALUES (126,1,'Fundacion Miguel Mujica Gallo','Museo Oro del Per�',20213555180,'Av. Alonso de Molina No. 1100 Monterrico Surco','(01)345-1292/(01)345-1787','www.museoroperu.com.pe','LIMA',' ',' ','Museo',1);
INSERT INTO destinos VALUES (127,1,'Fortaleza Real Felipe','Fortaleza Real Felipe',' ','Plaza Independencia (inicio Av. Saen Pe�a) - Lima','+51 (01) 4290532',' ','LIMA',' ',' ','Museo',1);
INSERT INTO destinos VALUES (128,1,'Museo de La Naci�n','Museo de La Naci�n',20161048683,'Javier Prado Este 2465 San Borja - Lima','+51 (01) 4769873',' ','LIMA',' ',' ','Museo',1);
INSERT INTO destinos VALUES (129,1,'Museo Enrico Poli','Museo Enrico Poli',' ','Lord Cochrane 466 Miraflores - Lima','+51 (01) 4222437',' ','LIMA',' ',' ','Museo',1);
INSERT INTO destinos VALUES (130,1,'Museo Amano','Museo Amano',20131260891,'Calle Retiro 160 Miraflores - Lima','+51 (01) 441-2909','http://www.fundacionmuseoamano.org.pe/','LIMA',' ',' ','Museo',1);
INSERT INTO destinos VALUES (131,1,'-','Museo Pedro de Osma',' ','Av. Pedro de Osma 421 - Barranco','+51 (01) 4670063/+51 (01) 4670141','www.museopedrodeosma.org','LIMA',' ',' ','Museo',1);
INSERT INTO destinos VALUES (132,1,'Museo de Arte de Lima','Museo de Arte de Lima',' ','Paseo Col�n 125 - Lima (acceso por el Parque de la Exposici�n)','+51 (01) 2040000','www.mali.pe','LIMA',' ',' ','Museo',1);
INSERT INTO destinos VALUES (133,1,'-','Museo Raimondi',' ','Av. La Fontana 755 La Molina - Lima','+51 (01) 6149700 AX 132/+51 (01) 3496092','www.museoraimondi.org.pe','LIMA',' ',' ','Museo',1);
INSERT INTO destinos VALUES (134,1,'Museo del Banco Central de Reserva del Per�','Museo del Banco Central de Reserva del Per�',' ','Esq. Lampa & Ucayali - Lima','+51 (01) 6132000 EXT:2655','museobcr.perucultural.org.pe','LIMA',' ',' ','Museo',1);
INSERT INTO destinos VALUES (135,1,'Patronato Del Museo De Historia Natural','Museo de Historia Natural',20503442231,'AV. Arenales 1256 - Jes�s Mar�a','+51 (01) 471-0117/+51 (01) 470-7918','museohn.unmsm.edu.pe','LIMA',' ',' ','Museo',1);
INSERT INTO destinos VALUES (136,1,'Museo de Sitio Huaca Pucllana','Museo de Sitio Huaca Pucllana',' ','Gnral. Borgo�o 800 Miraflores - Lima','+51 (01) 6177138/+51 (01) 4458695','pucllana.perucultural.org.pe','LIMA',' ',' ','Museo',1);
INSERT INTO destinos VALUES (137,1,'Museo de Sitio de Pachacamac','Museo de Sitio de Pachacamac',' ','Panamericana Sur Km 31 Lur�n - Lima','+51 (01) 4300168','www.mcultura.gob.pe','LIMA',' ',' ','Museo',1);
INSERT INTO destinos VALUES (138,1,'Museo De Sitio Arturo Jimenez Borja - Puruchuco','Museo de Sitio Arturo Jimenez Borja - Puruchuco',' ','Carretera central km 4.5 - Ate','+51(01) 4942641','museopuruchuco.perucultural.org.pe','LIMA',' ',' ','Museo',1);
INSERT INTO destinos VALUES (139,1,'Museo de Sitio Huaca Huallamarca','Museo de Sitio Huaca Huallamarca',' ','Nicolás de Ribera 201 San Isidro - Lima','+51 ( 01) 2224124',' ','LIMA',' ',' ','Museo',1);
INSERT INTO destinos VALUES (140,1,'Morgan Morgan Vda. De Solari Mari Elizabeth','Galer�a Las Pallas',10066689242,'Cajamarca 212 - Barranco','+51 (01) 477-4629/+51 999 740 174','www.laspallasperu.com','LIMA',' ',' ','Museo',1);
INSERT INTO destinos VALUES (141,1,'Central Interegional de Artesanos del Per� - C.I.A.P.','Galer�a-Caf� K''Antu',20138768431,'Av. Grau 323 - Barranco','+51 (01) 2528647/+51 992 681 419','http://asociacion.ciap.org/rubrique.php?id_rubrique=116&lang=es','LIMA',' ',' ','Museo',1);
INSERT INTO destinos VALUES (142,1,'Laberinto S.A.C.','Galer�a D�dalo',20507767193,'Paseo Sáenz Pe�a 295 - Barranco','+51 (01) 652-5400/+51 (01) 652-5398','www.dedalomarket.com','LIMA',' ',' ','Museo',1);
INSERT INTO destinos VALUES (143,1,'Bridge Of Hope','Bridge Of Hope',' ','Jr. Jos� Mar�a Plaza 155 Jes�s Mar�a - Lima','(01)333-0152/(01)333-0407','www.fairtradeperu.com','LIMA',' ',' ','Museo',1);
INSERT INTO destinos VALUES (144,1,'-','Pantanos de Villa',' ','Alt. Km. 19 Panamericana Sur (en el Pte. Villa) - Lima','(01)254-7611',' ','LIMA',' ',' ','Museo',1);
INSERT INTO destinos VALUES (145,1,'Casa Aliaga S.R.L.','Casa Aliaga',20509848263,'Jr. De la Union 224 - Cercado','(01)427-7736','www.casadealiaga.com','LIMA',' ',' ','Museo',1);
INSERT INTO destinos VALUES (146,1,'-','Palacio Arzobispal',' ','Plaza Mayor s/n - Lima','+51 (01) 4275790','www.palacioarzobispaldelima.com','LIMA',' ',' ','Museo',1);
INSERT INTO destinos VALUES (147,1,'Artesanos Don Bosco','Artesanos Don Bosco',20463339342,'Av. San Martin 135 - Barranco (a 2 cdras del Puente de los Suspiros)','(01)713-1344','www.artesanosdonbosco.com','LIMA',' ',' ','Museo',1);
INSERT INTO destinos VALUES (148,1,'Andes Textiles Peru S.A.C.','Galeria Wayra',20545929571,'Calle Bolognesi 494 – Miraflores','+51 (01)446-3775','www.wayrashop.com','LIMA',' ',' ','Museo',1);
INSERT INTO destinos VALUES (149,1,'Asociaci�n Mario Testino - MATE','MATE',20535886971,'Av. Pedro de Osma 409, Barranco','+51 (01) 251-7755','www.mate.pe','LIMA',' ',' ','Museo',1);
INSERT INTO destinos VALUES (150,1,'-','Reserva Nacional de Islas Islotes y Puntas Guaneras - RNSIIPG',' ','Calle 17 Nº 355 Urb. El Palomar San Isidro','+51 (01)717-7534','http://www.sernanp.gob.pe/sernanp/zonaturismoi.jsp?ID=76','LIMA',' ',' ','Museo',1);
INSERT INTO destinos VALUES (151,1,'La Rosa Nautica S.A.','La Rosa Nautica',20111035378,'Espig�n 4 Circuito de Playas - Miraflores','(01)445-0149/(01)447-0057','www.larosanautica.com','LIMA',' ',' ','Restaurant',1);
INSERT INTO destinos VALUES (152,1,'La Dama Juana S.A.C.','La Dama Juana',20511360804,'Av. Rep�blica de Panamá 230 - Barranco','+51 (01) 2487547/+51 981 044 718','www.ladamajuana.com.pe/home1.html','LIMA',' ',' ','Restaurant',1);
INSERT INTO destinos VALUES (153,1,'Giamen S.A.C.','Mangos',20424718361,'CC Larcomar-Malec�n de la Reserva 610 Tda. 4-02 - Miraflores','(01)242-6779/(01)242-8110','www.mangosperu.com','LIMA',' ',' ','Restaurant',1);
INSERT INTO destinos VALUES (154,1,'Inversiones Brade S.A.','Junius',20303972821,'Jr. Independencia 125 - Miraflores','(01)617-1000 AX: 203/(01)617-1000 AX: 278','www.junius.com.pe','LIMA',' ',' ','Restaurant',1);
INSERT INTO destinos VALUES (155,1,'Vivaldino Per� S.A.C.','Vivaldino Larcomar',20553201951,'Malec�n de la Reserva 610. Tienda 152-154. C.C. Larcomar Miraflores','(01)255-7224/975 151 284','www.vivaldino.com','LIMA',' ',' ','Restaurant',1);
INSERT INTO destinos VALUES (156,1,'El Senorio de Sulco E.I.R.L.','El Se�orio de Sulco',20109586286,'Malec�n Cisneros 1470 - Miraflores','(01)441-0183/(01)441-0389','www.senoriodesulco.com','LIMA',' ',' ','Restaurant',1);
INSERT INTO destinos VALUES (157,1,'Restaurant Huaca Pucllana S.A.C.','Huaca Pucllana',20500732891,'General Borgo�o cuadra 8 s/n - Miraflores','(01)445-4042','www.resthuacapucllana.com/en/','LIMA',' ',' ','Restaurant',1);
INSERT INTO destinos VALUES (158,1,'Inversiones Maysen S.A.C','Costa Verde',20504590632,'Playa Barranquito s/n Circuito de playas - Barranco','(01)247-1244/(01)247-9110','www.restaurantecostaverde.com/costaverde_portada.php?lan=en','LIMA',' ',' ','Restaurant',1);
INSERT INTO destinos VALUES (159,1,'Inversiones y Negocios del Norte S.A.C.','Fiesta Gourmet Lima',20306470338,'Av. Reducto 1278 - Miraflores','(01)242-9009','www.restaurantfiestagourmet.com/flash/restaurante.html','LIMA',' ',' ','Restaurant',1);
INSERT INTO destinos VALUES (160,1,'Pollos El Cerro S.A.','Pardo''s Chicken - Surco',20337093826,'Av. El Golf Los Incas 498 Urb. Monterrico-Surco','(01)617-2806/(01)437-1580','www.pardoschicken.com.pe','LIMA',' ',' ','Restaurant',1);
INSERT INTO destinos VALUES (161,1,'Fong Wen I Wan','Chifa Fu Jou',10093446793,'Av. Aurelio Miroquesada cuadra 8 s/n, 3er piso dentro del Real Club de Lima San Isidro','+51 (01)221-3133/+51 (01)422-8482','www.chifafujou.com','LIMA',' ',' ','Restaurant',1);
INSERT INTO destinos VALUES (162,1,'Serv Turist y  Estructur del  Pacifico Sur S.A.','Brujas de Cachiche',20166329451,'Calle  Bolognesi 472 - Miraflores','+51 (01)447-1883/+51 (01)447-1133','www.brujasdecachiche.com.pe/en','LIMA',' ',' ','Restaurant',1);
INSERT INTO destinos VALUES (163,1,'Cinco millas S.A.C.','Astrid & Gast�n',20509076945,'Av. Paz Soldán 290 - San Isidro','+51 (01)441-5757/+51 (01)442-2777','http://www.astridygaston.com','LIMA',' ',' ','Restaurant',1);
INSERT INTO destinos VALUES (164,1,'Liquid Company S.A.C.','Scena',20507397752,'Francisco de Paula Camino 280 - Miraflores','(01)445-9688/(01)241-8184','www.scena.com.pe','LIMA',' ',' ','Restaurant',1);
INSERT INTO destinos VALUES (165,1,'Crisantemo Gourmet S.A.C.','Centolla',20538474046,'Av Arnaldo Marquez 1629, Jes�s Mar�a 15072 (Alt. 16 de Gral. Garz�n','((01) 636 6354','www.centollarestaurante.com.pe','LIMA',' ',' ','Restaurant',1);
INSERT INTO destinos VALUES (166,1,'Pak Fok S.A.','Pak Fok',20513696290,'Av Malec�n de la Reserva 610 (Larcomar) tda 102-103 - Miraflores','(01)241-1333','www.pakfok.galeon.com','LIMA',' ',' ','Restaurant',1);
INSERT INTO destinos VALUES (167,1,'Jose Antonio S.R.L.','Jose Antonio - San Isidro',20100327849,'Jr. Bernardo Monteagudo 200 - San Isidro','(01)264-0188/(01)264-3284','www.joseantonio.com.pe','LIMA',' ',' ','Restaurant',1);
INSERT INTO destinos VALUES (168,1,'Inversiones Capricornio 25 S.R.L.','Jose Antonio - Chacarilla',20505080131,'Av. La Floresta 124 Esquina con Av. Primavera','(01)372-6868/(01)372-7288','www.joseantonio.com.pe','LIMA',' ',' ','Restaurant',1);
INSERT INTO destinos VALUES (169,1,'Queirolo de Barbieri S.A.C.','El Bolivariano',20112750798,'Calle Rosa Toledo N° 289 - 291 - Pueblo Libre','+51 (01) 261-9565/+51 (01) 463-0434','www.elbolivariano.com','LIMA',' ',' ','Restaurant',1);
INSERT INTO destinos VALUES (170,1,'Caf� del Museo S.A.C.','Caf� del Museo Larco Herrera',20513257610,'Av. Bolivar 1515 - Pueblo Libre','(01)461-1312/(01)461-1835','www.museolarco.org/cafedelmuseo/index_eng.html','LIMA',' ',' ','Restaurant',1);
INSERT INTO destinos VALUES (171,1,'BDD S.A.C.','Embarcadero',20503257336,'Fleming 181 - Urb. Higuereta - Santiago de Surco','+51 (01) 4483166/-','www.embarcadero41.com','LIMA',' ',' ','Restaurant',1);
INSERT INTO destinos VALUES (172,1,'MAREQ S.A.C.','El Rocoto',20538566081,'Av. Federico Villareal 360 - Miraflores','(01)222-3175/(01)448-3040','http://www.elrocoto.com.pe/local_miraflores.php','LIMA',' ',' ','Restaurant',1);
INSERT INTO destinos VALUES (173,1,'MAREA ALTA S.A.','SPONDYLUS',20430129326,'Av. Caminos del Inca 1899 Las Gardenias-Surco','+51 (01) 2753188/+51 998 199 509','-','LIMA',' ',' ','Restaurant',1);
INSERT INTO destinos VALUES (174,1,'FUNDACION CORPORACION RUSTICA','RUSTICA',20557123106,'Pq. Municipal 105 - Barranco','+51 (01) 2479385/-','-','LIMA',' ',' ','Restaurant',1);
INSERT INTO destinos VALUES (175,1,'Antigua Taberna Queirolo S.A.C.','Antigua Taberna Queirolo',20100906105,'Av. San Martin Nro. 1090 - Pueblo Libre','(01)460-0441/(01)463-1008','www.antiguatabernaqueirolo.com','LIMA',' ',' ','Restaurant',1);
INSERT INTO destinos VALUES (176,1,'100pre Feliz S.A.C.','Wa Lok - Cercado de Lima',20379719440,'Jr. Paruro 864 - 878 - Cercado de Lima','+51 (01) 427-2750','www.walok.com.pe/?lang=en#','LIMA',' ',' ','Restaurant',1);
INSERT INTO destinos VALUES (177,1,'INVERSIONES RESTAURANT SONIA S.A.C.','Sonia Cevicheria',20460965501,'Calle Santa Rosa Nr. 173 - Chorrillos','+51 (01) 4673788/+51 (01) 2516693','www.restaurantsonia.com','LIMA',' ',' ','Restaurant',1);
INSERT INTO destinos VALUES (178,1,'Besso Laura Susana','Paso Obligado',15516127446,'Av. Manuel Valle MZ. G  Lt. 10 -  Pachacamac','(01)430-4178',' ','LIMA',' ',' ','Restaurant',1);
INSERT INTO destinos VALUES (179,1,'Casa Hacienda los Ficus S.A.C.','Hacienda los Ficus',20515771671,'Valle de Lurin - Lima','(01)444-4022/(01)444-3979','www.haciendalosficus.com/01PagInicioIN.html','LIMA',' ',' ','Restaurant',1);
INSERT INTO destinos VALUES (180,1,'Anticuchos del Per� S.A.C.','Panchita',20514680401,'Av. Dos de Mayo 298 - Miraflores','(01)242-5957',' ','LIMA',' ',' ','Restaurant',1);
INSERT INTO destinos VALUES (181,1,'Restaurante Royal S.A.','Royal',20253023628,'Av. Guillermo Prescott 231 - San Isidro','+51 (01)422-9547/+51 (01)421-0814','www.restauranteroyal.com/en/index.php','LIMA',' ',' ','Restaurant',1);
INSERT INTO destinos VALUES (182,1,'100pre Feliz S.A.C.','Wa Lok - Miraflores',20379719440,'Av. Angamos Oeste 700 - Miraflores','+51 (01) 4471329/+51 (01) 4471314','www.walok.com.pe/?lang=en#','LIMA',' ',' ','Restaurant',1);
INSERT INTO destinos VALUES (183,1,'Gresco S.A.C.','Cala',20252796623,'Circuito vial Costa Verde - Playa Barranquito - Barranco','(01)252-9187/9982-47326','www.calarestaurante.com','LIMA',' ',' ','Restaurant',1);
INSERT INTO destinos VALUES (184,1,'Hacienda Mamacona S.A.C.','Hacienda Mamacona',20502800711,'Alameda Mamacona s/n - Lur�n','+51 (01) 2957461/994 186 995','www.haciendamamacona.com.pe','LIMA',' ',' ','Restaurant',1);
INSERT INTO destinos VALUES (185,1,'Eterno Retorno S.A.C.','Amor Amar',20521370042,'Jr. Garcia y Garcia 175 - Barranco','+51 (01) 6199595/+51 (01) 6511112','www.amoramar.com','LIMA',' ',' ','Restaurant',1);
INSERT INTO destinos VALUES (186,1,'Servicios Comerciales y Turisticos Ayacucho S.A.C.','El Parquetito',20110431601,'Calle Lima 373 - Miraflores','(01)444-0490','www.elparquetito.com','LIMA',' ',' ','Restaurant',1);
INSERT INTO destinos VALUES (187,1,'Asociaci�n de las Trabajadoras Misioneras de La Inmaculada Concepci�n L´EAU Vive Del Per�','L`EAU Vive',20108713870,'Jr. Ucayali 370 Lima - Lima','(01)427-5612',' ','LIMA',' ',' ','Restaurant',1);
INSERT INTO destinos VALUES (188,1,'Food Service Investment S.A.C.','Maido',20492015165,'Calle San Mart�n 399 -  Esq Col�n -  Miraflores','(01)444-2568','www.maido.pe/en/index.php','LIMA',' ',' ','Restaurant',1);
INSERT INTO destinos VALUES (189,1,'Bravo Restobar S.A.C.','Bravo Restobar',20512198563,'Av. Conquistadores 1005 - San Isidro','(01)221-5700','www.bravorestobar.com/html/','LIMA',' ',' ','Restaurant',1);
INSERT INTO destinos VALUES (190,1,'Danica Miraflores S.A.C.','Dánica',20536088335,'Av. Armendariz 524 - Miraflores','(01)446-2135/(01)445-8743','www.danica.pe','LIMA',' ',' ','Restaurant',1);
INSERT INTO destinos VALUES (191,1,'Enotours Peru S.A.C.','Trentino',20520582283,'Calle Antonio Polo N° 886 - Pueblo Libre','(01)261-1590/(01)461-8082','www.trentino.com.pe','LIMA',' ',' ','Restaurant',1);
INSERT INTO destinos VALUES (192,1,'Restaurant La Fonda de los Suspiros S.A.C.','La Fonda de los Suspiros',20507259953,'Av. Pedro de Osma 102 - Barranco - Lima','(01)247-2547','www.lafondadelossuspiros.com','LIMA',' ',' ','Restaurant',1);
INSERT INTO destinos VALUES (193,1,'Alimentos Latinos S.A.C.','El Mercado',20518773578,'Av. Hipolito Unanue N° 203 -  Miraflores','(01)221-1322','www.rafaelosterling.com/intro.html','LIMA',' ',' ','Restaurant',1);
INSERT INTO destinos VALUES (194,1,'Cangre Food S.A.C.','Mantra',20513913908,'Av.Benavides 1761 Urb. San Antonio - Miraflores','(01)445-0127/9955-55457','www.mantraperu.com','LIMA',' ',' ','Restaurant',1);
INSERT INTO destinos VALUES (195,1,'Cadepa S.A.C.','Caf� de la Paz',20100588995,'Calle Lima 361 - Miraflores','(01)241-6043','www.cafedelapazperu.com','LIMA',' ',' ','Restaurant',1);
INSERT INTO destinos VALUES (196,1,'Libre Albedrio S.A.C.','Pescados Capitales',20502773136,'Av. La Mar 1337 - Miraflores','(01)421-8808','www.pescadoscapitales.com','LIMA',' ',' ','Restaurant',1);
INSERT INTO destinos VALUES (197,1,'Inversiones EMC Gourmet S.A.C.','Lima 27',20516949377,'Calle Santa Luisa 295, San Isidro','(01)421-9084/(01)21-5822','http://www.lima27.com/','LIMA',' ',' ','Restaurant',1);
INSERT INTO destinos VALUES (198,1,'Restaurante Cordano S.R.L.','Cordano',20100437865,'Jr. Ancash 202 - Lima','(01)427-0181','www.restaurantcordano.com','LIMA',' ',' ','Restaurant',1);
INSERT INTO destinos VALUES (199,1,'Inversiones Eivissa S.A.C.','Chala',20513033002,'Bajada de Ba�os Nro 343 - Barranco','(01)252-8515','www.chala.com.pe','LIMA',' ',' ','Restaurant',1);
INSERT INTO destinos VALUES (200,1,'Salon Capon','Salon Capon',20512925538,'Jr. Paruro 819 Barrio Chino - Cercado de Lima','(01)426-9286','www.saloncapon.com','LIMA',' ',' ','Restaurant',1);
INSERT INTO destinos VALUES (201,1,'Loy Sing S.A.C.','Madam Tusan',20518792360,'Av. Santa Cruz 859, Miraflores','(01)505-5090',' ','LIMA',' ',' ','Restaurant',1);
INSERT INTO destinos VALUES (202,1,'Puerto Madero S.A.C.','La Bistecca',20510886209,'Av Los Conquistadores 1048, San Isidro','(01)421 7555/(01)421 1523','http://www.labisteccalima.com/','LIMA',' ',' ','Restaurant',1);
INSERT INTO destinos VALUES (203,1,'Cinco Millas S.A.C.','La Barra Casa Moreyra',20509076945,'Av. Paz Soldán 290 - San Isidro','(01)442-2774/(01)442-2777','http://www.astridygaston.com','LIMA',' ',' ','Restaurant',1);
INSERT INTO destinos VALUES (204,1,'Karla Watson Uriarte','Catering KW',10079714661,'Calle Domingo Ponte 1189 - Magdalena del Mar','+51 (01) 460 6208/+51 995 995 966',' ','LIMA',' ',' ','Restaurant',1);
INSERT INTO destinos VALUES (205,1,'Inversiones Lima 5909 S.A.C','Chifa Internacional',20502704835,'Av. Republica de Panamá 5915 Lima - Miraflores','(01)445-3242','www.chifainternacional.com','LIMA',' ',' ','Restaurant',1);
INSERT INTO destinos VALUES (206,1,'Orient- Express Peru S.A.','Mesa 18 - Miraflores Park',20334539149,'Av. Malec�n de la Reserva 1035 - Miraflores','(01)610-4000','www.mesa18restaurant.com/web/mesa18/index.jsp','LIMA',' ',' ','Restaurant',1);
INSERT INTO destinos VALUES (207,1,'Casa Aliaga S.R.L.','Casa Aliaga',20509848263,'Jr. De la Union 224 - Cercado','(01)427-7736','www.casadealiaga.com/index.php?idIdioma=en_EN','LIMA',' ',' ','Restaurant',1);
INSERT INTO destinos VALUES (208,1,'Pedro Miguel S.A.C.','Malabar Restaurant & Bar',20507660712,'Av. Camino Real 101','(01)440-9094/(01)440-5300','malabar.com.pe','LIMA',' ',' ','Restaurant',1);
INSERT INTO destinos VALUES (209,1,'Transgourmet S.A.C.','La D�cima',20524459818,'Av. Emilio Cavenecia 190 San Isidro','(01)440-2977/(01)222-1036','www.ladecima.pe','LIMA',' ',' ','Restaurant',1);
INSERT INTO destinos VALUES (210,1,'Asociaci�n Casa Garcia Alvarado','Casa Garcia Alvarado',20516788268,'Cal. Esperanza 138 (alt de la cuadra 3 de Larco)- Miraflores','+51 (01) 4477772','www.casa-garcia-alvarado.com/history.html','LIMA',' ',' ','Restaurant',1);
INSERT INTO destinos VALUES (211,1,'Serviperb S.R.L.','La Rana Verde',20101428819,'Parque Gálvez s/n La Punta - Callao','(01)429-5279/(01)429-8453',' ','LIMA',' ',' ','Restaurant',1);
INSERT INTO destinos VALUES (212,1,'Inversiones Viramar S.A.C.','Central Restaurante',20517895980,'Calle Santa Isabel 376 - Miraflores','+51 (01) 242- 8515/+51 (01 )242-8575','centralrestaurante.com.pe/en/index.php','LIMA',' ',' ','Restaurant',1);
INSERT INTO destinos VALUES (213,1,'La Tiendecita Blanca S.A.','La Tiendecita Blanca',20100317967,'Av. Larco 111 - Miraflores','(01)445-1412/(01)445-9797','www.latiendecitablanca.com.pe/index_eng.htm','LIMA',' ',' ','Restaurant',1);
INSERT INTO destinos VALUES (214,1,'Pollos El Acantilado S.A.','Pardo''s Chicken - Larcomar',20430040180,'Malec�n de La Reserva 610 CC Larcomar Tda 238','+51 (01)447-8023/(01)437-1580','www.pardoschicken.com.pe','LIMA',' ',' ','Restaurant',1);
INSERT INTO destinos VALUES (215,1,'AAR & Asociados S.A.C.','Portofino',20514933384,'Malecon de la Rserva 610 tda 155 2do nivel - Miraflores','(01)447-2194','www.restauranteportofino.com.pe','LIMA',' ',' ','Restaurant',1);
INSERT INTO destinos VALUES (216,1,'El Guayabo S.A.C.','Pardo''s Chicken - Costa verde',20537916461,'Av. Costa Verde s/n playa las Cascadas-Barranquito','(01)437-1580','www.pardoschicken.com.pe','LIMA',' ',' ','Restaurant',1);
INSERT INTO destinos VALUES (217,1,'WYCH Inversiones S.A.C.','Pardo''s Chicken - Centro Historico Lima',20425476115,'Pasaje Santa Rosa 153 - Lima','(01)437-1580','www.pardoschicken.com.pe','LIMA',' ',' ','Restaurant',1);
INSERT INTO destinos VALUES (218,1,'Fiesta Restaurant Gourmet','Fiesta Restaurant Gourmet',' ','Av. Reducto 1278 - Miraflores','(01)242-9009','www.restaurantfiestagourmet.com','LIMA',' ',' ','Restaurant',1);
INSERT INTO destinos VALUES (219,1,'Jose Antonio Restaurants','Jose Antonio Restaurants',' ','Jr. Bernardo Monteagudo 200 - San Isidro',' ','www.joseantonio.com.pe','LIMA',' ',' ','Restaurant',1);
INSERT INTO destinos VALUES (220,1,'Jaime Marimon Cruz','Los Hornitos de Azpitia',10402403689,'Valle de Mala-Azpitia en la bodega de Piscos','9890-47020','www.Loshornitosdeazpitia.com.pe','LIMA',' ',' ','Restaurant',1);
INSERT INTO destinos VALUES (221,1,'Inversiones Eivissa S.A.C.','Picas',20513033002,'Jr. Bajada de los Ba�os 340 - Barranco','(01)247-6150/(01)252-8095','www.picas.com.pe','LIMA',' ',' ','Restaurant',1);
INSERT INTO destinos VALUES (222,1,'Rudani Inversiones S.A.C','La Cuadra de Salvador',20549879277,'Centenario 105, Barranco (esquina con Av. Grau)','+51 (01) 247 8670/+51 989 817 299','http://www.lacuadradesalvador.com/quienes-somos.html','LIMA',' ',' ','Restaurant',1);
INSERT INTO destinos VALUES (223,1,'Inversiones Nacionales de Turismo S.A.','Maras - Libertador Lima Westin',20114803228,'Calle Las Begonias 450 - San Isidro','(01)201-5000/(01)518-6510','www.westinlima.com.pe/en','LIMA',' ',' ','Restaurant',1);
INSERT INTO destinos VALUES (224,1,'Desarrollo Gastron�mico S.A.C.','El Cortijo',20549252126,'Calle Montero Rosas 121, Barranco','+51 (01) 2519133','http://www.elcortijo.com.pe','LIMA',' ',' ','Restaurant',1);
INSERT INTO destinos VALUES (225,1,'AAP CORPORACION S.A.C.','Alfresco',20549253360,'Malec�n Balta 790 -Miraflores','+51 (01) 242-8960','http://www.restaurantealfresco.com','LIMA',' ',' ','Restaurant',1);
INSERT INTO destinos VALUES (226,1,'Rafael Osterling Lima','Rafael Osterling Lima',10093995037,'San Martin 300, Miraflores','+51 (01)242-4149/+51 (01)242-4231','http://www.rafaelosterling.pe/en/lima.html','LIMA',' ',' ','Restaurant',1);
INSERT INTO destinos VALUES (227,1,'Inversiones Honda Yaki S.A.C.','Sukha Asian Cuisine',20521923661,'calle Dos de Mayo 694 - Miraflores','+51 (1) 7193763','http://sukha.pe/sukharest/','LIMA',' ',' ','Restaurant',1);
INSERT INTO destinos VALUES (228,1,'Comercial OWN S.A.','Pardos Chicken - Benavides',20100313201,'Av. Benavides 730 – Miraflores','+51 (01) 444-2126','http://www.pardoschicken.pe/','LIMA',' ',' ','Restaurant',1);
INSERT INTO destinos VALUES (229,1,'Plaza San Mart�n','Plaza San Mart�n',20550057451,'Av. Nicolas de Pierola 938 of 304 Cercado de Lima','+51 (01) 717-8493/+51 984 724 740','www.restauranteplazasanmartin.com','LIMA',' ',' ','Restaurant',1);
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

/* INSERT TARIFARIO LIMA */

INSERT INTO tarifa VALUES (1, 1,0,'OW',28,8,1,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (2, 1,0,'OW',49,7,1,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (3, 1,0,'OW',79,5,1,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (4, 1,0,'OW',124,2,1,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (5, 1,0,'OW',33,8,2,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (6, 1,0,'OW',55,7,2,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (7, 1,0,'OW',94,5,2,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (8, 1,0,'OW',133,2,2,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (9, 1,3,'RT',44,8,3,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (10, 1,3,'RT',64,7,3,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (11, 1,3,'RT',103,5,3,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (12, 1,3,'RT',150,2,3,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (13, 1,0,'OW',10,8,4,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (14, 1,0,'OW',10,7,4,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (15, 1,0,'OW',15,5,4,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (16, 1,0,'OW',154,2,4,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');  
INSERT INTO tarifa VALUES (17, 1,0,'RT',20,8,5,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (18, 1,0,'RT',20,7,5,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (19, 1,0,'RT',30,5,5,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (20, 1,0,'RT',30,2,5,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');   
INSERT INTO tarifa VALUES (21, 1,0,'OW',55,8,6,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (22, 1,0,'OW',77,7,6,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (23, 1,0,'OW',155,5,6,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (24, 1,0,'OW',205,2,6,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (25, 1,0,'OW',23,8,7,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (26, 1,0,'OW',46,7,7,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (27, 1,0,'OW',75,5,7,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (28, 1,0,'OW',109,2,7,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (29, 1,0,'OW',39,8,8,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (30, 1,0,'OW',64,7,8,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (31, 1,0,'OW',103,5,8,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (32, 1,0,'OW',159,2,8,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');  
INSERT INTO tarifa VALUES (33, 1,0,'OW',33,8,9,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (34, 1,0,'OW',50,7,9,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (35, 1,0,'OW',83,5,9,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (36, 1,0,'OW',125,2,9,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');    
INSERT INTO tarifa VALUES (37, 1,0,'RT',28,8,10,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (38, 1,0,'RT',28,7,10,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (39, 1,0,'RT',28,5,10,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (40, 1,0,'RT',28,2,10,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47'); 
INSERT INTO tarifa VALUES (41, 1,4,'Sin Descripcion',44,8,11,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (42, 1,4,'Sin Descripcion',58,7,11,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (43, 1,4,'Sin Descripcion',120,5,11,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (44, 1,4,'Sin Descripcion',170,2,11,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (45, 1,4,'Sin Descripcion',44,8,12,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (46, 1,4,'Sin Descripcion',58,7,12,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (47, 1,4,'Sin Descripcion',120,5,12,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (48, 1,4,'Sin Descripcion',170,2,12,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (49, 1,4.5,'Sin Descripcion',55,8,13,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (50, 1,4.5,'Sin Descripcion',76,7,13,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (51, 1,4.5,'Sin Descripcion',130,5,13,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (52, 1,4.5,'Sin Descripcion',235,2,13,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (53, 1,8,'Sin Descripcion',112,8,14,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (54, 1,8,'Sin Descripcion',145,7,14,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (55, 1,8,'Sin Descripcion',250,5,14,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (56, 1,8,'Sin Descripcion',413,2,14,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');  
INSERT INTO tarifa VALUES (57, 1,4.5,'Sin Descripcion',56,8,15,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (58, 1,4.5,'Sin Descripcion',75,7,15,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (59, 1,4.5,'Sin Descripcion',130,5,15,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (60, 1,4.5,'Sin Descripcion',215,2,15,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47'); 
INSERT INTO tarifa VALUES (61, 1,4.5,'Sin Descripcion',75,8,16,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (62, 1,4.5,'Sin Descripcion',99,7,16,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (63, 1,4.5,'Sin Descripcion',193,5,16,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (64, 1,4.5,'Sin Descripcion',286,2,16,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (65, 1,5,'Sin Descripcion',91,8,17,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (66, 1,5,'Sin Descripcion',121,7,17,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (67, 1,5,'Sin Descripcion',286,5,17,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (68, 1,5,'Sin Descripcion',333,2,17,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (69, 1,8,'Sin Descripcion',146,8,18,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (70, 1,8,'Sin Descripcion',193,7,18,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (71, 1,8,'Sin Descripcion',347,5,18,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (72, 1,8,'Sin Descripcion',509,2,18,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (73, 1,1,'Sin Descripcion',17,8,19,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (74, 1,1,'Sin Descripcion',25,7,19,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (75, 1,1,'Sin Descripcion',35,5,19,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (76, 1,1,'Sin Descripcion',55,2,19,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');  
INSERT INTO tarifa VALUES (77, 1,5,'Sin Descripcion',56,8,20,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (78, 1,5,'Sin Descripcion',96,7,20,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (79, 1,5,'Sin Descripcion',140,5,20,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (80, 1,5,'Sin Descripcion',240,2,20,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47'); 
INSERT INTO tarifa VALUES (81, 1,0,'Sin Descripcion',230,8,21,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (82, 1,0,'Sin Descripcion',314,7,21,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (83, 1,0,'Sin Descripcion',470,5,21,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (84, 1,0,'Sin Descripcion',638,2,21,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (85, 1,0,'Sin Descripcion',260,8,22,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (86, 1,0,'Sin Descripcion',359,7,22,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (87, 1,0,'Sin Descripcion',560,5,22,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (88, 1,0,'Sin Descripcion',715,2,22,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (89, 1,0,'Sin Descripcion',280,8,23,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (90, 1,0,'Sin Descripcion',338,7,23,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (91, 1,0,'Sin Descripcion',600,5,23,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (92, 1,0,'Sin Descripcion',770,2,23,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');  
INSERT INTO tarifa VALUES (93, 1,0,'Sin Descripcion',294,8,24,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (94, 1,0,'Sin Descripcion',355,7,24,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (95, 1,0,'Sin Descripcion',630,5,24,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (96, 1,0,'Sin Descripcion',809,2,24,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');    
INSERT INTO tarifa VALUES (97, 1,0,'Sin Descripcion',332,8,25,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (98, 1,0,'Sin Descripcion',456,7,25,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (99, 1,0,'Sin Descripcion',695,5,25,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (100, 1,0,'Sin Descripcion',945,2,25,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');   
INSERT INTO tarifa VALUES (101, 1,0,'Sin Descripcion',282,8,26,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (102, 1,0,'Sin Descripcion',432,7,26,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (103, 1,0,'Sin Descripcion',660,5,26,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (104, 1,0,'Sin Descripcion',896,2,26,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (105, 1,0,'Sin Descripcion',25,8,27,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (106, 1,0,'Sin Descripcion',25,7,27,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (107, 1,0,'Sin Descripcion',25,5,27,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (108, 1,0,'Sin Descripcion',25,2,27,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (109, 1,0,'RT',155,8,28,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (110, 1,0,'RT',180,7,28,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');  
INSERT INTO tarifa VALUES (111, 1,0,'Sin Descripcion',729,8,29,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (112, 1,0,'Sin Descripcion',948,7,29,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (113, 1,0,'Sin Descripcion',398,8,30,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (114, 1,0,'Sin Descripcion',517,7,30,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');  
INSERT INTO tarifa VALUES (115, 1,0,'Sin Descripcion',551,8,31,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (116, 1,0,'Sin Descripcion',716,7,31,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');   
INSERT INTO tarifa VALUES (117, 1,0,'Sin Descripcion',259,8,32,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (118, 1,0,'Sin Descripcion',342,7,32,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (119, 1,0,'Sin Descripcion',585,5,32,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (120, 1,0,'Sin Descripcion',748,2,32,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');  
INSERT INTO tarifa VALUES (121, 1,3,'Sin Descripcion',40,8,33,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (122, 1,3,'Sin Descripcion',55,7,33,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (123, 1,3,'Sin Descripcion',90,5,33,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (124, 1,3,'Sin Descripcion',150,2,33,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (125, 1,3,'Sin Descripcion',40,8,34,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (126, 1,3,'Sin Descripcion',55,7,34,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (127, 1,3,'Sin Descripcion',90,5,34,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (128, 1,3,'Sin Descripcion',150,2,34,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (129, 1,4,'Sin Descripcion',56,8,35,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (130, 1,4,'Sin Descripcion',75,7,35,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (131, 1,4,'Sin Descripcion',105,5,35,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (132, 1,4,'Sin Descripcion',200,2,35,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');  
INSERT INTO tarifa VALUES (133, 1,4,'Sin Descripcion',50,8,36,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (134, 1,4,'Sin Descripcion',70,7,36,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (135, 1,4,'Sin Descripcion',100,5,36,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (136, 1,4,'Sin Descripcion',210,2,36,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');   
INSERT INTO tarifa VALUES (137, 1,4,'Sin Descripcion',56,8,37,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (138, 1,4,'Sin Descripcion',75,7,37,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (139, 1,4,'Sin Descripcion',105,5,37,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (140, 1,4,'Sin Descripcion',260,2,37,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');  
INSERT INTO tarifa VALUES (141, 1,5,'Sin Descripcion',85,8,38,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (142, 1,5,'Sin Descripcion',110,7,38,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (143, 1,5,'Sin Descripcion',155,5,38,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (144, 1,5,'Sin Descripcion',260,2,38,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (145, 1,4,'Sin Descripcion',50,8,39,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (146, 1,4,'Sin Descripcion',67,7,39,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (147, 1,4,'Sin Descripcion',125,5,39,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (148, 1,4,'Sin Descripcion',203,2,39,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');    
INSERT INTO tarifa VALUES (149, 1,0,'Sin Descripcion',75,1,40,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (150, 1,5,'Sin Descripcion',252,1,41,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (151, 1,1,'Sin Descripcion',54,1,42,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (152, 1,3,'Sin Descripcion',50,1,43,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (153, 1,4,'Sin Descripcion',45,1,44,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (154, 1,0,'Full Day',1180,1,45,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');  


/* INSERT TARIFARIO CUSCO */

    
INSERT INTO tarifa VALUES (155,2,0,'OW',10.27,8,46,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (156,2,0,'OW',12.98,7,46,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (157,2,0,'OW',16.22,6,46,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (158,2,0,'OW',22.42,3,46,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (159,2,0,'OW',25.65,4,46,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (160,2,0,'OW',10.27,8,47,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (161,2,0,'OW',12.98,7,47,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (162,2,0,'OW',16.22,6,47,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (163,2,0,'OW',22.42,3,47,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (164,2,0,'OW',25.65,4,47,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (165,2,0,'OW',10.27,8,48,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (166,2,0,'OW',12.98,7,48,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (167,2,0,'OW',16.22,6,48,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (168,2,0,'OW',22.42,3,48,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (169,2,0,'OW',25.65,4,48,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (170,2,0,'OW',18.93,8,49,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (171,2,0,'OW',23.25,7,49,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (172,2,0,'OW',28.66,6,49,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (173,2,0,'OW',44.84,3,49,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (174,2,0,'OW',51.3,4,49,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (175,2,0,'OW',66.84,8,50,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (176,2,0,'OW',81.69,7,50,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (177,2,0,'OW',97.60,6,50,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (178,2,0,'OW',135,3,50,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (179,2,0,'OW',144,4,50,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (180,2,0,'OW',72.14,8,51,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (181,2,0,'OW',83.81,7,51,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (182,2,0,'OW',100.26,6,51,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (183,2,0,'OW',152,3,51,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (184,2,0,'OW',161.68,4,51,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (185,2,0,'RT',77.98,8,52,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (186,2,0,'RT',89.61,7,52,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (187,2,0,'RT',106.09,6,52,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (188,2,0,'RT',173.76,3,52,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (189,2,0,'RT',180.5,4,52,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (190,2,0,'RT',20.16,8,53,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (191,2,0,'RT',26.79,7,53,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (192,2,0,'RT',33.42,6,53,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (193,2,0,'RT',44.84,3,53,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (194,2,0,'RT',51.3,4,53,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (195,2,0,'Sin Descripcion',13.39,8,54,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (196,2,0,'Sin Descripcion',15.45,7,54,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (197,2,0,'Sin Descripcion',17.51,6,54,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (198,2,0,'Sin Descripcion',22.42,3,54,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (199,2,0,'Sin Descripcion',26.9,4,54,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (200,2,0,'Sin Descripcion',41.17,8,55,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (201,2,0,'Sin Descripcion',48.04,7,55,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (202,2,0,'Sin Descripcion',54.37,6,55,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (203,2,0,'Sin Descripcion',84.08,3,55,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (204,2,0,'Sin Descripcion',89.68,4,55,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (205,2,0,'Sin Descripcion',49.09,8,56,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (206,2,0,'Sin Descripcion',54.37,7,56,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (207,2,0,'Sin Descripcion',61.76,6,56,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (208,2,0,'Sin Descripcion',90,3,56,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (209,2,0,'Sin Descripcion',94.4,4,56,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (210,2,0,'Sin Descripcion',57.54,8,57,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (211,2,0,'Sin Descripcion',67.57,7,57,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (212,2,0,'Sin Descripcion',78.13,6,57,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (213,2,0,'Sin Descripcion',123.31,3,57,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (214,2,0,'Sin Descripcion',133,4,57,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (215,2,0,'Sin Descripcion',63.35,8,58,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (216,2,0,'Sin Descripcion',72.85,7,58,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (217,2,0,'Sin Descripcion',84.46,6,58,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (218,2,0,'Sin Descripcion',134.52,3,58,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (219,2,0,'Sin Descripcion',142.5,4,58,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (220,2,0,'Sin Descripcion',57.54,8,59,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (221,2,0,'Sin Descripcion',67.57,7,59,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (222,2,0,'Sin Descripcion',79.18,6,59,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (223,2,0,'Sin Descripcion',123.31,3,59,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (224,2,0,'Sin Descripcion',133,4,59,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (225,2,0,'Sin Descripcion',70.74,8,60,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (226,2,0,'Sin Descripcion',83.40,7,60,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (227,2,0,'Sin Descripcion',97.66,6,60,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (228,2,0,'Sin Descripcion',156.94,3,60,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (229,2,0,'Sin Descripcion',166.25,4,60,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (230,2,0,'Sin Descripcion',76.01,8,61,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (231,2,0,'Sin Descripcion',86.57,7,61,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (232,2,0,'Sin Descripcion',102.94,6,61,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (233,2,0,'Sin Descripcion',184.97,3,61,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (234,2,0,'Sin Descripcion',190,4,61,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (235,2,0,'Sin Descripcion',57.54,8,62,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (236,2,0,'Sin Descripcion',67.57,7,62,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (237,2,0,'Sin Descripcion',79.18,6,62,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (238,2,0,'Sin Descripcion',123.31,3,62,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (239,2,0,'Sin Descripcion',133,4,62,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (240,2,0,'Sin Descripcion',81.69,8,63,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (241,2,0,'Sin Descripcion',98.66,7,63,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (242,2,0,'Sin Descripcion',125.19,6,63,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (243,2,0,'Sin Descripcion',175,3,63,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (244,2,0,'Sin Descripcion',182,4,63,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (245,2,0,'Sin Descripcion',86.99,8,64,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (246,2,0,'Sin Descripcion',103.97,7,64,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (247,2,0,'Sin Descripcion',130.49,6,64,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (248,2,0,'Sin Descripcion',201.78,3,64,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (249,2,0,'Sin Descripcion',209,4,64,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (250,2,0,'Sin Descripcion',86.99,8,65,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (251,2,0,'Sin Descripcion',103.97,7,65,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (252,2,0,'Sin Descripcion',130.49,6,65,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (253,2,0,'Sin Descripcion',184.97,3,65,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (254,2,0,'Sin Descripcion',190,4,65,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (255,2,0,'Sin Descripcion',114.58,8,66,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (256,2,0,'Sin Descripcion',130.49,7,66,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (257,2,0,'Sin Descripcion',163.38,6,66,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (258,2,0,'Sin Descripcion',244,3,66,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (259,2,0,'Sin Descripcion',260,4,66,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (260,2,0,'Sin Descripcion',119.88,8,67,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (261,2,0,'Sin Descripcion',136.86,7,67,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (262,2,0,'Sin Descripcion',168.68,6,67,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (263,2,0,'Sin Descripcion',246.62,3,67,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (264,2,0,'Sin Descripcion',256.5,4,67,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (265,2,0,'Sin Descripcion',86.99,8,68,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (266,2,0,'Sin Descripcion',103.97,7,68,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (267,2,0,'Sin Descripcion',130.49,6,68,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (268,2,0,'Sin Descripcion',182.72,3,68,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (269,2,0,'Sin Descripcion',190,4,68,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (270,2,0,'Sin Descripcion',103.97,8,69,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (271,2,0,'Sin Descripcion',119.88,7,69,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (272,2,0,'Sin Descripcion',147.47,6,69,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (273,2,0,'Sin Descripcion',201.78,3,69,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (274,2,0,'Sin Descripcion',209,4,69,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (275,2,0,'Sin Descripcion',68.96,8,70,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (276,2,0,'Sin Descripcion',86.99,7,70,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (277,2,0,'Sin Descripcion',103.97,6,70,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (278,2,0,'Sin Descripcion',184.97,3,70,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (279,2,0,'Sin Descripcion',190,4,70,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (280,2,0,'Sin Descripcion',92.83,8,71,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (281,2,0,'Sin Descripcion',114.58,7,71,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (282,2,0,'Sin Descripcion',142.16,6,71,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (283,2,0,'Sin Descripcion',184.97,3,71,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (284,2,0,'Sin Descripcion',190,4,71,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (285,2,0,'Sin Descripcion',360.71,8,72,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (286,2,0,'Sin Descripcion',381.92,7,72,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (287,2,0,'Sin Descripcion',463.61,6,72,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (288,2,0,'Sin Descripcion',625,3,72,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (289,2,0,'Sin Descripcion',830,4,72,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (290,2,0,'Sin Descripcion',381.92,8,73,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (291,2,0,'Sin Descripcion',419.06,7,73,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (292,2,0,'Sin Descripcion',493.32,6,73,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (293,2,0,'Sin Descripcion',655,3,73,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (294,2,0,'Sin Descripcion',875,4,73,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (295,2,0,'Sin Descripcion',360.71,8,74,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (296,2,0,'Sin Descripcion',381.92,7,74,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (297,2,0,'Sin Descripcion',463.61,6,74,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (298,2,0,'Sin Descripcion',381.92,8,75,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (299,2,0,'Sin Descripcion',419.06,7,75,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (300,2,0,'Sin Descripcion',493.32,6,75,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (301,2,0,'Sin Descripcion',10.08,8,76,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (302,2,0,'Sin Descripcion',12.73,7,76,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (303,2,0,'Sin Descripcion',15.91,6,76,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (304,2,0,'Sin Descripcion',66.84,8,77,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (305,2,0,'Sin Descripcion',81.69,7,77,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (306,2,0,'Sin Descripcion',97.60,6,77,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');


INSERT INTO tarifa VALUES (307, 1,0,'Sin Descripcion',30,8,78,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (308, 1,0,'Sin Descripcion',53,7,78,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (309, 1,0,'Sin Descripcion',69,5,78,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (310, 1,0,'Sin Descripcion',113,2,78,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (311, 1,0,'Sin Descripcion',50,8,79,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (312, 1,0,'Sin Descripcion',57,7,79,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (313, 1,0,'Sin Descripcion',88,5,79,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');    
INSERT INTO tarifa VALUES (314, 1,0,'Sin Descripcion',129,2,79,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (315, 1,0,'Sin Descripcion',44,8,80,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (316, 1,0,'Sin Descripcion',57,7,80,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (317, 1,0,'Sin Descripcion',105,5,80,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (318, 1,0,'Sin Descripcion',144,2,80,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (319, 1,0,'Sin Descripcion',44,8,81,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (320, 1,0,'Sin Descripcion',57,7,81,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (321, 1,0,'Sin Descripcion',105,5,81,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (322, 1,0,'Sin Descripcion',144,2,81,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (323, 1,0,'Sin Descripcion',218,8,82,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');    
INSERT INTO tarifa VALUES (324, 1,0,'Sin Descripcion',265,7,82,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (325, 1,0,'Sin Descripcion',402,5,82,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (326, 1,0,'Sin Descripcion',556,2,82,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (327, 1,0,'Sin Descripcion',283,8,83,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');    
INSERT INTO tarifa VALUES (328, 1,0,'Sin Descripcion',303,7,83,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (329, 1,0,'Sin Descripcion',458,5,83,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
INSERT INTO tarifa VALUES (330, 1,0,'Sin Descripcion',634,2,83,1,'2015-05-27 19:56:47', '2015-05-27 19:56:47');
