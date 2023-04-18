CREATE DATABASE senatimat;
USE senatimat;

CREATE TABLE escuelas
(
	idescuela 		INT AUTO_INCREMENT PRIMARY KEY,
	escuela 			VARCHAR(50) 	NOT NULL,
	CONSTRAINT uk_escuela_esc UNIQUE (escuela)
)ENGINE = INNODB;

INSERT INTO escuelas (escuela) VALUES
	('ETI'), -- 1
	('Administración'), -- 2
	('Metal mecánica'); -- 3

SELECT * FROM escuelas ORDER BY 1;

-- ***** SEGUNDA TABLA ***** --

CREATE TABLE carreras
(
	idcarrera 		INT AUTO_INCREMENT PRIMARY KEY,
	idescuela 		INT 			NOT NULL,
	carrera 			VARCHAR(100)NOT NULL,
	CONSTRAINT fk_idescuela_car FOREIGN KEY (idescuela) REFERENCES escuelas (idescuela),
	CONSTRAINT uk_carrera_car UNIQUE (carrera)
)ENGINE = INNODB;

INSERT INTO carreras (idescuela, carrera) VALUES
	(1, 'Diseño Gráfico Digital'),
	(1, 'Ingeniería de Software con IA'),
	(1, 'Cyberseguridad'),
	(2, 'Administración de empresas'),
	(2, 'Administración Industrial'),
	(2, 'Prevencionista de Riesgo'),
	(3, 'Soldador Universal'),
	(3, 'Mecánico de mantenimiento'),
	(3, 'Soldador estructuras metálicas');

SELECT * FROM carreras ORDER BY 1;

-- ****** TERCERA TABLA ******* --
CREATE TABLE sedes
(
	idsede 		INT AUTO_INCREMENT PRIMARY KEY,
	sede 			VARCHAR(40)		NOT NULL,
	CONSTRAINT uk_sede_sde UNIQUE (sede)
)ENGINE = INNODB;

INSERT INTO sedes (sede) VALUES
	('Chincha'),
	('Pisco'),
	('Ica'),
	('Ayacucho');

SELECT * FROM sedes ORDER BY 1;

-- ******* CUARTA TABLA ********* --
CREATE TABLE estudiantes
(
	idestudiante 		INT AUTO_INCREMENT PRIMARY KEY,
	apellidos			VARCHAR(40)		NOT NULL,
	nombres 				VARCHAR(40)		NOT NULL,
	tipodocumento 		CHAR(1)			NOT NULL DEFAULT 'D',
	nrodocumento		CHAR(8)			NOT NULL,
	fechanacimiento	DATE 				NOT NULL,
	idcarrera 			INT 				NOT NULL,
	idsede 				INT 				NOT NULL,
	fotografia 			VARCHAR(100)	NULL,
	fecharegistro		DATETIME 		NOT NULL DEFAULT NOW(),
	fechaupdate 		DATETIME 		NULL,
	estado 				CHAR(1)			NOT NULL DEFAULT '1',
	CONSTRAINT uk_nrodocumento_est UNIQUE (tipodocumento, nrodocumento),
	CONSTRAINT fk_idcarrera_est FOREIGN KEY (idcarrera) REFERENCES carreras (idcarrera),
	CONSTRAINT fk_idsede_est FOREIGN KEY (idsede) REFERENCES sedes (idsede)
)ENGINE = INNODB;

INSERT INTO estudiantes 
	(apellidos, nombres, nrodocumento, fechanacimiento, idcarrera, idsede) VALUES
	('Martinez', 'Carlos', '44445555', '2000-01-01', 1, 1),
	('Ochoa', 'Fiorella', '77778888', '2000-10-10', 4, 2),
	('Perez', 'Roxana', '88881111', '2001-03-03', 7, 3),
	('Quintana', 'Tania', '33334444', '2001-05-05', 9, 4);

SELECT * FROM estudiantes;




CREATE TABLE colaboradores
(
	idcolaboradores		INT AUTO_INCREMENT PRIMARY KEY,
	apellidos				VARCHAR(40)    		NOT NULL,
	nombres					VARCHAR(40)				NOT NULL,
	idcargo					INT						NOT NULL,
	idsede					INT 						NOT NULL,
	telefono					VARCHAR(9)				NOT NULL,
	tipocontrato  			CHAR(1) 					NOT NULL,
	cv							VARCHAR(100) 			NULL,
	direccion				VARCHAR(70) 			NOT NULL,  
	fecharegistro			DATETIME 				NOT NULL DEFAULT NOW(),
	fechaupdate				DATETIME	 				NULL,
	estado					CHAR(1) 					NOT NULL DEFAULT '1',
	CONSTRAINT fk_idcargo_col FOREIGN KEY (idcargo) REFERENCES cargo (idcargo)
)ENGINE = INNODB;


INSERT INTO colaboradores (apellidos, nombres, idcargo, idsede, telefono, tipocontrato, direccion) VALUES
('Sanchez', 'Anderson', 1, 2, '985214671', 'c', 'av.los angeles'),
('Castro', 'Julian', 2, 3, '952487879', 'p', 'av. los claveles');

SELECT * FROM colaboradores


CREATE TABLE Cargo
(
	idcargo				INT AUTO_INCREMENT PRIMARY KEY,
	cargo					VARCHAR(30) 			NOT NULL
)ENGINE = INNODB;

INSERT INTO cargo (cargo) VALUES
('Instructor'),
('Jefe Centro'),
('Asist. Administrativo'),
('Asist. Académico'),
('Coordinador ETI'),
('Coordinador CIS');