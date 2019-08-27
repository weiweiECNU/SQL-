/*
题目描述
对所有员工的当前(to_date='9999-01-01')薪水按照salary进行按照1-N的排名，相同salary并列且按照emp_no升序排列
CREATE TABLE `salaries` (
`emp_no` int(11) NOT NULL,
`salary` int(11) NOT NULL,
`from_date` date NOT NULL,
`to_date` date NOT NULL,
PRIMARY KEY (`emp_no`,`from_date`));
*/





select sa.emp_no, sa.salary, count( distinct sb.salary) as rank
from salaries as sa, salaries as sb
where sa.to_date='9999-01-01' 
and sb.to_date='9999-01-01'
and sb.salary >= sa.salary
group by sa.emp_no
order by sa.salary desc, sa.emp_no asc;


/*
复用salaries表进行比较排名
*/
