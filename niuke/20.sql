/*
查找员工编号emp_no为10001其自入职以来的薪水salary涨幅值growth
CREATE TABLE `salaries` (
`emp_no` int(11) NOT NULL,
`salary` int(11) NOT NULL,
`from_date` date NOT NULL,
`to_date` date NOT NULL,
PRIMARY KEY (`emp_no`,`from_date`));
*/

select 
(select salary
from salaries
where emp_no = 10001
order by to_date desc
limit 1
)
- 
(
select salary
from salaries
where emp_no = 10001
order by to_date asc
limit 1
)


-- 先分别找到emp_no=10001的员工的第一次工资记录与最后一次工资记录
--再将最后一次工资记录减去第一次工资记录得到入职以来salary的涨幅，最后用别名growth代替