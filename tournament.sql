-- Table definitions for the tournament project.
--

-- table to store player name and id number (auto assigned via serial type)
-- ok; test with data entries
CREATE TABLE players (player_id	SERIAL PRIMARY KEY, name TEXT NOT NULL);

-- table to record match results
-- ok
CREATE TABLE matches (
	match_id		SERIAL PRIMARY KEY,
	match_date		DATE,
	player_id		INTEGER,
	player_name		TEXT,
	match_result	TEXT,
	FOREIGN KEY (player_id) REFERENCES players (player_id)
	);

-- view: counts all players; 
-- ok; test with data entries
CREATE VIEW count_players AS
	SELECT player_id, count (*) as num
	FROM players
	GROUP BY player_id
	;

-- view: counts all matches played
-- ok; test with data entries
CREATE VIEW matches_played AS
    SELECT players.name, players.player_id, count (matches.player_id) as played
    FROM players LEFT JOIN matches
	ON players.player_id = matches.player_id
    GROUP BY players.player_id
    ;

-- view: counts all wins
-- ok; test with data entries
CREATE VIEW wins AS
	SELECT player_id, count (match_result) as wins
	FROM matches
		WHERE match_result = 'win'
	GROUP BY player_id
	ORDER BY wins DESC
	;

-- view: players standings
-- ok; test with data entries
CREATE VIEW standings AS
	SELECT matches_played.player_id, matches_played.name,
	COALESCE (wins.wins,0) AS wins,
	matches_played.played
	FROM matches_played
	LEFT JOIN wins ON matches_played.player_id = wins.player_id
	ORDER BY wins DESC
	;
