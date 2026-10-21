DROP TABLE IF EXISTS games;
DROP TABLE IF EXISTS leagues;
CREATE TABLE leagues (league_id INTEGER PRIMARY KEY, league_name TEXT NOT NULL);
CREATE TABLE games (game_id INTEGER PRIMARY KEY, game_date TEXT NOT NULL, league_id INTEGER, home_team TEXT, away_team TEXT, attendance INTEGER, status TEXT);
INSERT INTO leagues VALUES (1,'MLB'),(2,'AAA'),(3,'AA'),(4,'AFL');
INSERT INTO games VALUES
(101,'2026-04-01',1,'Phillies','Mets',42000,'Final'),
(102,'2026-04-02',2,'IronPigs','RailRiders',8100,'Final'),
(103,'2026-04-03',3,'Fightin Phils','SeaWolves',NULL,'Final'),
(104,'2026-04-04',1,'Yankees','Red Sox',46000,'Scheduled'),
(105,'2026-04-05',NULL,'Unknown','Visitors',NULL,'Final');
