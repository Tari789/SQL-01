WITH CTE AS (
SELECT
"a"."ID",
"r"."Reason",
CASE WHEN "Body_mass_index" < 18.5 THEN 'Underweight'
     WHEN "Body_mass_index" BETWEEN 18.5 AND 25 THEN 'Healthy'
     WHEN "Body_mass_index"BETWEEN 25 AND 30  THEN 'OverWeight'
     WHEN "Body_mass_index" < 30 THEN 'Obese'
     ELSE 'Unkown'
     END AS BMI_Category ,

CASE WHEN "Month_of_absence" IN (12,1,2) THEN 'Winter'
     WHEN"Month_of_absence" IN (3,4,5) THEN 'Spring'
     WHEN"Month_of_absence" IN (6,7,8) THEN 'Summer'
     WHEN"Month_of_absence" IN (9,10,11) THEN 'Autumn'
     ELSE 'Unkown'
     END  AS Season_Names  ,
"Month_of_absence",
"Day_of_the_week",
"Transportation_expense",
"Education",
"Son",
"Social_smoker",
"Social_drinker",
"Pet",
"Disciplinary_failure",
"Age",
"Work_load_Average_day",
"Absenteeism_time_in_hours"
     FROM  "Absenteeism_at_work" AS a
LEFT JOIN "compensation" AS c
ON  "c"."ID" = "a"."ID"
LEFT JOIN "Reasons" AS r 
ON "r"."Number" = "a"."Reason_for_absence" ) 



SELECT * FROM CTE 


-/*  ----- finding the healhiest for bonus 

Select * from "Absenteeism_at_work" 
where "Social_smoker" = 0 
AND "Social_drinker" = 0 
and "Body_mass_index" < 25 
and "Absenteeism_time_in_hours" < (Select AVG("Absenteeism_time_in_hours") 
from "Absenteeism_at_work" )


---- compensation rate increase for non-smokers / budget 983,221 .68 increase per hr 

SELECT count( * ) as nonsmoker 
from "Absenteeism_at_work"
where "Social_smoker" = 0


*/