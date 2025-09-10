-- CTE: promedio de goles por año y equipo
WITH partidos AS (
    SELECT
        Year,
        [Home Team Name] AS Team,
        [Home Team Goals] AS Goals
    FROM WorldCupMatches
    UNION ALL
    SELECT
        Year,
        [Away Team Name] AS Team,
        [Away Team Goals] AS Goals
    FROM WorldCupMatches
)
SELECT
    Year,
    Team,
    COUNT(*) AS matches_played,
    SUM(Goals) AS total_goals,
    ROUND(AVG(Goals), 2) AS avg_goals_per_match
FROM partidos
GROUP BY Year, Team
ORDER BY Year, total_goals DESC;
