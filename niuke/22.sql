/*
统计各个部门对应员工涨幅的次数总和，给出部门编码dept_no、部门名称dept_name以及次数sum
CREATE TABLE `departments` (
`dept_no` char(4) NOT NULL,
`dept_name` varchar(40) NOT NULL,
PRIMARY KEY (`dept_no`));
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



select d.dept_no, d.dept_name, count(s.salary) AS sum
from (dept_emp as de inner join salaries as s on de.emp_no = s.emp_no)
inner join departments as d on de.dept_no = d.dept_no
group by d.dept_no
order by d.dept_no

/*
虽然不严谨啊：
首先内联接三张表，按 dept_no 分组，然后聚合count 每一组里 s.salary 的个数（假设每次都是涨薪）

case when 
*/

