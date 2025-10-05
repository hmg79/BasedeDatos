USE sigef;
SET NAMES utf8mb4;

-- Catálogo de cursos a nivel provincia
-- Carga masiva de datos
INSERT INTO curso_catalogo (nombre, nivel_id, resolucion) VALUES
('TERMINALIDAD PRIMARIA',         (SELECT id FROM nivel WHERE codigo='TP'), 'S/N'),
('ASITENTE APÍCOLA',         (SELECT id FROM nivel WHERE codigo='FP'), '4458/15'),
('OPERARIO HORTICOLA',       (SELECT id FROM nivel WHERE codigo='FP'), '4458/15'),
('AUXILIAR EN CONSTRUCCIONES',(SELECT id FROM nivel WHERE codigo='FP'), 'S/N'),
('ALBAÑIL',                  (SELECT id FROM nivel WHERE codigo='FP'), '3515/15'),
('AUXILIAR EN INSTALACIONES ELECTRICAS DOMICILIARIAS',(SELECT id FROM nivel WHERE codigo='FP'), '3515/15'),
('MONTADOR ELECTRICISTA DOMICILIARIO',(SELECT id FROM nivel WHERE codigo='FP'), '4124/18'),
('AUXILIAR EN INSTALACIONES SANITARIAS',(SELECT id FROM nivel WHERE codigo='FP'), '4124/18'),
('MONTADOR DE INSTALACIONES SANITARIAS DOMICILIARIAS',(SELECT id FROM nivel WHERE codigo='FP'), '4383/15'),
('AUXILIAR MECÁNICO DE MOTORES NAFTEROS',(SELECT id FROM nivel WHERE codigo='FP'), '4383/15'),
('OPERADOR DE IMFORMÁTICA PARA LA ADMINISTRACIÓN Y GESTIÓN',(SELECT id FROM nivel WHERE codigo='FP'), '5566/15'),
('HERRERO/A',                (SELECT id FROM nivel WHERE codigo='FP'), '4708/12'),
('ORGANIZADOR/A DE EVENTOS', (SELECT id FROM nivel WHERE codigo='FP'), 'S/N'),
('AUXILIAR GASTRONÓMICO',    (SELECT id FROM nivel WHERE codigo='FP'), 'S/N'),
('COCINERO/A',               (SELECT id FROM nivel WHERE codigo='FP'), '1844/18'),
('PANADERO/A',               (SELECT id FROM nivel WHERE codigo='FP'), '1844/18'),
('PASTELERO/A',              (SELECT id FROM nivel WHERE codigo='FP'), '1844/18'),
('CONFECCIONISTA A MEDIDA: MODISTO/A',(SELECT id FROM nivel WHERE codigo='FP'), '1844/18'),
('MECÁNICO DE MOTOS',        (SELECT id FROM nivel WHERE codigo='FP'), '4360/15'),
('PELUQUERO/A',              (SELECT id FROM nivel WHERE codigo='FP'), '624/07'),
('AUXILIAR DE FAMILIA ESPECIALIZADO EN CUIDADOS',(SELECT id FROM nivel WHERE codigo='FP'), '3330/07'),
('AUXILIAR EN CUIDADOS GEREONTOLOGICOS',(SELECT id FROM nivel WHERE codigo='FP'), '3260/19'),

('REPARADOR DE RADIO Y TV',  (SELECT id FROM nivel WHERE codigo='CL'), '624/07'),
('ARMADOR Y REPARADOR DE PC',(SELECT id FROM nivel WHERE codigo='CL'), '4705/09'),
('CONTABILIDAD',             (SELECT id FROM nivel WHERE codigo='CL'), '624/07'),
('PINTURA SOBRE TELA',       (SELECT id FROM nivel WHERE codigo='CL'), '624/07'),
('ARTESANIA MANUAL',         (SELECT id FROM nivel WHERE codigo='CL'), '624/07'),
('INSEMINACIÓN ARTIFICIAL GANADERA',(SELECT id FROM nivel WHERE codigo='CL'), '624/07'),
('MANTENIMIENTO DE EDIFICIO',(SELECT id FROM nivel WHERE codigo='CL'), '624/07'),
('ADMINISTRACIÓN DE REDES',  (SELECT id FROM nivel WHERE codigo='CL'), '4705/09'),
('BELLEZA INTEGRAL',         (SELECT id FROM nivel WHERE codigo='CL'), '3330/07'),
('TEJIDO ARTESANAL',         (SELECT id FROM nivel WHERE codigo='CL'), '624/07'),
('ASISTENTE EN TURISMO',     (SELECT id FROM nivel WHERE codigo='CL'), '624/07'),
('ADMINISTRACION Y GESTIÓN DE MICROEMPRENDIMIENTO',(SELECT id FROM nivel WHERE codigo='CL'), '624/07'),
('ARTESANÍA EN MADERA',      (SELECT id FROM nivel WHERE codigo='CL'), '624/07'),
('ELABORACIÓN DE COMIDAS PARA CATERING',(SELECT id FROM nivel WHERE codigo='CL'), '624/07'),
('REPARADOR DE ELECTRODOMÉSTICOS',(SELECT id FROM nivel WHERE codigo='CL'), '624/07'),
('MECÁNICA DENTAL ESPECIALIZADO EN PRÓTESIS REMOVIBLES DE ACRÍLICO',(SELECT id FROM nivel WHERE codigo='CL'), '624/07'),
('MECÁNICA GENERAL',         (SELECT id FROM nivel WHERE codigo='CL'), '624/07'),
('RELOJERÍA',                (SELECT id FROM nivel WHERE codigo='CL'), '624/07'),
('CARPINTERO/A DE MELAMINA', (SELECT id FROM nivel WHERE codigo='CL'), '624/07'),
('CARPINTERÍA CREATIVA',     (SELECT id FROM nivel WHERE codigo='CL'), '624/07'),
('ARTESANIA EN CHAGUAR',     (SELECT id FROM nivel WHERE codigo='CL'), '624/07'),
('AUXILIAR AGROPECUARIO',    (SELECT id FROM nivel WHERE codigo='CL'), '624/07'),
('AUXILIAR EN GANADERÍA',    (SELECT id FROM nivel WHERE codigo='CL'), '624/07'),
('AUXILIAR EN INSTALACIÓN Y EXPLOTACIÓN DE APIARIO',(SELECT id FROM nivel WHERE codigo='CL'), '624/07'),
('HUERTA Y JARDINERIA',      (SELECT id FROM nivel WHERE codigo='CL'), '624/07'),
('JARDINERIA',               (SELECT id FROM nivel WHERE codigo='CL'), '624/07'),
('JARDINERIA Y PRODUCCION BAJO CUBIERTA',(SELECT id FROM nivel WHERE codigo='CL'), '624/07'),
('MECANICA LIGERA',          (SELECT id FROM nivel WHERE codigo='CL'), '624/07'),
('PRODUCCION FRUTIHORTICOLA',(SELECT id FROM nivel WHERE codigo='CL'), '624/07'),
('REPARACION DE IMPLEMENTOS AGRICOLAS',(SELECT id FROM nivel WHERE codigo='CL'), '624/07'),
('SOLDADURA ELÉCTRICA',      (SELECT id FROM nivel WHERE codigo='CL'), '624/07'),
('MECANICA DE MOTOS',        (SELECT id FROM nivel WHERE codigo='CL'), '624/07'),
('AUXILIAR EN PRODUCCIÓN VEGETAL',(SELECT id FROM nivel WHERE codigo='CL'), '624/07')
AS nuevos
ON DUPLICATE KEY UPDATE
resolucion = nuevos.resolucion;

-- Carga de Localidades
USE sigef;
SET NAMES utf8mb4;


-- Tomar el id de la provincia
SET @prov_id := (SELECT id FROM provincia WHERE nombre = 'Formosa');

-- Cargar las localidades
INSERT INTO localidad (provincia_id, nombre) VALUES
  (@prov_id, 'Formosa'),
  (@prov_id, 'Clorinda'),
  (@prov_id, 'Pirané'),
  (@prov_id, 'El Colorado'),
  (@prov_id, 'Ingeniero Juárez'),
  (@prov_id, 'Las Lomitas'),
  (@prov_id, 'Laguna Blanca'),
  (@prov_id, 'Ibarreta'),
  (@prov_id, 'Comandante Fontana'),
  (@prov_id, 'Herradura')
AS localidades
ON DUPLICATE KEY UPDATE 
nombre = localidades.nombre;

-- Carga de Instituciones

USE sigef;
SET NAMES utf8mb4;

-- Tomo los IDs de las 10 localidades (deben existir)
SET @loc_formosa  := (SELECT id FROM localidad WHERE nombre='Formosa');
SET @loc_clorinda := (SELECT id FROM localidad WHERE nombre='Clorinda');
SET @loc_pirane   := (SELECT id FROM localidad WHERE nombre='Pirané');
SET @loc_colorado := (SELECT id FROM localidad WHERE nombre='El Colorado');
SET @loc_ijuarez  := (SELECT id FROM localidad WHERE nombre='Ingeniero Juárez');
SET @loc_lomitas  := (SELECT id FROM localidad WHERE nombre='Las Lomitas');
SET @loc_lblanca  := (SELECT id FROM localidad WHERE nombre='Laguna Blanca');
SET @loc_ibarreta := (SELECT id FROM localidad WHERE nombre='Ibarreta');
SET @loc_cfontana := (SELECT id FROM localidad WHERE nombre='Comandante Fontana');
SET @loc_herradura:= (SELECT id FROM localidad WHERE nombre='Herradura');

-- ============ FORMOSA (10 instituciones) ============
INSERT INTO institucion (localidad_id, nombre, codigo_cue, direccion)
SELECT localidad_id, nombre, codigo_cue, direccion
FROM (
  SELECT @loc_formosa, 'NEP y FP N° 1',  'CUE-FOR-0001', 'Av. 25 de Mayo 100' UNION ALL
  SELECT @loc_formosa, 'NEP y FP N° 2',  'CUE-FOR-0002', 'Calle San Martín 250' UNION ALL
  SELECT @loc_formosa, 'NEP y FP N° 3',  'CUE-FOR-0003', 'Av. Italia 345' UNION ALL
  SELECT @loc_formosa, 'NEP y FP N° 4',  'CUE-FOR-0004', 'Av. Gutnisky 1200' UNION ALL
  SELECT @loc_formosa, 'NEP y FP N° 5',  'CUE-FOR-0005', 'Barrio Centro, Mz 3 Casa 12' UNION ALL
  SELECT @loc_formosa, 'NEP y FP N° 6',  'CUE-FOR-0006', 'Av. González Lelong 890' UNION ALL
  SELECT @loc_formosa, 'NEP y FP N° 7',  'CUE-FOR-0007', 'Calle España 560' UNION ALL
  SELECT @loc_formosa, 'NEP y FP N° 8',  'CUE-FOR-0008', 'Av. Néstor Kirchner 2100' UNION ALL
  SELECT @loc_formosa, 'NEP y FP N° 9',  'CUE-FOR-0009', 'Calle Maipú 430' UNION ALL
  SELECT @loc_formosa, 'NEP y FP N° 10', 'CUE-FOR-0010', 'Ruta 11 Km 5'
) AS nuevos (localidad_id, nombre, codigo_cue, direccion)
ON DUPLICATE KEY UPDATE
  direccion = nuevos.direccion,
  codigo_cue = nuevos.codigo_cue;

-- ============ CLORINDA (2) ============
INSERT INTO institucion (localidad_id, nombre, codigo_cue, direccion)
SELECT localidad_id, nombre, codigo_cue, direccion
FROM (
  SELECT @loc_clorinda, 'NEP y FP N° 11', 'CUE-CLO-0001', 'Av. San Vicente de Paul 150' UNION ALL
  SELECT @loc_clorinda, 'NEP y FP N° 12', 'CUE-CLO-0002', 'Calle Rivadavia 220'
) AS nuevos (localidad_id, nombre, codigo_cue, direccion)
ON DUPLICATE KEY UPDATE direccion = nuevos.direccion, codigo_cue = nuevos.codigo_cue;

-- ============ PIRANÉ (2) ============
INSERT INTO institucion (localidad_id, nombre, codigo_cue, direccion)
SELECT localidad_id, nombre, codigo_cue, direccion
FROM (
  SELECT @loc_pirane, 'NEP y FP N° 13', 'CUE-PIR-0001', 'Av. 9 de Julio 300' UNION ALL
  SELECT @loc_pirane, 'NEP y FP N° 14', 'CUE-PIR-0002', 'Calle Belgrano 180'
) AS nuevos (localidad_id, nombre, codigo_cue, direccion)
ON DUPLICATE KEY UPDATE direccion = nuevos.direccion, codigo_cue = nuevos.codigo_cue;

-- ============ EL COLORADO (2) ============
INSERT INTO institucion (localidad_id, nombre, codigo_cue, direccion)
SELECT localidad_id, nombre, codigo_cue, direccion
FROM (
  SELECT @loc_colorado, 'NEP y FP N° 15', 'CUE-COL-0001', 'Av. Libertad 75' UNION ALL
  SELECT @loc_colorado, 'NEP y FP N° 16', 'CUE-COL-0002', 'Calle Güemes 410'
) AS nuevos (localidad_id, nombre, codigo_cue, direccion)
ON DUPLICATE KEY UPDATE direccion = nuevos.direccion, codigo_cue = nuevos.codigo_cue;

-- ============ INGENIERO JUÁREZ (2) ============
INSERT INTO institucion (localidad_id, nombre, codigo_cue, direccion)
SELECT localidad_id, nombre, codigo_cue, direccion
FROM (
  SELECT @loc_ijuarez, 'NEP y FP N° 17', 'CUE-IJU-0001', 'Av. Independencia 640' UNION ALL
  SELECT @loc_ijuarez, 'NEP y FP N° 18', 'CUE-IJU-0002', 'Calle Moreno 95'
) AS nuevos (localidad_id, nombre, codigo_cue, direccion)
ON DUPLICATE KEY UPDATE direccion = nuevos.direccion, codigo_cue = nuevos.codigo_cue;

-- ============ LAS LOMITAS (2) ============
INSERT INTO institucion (localidad_id, nombre, codigo_cue, direccion)
SELECT localidad_id, nombre, codigo_cue, direccion
FROM (
  SELECT @loc_lomitas, 'NEP y FP N° 19', 'CUE-LLO-0001', 'Av. Sarmiento 210' UNION ALL
  SELECT @loc_lomitas, 'NEP y FP N° 20', 'CUE-LLO-0002', 'Calle Mitre 340'
) AS nuevos (localidad_id, nombre, codigo_cue, direccion)
ON DUPLICATE KEY UPDATE direccion = nuevos.direccion, codigo_cue = nuevos.codigo_cue;

-- ============ LAGUNA BLANCA (2) ============
INSERT INTO institucion (localidad_id, nombre, codigo_cue, direccion)
SELECT localidad_id, nombre, codigo_cue, direccion
FROM (
  SELECT @loc_lblanca, 'NEP y FP N° 21', 'CUE-LBL-0001', 'Av. San Martín 70' UNION ALL
  SELECT @loc_lblanca, 'NEP y FP N° 22', 'CUE-LBL-0002', 'Calle Italia 55'
) AS nuevos (localidad_id, nombre, codigo_cue, direccion)
ON DUPLICATE KEY UPDATE direccion = nuevos.direccion, codigo_cue = nuevos.codigo_cue;

-- ============ IBARRETA (2) ============
INSERT INTO institucion (localidad_id, nombre, codigo_cue, direccion)
SELECT localidad_id, nombre, codigo_cue, direccion
FROM (
  SELECT @loc_ibarreta, 'NEP y FP N° 23', 'CUE-IBA-0001', 'Av. 3 de Febrero 260' UNION ALL
  SELECT @loc_ibarreta, 'NEP y FP N° 24', 'CUE-IBA-0002', 'Calle Córdoba 102'
) AS nuevos (localidad_id, nombre, codigo_cue, direccion)
ON DUPLICATE KEY UPDATE direccion = nuevos.direccion, codigo_cue = nuevos.codigo_cue;

-- ============ COMANDANTE FONTANA (2) ============
INSERT INTO institucion (localidad_id, nombre, codigo_cue, direccion)
SELECT localidad_id, nombre, codigo_cue, direccion
FROM (
  SELECT @loc_cfontana, 'NEP y FP N° 25', 'CUE-CFO-0001', 'Av. 25 de Mayo 50' UNION ALL
  SELECT @loc_cfontana, 'NEP y FP N° 26', 'CUE-CFO-0002', 'Calle Salta 399'
) AS nuevos (localidad_id, nombre, codigo_cue, direccion)
ON DUPLICATE KEY UPDATE direccion = nuevos.direccion, codigo_cue = nuevos.codigo_cue;

-- ============ HERRADURA (2) ============
INSERT INTO institucion (localidad_id, nombre, codigo_cue, direccion)
SELECT localidad_id, nombre, codigo_cue, direccion
FROM (
  SELECT @loc_herradura, 'NEP y FP N° 27', 'CUE-HER-0001', 'Av. Costanera 10' UNION ALL
  SELECT @loc_herradura, 'NEP y FP N° 28', 'CUE-HER-0002', 'Calle 9 de Julio 220'
) AS nuevos (localidad_id, nombre, codigo_cue, direccion)
ON DUPLICATE KEY UPDATE direccion = nuevos.direccion, codigo_cue = nuevos.codigo_cue;
-- Carga de las relaciones entre los cursos y las instituciones
USE sigef;
SET NAMES utf8mb4;

-- Formosa (capital) — Institución: NEP y FP N° 1
INSERT INTO institucion_curso (institucion_id, curso_catalogo_id, activo) VALUES
  (1, 1, TRUE),
  (1, 24, TRUE),
  (1, 30, TRUE),
  (1, 15, TRUE),
  (1, 20, TRUE),
  (1, 16, TRUE),
  (1, 17, TRUE),
  (1, 53, TRUE),
  (1, 37, TRUE);

-- Formosa (capital) — Institución: NEP y FP N° 2
INSERT INTO institucion_curso (institucion_id, curso_catalogo_id, activo) VALUES
  (2, 1, TRUE),
  (2, 24, TRUE),
  (2, 30, TRUE),
  (2, 15, TRUE),
  (2, 20, TRUE),
  (2, 16, TRUE),
  (2, 17, TRUE),
  (2, 53, TRUE),
  (2, 37, TRUE);

-- Formosa (capital) — Institución: NEP y FP N° 3
INSERT INTO institucion_curso (institucion_id, curso_catalogo_id, activo) VALUES
  (3, 1, TRUE),
  (3, 24, TRUE),
  (3, 30, TRUE),
  (3, 15, TRUE),
  (3, 20, TRUE),
  (3, 16, TRUE),
  (3, 17, TRUE),
  (3, 53, TRUE),
  (3, 37, TRUE);

-- Formosa (capital) — Institución: NEP y FP N° 4
INSERT INTO institucion_curso (institucion_id, curso_catalogo_id, activo) VALUES
  (4, 1, TRUE),
  (4, 24, TRUE),
  (4, 30, TRUE),
  (4, 15, TRUE),
  (4, 20, TRUE),
  (4, 16, TRUE),
  (4, 17, TRUE),
  (4, 53, TRUE),
  (4, 37, TRUE);

-- Formosa (capital) — Institución: NEP y FP N° 5
INSERT INTO institucion_curso (institucion_id, curso_catalogo_id, activo) VALUES
  (5, 1, TRUE),
  (5, 24, TRUE),
  (5, 30, TRUE),
  (5, 15, TRUE),
  (5, 20, TRUE),
  (5, 16, TRUE),
  (5, 17, TRUE),
  (5, 53, TRUE),
  (5, 37, TRUE);

-- Formosa (capital) — Institución: NEP y FP N° 6
INSERT INTO institucion_curso (institucion_id, curso_catalogo_id, activo) VALUES
  (6, 1, TRUE),
  (6, 24, TRUE),
  (6, 30, TRUE),
  (6, 15, TRUE),
  (6, 20, TRUE),
  (6, 16, TRUE),
  (6, 17, TRUE),
  (6, 53, TRUE),
  (6, 37, TRUE);

-- Formosa (capital) — Institución: NEP y FP N° 7
INSERT INTO institucion_curso (institucion_id, curso_catalogo_id, activo) VALUES
  (7, 1, TRUE),
  (7, 24, TRUE),
  (7, 30, TRUE),
  (7, 15, TRUE),
  (7, 20, TRUE),
  (7, 16, TRUE),
  (7, 17, TRUE),
  (7, 53, TRUE),
  (7, 37, TRUE);

-- Formosa (capital) — Institución: NEP y FP N° 8
INSERT INTO institucion_curso (institucion_id, curso_catalogo_id, activo) VALUES
  (8, 1, TRUE),
  (8, 24, TRUE),
  (8, 30, TRUE),
  (8, 15, TRUE),
  (8, 20, TRUE),
  (8, 16, TRUE),
  (8, 17, TRUE),
  (8, 53, TRUE),
  (8, 37, TRUE);

-- Formosa (capital) — Institución: NEP y FP N° 9
INSERT INTO institucion_curso (institucion_id, curso_catalogo_id, activo) VALUES
  (9, 1, TRUE),
  (9, 24, TRUE),
  (9, 30, TRUE),
  (9, 15, TRUE),
  (9, 20, TRUE),
  (9, 16, TRUE),
  (9, 17, TRUE),
  (9, 53, TRUE),
  (9, 37, TRUE);

-- Formosa (capital) — Institución: NEP y FP N° 10
INSERT INTO institucion_curso (institucion_id, curso_catalogo_id, activo) VALUES
  (10, 1, TRUE),
  (10, 24, TRUE),
  (10, 30, TRUE),
  (10, 15, TRUE),
  (10, 20, TRUE),
  (10, 16, TRUE),
  (10, 17, TRUE),
  (10, 53, TRUE),
  (10, 37, TRUE);

-- Interior — Institución: NEP y FP N° 11
INSERT INTO institucion_curso (institucion_id, curso_catalogo_id, activo) VALUES
  (11, 1, TRUE),
  (11, 44, TRUE),
  (11, 47, TRUE),
  (11, 51, TRUE),
  (11, 19, TRUE),
  (11, 46, TRUE),
  (11, 29, TRUE),
  (11, 52, TRUE),
  (11, 53, TRUE);

-- Interior — Institución: NEP y FP N° 12
INSERT INTO institucion_curso (institucion_id, curso_catalogo_id, activo) VALUES
  (12, 1, TRUE),
  (12, 49, TRUE),
  (12, 47, TRUE),
  (12, 51, TRUE),
  (12, 19, TRUE),
  (12, 46, TRUE),
  (12, 29, TRUE),
  (12, 52, TRUE),
  (12, 53, TRUE);

-- Interior — Institución: NEP y FP N° 13
INSERT INTO institucion_curso (institucion_id, curso_catalogo_id, activo) VALUES
  (13, 1, TRUE),
  (13, 48, TRUE),
  (13, 47, TRUE),
  (13, 51, TRUE),
  (13, 19, TRUE),
  (13, 46, TRUE),
  (13, 29, TRUE),
  (13, 52, TRUE),
  (13, 53, TRUE);

-- Interior — Institución: NEP y FP N° 14
INSERT INTO institucion_curso (institucion_id, curso_catalogo_id, activo) VALUES
  (14, 1, TRUE),
  (14, 47, TRUE),
  (14, 48, TRUE),
  (14, 51, TRUE),
  (14, 19, TRUE),
  (14, 46, TRUE),
  (14, 29, TRUE),
  (14, 52, TRUE),
  (14, 53, TRUE);

-- Interior — Institución: NEP y FP N° 15
INSERT INTO institucion_curso (institucion_id, curso_catalogo_id, activo) VALUES
  (15, 1, TRUE),
  (15, 47, TRUE),
  (15, 48, TRUE),
  (15, 51, TRUE),
  (15, 19, TRUE),
  (15, 46, TRUE),
  (15, 29, TRUE),
  (15, 52, TRUE),
  (15, 53, TRUE);

-- Interior — Institución: NEP y FP N° 16
INSERT INTO institucion_curso (institucion_id, curso_catalogo_id, activo) VALUES
  (16, 1, TRUE),
  (16, 47, TRUE),
  (16, 48, TRUE),
  (16, 51, TRUE),
  (16, 19, TRUE),
  (16, 46, TRUE),
  (16, 29, TRUE),
  (16, 52, TRUE),
  (16, 53, TRUE);

-- Interior — Institución: NEP y FP N° 17
INSERT INTO institucion_curso (institucion_id, curso_catalogo_id, activo) VALUES
  (17, 1, TRUE),
  (17, 47, TRUE),
  (17, 48, TRUE),
  (17, 51, TRUE),
  (17, 19, TRUE),
  (17, 46, TRUE),
  (17, 29, TRUE),
  (17, 52, TRUE),
  (17, 53, TRUE);

-- Interior — Institución: NEP y FP N° 18
INSERT INTO institucion_curso (institucion_id, curso_catalogo_id, activo) VALUES
  (18, 1, TRUE),
  (18, 47, TRUE),
  (18, 48, TRUE),
  (18, 51, TRUE),
  (18, 19, TRUE),
  (18, 46, TRUE),
  (18, 29, TRUE),
  (18, 52, TRUE),
  (18, 53, TRUE);

-- Interior — Institución: NEP y FP N° 19
INSERT INTO institucion_curso (institucion_id, curso_catalogo_id, activo) VALUES
  (19, 1, TRUE),
  (19, 47, TRUE),
  (19, 48, TRUE),
  (19, 51, TRUE),
  (19, 19, TRUE),
  (19, 46, TRUE),
  (19, 29, TRUE),
  (19, 52, TRUE),
  (19, 53, TRUE);

-- Interior — Institución: NEP y FP N° 20
INSERT INTO institucion_curso (institucion_id, curso_catalogo_id, activo) VALUES
  (20, 1, TRUE),
  (20, 47, TRUE),
  (20, 49, TRUE),
  (20, 51, TRUE),
  (20, 19, TRUE),
  (20, 46, TRUE),
  (20, 29, TRUE),
  (20, 52, TRUE),
  (20, 53, TRUE);

-- Interior — Institución: NEP y FP N° 21
INSERT INTO institucion_curso (institucion_id, curso_catalogo_id, activo) VALUES
  (21, 1, TRUE),
  (21, 47, TRUE),
  (21, 45, TRUE),
  (21, 51, TRUE),
  (21, 19, TRUE),
  (21, 46, TRUE),
  (21, 29, TRUE),
  (21, 52, TRUE),
  (21, 53, TRUE);

-- Interior — Institución: NEP y FP N° 22
INSERT INTO institucion_curso (institucion_id, curso_catalogo_id, activo) VALUES
  (22, 1, TRUE),
  (22, 47, TRUE),
  (22, 49, TRUE),
  (22, 51, TRUE),
  (22, 19, TRUE),
  (22, 46, TRUE),
  (22, 29, TRUE),
  (22, 52, TRUE),
  (22, 53, TRUE);

-- Interior — Institución: NEP y FP N° 23
INSERT INTO institucion_curso (institucion_id, curso_catalogo_id, activo) VALUES
  (23, 1, TRUE),
  (23, 48, TRUE),
  (23, 47, TRUE),
  (23, 51, TRUE),
  (23, 19, TRUE),
  (23, 46, TRUE),
  (23, 29, TRUE),
  (23, 52, TRUE),
  (23, 53, TRUE);

-- Interior — Institución: NEP y FP N° 24
INSERT INTO institucion_curso (institucion_id, curso_catalogo_id, activo) VALUES
  (24, 1, TRUE),
  (24, 47, TRUE),
  (24, 49, TRUE),
  (24, 51, TRUE),
  (24, 19, TRUE),
  (24, 46, TRUE),
  (24, 29, TRUE),
  (24, 52, TRUE),
  (24, 53, TRUE);

-- Interior — Institución: NEP y FP N° 25
INSERT INTO institucion_curso (institucion_id, curso_catalogo_id, activo) VALUES
  (25, 1, TRUE),
  (25, 49, TRUE),
  (25, 47, TRUE),
  (25, 51, TRUE),
  (25, 19, TRUE),
  (25, 46, TRUE),
  (25, 29, TRUE),
  (25, 52, TRUE),
  (25, 53, TRUE);

-- Interior — Institución: NEP y FP N° 26
INSERT INTO institucion_curso (institucion_id, curso_catalogo_id, activo) VALUES
  (26, 1, TRUE),
  (26, 48, TRUE),
  (26, 47, TRUE),
  (26, 51, TRUE),
  (26, 19, TRUE),
  (26, 46, TRUE),
  (26, 29, TRUE),
  (26, 52, TRUE),
  (26, 53, TRUE);

-- Interior — Institución: NEP y FP N° 27
INSERT INTO institucion_curso (institucion_id, curso_catalogo_id, activo) VALUES
  (27, 1, TRUE),
  (27, 49, TRUE),
  (27, 47, TRUE),
  (27, 51, TRUE),
  (27, 19, TRUE),
  (27, 46, TRUE),
  (27, 29, TRUE),
  (27, 52, TRUE),
  (27, 53, TRUE);

-- Interior — Institución: NEP y FP N° 28
INSERT INTO institucion_curso (institucion_id, curso_catalogo_id, activo) VALUES
  (28, 1, TRUE),
  (28, 48, TRUE),
  (28, 47, TRUE),
  (28, 51, TRUE),
  (28, 19, TRUE),
  (28, 46, TRUE),
  (28, 29, TRUE),
  (28, 52, TRUE),
  (28, 53, TRUE);
-- Carga de datos de alumnos, matricula, y estado

USE sigef;
SET NAMES utf8mb4;

-- =========================================================
-- 1) PERÍODOS lectivos
-- =========================================================
INSERT IGNORE INTO periodo (anio, cuatrimestre, fecha_inicio, fecha_fin) VALUES
  (2025, 1, '2025-03-01', '2025-07-31'),
  (2025, 2, '2025-08-01', '2025-12-15');

-- IDs de período
SET @p1 := (SELECT id FROM periodo WHERE anio=2025 AND cuatrimestre=1);
SET @p2 := (SELECT id FROM periodo WHERE anio=2025 AND cuatrimestre=2);

-- Estados (variables por claridad)
SET @e_inscripto := (SELECT id FROM estado_matricula WHERE codigo='INSCRIPTO');
SET @e_cursando  := (SELECT id FROM estado_matricula WHERE codigo='CURSANDO');
SET @e_egresado  := (SELECT id FROM estado_matricula WHERE codigo='EGRESADO');
SET @e_abandono  := (SELECT id FROM estado_matricula WHERE codigo='ABANDONO');

-- =========================================================
-- 2) ALUMNOS (200 registros sintéticos)
-- =========================================================
SET @n := 0;
INSERT INTO alumno (dni, apellido, nombre)
SELECT CONCAT('DNI', LPAD(@n:=@n+1, 6, '0')) AS dni,
       ap.apellido,
       no.nombre
FROM (
  SELECT 'Gómez' apellido UNION ALL SELECT 'González' UNION ALL SELECT 'Rodríguez'
  UNION ALL SELECT 'López' UNION ALL SELECT 'Martínez' UNION ALL SELECT 'Díaz'
  UNION ALL SELECT 'Pérez' UNION ALL SELECT 'Sosa' UNION ALL SELECT 'Fernández'
  UNION ALL SELECT 'Romero'
) ap
CROSS JOIN (
  SELECT 'Juan' nombre UNION ALL SELECT 'María' UNION ALL SELECT 'Carlos'
  UNION ALL SELECT 'Laura' UNION ALL SELECT 'Ana' UNION ALL SELECT 'Luis'
  UNION ALL SELECT 'Sofía' UNION ALL SELECT 'Miguel' UNION ALL SELECT 'Marta'
  UNION ALL SELECT 'Diego'
) no
LIMIT 200
ON DUPLICATE KEY UPDATE apellido=VALUES(apellido), nombre=VALUES(nombre);

-- =========================================================
-- 3) TABLAS TEMPORALES de soporte (misma sesión)
-- =========================================================

-- TP por institución (oferta obligatoria)
DROP TEMPORARY TABLE IF EXISTS tmp_inst_tp;
CREATE TEMPORARY TABLE tmp_inst_tp AS
SELECT ic.institucion_id, MIN(ic.id) AS ic_tp_id
FROM institucion_curso ic
JOIN curso_catalogo cc ON cc.id = ic.curso_catalogo_id
JOIN nivel n ON n.id = cc.nivel_id
WHERE n.codigo = 'TP' AND ic.activo = TRUE
GROUP BY ic.institucion_id;

-- CL por institución (una oferta base para segundo curso)
DROP TEMPORARY TABLE IF EXISTS tmp_inst_cl;
CREATE TEMPORARY TABLE tmp_inst_cl AS
SELECT ic.institucion_id, MIN(ic.id) AS ic_cl_id
FROM institucion_curso ic
JOIN curso_catalogo cc ON cc.id = ic.curso_catalogo_id
JOIN nivel n ON n.id = cc.nivel_id
WHERE n.codigo = 'CL' AND ic.activo = TRUE
GROUP BY ic.institucion_id;

-- Enumeración de instituciones (rn) usando ventana (MySQL 8+)
DROP TEMPORARY TABLE IF EXISTS tmp_inst_ord;
CREATE TEMPORARY TABLE tmp_inst_ord AS
SELECT  t.institucion_id,
        t.ic_tp_id,
        c.ic_cl_id,
        ROW_NUMBER() OVER (ORDER BY t.institucion_id) AS rn
FROM tmp_inst_tp t
JOIN tmp_inst_cl c USING (institucion_id);

-- Enumeración de alumnos (rn)
DROP TEMPORARY TABLE IF EXISTS tmp_al;
CREATE TEMPORARY TABLE tmp_al AS
SELECT a.id AS alumno_id,
       ROW_NUMBER() OVER (ORDER BY a.id) AS rn
FROM alumno a;

-- Conteo de instituciones (necesario para el módulo)
SET @n_inst := (SELECT COUNT(*) FROM tmp_inst_ord);

-- =========================================================
-- 4) MATRÍCULA
-- Usamos INSERT IGNORE + UPDATE para evitar VALUES() deprecado
-- =========================================================

-- 4.1) Todos los alumnos: CURSANDO TP en 2025-2
DROP TEMPORARY TABLE IF EXISTS tmp_p2_tp;
CREATE TEMPORARY TABLE tmp_p2_tp AS
SELECT ta.alumno_id, ti.ic_tp_id
FROM tmp_al ta
JOIN tmp_inst_ord ti
  ON ((ta.rn - 1) % @n_inst) + 1 = ti.rn;

INSERT IGNORE INTO matricula (alumno_id, institucion_curso_id, periodo_id, estado_id, fecha_estado)
SELECT alumno_id, ic_tp_id, @p2, @e_cursando, CURDATE()
FROM tmp_p2_tp;

UPDATE matricula m
JOIN tmp_p2_tp t ON t.alumno_id = m.alumno_id AND t.ic_tp_id = m.institucion_curso_id
SET m.estado_id = @e_cursando,
    m.fecha_estado = CURDATE()
WHERE m.periodo_id = @p2;

INSERT INTO matricula_estado_historial (matricula_id, estado_id, fecha, observacion)
SELECT m.id, @e_inscripto, DATE('2025-08-01'), 'Inscripción inicial 2025-2'
FROM matricula m
JOIN tmp_p2_tp t ON t.alumno_id = m.alumno_id AND t.ic_tp_id = m.institucion_curso_id
WHERE m.periodo_id=@p2
  AND NOT EXISTS (
    SELECT 1 FROM matricula_estado_historial h
    WHERE h.matricula_id = m.id AND h.estado_id = @e_inscripto AND h.fecha = DATE('2025-08-01')
  );

INSERT INTO matricula_estado_historial (matricula_id, estado_id, fecha, observacion)
SELECT m.id, @e_cursando, DATE('2025-08-05'), 'Inicio de cursado 2025-2'
FROM matricula m
JOIN tmp_p2_tp t ON t.alumno_id = m.alumno_id AND t.ic_tp_id = m.institucion_curso_id
WHERE m.periodo_id=@p2
  AND NOT EXISTS (
    SELECT 1 FROM matricula_estado_historial h
    WHERE h.matricula_id = m.id AND h.estado_id = @e_cursando AND h.fecha = DATE('2025-08-05')
  );

-- 4.2) Mitad de alumnos (rn par): segundo curso CL en 2025-2
DROP TEMPORARY TABLE IF EXISTS tmp_p2_cl;
CREATE TEMPORARY TABLE tmp_p2_cl AS
SELECT ta.alumno_id, ti.ic_cl_id
FROM tmp_al ta
JOIN tmp_inst_ord ti
  ON ((ta.rn - 1) % @n_inst) + 1 = ti.rn
WHERE MOD(ta.rn, 2) = 0;

INSERT IGNORE INTO matricula (alumno_id, institucion_curso_id, periodo_id, estado_id, fecha_estado)
SELECT alumno_id, ic_cl_id, @p2, @e_cursando, CURDATE()
FROM tmp_p2_cl;

UPDATE matricula m
JOIN tmp_p2_cl t ON t.alumno_id = m.alumno_id AND t.ic_cl_id = m.institucion_curso_id
SET m.estado_id = @e_cursando,
    m.fecha_estado = CURDATE()
WHERE m.periodo_id = @p2;

INSERT INTO matricula_estado_historial (matricula_id, estado_id, fecha, observacion)
SELECT m.id, @e_inscripto, DATE('2025-08-01'), 'Inscripción segundo curso 2025-2'
FROM matricula m
JOIN tmp_p2_cl t ON t.alumno_id = m.alumno_id AND t.ic_cl_id = m.institucion_curso_id
WHERE m.periodo_id=@p2
  AND NOT EXISTS (
    SELECT 1 FROM matricula_estado_historial h
    WHERE h.matricula_id = m.id AND h.estado_id = @e_inscripto AND h.fecha = DATE('2025-08-01')
  );

INSERT INTO matricula_estado_historial (matricula_id, estado_id, fecha, observacion)
SELECT m.id, @e_cursando, DATE('2025-08-06'), 'Inicio segundo curso 2025-2'
FROM matricula m
JOIN tmp_p2_cl t ON t.alumno_id = m.alumno_id AND t.ic_cl_id = m.institucion_curso_id
WHERE m.periodo_id=@p2
  AND NOT EXISTS (
    SELECT 1 FROM matricula_estado_historial h
    WHERE h.matricula_id = m.id AND h.estado_id = @e_cursando AND h.fecha = DATE('2025-08-06')
  );

-- 4.3) Período anterior (2025-1): EGRESADOS y ABANDONO en TP

-- EGRESADOS rn 1..60
DROP TEMPORARY TABLE IF EXISTS tmp_p1_tp_eg;
CREATE TEMPORARY TABLE tmp_p1_tp_eg AS
SELECT ta.alumno_id, ti.ic_tp_id
FROM tmp_al ta
JOIN tmp_inst_ord ti
  ON ((ta.rn - 1) % @n_inst) + 1 = ti.rn
WHERE ta.rn BETWEEN 1 AND 60;

INSERT IGNORE INTO matricula (alumno_id, institucion_curso_id, periodo_id, estado_id, fecha_estado)
SELECT alumno_id, ic_tp_id, @p1, @e_egresado, DATE('2025-07-15')
FROM tmp_p1_tp_eg;

UPDATE matricula m
JOIN tmp_p1_tp_eg t ON t.alumno_id = m.alumno_id AND t.ic_tp_id = m.institucion_curso_id
SET m.estado_id = @e_egresado,
    m.fecha_estado = DATE('2025-07-15')
WHERE m.periodo_id = @p1;

INSERT INTO matricula_estado_historial (matricula_id, estado_id, fecha, observacion)
SELECT m.id, @e_inscripto, DATE('2025-03-01'), 'Inscripción 2025-1'
FROM matricula m
JOIN tmp_p1_tp_eg t ON t.alumno_id = m.alumno_id AND t.ic_tp_id = m.institucion_curso_id
WHERE m.periodo_id=@p1
  AND NOT EXISTS (
    SELECT 1 FROM matricula_estado_historial h
    WHERE h.matricula_id = m.id AND h.estado_id = @e_inscripto AND h.fecha = DATE('2025-03-01')
  );

INSERT INTO matricula_estado_historial (matricula_id, estado_id, fecha, observacion)
SELECT m.id, @e_cursando, DATE('2025-03-05'), 'Inicio cursado 2025-1'
FROM matricula m
JOIN tmp_p1_tp_eg t ON t.alumno_id = m.alumno_id AND t.ic_tp_id = m.institucion_curso_id
WHERE m.periodo_id=@p1
  AND NOT EXISTS (
    SELECT 1 FROM matricula_estado_historial h
    WHERE h.matricula_id = m.id AND h.estado_id = @e_cursando AND h.fecha = DATE('2025-03-05')
  );

INSERT INTO matricula_estado_historial (matricula_id, estado_id, fecha, observacion)
SELECT m.id, @e_egresado, DATE('2025-07-15'), 'Egreso 2025-1'
FROM matricula m
JOIN tmp_p1_tp_eg t ON t.alumno_id = m.alumno_id AND t.ic_tp_id = m.institucion_curso_id
WHERE m.periodo_id=@p1
  AND NOT EXISTS (
    SELECT 1 FROM matricula_estado_historial h
    WHERE h.matricula_id = m.id AND h.estado_id = @e_egresado AND h.fecha = DATE('2025-07-15')
  );

-- ABANDONO rn 61..100
DROP TEMPORARY TABLE IF EXISTS tmp_p1_tp_ab;
CREATE TEMPORARY TABLE tmp_p1_tp_ab AS
SELECT ta.alumno_id, ti.ic_tp_id
FROM tmp_al ta
JOIN tmp_inst_ord ti
  ON ((ta.rn - 1) % @n_inst) + 1 = ti.rn
WHERE ta.rn BETWEEN 61 AND 100;

INSERT IGNORE INTO matricula (alumno_id, institucion_curso_id, periodo_id, estado_id, fecha_estado)
SELECT alumno_id, ic_tp_id, @p1, @e_abandono, DATE('2025-05-20')
FROM tmp_p1_tp_ab;

UPDATE matricula m
JOIN tmp_p1_tp_ab t ON t.alumno_id = m.alumno_id AND t.ic_tp_id = m.institucion_curso_id
SET m.estado_id = @e_abandono,
    m.fecha_estado = DATE('2025-05-20')
WHERE m.periodo_id = @p1;

INSERT INTO matricula_estado_historial (matricula_id, estado_id, fecha, observacion)
SELECT m.id, @e_inscripto, DATE('2025-03-01'), 'Inscripción 2025-1'
FROM matricula m
JOIN tmp_p1_tp_ab t ON t.alumno_id = m.alumno_id AND t.ic_tp_id = m.institucion_curso_id
WHERE m.periodo_id=@p1
  AND NOT EXISTS (
    SELECT 1 FROM matricula_estado_historial h
    WHERE h.matricula_id = m.id AND h.estado_id = @e_inscripto AND h.fecha = DATE('2025-03-01')
  );

INSERT INTO matricula_estado_historial (matricula_id, estado_id, fecha, observacion)
SELECT m.id, @e_cursando, DATE('2025-03-05'), 'Inicio cursado 2025-1'
FROM matricula m
JOIN tmp_p1_tp_ab t ON t.alumno_id = m.alumno_id AND t.ic_tp_id = m.institucion_curso_id
WHERE m.periodo_id=@p1
  AND NOT EXISTS (
    SELECT 1 FROM matricula_estado_historial h
    WHERE h.matricula_id = m.id AND h.estado_id = @e_cursando AND h.fecha = DATE('2025-03-05')
  );

INSERT INTO matricula_estado_historial (matricula_id, estado_id, fecha, observacion)
SELECT m.id, @e_abandono, DATE('2025-05-20'), 'Abandono 2025-1'
FROM matricula m
JOIN tmp_p1_tp_ab t ON t.alumno_id = m.alumno_id AND t.ic_tp_id = m.institucion_curso_id
WHERE m.periodo_id=@p1
  AND NOT EXISTS (
    SELECT 1 FROM matricula_estado_historial h
    WHERE h.matricula_id = m.id AND h.estado_id = @e_abandono AND h.fecha = DATE('2025-05-20')
  );

-- =========================================================
-- 5) CONSULTAS DE CONTROL
-- =========================================================
-- ¿Algún alumno con >2 CURSANDO en 2025-2? (debería 0)
SELECT a.id AS alumno_id, COUNT(*) AS cursando_2025_2
FROM matricula m
JOIN estado_matricula e ON e.id=m.estado_id AND e.codigo='CURSANDO'
JOIN alumno a ON a.id=m.alumno_id
WHERE m.periodo_id=@p2
GROUP BY a.id
HAVING COUNT(*) > 2;

-- Totales por estado (2025-2)
SELECT e.codigo, COUNT(*) AS total
FROM matricula m
JOIN estado_matricula e ON e.id=m.estado_id
WHERE m.periodo_id=@p2
GROUP BY e.codigo;

-- Distribución por nivel en 2025-2
SELECT n.codigo AS nivel, COUNT(*) AS total
FROM matricula m
JOIN institucion_curso ic ON ic.id=m.institucion_curso_id
JOIN curso_catalogo cc ON cc.id=ic.curso_catalogo_id
JOIN nivel n ON n.id=cc.nivel_id
WHERE m.periodo_id=@p2
GROUP BY n.codigo;
