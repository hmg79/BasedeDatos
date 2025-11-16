-- Informe estadistico para la institución 4
SET @inst_id := 4;

SELECT
  p.anio, p.cuatrimestre,
  COUNT(DISTINCT CASE WHEN e.codigo='INSCRIPTO' THEN m.alumno_id END) AS inscripto,
  COUNT(DISTINCT CASE WHEN e.codigo='CURSANDO'  THEN m.alumno_id END) AS cursando,
  COUNT(DISTINCT CASE WHEN e.codigo='EGRESADO'  THEN m.alumno_id END) AS egresado,
  COUNT(DISTINCT CASE WHEN e.codigo='ABANDONO'  THEN m.alumno_id END) AS abandono
FROM matricula m
JOIN institucion_curso ic ON ic.id = m.institucion_curso_id
JOIN estado_matricula e   ON e.id = m.estado_id
JOIN periodo p            ON p.id = m.periodo_id
WHERE ic.institucion_id = @inst_id
GROUP BY p.id
ORDER BY p.anio, p.cuatrimestre;
