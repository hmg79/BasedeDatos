-- Consulta por curso
SET @inst_id := 4;
SET @per_2025_2 := (SELECT id FROM periodo WHERE anio=2025 AND cuatrimestre=2);

SELECT
  cc.nombre AS curso,
  COUNT(DISTINCT CASE WHEN e.codigo='INSCRIPTO' THEN m.alumno_id END) AS inscripto,
  COUNT(DISTINCT CASE WHEN e.codigo='CURSANDO'  THEN m.alumno_id END) AS cursando,
  COUNT(DISTINCT CASE WHEN e.codigo='EGRESADO'  THEN m.alumno_id END) AS egresado,
  COUNT(DISTINCT CASE WHEN e.codigo='ABANDONO'  THEN m.alumno_id END) AS abandono
FROM matricula m
JOIN institucion_curso ic ON ic.id = m.institucion_curso_id
JOIN curso_catalogo   cc ON cc.id = ic.curso_catalogo_id
JOIN estado_matricula e  ON e.id = m.estado_id
WHERE ic.institucion_id = @inst_id
  AND m.periodo_id      = @per_2025_2
GROUP BY cc.id
ORDER BY cc.nombre;
