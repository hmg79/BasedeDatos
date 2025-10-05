-- ==========================================================
-- BD: SIGEF – Esquema completo (MySQL 8)
-- ==========================================================
CREATE DATABASE IF NOT EXISTS sigef
  DEFAULT CHARACTER SET utf8mb4
  DEFAULT COLLATE utf8mb4_unicode_ci;
USE sigef;
SET NAMES utf8mb4;

-- =========================
-- Catálogos / dominios
-- =========================
CREATE TABLE IF NOT EXISTS rol (
  id TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
  codigo VARCHAR(32) NOT NULL UNIQUE,   -- 'DEP', 'INSTITUCION'
  nombre VARCHAR(64) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS nivel (
  id TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
  codigo VARCHAR(4) NOT NULL UNIQUE,    -- 'TP', 'CL', 'FP'
  nombre VARCHAR(64) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS estado_matricula (
  id TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
  codigo VARCHAR(16) NOT NULL UNIQUE,   -- 'INSCRIPTO','CURSANDO','EGRESADO','ABANDONO'
  nombre VARCHAR(64) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB;

-- =========================
-- Territorio e instituciones
-- =========================
CREATE TABLE IF NOT EXISTS provincia (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(100) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY uq_provincia_nombre (nombre)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS localidad (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  provincia_id BIGINT UNSIGNED NOT NULL,
  nombre VARCHAR(100) NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_localidad_provincia
    FOREIGN KEY (provincia_id) REFERENCES provincia(id)
    ON UPDATE CASCADE ON DELETE RESTRICT,
  UNIQUE KEY uq_localidad (provincia_id, nombre),
  KEY idx_localidad_provincia (provincia_id)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS institucion (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  localidad_id BIGINT UNSIGNED NOT NULL,
  nombre VARCHAR(150) NOT NULL,
  codigo_cue VARCHAR(30) NULL,
  direccion VARCHAR(200) NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_institucion_localidad
    FOREIGN KEY (localidad_id) REFERENCES localidad(id)
    ON UPDATE CASCADE ON DELETE RESTRICT,
  UNIQUE KEY uq_institucion_nombre (localidad_id, nombre),
  UNIQUE KEY uq_institucion_cue (codigo_cue)
) ENGINE=InnoDB;

-- =========================
-- Catálogo de cursos (único en la provincia)
-- =========================
CREATE TABLE IF NOT EXISTS curso_catalogo (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(180) NOT NULL,
  nivel_id TINYINT UNSIGNED NOT NULL,    -- TP/CL/FP
  resolucion VARCHAR(32) NULL,           -- NULL si 'S/N'
  PRIMARY KEY (id),
  CONSTRAINT fk_cc_nivel FOREIGN KEY (nivel_id) REFERENCES nivel(id)
    ON UPDATE CASCADE ON DELETE RESTRICT,
  UNIQUE KEY uq_cc_nombre_nivel (nombre, nivel_id)
) ENGINE=InnoDB;

-- =========================
-- Ofertas: relación Institución ↔ Curso del catálogo
-- =========================
CREATE TABLE IF NOT EXISTS institucion_curso (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  institucion_id BIGINT UNSIGNED NOT NULL,
  curso_catalogo_id BIGINT UNSIGNED NOT NULL,
  activo BOOLEAN NOT NULL DEFAULT TRUE,
  PRIMARY KEY (id),
  CONSTRAINT fk_ic_institucion
    FOREIGN KEY (institucion_id) REFERENCES institucion(id)
    ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT fk_ic_catalogo
    FOREIGN KEY (curso_catalogo_id) REFERENCES curso_catalogo(id)
    ON UPDATE CASCADE ON DELETE RESTRICT,
  UNIQUE KEY uq_ic_inst_catalogo (institucion_id, curso_catalogo_id),
  KEY idx_ic_activo (activo)
) ENGINE=InnoDB;

-- =========================
-- Usuarios (login) y seguridad
-- =========================
CREATE TABLE IF NOT EXISTS usuario (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  nombre_usuario VARCHAR(50) NOT NULL UNIQUE,
  correo VARCHAR(120) NOT NULL UNIQUE,
  contrasena_hash VARCHAR(255) NOT NULL,
  rol_id TINYINT UNSIGNED NOT NULL,
  institucion_id BIGINT UNSIGNED NULL,      -- NULL si rol = DEP
  activo BOOLEAN NOT NULL DEFAULT TRUE,
  intentos_fallidos TINYINT UNSIGNED NOT NULL DEFAULT 0,
  bloqueado_hasta DATETIME NULL,
  creado_en TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  CONSTRAINT fk_usuario_rol
    FOREIGN KEY (rol_id) REFERENCES rol(id)
    ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT fk_usuario_institucion
    FOREIGN KEY (institucion_id) REFERENCES institucion(id)
    ON UPDATE CASCADE ON DELETE SET NULL
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS sesion_acceso (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  usuario_id BIGINT UNSIGNED NULL,
  ip VARCHAR(45) NULL,
  exito BOOLEAN NOT NULL,
  mensaje VARCHAR(200) NULL,
  creado_en TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  CONSTRAINT fk_sesion_usuario
    FOREIGN KEY (usuario_id) REFERENCES usuario(id)
    ON UPDATE CASCADE ON DELETE SET NULL,
  KEY idx_sesion_usuario (usuario_id),
  KEY idx_sesion_fecha (creado_en)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS recupero_contrasena (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  usuario_id BIGINT UNSIGNED NOT NULL,
  token CHAR(64) NOT NULL UNIQUE,
  expira DATETIME NOT NULL,
  usado BOOLEAN NOT NULL DEFAULT FALSE,
  usado_en DATETIME NULL,
  creado_en TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  CONSTRAINT fk_rc_usuario
    FOREIGN KEY (usuario_id) REFERENCES usuario(id)
    ON UPDATE CASCADE ON DELETE CASCADE,
  KEY idx_rc_usuario (usuario_id),
  KEY idx_rc_expira (expira)
) ENGINE=InnoDB;

-- =========================
-- Alumnos, períodos y matrículas
-- =========================
CREATE TABLE IF NOT EXISTS alumno (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  dni VARCHAR(20) NULL,
  apellido VARCHAR(80) NULL,
  nombre VARCHAR(80) NULL,
  PRIMARY KEY (id),
  UNIQUE KEY uq_alumno_dni (dni)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS periodo (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  anio SMALLINT NOT NULL,
  cuatrimestre TINYINT NULL,      -- 1, 2 o NULL
  fecha_inicio DATE NULL,
  fecha_fin DATE NULL,
  PRIMARY KEY (id),
  UNIQUE KEY uq_periodo (anio, cuatrimestre),
  CONSTRAINT chk_cuatrimestre CHECK (cuatrimestre IN (1,2) OR cuatrimestre IS NULL)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS matricula (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  alumno_id BIGINT UNSIGNED NOT NULL,
  institucion_curso_id BIGINT UNSIGNED NOT NULL,
  periodo_id INT UNSIGNED NOT NULL,
  estado_id TINYINT UNSIGNED NOT NULL,     -- estado actual
  fecha_estado DATE NULL,
  creado_en TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  actualizado_en TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  CONSTRAINT fk_matricula_alumno
    FOREIGN KEY (alumno_id) REFERENCES alumno(id)
    ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT fk_matricula_oferta
    FOREIGN KEY (institucion_curso_id) REFERENCES institucion_curso(id)
    ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT fk_matricula_periodo
    FOREIGN KEY (periodo_id) REFERENCES periodo(id)
    ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT fk_matricula_estado
    FOREIGN KEY (estado_id) REFERENCES estado_matricula(id)
    ON UPDATE CASCADE ON DELETE RESTRICT,
  UNIQUE KEY uq_matricula (alumno_id, institucion_curso_id, periodo_id),
  KEY idx_matricula_alumno (alumno_id),
  KEY idx_matricula_periodo_estado (periodo_id, estado_id)
) ENGINE=InnoDB;

-- Historial 
CREATE TABLE IF NOT EXISTS matricula_estado_historial (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  matricula_id BIGINT UNSIGNED NOT NULL,
  estado_id TINYINT UNSIGNED NOT NULL,
  fecha DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  observacion VARCHAR(255) NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_mh_matricula
    FOREIGN KEY (matricula_id) REFERENCES matricula(id)
    ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT fk_mh_estado
    FOREIGN KEY (estado_id) REFERENCES estado_matricula(id)
    ON UPDATE CASCADE ON DELETE RESTRICT,
  KEY idx_mh_matricula (matricula_id)
) ENGINE=InnoDB;

-- ============================================
-- Datos base (roles, niveles, estados)
-- ============================================
INSERT INTO rol (id, codigo, nombre) VALUES
 (1,'DEP','Departamento'),
 (2,'INSTITUCION','Institución')
ON DUPLICATE KEY UPDATE nombre=VALUES(nombre);

INSERT INTO nivel (id, codigo, nombre) VALUES
 (1,'TP','Terminalidad Primaria'),
 (2,'CL','Capacitación Laboral'),
 (3,'FP','Formación Profesional')
ON DUPLICATE KEY UPDATE nombre=VALUES(nombre);

INSERT INTO estado_matricula (id, codigo, nombre) VALUES
 (1,'INSCRIPTO','Inscripto'),
 (2,'CURSANDO','Cursando'),
 (3,'EGRESADO','Egresado'),
 (4,'ABANDONO','Abandono')
ON DUPLICATE KEY UPDATE nombre=VALUES(nombre);

INSERT INTO provincia(nombre) VALUES 
('Formosa')
ON DUPLICATE KEY UPDATE nombre=VALUES(nombre);
-- ==========================================================
-- Regla 1: Alumno con máx. 2 ofertas CURSANDO por período
-- ==========================================================
DELIMITER $$

CREATE TRIGGER trg_matricula_bi_max2
BEFORE INSERT ON matricula
FOR EACH ROW
BEGIN
  DECLARE v_es_cursando BOOLEAN DEFAULT FALSE;
  DECLARE v_cant INT DEFAULT 0;
  SELECT (em.codigo='CURSANDO') INTO v_es_cursando
  FROM estado_matricula em WHERE em.id=NEW.estado_id;
  IF v_es_cursando THEN
    SELECT COUNT(*) INTO v_cant
    FROM matricula m
    JOIN estado_matricula e ON e.id=m.estado_id
    WHERE m.alumno_id=NEW.alumno_id
      AND m.periodo_id=NEW.periodo_id
      AND e.codigo='CURSANDO';
    IF v_cant >= 2 THEN
      SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT='Regla: el alumno ya cursa 2 ofertas en este período.';
    END IF;
  END IF;
END$$

CREATE TRIGGER trg_matricula_bu_max2
BEFORE UPDATE ON matricula
FOR EACH ROW
BEGIN
  DECLARE v_es_cursando BOOLEAN DEFAULT FALSE;
  DECLARE v_cant INT DEFAULT 0;
  SELECT (em.codigo='CURSANDO') INTO v_es_cursando
  FROM estado_matricula em WHERE em.id=NEW.estado_id;
  IF v_es_cursando THEN
    SELECT COUNT(*) INTO v_cant
    FROM matricula m
    JOIN estado_matricula e ON e.id=m.estado_id
    WHERE m.alumno_id=NEW.alumno_id
      AND m.periodo_id=NEW.periodo_id
      AND e.codigo='CURSANDO'
      AND m.id<>NEW.id;
    IF v_cant >= 2 THEN
      SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT='Regla: el alumno ya cursa 2 ofertas en este período.';
    END IF;
  END IF;
END$$

-- ==========================================================
-- Regla 2: Cada institución debe tener ≥1 oferta TP ACTIVA
--  (bloquea borrar/desactivar la última TP)
-- ==========================================================
CREATE TRIGGER trg_ic_bd_tp_minima
BEFORE DELETE ON institucion_curso
FOR EACH ROW
BEGIN
  DECLARE v_codigo_nivel VARCHAR(4);
  DECLARE v_quedan INT DEFAULT 0;
  SELECT n.codigo INTO v_codigo_nivel
  FROM curso_catalogo cc
  JOIN nivel n ON n.id=cc.nivel_id
  WHERE cc.id=OLD.curso_catalogo_id;

  IF v_codigo_nivel='TP' THEN
    SELECT COUNT(*) INTO v_quedan
    FROM institucion_curso ic
    JOIN curso_catalogo cc ON cc.id=ic.curso_catalogo_id
    JOIN nivel n ON n.id=cc.nivel_id
    WHERE ic.institucion_id=OLD.institucion_id
      AND ic.id<>OLD.id
      AND ic.activo=TRUE
      AND n.codigo='TP';
    IF v_quedan=0 THEN
      SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT='Regla: no puede eliminar la última oferta de Terminalidad Primaria de la institución.';
    END IF;
  END IF;
END$$

CREATE TRIGGER trg_ic_bu_tp_minima
BEFORE UPDATE ON institucion_curso
FOR EACH ROW
BEGIN
  DECLARE v_cod_old VARCHAR(4);
  DECLARE v_cod_new VARCHAR(4);
  DECLARE v_quedan INT DEFAULT 0;

  -- Nivel del curso anterior y del nuevo
  SELECT n.codigo INTO v_cod_old
  FROM curso_catalogo cc JOIN nivel n ON n.id=cc.nivel_id
  WHERE cc.id=OLD.curso_catalogo_id;

  SELECT n.codigo INTO v_cod_new
  FROM curso_catalogo cc JOIN nivel n ON n.id=cc.nivel_id
  WHERE cc.id=NEW.curso_catalogo_id;

  IF OLD.activo=TRUE AND NEW.activo=FALSE AND v_cod_old='TP' THEN
    SELECT COUNT(*) INTO v_quedan
    FROM institucion_curso ic
    JOIN curso_catalogo cc ON cc.id=ic.curso_catalogo_id
    JOIN nivel n ON n.id=cc.nivel_id
    WHERE ic.institucion_id=OLD.institucion_id
      AND ic.id<>OLD.id
      AND ic.activo=TRUE
      AND n.codigo='TP';
    IF v_quedan=0 THEN
      SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT='Regla: la institución debe conservar al menos una oferta TP activa.';
    END IF;
  END IF;

  IF v_cod_old='TP' AND v_cod_new<>'TP' THEN
    SELECT COUNT(*) INTO v_quedan
    FROM institucion_curso ic
    JOIN curso_catalogo cc ON cc.id=ic.curso_catalogo_id
    JOIN nivel n ON n.id=cc.nivel_id
    WHERE ic.institucion_id=OLD.institucion_id
      AND ic.id<>OLD.id
      AND ic.activo=TRUE
      AND n.codigo='TP';
    IF v_quedan=0 THEN
      SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT='Regla: la institución debe conservar al menos una oferta TP activa.';
    END IF;
  END IF;
END$$

DELIMITER ;

-- =========================
-- Vistas de control / soporte
-- =========================
CREATE OR REPLACE VIEW v_institucion_sin_tp_activa AS
SELECT i.id AS institucion_id, i.nombre AS institucion
FROM institucion i
LEFT JOIN (
  SELECT ic.institucion_id
  FROM institucion_curso ic
  JOIN curso_catalogo cc ON cc.id=ic.curso_catalogo_id
  JOIN nivel n ON n.id=cc.nivel_id
  WHERE ic.activo=TRUE AND n.codigo='TP'
  GROUP BY ic.institucion_id
) t ON t.institucion_id=i.id
WHERE t.institucion_id IS NULL;

CREATE OR REPLACE VIEW v_cursando_por_alumno AS
SELECT m.alumno_id, m.periodo_id, COUNT(*) AS ofertas_cursando
FROM matricula m
JOIN estado_matricula e ON e.id=m.estado_id AND e.codigo='CURSANDO'
GROUP BY m.alumno_id, m.periodo_id;
