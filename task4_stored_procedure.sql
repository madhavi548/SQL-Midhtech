
# //structured procedure to display employees
#same like functions
USE company;
DELIMITER //
create procedure display_emp()
BEGIN
   SELECT * from employee;
END//
DELIMITER ;
call display_emp();


