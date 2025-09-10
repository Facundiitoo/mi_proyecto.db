-- OLAP emulado: goles por Año, Equipo y total global

-- 1) detalle por Año y Equipo
SELECT Year, Team, SUM(Goals) AS total_goals, 'DETAIL' AS level
FROM (
    SELECT Year, [Home Team Name] AS Team, [Home Team Goals] AS Goals
    FROM WorldCupMatches
    UNION ALL
    SELECT Year, [Away Team Name], [Away Team Goals]
    FROM WorldCupMatches
)
GROUP BY Year, Team

UNION ALL

-- 2) subtotal por Año (todas las selecciones de ese Mundial)
SELECT Year, NULL AS Team, SUM(Goals) AS total_goals, 'YEAR_TOTAL' AS level
FROM (
    SELECT Year, [Home Team Goals] AS Goals
    FROM WorldCupMatches
    UNION ALL
    SELECT Year, [Away Team Goals]
    FROM WorldCupMatches
)
GROUP BY Year

UNION ALL

-- 3) total global (todos los años, todos los equipos)
SELECT NULL AS Year, NULL AS Team, SUM(Goals) AS total_goals, 'GLOBAL_TOTAL' AS level
FROM (
    SELECT [Home Team Goals] AS Goals FROM WorldCupMatches
    UNION ALL
    SELECT [Away Team Goals] FROM WorldCupMatches
)

ORDER BY Year, Team;
