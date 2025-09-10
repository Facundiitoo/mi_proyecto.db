-- Window Function: ranking de equipos por goles totales
WITH goles_totales AS (
    SELECT
        [Home Team Name] AS Team,
        SUM([Home Team Goals]) AS goals_for
    FROM WorldCupMatches
    GROUP BY [Home Team Name]
    UNION ALL
    SELECT
        [Away Team Name],
        SUM([Away Team Goals])
    FROM WorldCupMatches
    GROUP BY [Away Team Name]
)
SELECT
    Team,
    SUM(goals_for) AS total_goals,
    RANK() OVER (ORDER BY SUM(goals_for) DESC) AS rank_by_goals
FROM goles_totales
GROUP BY Team
ORDER BY rank_by_goals;
