-- Report games and attendance by league.
SELECT l.league_name,
       COUNT(g.game_id) AS games_played,
       ROUND(AVG(g.attendance), 0) AS average_reported_attendance
FROM leagues AS l
LEFT JOIN games AS g ON l.league_id = g.league_id AND g.status = 'Final'
GROUP BY l.league_id, l.league_name
ORDER BY games_played DESC, l.league_name;
