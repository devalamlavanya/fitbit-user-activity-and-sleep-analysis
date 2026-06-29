-- Preview the Daily Activity dataset
SELECT * FROM `firstproject-492514.fit.dailyactivity_cleaned` limit 10;

-- Preview the Sleep dataset
select * from `firstproject-492514.fit.sleepday_cleaned`;

-- What is the average number of steps taken by users each day?
select
  ActivityDate,
  round(avg(totalsteps),2)
from
  `firstproject-492514.fit.dailyactivity_cleaned`
group by 
   ActivityDate;

-- How many users have both activity and sleep records?
select 
   count(distinct(d.id))
from 
  `firstproject-492514.fit.dailyactivity_cleaned` as d
join
  `firstproject-492514.fit.sleepday_cleaned` as s
on d.Id=s.Id;

-- Which date recorded the highest average distance travelled?
select 
  ActivityDate,
  round(avg(TotalDistance),2) as avg_steps
from
   `firstproject-492514.fit.dailyactivity_cleaned`
group by 
  ActivityDate
order by 
  avg_steps desc
limit 1;

-- Which user recorded the highest total number of steps?
select 
  Id,
  sum(TotalSteps) as total_steps
from 
   `firstproject-492514.fit.dailyactivity_cleaned`
group by 
  Id
order by
  total_steps desc
limit 1 ;

-- Question 5:
-- Which user spent the most total time awake while in bed?
select id,
      sum(TotalTimeInBed)-sum(TotalMinutesAsleep) as best
from
  `firstproject-492514.fit.sleepday_cleaned`
group by 
 id
order by 
best desc
limit 1;

-- Do more active users tend to sleep longer?
-- Average daily steps vs average minutes asleep
select dc.Id, round(avg(TotalSteps),2) as activity,round(avg(TotalMinutesAsleep),2) as sleep
from 
 `firstproject-492514.fit.dailyactivity_cleaned`as dc
join
  `firstproject-492514.fit.sleepday_cleaned` as sc
on dc.Id= sc.Id and dc.ActivityDate=sc.SleepDay
group by dc.Id;

-- Which users average at least 7 hours (420 minutes) of sleep?
select avg(TotalMinutesAsleep) as average
from `firstproject-492514.fit.sleepday_cleaned`
group by Id
having average >=420;

-- Count users achieving the recommended sleep duration
select count(*)
from (select avg(TotalMinutesAsleep) as average
from `firstproject-492514.fit.sleepday_cleaned`
group by Id
having average >=420);
  

-- Which users are more active than the average Fitbit user?
select 
  Id,
  avg(TotalSteps) as avg_steps
from 
   `firstproject-492514.fit.dailyactivity_cleaned`
group by Id
having avg_steps > (
  select avg(totalsteps) as average
  from 
  `firstproject-492514.fit.dailyactivity_cleaned`
  );

-- Same analysis sorted from highest to lowest activity
SELECT
  Id,
  AVG(TotalSteps) AS avg_steps
FROM `firstproject-492514.fit.dailyactivity_cleaned`
GROUP BY Id
HAVING avg_steps > (
  SELECT AVG(TotalSteps)
  FROM `firstproject-492514.fit.dailyactivity_cleaned`
)
ORDER BY avg_steps DESC;

-- Which users spend the most time being sedentary?
select id, round(avg(SedentaryMinutes),2) as avg_sedentary_minutes
from 
   `firstproject-492514.fit.dailyactivity_cleaned`
group by id
order by avg_sedentary_minutes desc;

-- Classify users into activity levels based on average steps
select 
    id,
    round(avg(totalsteps)) as avg_steps,
case 
when avg(totalsteps) < 5000 then 'Low activity'
when avg(totalsteps) between 5000 and 10000 then 'Moderate activity'
else 'High activity'
end as cat
from 
   `firstproject-492514.fit.dailyactivity_cleaned`
GROUP BY ID;

-- Which user has the highest sleep efficiency?
-- Sleep Efficiency = (Minutes Asleep / Time In Bed) × 100
SELECT
  Id,
  ROUND(
    (TotalMinutesAsleep / TotalTimeInBed) * 100, 2
  ) AS sleep_efficiency
FROM
  `firstproject-492514.fit.sleepday_cleaned`
ORDER BY
  sleep_efficiency DESC
LIMIT 1;
 
-- Additional Validation Query
-- Verify matching records between activity and sleep datasets
SELECT
  da.id
FROM `firstproject-492514.fit.dailyactivity_cleaned` as da
join `firstproject-492514.fit.sleepday_cleaned` as sd
on da.id= sd.id
and 
da.ActivityDate=sd.SleepDay

-- Identify users present in both datasets
SELECT
  distinct dc.id 
FROM `firstproject-492514.fit.dailyactivity_cleaned` dc
JOIN `firstproject-492514.fit.sleepday_cleaned` sc
ON dc.Id = sc.Id;

