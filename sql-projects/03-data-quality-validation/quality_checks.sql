-- Audit missing league assignments and attendance values.
SELECT game_id, game_date, league_id
FROM games
WHERE league_id IS NULL;

SELECT game_id, game_date, attendance
FROM games
WHERE status = 'Final' AND attendance IS NULL;

-- Confirm uniqueness of game identifiers.
SELECT game_id, COUNT(*) AS occurrences
FROM games
GROUP BY game_id
HAVING COUNT(*) > 1;
