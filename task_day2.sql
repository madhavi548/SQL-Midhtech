create database office_db;
use office_db;

#dept table creation
create table department(dept_id int primary key,
    dept_name varchar(30) not null); 
    
 #emp table creation   
create table emp(e_id int primary key,
e_name varchar(30) not null,
e_email varchar(100) unique,
e_sal int default 25000,
age int check(age>=18)   ,
dept_id int,
foreign key(dept_id)
references department(dept_id)); 

#insert into dept
insert into department values(10,'IT'),
(20,'HR'),(30,'finance'),(40,'sales'),(50,'marketing');

#insert into emp
insert into emp values(101,'madhu','madhu@gmail.com',25000,19,20),
   (102,'sruu','sruu@gmail.com',65000,22,30),
   (103,'hari','hari@gmail.com',29000,21,10),
   (104,'vani','vani@gmail.com',67000,30,50),
   (105,'priya','priya@gmail.com',42000,29,40),
   (106,'chaitu','chaitu@gmail.com',54000,23,20),
   (107,'sai','sai@gmail.com',47000,18,40),
   (108,'shiv','shiv@gmail.com',86000,34,30),
   (109,'ram','ram@gmail.com',76000,27,10),
   (110,'keshu','keshu@gmail.com',78900,26,10);

-- ==============================================================

#TASK2
#1.display the tables
select * from department;
select * from emp;

#2.name and sal
select e_name,e_sal from emp;

#3.sal>50000
select * from emp where e_sal>50000;

#4.age between 25 and 30
select * from emp where age between 25 and 30 ;

#5.display emp dept 10,30
select * from emp where dept_id in(10,30);

#6.distinct dept id
select distinct dept_id  from emp;

#7.sal in desc
select * from emp order by e_sal desc;

#8. 1st 5 emp
select * from emp limit 5;

#9.names starts with 'v'
select * from emp where e_name like 'v%';

#10.total emp
select count(*)  from emp;

#11.max sal
select max(e_sal) from emp;

#12.min sal
select min(e_sal) from emp;

#13.avg sal
select avg(e_sal) from emp;

#14.count emp group wise dept
select dept_id,count(*) from emp group by dept_id;

#15.dpt wise having count >1
select dept_id,count(*) from emp group by dept_id having count(*)>1

#16.emp name,dept name using inner join
select e.e_name ,d.dept_name,e.dept_id as "emp_dept",d.dept_id as "dept.dept_id" from emp e 
inner join department d on e.dept_id=d.dept_id; 
