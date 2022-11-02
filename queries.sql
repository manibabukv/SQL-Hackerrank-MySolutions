-- Hackerrank

-- Problem 1: Names of students who scored more than 75, order by last three char 

select name from student
where
marks > 75
order by 
substring(name, length(name)-2, 3), id

-- Problem 2: Top Earners

select months*salary as earnings, count(*)
from employee
group by
earnings
order by
earnings desc
limit 1

-- Problem 3: Average population of each continent 

select t2.continent, floor(avg(t1.population)) from city as t1
inner join country as t2 on t1.countrycode = t2.code
group by
t2.continent

-- Problem 4: African cities

select t1.name from city as t1
inner join country as t2 on t1.countrycode = t2.code
where t2.continent = 'Africa'

-- Problem 5: The Report

select if(t2.grade>=8, t1.name, NULL) as name, t2.grade, t1.marks
from students as t1
inner join grades as t2
on t1.marks >= t2.min_mark and t1.marks <= t2.max_mark
order by 
t2.grade desc, t1.name, t1.marks


-- Problem 6: Weather Observation Station 5

select city c, length(city) l
from   station
order by l desc, c asc
limit 1;

select city c, length(city) l
from   station
order by l asc, c asc
limit 1;

-- Problem 7: Weather Observation Station 8

select distinct city from station
where
substring(city,1,1) in ('a','e','i','o','u')
and
substring(city,length(city),1) in ('a','e','i','o','u')

-- Problem 8: Weather Observation Station 9

select distinct city from station
where
left(city,1) not in ('a','e','i','o','u')

-- Problem 9: Type of triangle

select case
when
A+B <= C or B+C <= A or C+A <= B then 'Not A Triangle'
WHEN
A = B and B = C then 'Equilateral'
WHEN
A = B or B = C or C = A then 'Isosceles'
Else 
'Scalene'
end
from TRIANGLES

-- Problem 10: Weather Observation Station 2

select round(sum(lat_n),2),round(sum(long_w),2) from station

-- Problem 11: Weather Observation Station 15

select round(long_w,4) from station
where
lat_n = (select max(lat_n) from station 
         where
        lat_n < 137.2345)
