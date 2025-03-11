Create Database Hospital;
Use Hospital;

Create Table patients(
patient_id int primary key,
name varchar(50),
age int,
gender varchar(50),
admission_date date,
discharge_date date
);
Create Table Departments(
department_id int primary key,
department_name varchar (50)
);

Create Table  bills(
bill_id int primary key,
patient_id int ,
department_id int,
total_amount int
);

insert into patients(patient_id,name,age,gender,admission_date,discharge_date )
values
(1,'John',45,'Male','2024-01-10','2024-01-15'),
(2,'Mary',30,'Female','2024-02-05','2024-02-12');
 
 insert into Departments(department_id,department_name)
 Values
 (1	,'Cardiology'),
 (2	,'Neurology');

insert into bills(bill_id,patient_id,department_id,total_amount)
values
(1,	1,	1, 5000),
(2, 2, 2, 7000
);

select bill_id,patient_id,department_id,total_amount
from bills;

 ALTER TABLE bills
ADD FOREIGN KEY (department_id) REFERENCES Departments(department_id) ;


#1Get the total number of patients
SELECT COUNT(*) AS total_patients FROM patients;

#2Find the average hospital stay duration
SELECT AVG(DATEDIFF(discharge_date, admission_date)) AS avg_stay_days FROM patients;

#3️Get the number of patients per department

SELECT d.department_name, COUNT(b.patient_id) AS patient_count
FROM bills b
JOIN departments d ON b.department_id = d.department_id
GROUP BY d.department_name;


SELECT p.name, d.department_name, b.total_amount
from patients p
join bills b on p.patient_id = b.patient_id
join departments d ON b.department_id = d.department_id;


