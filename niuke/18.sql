/*
查找当前薪水(to_date='9999-01-01')排名第二多的员工编号emp_no、薪水salary、last_name以及first_name，不准使用order by
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

select e.emp_no, max(s.salary) as salary, e.last_name, e.first_name
from employees as e inner join salaries as s
on e.emp_no = s.emp_no
where s.to_date = '9999-01-01'
and s.salary not in (select max(salary) from salaries where to_date = '9999-01-01')

-- 在非 最高薪水中找到最高的薪水

SELECT e.emp_no, s1.salary, e.last_name, e.first_name
FROM employees e, salaries s1, salaries s2
WHERE e.emp_no = s1.emp_no
    AND s1.to_date = '9999-01-01'
    AND s2.to_date = '9999-01-01'
    AND s1.salary <= s2.salary
GROUP BY s1.emp_no
HAVING COUNT(DISTINCT s2.salary)= 2

/*
链接：https://www.nowcoder.com/questionTerminal/c1472daba75d4635b7f8540b837cc719?f=discussion
来源：牛客网

薪水第二多，意思就是只有一个人比他多，这样只要用salary表内连接，再分组，组内条数等于1的那条记录，就正好是第二多。如果要找第三多，那就让having count(*)=2就行了，只有两个人比那个人多。。还可扩展呢~
不过如果，有两个人比那个人多，这两个人的薪水值相同的话，还得用一下distinct关键字消除。
*/



select e.emp_no,s3.salary,e.last_name,e.first_name
from employees e
inner join(
select s1.emp_no,s1.salary
from salaries s1
inner join salaries s2
on s1.salary < s2.salary
where s1.to_date = '9999-01-01' and s2.to_date = '9999-01-01'
group by s1.emp_no
having count(*) = 1
) s3
on e.emp_no = s3.emp_no;
