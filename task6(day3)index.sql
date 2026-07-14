
#create index
use company;
create index idx_emp on employee(emp_name);
select * from employee where emp_name="madhu";
desc employee;
desc dept;