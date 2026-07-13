
#===============task3=======================

#Part-A =>User Management
#DCL(Data Control Language)
use company;
-- \password set
create user 'student1'@'%' 
identified by 'Student@123';

-- //check permissions
show grants for 'student1'@'%';

-- //giving  permission
grant select on company.* to 'student1'@'%';

-- //again check permissions
show grants for 'student1'@'%';



-- =============PART B(TRANSACTIONS)========================
  -- 1.rollback
  select * from employee;
 --  //update name of emp1
 start transaction;
 set autocommit=0;
 update employee set emp_name='madhavi' where emp_id=3;
 select * from employee;
 rollback;
select * from employee;

-- //update sal
start transaction;
set autocommit=0;
update employee set salary=40000 where emp_id=1;
select * from employee;
rollback;
select * from employee;

-- //commit
start transaction;
update employee set salary=salary+20000 where emp_id=1;
commit; 
select * from employee;



-- ===================PART-3(tABLE MODIFICATION) ==============
-- //add phn column

alter table employee drop column phone_num;
alter table employee add phn_num varchar(10) check(length(phn_num)=10);
select * from employee;

-- if columns like emp_id, emp_name, salary, etc. are NOT NULL, this statement will fail
--  because those values are missing.(we cant insert values)

-- insert into employee (phn_num) values('9865345671'),
-- ('9123456789'),('9825671340'),('8756456111'),
-- ('9123056789'),('9825371340'),('8756446111'),
-- ('9120456789'),('9835671340'),('8756416111');

-- //updating 3 phn numbers
update employee set phn_num='8756416111' where emp_id=3;
update employee set phn_num='8756415111' where emp_id=5;
update employee set phn_num='8736416111' where emp_id=10;

-- //display the data
select * from employee;

-- //truncate=> truncate table tablename;
-- //drop=> drop table tablename;


