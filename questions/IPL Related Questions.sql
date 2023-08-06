--1.Find the number of matches played in each venue?
    select 
    v.name as venue_name
    ,count(im.id) as matches_played
    from ipl_matches im 
    join venues v
    on im.venue_id = v.id 
    group by v.name
    order by matches_played desc

--2.Find count of matches won by each team for each season?

    select t.name as team_name,count(im.id) as matches_won from ipl_matches im 
    join teams t  on im.winner_id = t.id 
    group by team_name
    order by matches_won desc

    select t.name as team_name,s.name  as season_name,count(im.id) as matches_won from ipl_matches im 
    join teams t  on im.winner_id = t.id 
    join seasons s on im.season_id = s.id 
    group by team_name,season_name
    order by 2,1 



--3.Season wise find the number of mom award won by player sort by season ascending and number of mom won descending

    select s.name as season_name ,p.Player_Name ,count(im.id) as mom_won from ipl_matches im 
    join seasons s on im.season_id = s.id
    join players p on im.player_of_match_id = p.id 
    group by season_name ,p.Player_Name 
    order by season_name asc,mom_won desc

--4.Find which player has won most number of man of the match in each season

    with cte as (
    select
    season_name
    ,player_name
    ,mom_won
    ,rank() over(partition by season_name order by mom_won desc) as most_mom_winner 
    from
    (
    select s.name as season_name ,p.Player_Name ,count(im.id) as mom_won from ipl_matches im 
    join seasons s on im.season_id = s.id
    join players p on im.player_of_match_id = p.id 
    group by season_name ,p.Player_Name 
    ) mom
    )
    select season_name,player_name,mom_won  from cte where most_mom_winner=1
    order by season_name asc,mom_won desc

--5.Display matches participated by Umpires
    select umpire_name,count(distinct id) as matches_count from (
    select u.name as umpire_name , im.id from ipl_matches im 
    join umpires u on im.umpire1_id = u.id 
    union 
    select u.name ,im.id  from ipl_matches im 
    join umpires u on im.umpire2_id   = u.id )
    a
    group by umpire_name
    order by matches_count desc
