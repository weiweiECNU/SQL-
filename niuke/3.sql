/*
https://www.nowcoder.com/practice/c63c5b54d86e4c6d880e4834bfd70c3b?tpId=82&tqId=29755&tPage=1&rp=&ru=%2Fta%2Fsql&qru=%2Fta%2Fsql%2Fquestion-ranking
题目描述
查找各个部门当前(to_date='9999-01-01')领导当前薪水详情以及其对应部门编号dept_no
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

select s.*, d.dept_no
from salaries as s, dept_manager as d
where s.emp_no = d.emp_no 
and d.to_date = '9999-01-01'
and s.to_date = '9999-01-01';



/*

链接：https://www.nowcoder.com/questionTerminal/c63c5b54d86e4c6d880e4834bfd70c3b?f=discussion
来源：牛客网

关于为什么一定要两个表格的时间都限制成规定时间（9999-01-01）呢？
-----因为薪水表是按年发的，而题目要查找的是当前的薪水，所以要过滤掉以前，而dept_manager是因为有领导会离职，to_date时间不一定是9999-01-01，所以要过滤过离职的领导
*/




select s.*, d.dept_no
from salaries as s inner join dept_manager as d
on s.emp_no = d.emp_no
where d.to_date = '9999-01-01'
and s.to_date = '9999-01-01';