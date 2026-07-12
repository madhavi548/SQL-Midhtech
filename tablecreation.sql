create database company_db;
use company_db;
create table students(student_id int primary key,
	        student_name varchar(50),
           age int,
       city varchar(50)
    );
 
insert into students values
(101,'Rahul',21,'Hyderabad'),
(102,'Anjali',20,'Chennai'),
(103,'Ravi',22,'Bangalore'),
(104,'Priya',19,'Pune'),
(105,'Kiran',23,'Mumbai');

select * from students;

