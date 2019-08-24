/*
查找employees表所有emp_no为奇数，且last_name不为Mary的员工信息，并按照hire_date逆序排列
CREATE TABLE `employees` (
`emp_no` int(11) NOT NULL,
`birth_date` date NOT NULL,
`first_name` varchar(14) NOT NULL,
`last_name` varchar(16) NOT NULL,
`gender` char(1) NOT NULL,
`hire_date` date NOT NULL,
PRIMARY KEY (`emp_no`));
*/

select *
from employees
where emp_no  % 2 = 1 
and last_name <> "Mary"
order by hire_date desc;

-- sqlit3 取余用 % ， oracle  用 mod(  ,2)
-- 不等于 用 <>, oracle 可以用!= 

