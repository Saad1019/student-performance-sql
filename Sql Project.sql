show databases;
create database Student_Performance;

-- Import data set\

desc tablename;

select * from student_performences limit 5;

-- checking total column

select count(*) from student_performences;

-- checking null values	

select count(*) from 
student_performences
where gender is NUll
or race is null 
or parental_education is null
 or lunch is null 
 or test_preparation_course is null
 or math_score is null
 or reading_score is null
 or writing_score is null;
 
 
 -- finding unique values	
 
select * from student_performences limit 5;
select distinct(gender) from student_performences;
select distinct(race) from student_performences;
select distinct(parental_education) from student_performences;
select distinct(lunch) from student_performences;
select distinct(test_preparation_course) from student_performences;


-- Finding Average score

select avg(math_score) from student_performences;  -- 66.08
select avg(reading_score) from student_performences; -- 69.16
select avg(writing_score) from student_performences; --  68.05

select avg((math_score + writing_score + reading_score)/3) as average_combine from student_performences;

-- whole class average score lies between 67.77

-- Gender wise average score

select * from student_performences limit 5;

select avg(math_score) as female_math_score from student_performences where gender = 'female'; -- 63.66
select avg(math_score) as male_math_score from student_performences where gender = 'male';  -- 68.72

select avg(reading_score) as female_reading_score from student_performences where gender = 'female';  -- 72.60
select avg(reading_score) as male_reading_score from student_performences where gender = 'male';  -- 65.47

select avg(writing_score) as female_writing_score from student_performences where gender = 'female';  -- 72.46
select avg(writing_score) as male_writing_score from student_performences where gender = 'male';   -- 63.31

-- overall gender wise average score

select (avg(math_score + reading_score + writing_score)/3)
 as total_female_avg_score from student_performences 
 where  gender = 'female';  -- 69.56
 
 select (avg(math_score + reading_score + writing_score)/3)
 as total_male_avg_score from student_performences 
 where  gender = 'male'; -- 65.83
 
 
-- Average score based on Race group 

select distinct(race) from student_performences;

-- Group A

select (avg(math_score + reading_score + writing_score)/3)
 as total_groupA_avg_score from student_performences 
 where  race = 'group A';  -- 62.99
 
 -- Group B 
 
 select (avg(math_score + reading_score + writing_score)/3)
 as total_groupB_avg_score from student_performences 
 where  race = 'group B';  -- 65.46
 
 -- GROUP C 
 
 select (avg(math_score + reading_score + writing_score)/3)
 as total_groupC_avg_score from student_performences 
 where  race = 'group C';  -- 67.13
 
-- Group D 

select (avg(math_score + reading_score + writing_score)/3)
 as total_groupB_avg_score from student_performences 
 where  race = 'group D'; -- 69.17
 
 select (avg(math_score + reading_score + writing_score)/3)
 as total_groupE_avg_score from student_performences 
 where  race = 'group E';  -- 72.75
 
 
 --  parental education level affect student performance
 
 select distinct(parental_education) from student_performences;
 
 -- Associate degree
 
  select (avg(math_score + reading_score + writing_score)/3)
 as student_score_Associate_degree from student_performences 
 where  parental_education = "associate's degree";  -- 69.56
 
 -- bachelors degree
 
 select (avg(math_score + reading_score + writing_score)/3)
 as student_score_bachelors_degree from student_performences 
 where  parental_education = "bachelor's degree"; -- 71.92
 
 -- high school
 
 select (avg(math_score + reading_score + writing_score)/3)
 as student_score_high_school from student_performences 
 where  parental_education = "high school"; -- 63.03
 
 -- master degree
 
 select (avg(math_score + reading_score + writing_score)/3)
 as student_score_Masters_degree from student_performences 
 where  parental_education = "master's degree"; -- 73.59
 
 -- some college 
 
 select (avg(math_score + reading_score + writing_score)/3)
 as student_score_some_college from student_performences 
 where  parental_education = "some college"; -- 68.47

-- some high school 
 
 select (avg(math_score + reading_score + writing_score)/3)
 as student_score_some_high_school from student_performences 
 where  parental_education = "some high school"; -- 65.11
 
 
 -- Does Luch type Imapact score
 
 select distinct(lunch) from student_performences;
 
 -- standard lunch
 
 select (avg(math_score + reading_score + writing_score)/3)
 as standard_lunch_score from student_performences 
 where  lunch = "standard"; -- 70.83
 
 -- free/reduced lunch
 
 select (avg(math_score + reading_score + writing_score)/3)
 as free_lunch_score from student_performences 
 where  lunch = "free/reduced";  -- 62.199
 
 select distinct(test_preparation_course) from student_performences;
 
 -- who complete preparations
 
 select (avg(math_score + reading_score + writing_score)/3)
 as complete_prepartion_score from student_performences 
 where  test_preparation_course = "completed";  -- 72.66
 
 -- didn't complete preparations
 
 select (avg(math_score + reading_score + writing_score)/3)
 as none_preparation_score from student_performences 
 where  test_preparation_course = "none"; -- 65.03
 
 -- Who are the top 10 highest scoring students based on total or average score?
 
 select * from student_performences;
 
 -- top 10  total score 
 
 select gender,math_score,reading_score,writing_score ,
 (math_score+reading_score+writing_score) as total_score from 
 student_performences order by total_score desc limit 10;
 
-- top 10 average score

 select gender,math_score,reading_score,writing_score , 
 ((math_score+reading_score+writing_score)/3) as average_score from 
 student_performences order by average_score desc limit 10;
 
 -- How many students passed all three subjects (assuming pass mark = 40)?
 
 -- math score
 
 select count(math_score) from student_performences where math_score >= 40;
 
 -- pass 960 in math
 -- fail 40 in math
 
 -- reading score
 
 select count(reading_score) from student_performences where reading_score >= 40;
 
  -- pass 974 in reading
 -- fail 26 in reading 
 
 -- writing score
 
 select count(writing_score) from student_performences where writing_score >= 40;
 
   -- pass 968 in writing
 -- fail 32 in writing
 
 
 -- Students who pass in all subjects 
 
select count(*) as pass_studnets 
from student_performences
where reading_score >= 40 and writing_score >= 40 and math_score >= 40 ;

-- pass studnets 949 


-- students who fail in all subjects 

select count(*) as fail_studnets 
from student_performences
where reading_score < 40 and writing_score  <40 and math_score < 40 ;

-- failers 18 


-- what subject has the higest average

select avg(reading_score),avg(writing_score),avg(math_score) from student_performences;

-- reading avg score is higest 









 
 
 
 
 
 
 











 


















