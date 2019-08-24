/*
查找所有员工自入职以来的薪水涨幅情况，给出员工编号emp_no以及其对应的薪水涨幅growth，并按照growth进行升序
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

select s_current.emp_no, 
(s_current.salary - s_past.salary) as growth

from 
(select s.emp_no, s.salary from  employees as e inner join salaries as s
 on s.emp_no = e.emp_no where s.to_date = '9999-01-01') as s_current
inner join 
(select s.emp_no, s.salary from  employees as e inner join salaries as s
 on s.emp_no = e.emp_no where s.from_date = e.hire_date ) as s_past

on s_current.emp_no = s_past.emp_no

order by growth asc

/*
先用子查询 建一个只有 现在工资的表
再用子查询建一个只有 刚入公司工资的表
两张表 内连接


*/