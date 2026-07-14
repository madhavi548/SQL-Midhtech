#//highest sal using subquery 
use company;
select * from employee;
select * from employee where salary in(select max(salary) from employee);