USE sigef;
SET NAMES utf8mb4;

-- Parámetros de trabajo
SET @inst_id    := (SELECT id FROM institucion WHERE nombre='NEP y FP N° 4');
SET @per_2025_2 := (SELECT id FROM periodo WHERE anio=2025 AND cuatrimestre=2);
SET @e_ins      := (SELECT id FROM estado_matricula WHERE codigo='INSCRIPTO');
SET @e_cur      := (SELECT id FROM estado_matricula WHERE codigo='CURSANDO');

-- === 1) Carga/actualiza alumnos (dni único) ===============================
INSERT INTO alumno (dni, apellido, nombre)
SELECT dni, apellido, nombre
FROM (
  SELECT 'DNI900001' AS dni, 'Pérez'     AS apellido, 'Lucía'  AS nombre UNION ALL
  SELECT 'DNI900002',         'Gómez',               'Juan'             UNION ALL
  SELECT 'DNI900003',         'Rodríguez',           'Ana'
) AS nuevos (dni, apellido, nombre)
ON DUPLICATE KEY UPDATE
  apellido = nuevos.apellido,
  nombre   = nuevos.nombre;

-- Tomo los IDs de esos alumnos
SET @al1 := (SELECT id FROM alumno WHERE dni='DNI900001');
SET @al2 := (SELECT id FROM alumno WHERE dni='DNI900002');
SET @al3 := (SELECT id FROM alumno WHERE dni='DNI900003');

-- === 2) Busco las ofertas (institucion_curso) en la institución 4 =========
-- TP (Terminalidad Primaria)
SET @ic_tp := (
  SELECT ic.id
  FROM institucion_curso ic
  JOIN curso_catalogo cc ON cc.id = ic.curso_catalogo_id
  JOIN nivel n ON n.id = cc.nivel_id
  WHERE ic.institucion_id=@inst_id AND n.codigo='TP'
  ORDER BY ic.id LIMIT 1
);

-- COCINERO/A (FP)
SET @ic_coc := (
  SELECT ic.id
  FROM institucion_curso ic
  JOIN curso_catalogo cc ON cc.id = ic.curso_catalogo_id
  WHERE ic.institucion_id=@inst_id AND cc.nombre='COCINERO/A'
  ORDER BY ic.id LIMIT 1
);

-- ARMADOR Y REPARADOR DE PC (CL)
SET @ic_pc := (
  SELECT ic.id
  FROM institucion_curso ic
  JOIN curso_catalogo cc ON cc.id = ic.curso_catalogo_id
  WHERE ic.institucion_id=@inst_id AND cc.nombre='ARMADOR Y REPARADOR DE PC'
  ORDER BY ic.id LIMIT 1
);

-- === 3) Matriculo (2025–2) ================================================
-- Lucía: TP (CURSANDO) + COCINERO/A (CURSANDO)
-- Juan : solo TP (CURSANDO)
-- Ana  : TP (CURSANDO) + PC (CURSANDO)

INSERT INTO matricula (alumno_id, institucion_curso_id, periodo_id, estado_id, fecha_estado)
SELECT alumno_id, institucion_curso_id, periodo_id, estado_id, fecha_estado
FROM (
  SELECT @al1 AS alumno_id, @ic_tp AS institucion_curso_id, @per_2025_2 AS periodo_id, @e_cur AS estado_id, CURDATE() AS fecha_estado UNION ALL
  SELECT @al1, @ic_coc, @per_2025_2, @e_cur, CURDATE() UNION ALL
  SELECT @al2, @ic_tp,  @per_2025_2, @e_cur, CURDATE() UNION ALL
  SELECT @al3, @ic_tp,  @per_2025_2, @e_cur, CURDATE() UNION ALL
  SELECT @al3, @ic_pc,  @per_2025_2, @e_cur, CURDATE()
) AS nuevos (alumno_id, institucion_curso_id, periodo_id, estado_id, fecha_estado)
ON DUPLICATE KEY UPDATE
  estado_id   = nuevos.estado_id,
  fecha_estado= nuevos.fecha_estado;

-- === 4) Historial (INSCRIPTO -> CURSANDO) evitando duplicados =============
-- INSCRIPCIÓN (mismo día para el ejemplo; ajustá si querés otro)
INSERT INTO matricula_estado_historial (matricula_id, estado_id, fecha, observacion)
SELECT m.id, @e_ins, CURDATE(), 'Inscripción 2025-2'
FROM matricula m
WHERE m.periodo_id=@per_2025_2
  AND m.alumno_id IN (@al1,@al2,@al3)
  AND NOT EXISTS (
    SELECT 1 FROM matricula_estado_historial h
    WHERE h.matricula_id=m.id AND h.estado_id=@e_ins AND h.fecha=CURDATE()
  );

-- INICIO DE CURSADO
INSERT INTO matricula_estado_historial (matricula_id, estado_id, fecha, observacion)
SELECT m.id, @e_cur, CURDATE(), 'Inicio cursado 2025-2'
FROM matricula m
WHERE m.periodo_id=@per_2025_2
  AND m.alumno_id IN (@al1,@al2,@al3)
  AND NOT EXISTS (
    SELECT 1 FROM matricula_estado_historial h
    WHERE h.matricula_id=m.id AND h.estado_id=@e_cur AND h.fecha=CURDATE()
  );

-- === 5) Verificación rápida ===============================================
SELECT a.dni, a.apellido, a.nombre, cc.nombre AS curso, e.codigo AS estado
FROM matricula m
JOIN alumno a ON a.id=m.alumno_id
JOIN institucion_curso ic ON ic.id=m.institucion_curso_id
JOIN curso_catalogo cc ON cc.id=ic.curso_catalogo_id
JOIN estado_matricula e ON e.id=m.estado_id
WHERE m.periodo_id=@per_2025_2
  AND ic.institucion_id=@inst_id
  AND a.id IN (@al1,@al2,@al3)
ORDER BY a.apellido, cc.nombre;
