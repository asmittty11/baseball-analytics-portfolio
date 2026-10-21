-- INNER JOIN: only games with a matching league.
SELECT g.game_id, g.game_date, l.league_name
FROM games AS g
INNER JOIN leagues AS l ON g.league_id = l.league_id
ORDER BY g.game_id;

-- LEFT JOIN: all games, including missing league matches.
SELECT g.game_id, g.game_date, l.league_name
FROM games AS g
LEFT JOIN leagues AS l ON g.league_id = l.league_id
ORDER BY g.game_id;

-- Isolate games without a matching league.
SELECT g.game_id, g.game_date
FROM games AS g
LEFT JOIN leagues AS l ON g.league_id = l.league_id
WHERE l.league_id IS NULL;
