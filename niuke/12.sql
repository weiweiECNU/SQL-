/*
获取所有部门中当前员工薪水最高的相关信息，给出dept_no, emp_no以及其对应的salary
CREATE TABLE `dept_emp` (
`emp_no` int(11) NOT NULL,
`dept_no` char(4) NOT NULL,
`from_date` date NOT NULL,
`to_date` date NOT NULL,
PRIMARY KEY (`emp_no`,`dept_no`));
CREATE TABLE `salaries` (
`emp_no` int(11) NOT NULL,
`salary` int(11) NOT NULL,
`from_date` date NOT NULL,
`to_date` date NOT NULL,
PRIMARY KEY (`emp_no`,`from_date`));
*/

select d.dept_no, d.emp_no, max(s.salary) as salary
from dept_emp as d inner join salaries as s
on d.emp_no = s.emp_no
where s.to_date = '9999-01-01'
and d.to_date = '9999-01-01'
group by d.dept_no

-- 分组  聚合函数 max()