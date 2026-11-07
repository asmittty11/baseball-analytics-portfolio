-- Week 5 Day 7 Q3: League QC scorecard (20/20; references consulted).
SELECT g.league, COUNT(DISTINCT g.game_id) AS final_games, COUNT(*) AS total_findings, SUM(CASE WHEN resolved = 0 THEN 1 ELSE 0 END) AS unresolved_findings, SUM(CASE WHEN resolved = 0 AND severity = 'High' THEN 1 ELSE 0 END) AS unresolved_high_severity
FROM games_w5d7 AS g
JOIN findings_w5d7 AS f
ON g.game_id = f.game_id
WHERE g.game_status = 'Final'
GROUP BY g.league
ORDER BY unresolved_high_severity DESC, unresolved_findings DESC, g.league ASC;

-- Week 5 Day 7 Q4: Operator workload (20/20; independent).
SELECT o.operator_name, o.team, COUNT(DISTINCT g.game_id) AS final_games, COUNT(*) AS total_findings, SUM(CASE WHEN resolved = 0 THEN 1 ELSE 0 END) AS unresolved_findings
FROM operators_w5d7 AS o
JOIN games_w5d7 AS g
ON o.operator_id = g.operator_id
JOIN findings_w5d7 AS f
ON g.game_id = f.game_id
WHERE g.game_status = 'Final'
GROUP BY o.operator_name, o.team
ORDER BY unresolved_findings DESC, total_findings DESC, o.operator_name ASC;

-- Week 5 Day 7 Q5: Team priority report (20/20; independent).
SELECT o.team, COUNT(DISTINCT g.game_id) AS final_games, COUNT(*) AS total_findings, SUM(CASE WHEN resolved = 0 THEN 1 ELSE 0 END) AS unresolved_findings, SUM(CASE WHEN resolved = 0 AND severity = 'High' THEN 1 ELSE 0 END) AS unresolved_high_severity
FROM operators_w5d7 AS o
JOIN games_w5d7 AS g
ON o.operator_id = g.operator_id
JOIN findings_w5d7 AS f
ON g.game_id = f.game_id
WHERE g.game_status = 'Final'
GROUP BY o.team
ORDER BY unresolved_high_severity DESC, unresolved_findings DESC, o.team ASC;
