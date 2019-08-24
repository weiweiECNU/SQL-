/*

获取当前（to_date='9999-01-01'）薪水第二多的员工的emp_no以及其对应的薪水salary
CREATE TABLE `salaries` (
`emp_no` int(11) NOT NULL,
`salary` int(11) NOT NULL,
`from_date` date NOT NULL,
`to_date` date NOT NULL,
PRIMARY KEY (`emp_no`,`from_date`));
*/

select emp_no, salary
from salaries
where to_date ='9999-01-01'
order by salary desc
limit 1 offset 1

-- 排序 orderby
-- LIMIT 指定返回的行数。LIMIT 带的 OFFSET 指定从哪儿开始
-- 第一个被检索的行是第 0 行，而不是第 1 行。LIMIT 1 OFFSET 1 会检索第 2 行，而不是第 1 行。