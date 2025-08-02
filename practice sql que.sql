use june_4;

select * from tips;

select * from athletes;


-- 17. view the tips table

select * from tips;


-- 18. Find avg of total bill based on day and time

select day , time, avg(total_bill)
from tips
group by day,time
order by day,time;


-- 19. Find out sum of total bill and tips based on smoker and gender 
-- order by tips desc

select smoker,sex, sum(total_bill and tip)
from tips
group by smoker,sex
order by sum(total_bill and tip) desc;

-- 20. Find out top 5 tips in table

select * from tips
order by tip desc
limit 5 ;


-- 21. Find out bottom 3 total_bill in the data

select * from tips
order by total_bill asc
limit 3 ;


-- 22. Find out highest size in the data

select max(size) from tips;


-- 23. Find out highest total bill

select max(total_bill) from tips;


-- 23. Find out highest tip by female and non smoker

select * from tips
where sex = ("female") and smoker = ("no")
order by tip desc
limit 1 ;

-- 24. Find out third highest tip by female and non smoker use limit and offset

select * from tips
where sex=("female") and smoker=("no")
order by tip desc
limit 1 offset 2;

-- 25. Find out the entry where lowest tip was paid

select * from tips
order by tip asc
limit 1 ;


-- Find out 5th lowest tip paid by female, smoker , use limit and offset

select * from tips 
where sex=("female") 
order by tip asc
limit 1 offset 4;

-- Find out top 5 tips in the data

select * from tips 
order by tip desc
limit 5 ;


-- Find out bottom 3 total_bill in the data

select * from tips 
order by total_bill asc
limit 3 ;


-- find out 1st highest tip

select * from tips
order by tip desc
limit 1 ;

#.... OR

select max(tip) from tips;


-- find out 2nd highest 

select * from tips 
order by tip desc
limit 1 offset 1 ;
 
 -- 3rd highest tip

select * from tips 
order by tip desc
limit 1 offset 2 ;

-- show 3rows starting from 3rd highest tip

select * from tips 
order by tip desc
limit 3 offset 2 ;


-- Find out third highest tip by female and non smoker use limit 

select * from tips
where sex=("female") and smoker=("no")
order by tip desc
limit 1 offset 2 ;


-- Find out the entry where lowest tip was paid

select * from tips 
order by tip asc 
limit 1 ;


 
 




