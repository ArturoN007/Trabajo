/*
SQLyog Ultimate v12.5.1 (64 bit)
MySQL - 10.4.24-MariaDB : Database - senatimat
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`senatimat` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `senatimat`;

/*Table structure for table `cargo` */

DROP TABLE IF EXISTS `cargo`;

CREATE TABLE `cargo` (
  `idcargo` int(11) NOT NULL AUTO_INCREMENT,
  `cargo` varchar(30) NOT NULL,
  PRIMARY KEY (`idcargo`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

/*Data for the table `cargo` */

insert  into `cargo`(`idcargo`,`cargo`) values 
(1,'Instructor'),
(2,'Jefe Centro'),
(3,'Asist. Administrativo'),
(4,'Asist. Académico'),
(5,'Coordinador ETI'),
(6,'Coordinador CIS');

/*Table structure for table `carreras` */

DROP TABLE IF EXISTS `carreras`;

CREATE TABLE `carreras` (
  `idcarrera` int(11) NOT NULL AUTO_INCREMENT,
  `idescuela` int(11) NOT NULL,
  `carrera` varchar(100) NOT NULL,
  PRIMARY KEY (`idcarrera`),
  UNIQUE KEY `uk_carrera_car` (`carrera`),
  KEY `fk_idescuela_car` (`idescuela`),
  CONSTRAINT `fk_idescuela_car` FOREIGN KEY (`idescuela`) REFERENCES `escuelas` (`idescuela`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

/*Data for the table `carreras` */

insert  into `carreras`(`idcarrera`,`idescuela`,`carrera`) values 
(1,1,'Diseño Gráfico Digital'),
(2,1,'Ingeniería de Software con IA'),
(3,1,'Cyberseguridad'),
(4,2,'Administración de empresas'),
(5,2,'Administración Industrial'),
(6,2,'Prevencionista de Riesgo'),
(7,3,'Soldador Universal'),
(8,3,'Mecánico de mantenimiento'),
(9,3,'Soldador estructuras metálicas');

/*Table structure for table `colaboradores` */

DROP TABLE IF EXISTS `colaboradores`;

CREATE TABLE `colaboradores` (
  `idcolaboradores` int(11) NOT NULL AUTO_INCREMENT,
  `apellidos` varchar(40) NOT NULL,
  `nombres` varchar(40) NOT NULL,
  `idcargo` int(11) NOT NULL,
  `idsede` int(11) NOT NULL,
  `telefono` varchar(9) NOT NULL,
  `tipocontrato` char(1) NOT NULL,
  `cv` varchar(100) DEFAULT NULL,
  `direccion` varchar(70) NOT NULL,
  `fecharegistro` datetime NOT NULL DEFAULT current_timestamp(),
  `fechaupdate` datetime DEFAULT NULL,
  `estado` char(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idcolaboradores`),
  KEY `fk_idcargo_col` (`idcargo`),
  CONSTRAINT `fk_idcargo_col` FOREIGN KEY (`idcargo`) REFERENCES `cargo` (`idcargo`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

/*Data for the table `colaboradores` */

insert  into `colaboradores`(`idcolaboradores`,`apellidos`,`nombres`,`idcargo`,`idsede`,`telefono`,`tipocontrato`,`cv`,`direccion`,`fecharegistro`,`fechaupdate`,`estado`) values 
(5,'Sanchez','Anderson',1,2,'985214671','c',NULL,'av.los angeles','2023-04-18 09:09:47',NULL,'1'),
(6,'Castro','Julian',2,3,'952487879','p',NULL,'av. los claveles','2023-04-18 09:09:47',NULL,'1');

/*Table structure for table `escuelas` */

DROP TABLE IF EXISTS `escuelas`;

CREATE TABLE `escuelas` (
  `idescuela` int(11) NOT NULL AUTO_INCREMENT,
  `escuela` varchar(50) NOT NULL,
  PRIMARY KEY (`idescuela`),
  UNIQUE KEY `uk_escuela_esc` (`escuela`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

/*Data for the table `escuelas` */

insert  into `escuelas`(`idescuela`,`escuela`) values 
(2,'Administración'),
(1,'ETI'),
(3,'Metal mecánica');

/*Table structure for table `estudiantes` */

DROP TABLE IF EXISTS `estudiantes`;

CREATE TABLE `estudiantes` (
  `idestudiante` int(11) NOT NULL AUTO_INCREMENT,
  `apellidos` varchar(40) NOT NULL,
  `nombres` varchar(40) NOT NULL,
  `tipodocumento` char(1) NOT NULL DEFAULT 'D',
  `nrodocumento` char(8) NOT NULL,
  `fechanacimiento` date NOT NULL,
  `idcarrera` int(11) NOT NULL,
  `idsede` int(11) NOT NULL,
  `fotografia` varchar(100) DEFAULT NULL,
  `fecharegistro` datetime NOT NULL DEFAULT current_timestamp(),
  `fechaupdate` datetime DEFAULT NULL,
  `estado` char(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idestudiante`),
  UNIQUE KEY `uk_nrodocumento_est` (`tipodocumento`,`nrodocumento`),
  KEY `fk_idcarrera_est` (`idcarrera`),
  KEY `fk_idsede_est` (`idsede`),
  CONSTRAINT `fk_idcarrera_est` FOREIGN KEY (`idcarrera`) REFERENCES `carreras` (`idcarrera`),
  CONSTRAINT `fk_idsede_est` FOREIGN KEY (`idsede`) REFERENCES `sedes` (`idsede`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

/*Data for the table `estudiantes` */

insert  into `estudiantes`(`idestudiante`,`apellidos`,`nombres`,`tipodocumento`,`nrodocumento`,`fechanacimiento`,`idcarrera`,`idsede`,`fotografia`,`fecharegistro`,`fechaupdate`,`estado`) values 
(1,'Martinez','Carlos','D','44445555','2000-01-01',1,1,NULL,'2023-04-18 07:58:28',NULL,'1'),
(2,'Ochoa','Fiorella','D','77778888','2000-10-10',4,2,NULL,'2023-04-18 07:58:28',NULL,'1'),
(3,'Perez','Roxana','D','88881111','2001-03-03',7,3,NULL,'2023-04-18 07:58:28',NULL,'1'),
(4,'Quintana','Tania','D','33334444','2001-05-05',9,4,NULL,'2023-04-18 07:58:28',NULL,'1'),
(5,'Francia Minaya','Jhon','D','12345678','1984-09-20',5,1,NULL,'2023-04-18 07:58:52',NULL,'1'),
(6,'Munayco','José','D','77779999','1999-09-20',3,2,NULL,'2023-04-18 07:58:52',NULL,'1'),
(7,'Prada','Teresa','C','01234567','2002-09-25',3,2,NULL,'2023-04-18 07:58:52',NULL,'1');

/*Table structure for table `sedes` */

DROP TABLE IF EXISTS `sedes`;

CREATE TABLE `sedes` (
  `idsede` int(11) NOT NULL AUTO_INCREMENT,
  `sede` varchar(40) NOT NULL,
  PRIMARY KEY (`idsede`),
  UNIQUE KEY `uk_sede_sde` (`sede`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

/*Data for the table `sedes` */

insert  into `sedes`(`idsede`,`sede`) values 
(4,'Ayacucho'),
(1,'Chincha'),
(3,'Ica'),
(2,'Pisco');

/* Procedure structure for procedure `spu_cargo_listar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_cargo_listar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_cargo_listar`()
BEGIN
	SELECT * FROM cargo ORDER BY 2;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_carreras_listar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_carreras_listar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_carreras_listar`(IN _idescuela INT)
BEGIN
	SELECT idcarrera, carrera 
		FROM carreras
		WHERE idescuela = _idescuela;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_colaboradores_listar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_colaboradores_listar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_colaboradores_listar`()
BEGIN
	SELECT	COL.idcolaboradores,
				COL.nombres,
				COL.apellidos,
				CARG.cargo,
				SED.sede,
				COL.tipocontrato,
				COL.cv,
				COL.direccion
				
		FROM colaboradores COL
		INNER JOIN sedes SED ON SED.idsede = COL.idsede
		INNER JOIN cargo CARG ON CARG.idcargo = COL.idcargo 
		WHERE COL.estado = '1';
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_escuelas_listar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_escuelas_listar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_escuelas_listar`()
BEGIN 
	SELECT * FROM escuelas ORDER BY 2;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_estudiantes_listar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_estudiantes_listar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_estudiantes_listar`()
BEGIN
	SELECT	EST.idestudiante,
				EST.apellidos, EST.nombres,
				EST.tipodocumento, EST.nrodocumento,
				EST.fechanacimiento,
				ESC.escuela,
				CAR.carrera,
				SED.sede,
				EST.fotografia
		FROM estudiantes EST
		INNER JOIN carreras CAR ON CAR.idcarrera = EST.idcarrera
		INNER JOIN sedes SED ON SED.idsede = EST.idsede
		INNER JOIN escuelas ESC ON ESC.idescuela = CAR.idescuela
		WHERE EST.estado = '1';
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_estudiantes_registrar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_estudiantes_registrar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_estudiantes_registrar`(
	IN _apellidos 			VARCHAR(40),
	IN _nombres 			VARCHAR(40),
	IN _tipodocumento		CHAR(1),
	IN _nrodocumento		CHAR(8),
	IN _fechanacimiento	DATE,
	IN _idcarrera 			INT,
	IN _idsede 				INT,
	IN _fotografia 		VARCHAR(100)
)
BEGIN
	-- Validar el contenido de _fotografia
	IF _fotografia = '' THEN 
		SET _fotografia = NULL;
	END IF;

	INSERT INTO estudiantes 
	(apellidos, nombres, tipodocumento, nrodocumento, fechanacimiento, idcarrera, idsede, fotografia) VALUES
	(_apellidos, _nombres, _tipodocumento, _nrodocumento, _fechanacimiento, _idcarrera, _idsede, _fotografia);
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_sedes_listar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_sedes_listar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_sedes_listar`()
BEGIN
	SELECT * FROM sedes ORDER BY 2;
END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
