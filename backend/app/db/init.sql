CREATE TABLE players (
    player_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT UNIQUE,
    balance DECIMAL(10, 2)
);

CREATE TABLE games (
    game_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE game_tables (
    table_id INTEGER PRIMARY KEY,
    game_id INTEGER NOT NULL,
    table_name TEXT NOT NULL,
    min_bet DECIMAL(10, 2),
    max_bet DECIMAL(10, 2),
    FOREIGN KEY (game_id) REFERENCES games(game_id)
);

CREATE TABLE sessions (
    session_id INTEGER PRIMARY KEY,
    player_id INTEGER NOT NULL,
    start_time TIMESTAMP,
    end_time TIMESTAMP,
    FOREIGN KEY(player_id) REFERENCES players(player_id)
);

CREATE TABLE plays_at (
    plays_at_id INTEGER PRIMARY KEY,
    table_id INTEGER NOT NULL,
    game_id INTEGER NOT NULL,
    date TIMESTAMP,
    FOREIGN KEY(table_id) REFERENCES game_tables(table_id),
    FOREIGN KEY(game_id) REFERENCES games(game_id)
);

CREATE TABLE game_rounds (
    round_id INTEGER PRIMARY KEY,
    table_id INTEGER NOT NULL,
    start_time TIMESTAMP,
    end_time TIMESTAMP,
    FOREIGN KEY(table_id) REFERENCES game_tables(table_id)
);

CREATE TABLE bets (
    bet_id INTEGER PRIMARY KEY,
    player_id INTEGER NOT NULL,
    round_id INTEGER NOT NULL,
    session_id INTEGER NOT NULL,
    amount DECIMAL(10, 2),
    bet_type VARCHAR(10),
    bet_value VARCHAR(20),
    placed_at TIMESTAMP,
    FOREIGN KEY(player_id) REFERENCES players(player_id),
    FOREIGN KEY(round_id) REFERENCES game_rounds(round_id),
    FOREIGN KEY(session_id) REFERENCES sessions(session_id)
);

CREATE TABLE results (
    result_id INTEGER PRIMARY KEY,
    round_id INTEGER UNIQUE NOT NULL,
    outcome VARCHAR(10),
    FOREIGN KEY(round_id) REFERENCES game_rounds(round_id)
);

CREATE TABLE payouts (
    payout_id INTEGER PRIMARY KEY,
    bet_id INTEGER UNIQUE NOT NULL,
    amount DECIMAL(10, 2),
    payout_time TIMESTAMP,
    result_id INTEGER NOT NULL,
    FOREIGN KEY(result_id) REFERENCES results(result_id),
    FOREIGN KEY(bet_id) REFERENCES bets(bet_id)
);
