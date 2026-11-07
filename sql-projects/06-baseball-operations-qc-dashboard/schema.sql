-- Synthetic training data; not sourced from MLB internal systems.
PRAGMA foreign_keys = ON;
DROP TABLE IF EXISTS findings_w5d7;
DROP TABLE IF EXISTS games_w5d7;
DROP TABLE IF EXISTS operators_w5d7;

CREATE TABLE operators_w5d7 (
    operator_id INTEGER PRIMARY KEY,
    operator_name TEXT NOT NULL,
    team TEXT NOT NULL
);
CREATE TABLE games_w5d7 (
    game_id INTEGER PRIMARY KEY,
    game_date TEXT NOT NULL,
    league TEXT NOT NULL,
    operator_id INTEGER NOT NULL,
    game_status TEXT NOT NULL,
    FOREIGN KEY (operator_id) REFERENCES operators_w5d7(operator_id)
);
CREATE TABLE findings_w5d7 (
    finding_id INTEGER PRIMARY KEY,
    game_id INTEGER NOT NULL,
    finding_type TEXT NOT NULL,
    severity TEXT NOT NULL,
    resolved INTEGER NOT NULL,
    FOREIGN KEY (game_id) REFERENCES games_w5d7(game_id)
);
INSERT INTO operators_w5d7 VALUES
(1,'Allan','East'),
(2,'Jordan','East'),
(3,'Taylor','West'),
(4,'Morgan','West'),
(5,'Casey','East'),
(6,'Drew','West');
INSERT INTO games_w5d7 VALUES
(9501,'2026-11-01','AAA',1,'Final'),
(9502,'2026-11-02','AAA',2,'Final'),
(9503,'2026-11-03','AAA',1,'Final'),
(9504,'2026-11-04','AAA',3,'Postponed'),
(9505,'2026-11-05','AAA',6,'Final'),
(9506,'2026-11-06','AA',2,'Final'),
(9507,'2026-11-07','AA',3,'Final'),
(9508,'2026-11-08','AA',5,'Final'),
(9509,'2026-11-09','AA',6,'Final'),
(9510,'2026-11-10','MLB',1,'Final'),
(9511,'2026-11-11','MLB',3,'Final'),
(9512,'2026-11-12','MLB',5,'Final'),
(9513,'2026-11-13','MLB',2,'Scheduled'),
(9514,'2026-11-14','AFL',4,'Final'),
(9515,'2026-11-15','AFL',5,'Final'),
(9516,'2026-11-16','AFL',4,'Final'),
(9517,'2026-11-17','AFL',6,'Final'),
(9518,'2026-11-18','AFL',3,'Scheduled');
INSERT INTO findings_w5d7 VALUES
(1,9501,'Scoring','High',0),
(2,9501,'Roster','Low',1),
(3,9502,'Timing','Medium',1),
(4,9503,'Scoring','High',0),
(5,9503,'Timing','Low',1),
(6,9505,'Roster','Medium',0),
(7,9506,'Roster','Low',1),
(8,9507,'Scoring','High',0),
(9,9507,'Roster','Medium',0),
(10,9508,'Timing','Medium',1),
(11,9509,'Scoring','Low',1),
(12,9509,'Roster','High',0),
(13,9510,'Scoring','High',1),
(14,9510,'Timing','Low',1),
(15,9511,'Roster','Medium',0),
(16,9512,'Scoring','High',0),
(17,9512,'Timing','Medium',1),
(18,9513,'Roster','Low',0),
(19,9514,'Timing','Low',1),
(20,9515,'Roster','High',0),
(21,9515,'Scoring','High',0),
(22,9516,'Timing','Medium',1),
(23,9516,'Roster','Low',1),
(24,9516,'Scoring','High',0),
(25,9517,'Roster','Medium',0),
(26,9517,'Timing','Low',1),
(27,9518,'Scoring','Medium',0);
