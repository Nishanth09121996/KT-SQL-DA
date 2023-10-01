use ipldisconnected;

-- Add the foreign key  for player_of_match_id
ALTER TABLE ipldisconnected.ipl_matches
ADD CONSTRAINT FK_player_id
FOREIGN KEY (player_of_match_id) REFERENCES ipldisconnected.players(id);

-- Add the foreign key  for player_of_match_id
ALTER TABLE ipldisconnected.ipl_matches
ADD CONSTRAINT FK_TEAM_1
FOREIGN KEY (team1_id) REFERENCES ipldisconnected.teams(id);


Alter table ipldisconnected.ipl_matches
drop constraint FK_player_id;


Alter table ipl.venues
Add constraint primary_key_col
primary key (id);

Alter table ipl.players
Add constraint primary_key_col
primary key (id);

Alter table ipl.seasons
Add constraint primary_key_col
primary key (id);

Alter table ipl.teams
Add constraint primary_key_col
primary key (id);

Alter table ipl.umpires
Add constraint primary_key_col
primary key (id);