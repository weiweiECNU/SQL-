/*
题目描述
获取员工其当前的薪水比其manager当前薪水还高的相关信息，当前表示to_date='9999-01-01',
结果第一列给出员工的emp_no，
第二列给出其manager的manager_no，
第三列给出该员工当前的薪水emp_salary,
第四列给该员工对应的manager当前的薪水manager_salary
CREATE TABLE `dept_emp` (
`emp_no` int(11) NOT NULL,
`dept_no` char(4) NOT NULL,
`from_date` date NOT NULL,
`to_date` date NOT NULL,
PRIMARY KEY (`emp_no`,`dept_no`));
CREATE TABLE `dept_manager` (
`dept_no` char(4) NOT NULL,
`emp_no` int(11) NOT NULL,
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

select es.emp_no as emp_no, ms.emp_no as manager_no, es.salary as emp_salary, ms.salary as manager_salary
from 
(
select de.emp_no, de.dept_no, s.salary
from dept_emp as de inner join salaries as s
on de.emp_no = s.emp_no 
and s.to_date='9999-01-01' 
and de.to_date='9999-01-01' 
) as es,
(
select dm.emp_no, dm.dept_no, s.salary
from dept_manager as dm inner join salaries as s
on dm.emp_no = s.emp_no 
and s.to_date='9999-01-01' 
and dm.to_date='9999-01-01' 
) as ms

where es.salary > ms.salary and es.dept_no = ms.dept_no


/*
先是联结出 部门员工的工资表
再联结出 部门经理的工资表
再把两张表通过 dept_no 联结
*/