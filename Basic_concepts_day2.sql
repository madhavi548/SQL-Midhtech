-- create database company;
use company;
create table  dept(dept_id int primary key,
          dept_name varchar(50));
insert into dept values(101,'it'),
(102,'security'),
(103,'testing'),
(104,'HR'),
(105,'operation'),
(106,'sales'),
(107,'admin'),
(108,'marketing'),
(109,'support'),
(110,'finance');

select * from dept;

--  create employee table

create table employee(emp_id int primary key,
emp_name varchar(50) not null,
email varchar(100) unique,
salary decimal(10,2) default 30000,      -- DECIMAL(precision, scale)
                                             -- precision->max 10 digits,scale-> decimal point
--                                              Maximum 10 digits in total.
-- 												2 digits after the decimal point.
-- 											Therefore, 8 digits before the decimal point.
age int check(age>=18),
dept_id int,
foreign  key(dept_id)
references dept(dept_id));

desc employee;
show tables;

insert into employee values(1,'madhu','madhu@gmail.com',86000,25,101),
 (2,'ma','ma@gmail.com',36000,20,102),
 (3,'sru','sru@gmail.com',25000,23,101),
 (4,'hari','hari@gmail.com',24000,19,103),
 (5,'priya','priya@gmail.com',78000,30,104),
 (6,'keshu','keshu@gmail.com',27000,29,101),
 (7,'ram','ram@gmail.com',98000,29,105),
 (8,'vani','vani@gmail.com',40000,19,108),
 (9,'sree','sree@gmail.com',21000,29,106);
 
 select * from employee;
 
--  primary key(id)  ->must be unique
insert into employee values(2,'alex','alex@gmail.com',70000,25,101);
-- primary key accepts only unique values,otherwise error

-- unique key(email) (cant accept duplicate values)
insert into employee values(11,'ma','madhu@gmail.com',34000,34,102);

-- not null(must be present)
insert into employee(emp_id,email,salary,age,dept_id)
values(11,'madhu@gmail.com',34000,34,102);
 
 -- default 
 insert into employee(emp_id,emp_name,email,age,dept_id)
values(11,'chaitu','chaithu@gmail.com',34,102);


-- check  (constraint is violated <18)
insert into employee(emp_id,emp_name,email,age,dept_id)
values(12,'chaiu','chathu@gmail.com',15,102);

-- foriegn key
insert into employee(emp_id,emp_name,email,salary,age,dept_id)
values(16,'chai','chu@gmail.com',23000,19,120);

-- 1.select clause
select emp_name,dept_id from employee;

-- --2. where clause(for filtering the condition)
select * from employee where salary>50000;
select * from employee where emp_name="madhu";

-- 3.Distinct clause(removes duplicates)
select distinct dept_id from employee;

-- 4.order by(default asc)
select * from employee order by salary;
select * from employee order by salary asc;
-- descending
select * from employee order by salary desc;
select * from employee order by emp_name;

-- 5.limit(limit to print)
select * from employee limit 3;

-- limit and offset(skip rows)
select * from employee limit 4 offset 3;     -- skips upto 3 and prints 4 to 7

-- between
select * from employee where salary between 30000 and 50000;
select * from employee where age between 25 and 35;

-- In opeartor
select * from employee where dept_id in(101,103,105);

-- not in
select * from employee where dept_id not  in(101,103,105);
 
--  is null(checks empty value in column
select * from employee where email is null;

-- is not null
select * from employee where email is not null;

-- like(pattern matching process)
-- %->multiple charcters
-- _(underscore -> single character)

select * from employee where emp_name like "h%";
select * from employee where emp_name like "_a%";

-- Aggregate functions(sum,max,min,count,avg)
-- --1. count
select count(*) from employee;
-- 2.max()
select max(salary) from employee;
-- 3.min
select min(salary) from employee;
-- 4.avg
select avg(salary) from employee;
-- 5.sum
select sum(salary) from employee;

-- group by
select dept_id,count(*) from employee group by dept_id;

-- having
select dept_id,count(*) from employee group by dept_id having count(*)>1;

-- alias (used to give alternative nametemporarily)
-- column alias
select emp_name as ename,dept_id as department_id from employee;
-- table alias
select e.emp_name,e.salary from employee e;

-- group by
select dept_id,count(*) from employee group  by dept_id;
select dept_id,avg(salary) from employee  group  by dept_id ;
select dept_id,sum(salary) from employee  group  by dept_id ;
select dept_id,min(salary) from employee  group  by dept_id ;
select dept_id,max(salary) from employee  group  by dept_id ;

#having
select dept_id,count(*) from employee group  by dept_id having count(*)>1;

select dept_id,count(*),avg(salary) from employee 
group  by dept_id having avg(salary)>35000;

select dept_id,emp_name from employee order by emp_name;
select dept_id,emp_name,count(*) from employee order by emp_name;  #error without groupby we can't use




#JOINS
#1.InnerJoin(fetch matching records from both tables)
-- syntax
-- select column from table1 inner join table2 on tab1.col=tab2.col;

select emp_name from employee inner join dept on employee.dept_id=dept.dept_id;
select emp_name,emp_id from employee inner join 
dept on employee.dept_id=dept.dept_id;

select emp_name,emp_id from employee inner join 
dept on employee.dept_id=dept.dept_id;

select e.emp_name,d.dept_name
from dept as d
inner join employee as e
on d.dept_id=e.dept_id;

select d.dept_id,e.emp_name from dept as d 
inner join employee as e
on d.dept_id=e.dept_id;

select distinct dept_id from employee;
select distinct dept_id from dept;

#2.Outer join
#1.left outer join
select * from dept;
select * from employee;
#syntax:select column from table1 left outer join table2 on tab1.col=tab2.col;
#if not same it returns null
#left join
select d.dept_name,e.emp_name from dept d left outer join employee e 
on d.dept_id=e.dept_id;
#right join
select d.dept_name,e.emp_name from dept d right join employee e 
on d.dept_id=e.dept_id;

#full outer join  (union operator we use)
select d.dept_name,e.emp_name from dept d left outer join employee e 
on d.dept_id=e.dept_id
union
select d.dept_name,e.emp_name from dept d right join employee e 
on d.dept_id=e.dept_id;




