/*

查找所有员工入职时候的薪水情况，给出emp_no以及salary， 并按照emp_no进行逆序
CREATE TABLE `employees` (
`emp_no` int(11) NOT NULL,
`birth_date` date NOT NULL,
`first_name` varchar(14) NOT NULL,
`last_name` varchar(16) NOT NULL,
`gender` char(1) NOT NULL,
`hire_date` date NOT NULL,
PRIMARY KEY (`emp_no`));
CREATE TABLE `salaries` (
`emp_no` int(11) NOT NULL,
`salary` int(11) NOT NULL,
`from_date` date NOT NULL,
`to_date` date NOT NULL,
PRIMARY KEY (`emp_no`,`from_date`));
*/


select s.emp_no, s.salary
from employees as e inner join salaries as s
on e.emp_no = s.emp_no
where s.from_date = e.hire_date
order by s.emp_no desc;

/*
s.from_date = e.hire_date
入职时候的薪水

*/