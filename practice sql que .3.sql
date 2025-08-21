select first_name ,last_name, gender
from patients
where gender ="M"  ;


#....To show the first names of patients that start with the letter 'C',
#..you can use the LIKE operator in SQL.

select first_name, last_name 
from patients
where allergies is null ;

select first_name 
from patients
where first_name like "c%" ;


#....Show first name and last name of patients that weight within the range of 100 to 120 (inclusive)

select first_name, last_name
from patients
where weight between 100 and 200 ;


update patients
set allergies ="NKA"
where allergies is null ;


#....Show first name, last name, and the full province name of each patient.

select concat(first_name," " ,last_name) as full_name
from patients ;


#....Show first name, last name, and the full province name of each patient.

select patients.first_name, last_name ,province_names.province_name
from patients join province_names
on patients.province_id = province_names.province_id ;


#...Show how many patients have a birth_date with 2010 as the birth year.

select count(*) as total_patients
from patients
where year (birth_date)=2010 ;


#...Show the first_name, last_name, and height of the patient with the greatest height.

select first_name, last_name, height
from patients
order by height desc
limit 1 ;


#...Show all columns for patients who have one of the following patient_ids:
#..1,45,534,879,1000.

select * from patients
where patient_id in (1,45,534,879,1000);


#...Show the total number of admissions

select count(*) as total_num_of_admissions
from admissions ;

#...Show all the columns from admissions where the patient was 
#..admitted and discharged on the same day.

select * from admissions
where admission_date = discharge_date ;


select first_name ,last_name, gender
from patients
where gender ="M"  ;


#....To show the first names of patients that start with the letter 'C',
#..you can use the LIKE operator in SQL.

select first_name, last_name 
from patients
where allergies is null ;

select first_name 
from patients
where first_name like "c%" ;


#....Show first name and last name of patients that weight within the range of 100 to 120 (inclusive)

select first_name, last_name
from patients
where weight between 100 and 200 ;


update patients
set allergies ="NKA"
where allergies is null ;


#....Show first name, last name, and the full province name of each patient.

select concat(first_name," " ,last_name) as full_name
from patients ;


#....Show first name, last name, and the full province name of each patient.

select patients.first_name, last_name ,province_names.province_name
from patients join province_names
on patients.province_id = province_names.province_id ;


#...Show how many patients have a birth_date with 2010 as the birth year.

select count(*) as total_patients
from patients
where year (birth_date)=2010 ;


#...Show the first_name, last_name, and height of the patient with the greatest height.

select first_name, last_name, height
from patients
order by height desc
limit 1 ;


#...Show all columns for patients who have one of the following patient_ids:
#..1,45,534,879,1000.

select * from patients
where patient_id in (1,45,534,879,1000);


#...Show the total number of admissions

select count(*) as total_num_of_admissions
from admissions ;

#...Show all the columns from admissions where the patient was 
#..admitted and discharged on the same day.

select * from admissions
where admission_date = discharge_date ;


#...Show unique birth years from patients and order them by ascending.

select distinct year(birth_date) as birth_year
from patients
order by birth_year asc ;

select first_name 
from patients
group by first_name
having count(*) = 1 ;


select patient_id, first_name
from patients
where first_name like "s%s"
and length(first_name)>=6 ;


select patients.patient_id, first_name, last_name
from patients inner join admissions
on patients.patient_id=admissions.patient_id
where diagnosis like "dementia" ;


select first_name 
from patients
order by length(first_name), first_name asc ;


select count(gender) as male_count ,female_count
from patients
where gender="M" and gender="F";


#..Show the total amount of male patients and the total amount of female patients in the patients table.
#..Display the two results in the same row. 
SELECT 
    COUNT(CASE WHEN gender = 'M' THEN 1 END) AS male_patients,
    COUNT(CASE WHEN gender = 'F' THEN 1 END) AS female_patients
FROM Patients;

#..Show first and last name, allergies from patients which have allergies to either
#. 'Penicillin' or 'Morphine'. Show results ordered ascending by allergies then by 
#.first_name then by last_name.
select first_name, last_name, allergies
from patients
where allergies in ("Penicillin", "Morphine")
order by allergies, first_name, last_name asc ;


#..Show all of the patients grouped into weight groups.
#.Show the total amount of patients in each weight group.
#.Order the list by the weight group decending.
#.For example, if they weight 100 to 109 they are placed in the 100 weight group, 
#.110-119 = 110 weight group, etc.
 SELECT (weight DIV 10) * 10 AS weight_group,COUNT(*) AS total_patients
FROM patients
GROUP BY weight_group
ORDER BY weight_group DESC;

#..Show patient_id, diagnosis from admissions. Find patients admitted multiple times for the same diagnosis.
SELECT patient_id, diagnosis
FROM admissions
GROUP BY patient_id, diagnosis
HAVING COUNT(*) > 1;


#..Show the city and the total number of patients in the city. 
#..Order from most to least patients and then by city name ascending.
select city, count(*) as num_patients
from patients
group by city
order by num_patients desc, city asc ;


#..Show first name, last name and role of every person that is either patient or doctor. 
#.The roles are either "Patient" or "Doctor"
SELECT first_name, last_name, 'Patient' AS role
FROM patients
UNION ALL
SELECT first_name, last_name, 'Doctor' AS role
FROM doctors;


select allergies, count(*) as total_diagnosis
from patients
where allergies is not null 
group by allergies 
order by total_diagnosis desc ;


#..Show all allergies ordered by popularity. Remove NULL values from query.
select first_name, last_name, birth_date
from patients
where year(birth_date) between 1970 and 1979
order by birth_date asc ;


#... We want to display each patient's full name in a single column.
 #Their last_name in all upper letters must appear first, then first_name in all lower case letters.
 #Separate the last_name and first_name with a comma. 
#Order the list by the first_name in decending order EX: SMITH,jane .
select concat(upper(last_name), "," ,lower(first_name))as new_name_format
from patients
order by lower(first_name) desc ;


 


