use june_4 ;

select * from athletes ;

#....Find the total number of players in the table.   

select count(name) as total_players from athletes;


#....List all unique sports played in the dataset.

select distinct(sport) from athletes;


#....Find the average height and weight of male and female athletes.

select sex, avg(height) as average_height,
avg(weight) as average_weight
from athletes
group by sex;


#....Display the youngest athlete who won a medal

SELECT  *
FROM athletes
WHERE medal!=("nomedal")
ORDER BY age ASC
LIMIT 1;


#....List all players who participated in the 2008 Summer Olympics.

SELECT *
FROM athletes
WHERE year = 2008
AND season = 'Summer';

#....Find out how many athletes represented each team.

select team ,count(distinct name) from athletes
group by team 
order by count(*) desc ;

#....Show the total number of medals won by each country.

select team, count(medal) as total_num_of_medals
from athletes
group by team
order by count(medal) desc ;

#....Find the names of athletes who have won Gold medals.

select distinct name,medal from athletes
where medal=("gold") ;

#....List the top 5 tallest athletes.

select distinct name,height  from athletes
order by height desc
limit 5 ;


#....Find the average age of athletes for each sport.

select distinct sport, avg(age) from athletes
group by sport 
order by avg(age) desc ;

#....Display athletes who have participated in more than one Olympic game.

SELECT name, COUNT(DISTINCT year) AS total_games
FROM athletes
GROUP BY name
HAVING COUNT(DISTINCT year) > 1
ORDER BY total_games DESC;

 
#....Find the number of medals won in each season.

select season, count(medal) from athletes
where medal != "nomedal"
group by season ;


#....Show the city which hosted the maximum number of Olympic events.

select city, count(event) from athletes
group by city
order by count(event) desc 
limit 1 ;

select * from athletes ;

#....List all athletes with height greater than 190 cm and weight over 90 kg.

select distinct * from athletes
where height>190 and weight>90 ; 

#....Find out which sport had the highest number of participants.

select sport , count(name) from athletes
group by sport
order by count(name) desc 
limit 1 ;

 
#....Show all unique events held in the Winter Olympics.

select distinct event, season 
 from athletes
where season="winter" ;


#....Find the athlete with the highest number of medals
 
 SELECT name, COUNT(medal) 
FROM athletes
GROUP BY name
ORDER BY count(medal)DESC
LIMIT 1;

#..In such case put where to find nomedals and null medals.....=

SELECT name, COUNT(medal) AS total_medals
FROM athletes
WHERE medal IS NOT NULL AND medal != 'NA' AND medal != 'NoMedal'
GROUP BY name
ORDER BY total_medals DESC
LIMIT 1;


select * from athletes ;

#....Display the count of male and female participants by year.

SELECT year, sex, COUNT(*) AS participant_count
FROM athletes
GROUP BY year, sex
ORDER BY year, sex;

#....List the number of Gold, Silver, and Bronze medals won by each team.

select
  team,
  SUM(case when medal = "gold" then 1 else 0 end) as gold_medals,
  SUM(case when medal = "silver" then 1 else 0 end) as silver_medals,
  SUM(case when medal = "bronze" then 1 else 0 end) as bronze_medals
from athletes
group by team
order by team ;

select * from athletes ;

#....Find out the average weight of athletes who participated in Swimming.

select sport ,avg(weight) as average_weight
from athletes
where sport="swimming" ;


#....Show athletes who have never won a medal.

select * from athletes
where medal="nomedal" ;


#....Find out the total number of events played in each game edition.

 select games, count(distinct event) as total_events
 from athletes
 group by games;

 
#....List the names of athletes along with their team who participated in Boxing.

select name , team, sport
from athletes
where sport="boxing" ;

 

#....Show all distinct cities where the Summer Olympics were held.

select distinct(city) , season
from athletes
where season="summer" ;


#....Find the athlete with the maximum weight.

select * from athletes
where weight= (select max(weight) from athletes ) ;


#....Show the number of athletes from each NOC (National Olympic Committee).

 select noc, count(name) as num_athletes
 from athletes
 group by noc ;
 

#....Find the average age of medal-winning athletes.

select avg(age) as average_age
from athletes
where medal != "nomedal" ;


#....List the events that have had more than 50 participants.

select event, count(*) as participants
from athletes
group by event
having count(*) > 50 ;


#....Show all athletes who won a medal in Athletics.

select * from athletes 
where sport= "athletics"
and medal!= "nomedal" ;


#....Display the details of athletes who participated in the 2016 Rio de janeiro.

select * from athletes
where year=2016 
and city = "rio de janeiro" ;





