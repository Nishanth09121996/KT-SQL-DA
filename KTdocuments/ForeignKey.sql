ALTER TABLE ipl.ipl_matches
ADD CONSTRAINT FK_venue_id
FOREIGN KEY (player_of_match_id) REFERENCES ipl.players(id);


ALTER TABLE ipl.ipl_matches
ADD CONSTRAINT FK_TEAM_1
FOREIGN KEY (team1_id) REFERENCES ipl.teams(id);


ALTER TABLE ipl.ipl_matches
ADD CONSTRAINT FK_TEAM_2
FOREIGN KEY (team2_id) REFERENCES ipl.teams(id);


ALTER TABLE ipl.ipl_matches
ADD CONSTRAINT FK_TEAM_winning
FOREIGN KEY (winner_id) REFERENCES ipl.teams(id);


ALTER TABLE ipl.ipl_matches
ADD CONSTRAINT FK_Umpire
FOREIGN KEY (umpire1_id) REFERENCES ipl.umpires(id);

ALTER TABLE ipl.ipl_matches
ADD CONSTRAINT FK_Umpire
FOREIGN KEY (umpire1_id) REFERENCES ipl.umpires(id);

ALTER TABLE ipl.ipl_matches
ADD CONSTRAINT FK_Umpire_2
FOREIGN KEY (umpire2_id) REFERENCES ipl.umpires(id);


ALTER TABLE ipl.ipl_matches
ADD CONSTRAINT FK_TEAM_toss
FOREIGN KEY (toss_winner_id) REFERENCES ipl.teams(id);

ALTER TABLE ipl.ipl_matches
ADD CONSTRAINT FK_Season
FOREIGN KEY (season_id) REFERENCES ipl.seasons(id);


