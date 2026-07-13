-- create
use company;
#user management  to see user,host 
select user,host from mysql.user;

create user 'manu'@'%'          -- if i give 'manu'@'localhost' only files we  can see in our local
                                                       #  ,but not in others system
identified by 'manu@123';

show grants for 'manu'@'%';


grant select on company.*  to 'manu'@'%';

-- multiple grants
grant select,insert,update on company.*  to 'manu'@'%';

-- revoke
revoke select on company.* from 'manu'@'%';
-- multiple revokes
revoke select,insert,update on company.* from 'manu'@'%';
show grants for 'manu'@'%';
