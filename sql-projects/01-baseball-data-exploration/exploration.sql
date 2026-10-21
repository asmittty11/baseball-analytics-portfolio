-- Explore completed games and attendance using a synthetic dataset.
SELECT game_id, game_date, home_team, away_team, attendance
FROM games
WHERE status = 'Final'
ORDER BY game_date DESC;

SELECT DISTINCT status FROM games ORDER BY status;
