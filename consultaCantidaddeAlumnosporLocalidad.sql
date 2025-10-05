-- Selecciono la localidad y el periodomatricula
SET @loc_id := (SELECT id FROM localidad WHERE nombre COLLATE utf8mb4_unicode_ci = _utf8mb4'Formosa');
SET @per    := (SELECT id FROM periodo   WHERE anio=2025 AND cuatrimestre=2);

SELECT
  COUNT(DISTINCT CASE WHEN e.codigo='INSCRIPTO' THEN m.alumno_id END) AS inscripto,
  COUNT(DISTINCT CASE WHEN e.codigo='CURSANDO'  THEN m.alumno_id END) AS cursando,
  COUNT(DISTINCT CASE WHEN e.codigo='EGRESADO'  THEN m.alumno_id END) AS egresado,
  COUNT(DISTINCT CASE WHEN e.codigo='ABANDONO'  THEN m.alumno_id END) AS abandono
FROM matricula m
JOIN institucion_curso ic ON ic.id = m.institucion_curso_id
JOIN institucion i        ON i.id  = ic.institucion_id
JOIN estado_matricula e   ON e.id  = m.estado_id
WHERE i.localidad_id = @loc_id
  AND m.periodo_id   = @per;
