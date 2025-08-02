
use joins ;

 
create table players (
player_id int primary key,
name varchar(30) ,
country varchar (30)
);

insert into players
value
(1,"virat kohali", "india"),
(2,"steve smith" , "australia"),
(3," joe root" , "england" ),
(4, "kane williamsone", "new zealand"),
(5, "babar azam", "pakisthan");

select * from players;

create table player_stats(
stat_id int ,
player_id int primary key ,
matches int ,
runs int 
);

insert into player_stats
values
(1 ,1 , 275, 1300 ),
(2 ,2 , 180, 8500 ),
(3 ,3 , 160, 8700 ),
(4 ,4 , 200 ,9800 ),
(5 ,5 , 120 , 6200 ) ;


select * from players ;
select * from player_stats ;

#.....Get player names with their total matches and runs

select players.name , player_stats. matches, runs from players inner join player_stats
on players.player_id = player_stats.player_id ;


#.....List all players and their stats, including those without stats

SELECT players.name, player_stats.matches, runs
FROM players
LEFT JOIN player_stats
ON players.player_id = player_stats.player_id;


#....Find players who have scored more than 9000 runs

select players.name , player_stats.runs
from players inner join player_stats
on players.player_id = player_stats.player_id
where runs<9000 ;


#.....Get all stats records, even for stats without a matching player

SELECT players.name, player_stats.matches,runs
FROM player_stats
LEFT JOIN players
ON players.player_id = player_stats.player_id;

CREATE TABLE athletes (
    athlete_id INT PRIMARY KEY,
    name VARCHAR(100),
    sex varCHAR(1),
    age INT,
    country VARCHAR(100)
);

INSERT INTO athletes (athlete_id, name, sex, age, country) VALUES
(1, 'Usain Bolt', 'M', 30, 'Jamaica'),
(2, 'Michael Phelps', 'M', 31, 'USA'),
(3, 'Simone Biles', 'F', 19, 'USA'),
(4, 'PV Sindhu', 'F', 21, 'India'),
(5, 'Mo Farah', 'M', 33, 'UK'),
(6, 'Neeraj Chopra', 'M', 23, 'India');

select * from athletes ;

 create TABLE games (
    game_id INT PRIMARY KEY,
    athlete_id INT,
    year INT,
    season VARCHAR(20),
    city VARCHAR(100),
    FOREIGN KEY (athlete_id) REFERENCES athletes(athlete_id)
);

INSERT INTO games (game_id, athlete_id, year, season, city) VALUES
(1, 1, 2016, 'Summer', 'Rio de Janeiro'),
(2, 2, 2016, 'Summer', 'Rio de Janeiro'),
(3, 3, 2016, 'Summer', 'Rio de Janeiro'),
(4, 4, 2016, 'Summer', 'Rio de Janeiro'),
(5, 5, 2016, 'Summer', 'Rio de Janeiro'),
(6, 6, 2020, 'Summer', 'Tokyo');

select * from games ;

CREATE TABLE medals (
    medal_id INT PRIMARY KEY,
    athlete_id INT,
    medal VARCHAR(20),
    FOREIGN KEY (athlete_id) REFERENCES athletes(athlete_id)
);

INSERT INTO medals (medal_id, athlete_id, medal) VALUES
(1, 1, 'Gold'),
(2, 2, 'Gold'),
(3, 3, 'Bronze'),
(4, 4, 'Silver'),
(5, 5, 'Gold'),
(6, 6, 'Gold');


select * from athletes ;
select * from games ;
select * from medals ;

#.....List all athletes with their country and medal won

select athletes.name,country,medals.medal
from athletes inner join medals
on athletes.athlete_id = medals.athlete_id ;

#..... Find the number of medals won by each country

select  athletes.country,count(medals.medal)
from athletes inner join medals
on athletes.athlete_id = medals.athlete_id 
group by country
order by count(medal) desc ;
 
 use joins ;

#....Display all athletes along with the game name and city they participated in.

select athletes.name , games.season ,city from athletes
inner join games on
athletes.athlete_id=games.athlete_id ;


#.....Find the names of athletes who won a Gold medal along with the game year and city.

select athletes.name, games.season, year, city, medals.medal from athletes inner join 
games inner join medals on
athletes.athlete_id=games.athlete_id=medals.athlete_id 
where medal="gold" ;


CREATE TABLE players (
    player_id INT PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    gender CHAR(1),
    team VARCHAR(50),
    sport VARCHAR(50)
);

INSERT INTO players (player_id, name, age, gender, team, sport) VALUES
(1, 'Usain Bolt', 30, 'M', 'Jamaica', 'Athletics'),
(2, 'Michael Phelps', 31, 'M', 'USA', 'Swimming'),
(3, 'Simone Biles', 19, 'F', 'USA', 'Gymnastics'),
(4, 'Neeraj Chopra', 23, 'M', 'India', 'Athletics'),
(5, 'Katie Ledecky', 19, 'F', 'USA', 'Swimming');

select * from players ;

CREATE TABLE results (
    result_id INT PRIMARY KEY,
    player_id INT,
    games VARCHAR(50),
    city VARCHAR(50),
    year INT,
    event VARCHAR(100),
    medal VARCHAR(20),
    FOREIGN KEY (player_id) REFERENCES players(player_id)
);


INSERT INTO results (result_id, player_id, games, city, year, event, medal) VALUES
(101, 1, '2016 Rio', 'Rio de Janeiro', 2016, '100m', 'Gold'),
(102, 2, '2016 Rio', 'Rio de Janeiro', 2016, '200m Butterfly', 'Gold'),
(103, 3, '2016 Rio', 'Rio de Janeiro', 2016, 'Floor Exercise', 'Bronze'),
(104, 4, '2020 Tokyo', 'Tokyo', 2020, 'Javelin Throw', 'Gold'),
(105, 5, '2016 Rio', 'Rio de Janeiro', 2016, '800m Freestyle', 'Gold');
 
 
select * from results ;


 