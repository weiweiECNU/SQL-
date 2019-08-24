/*

查找薪水出现15次以上的员工号emp_no以及其对应的次数t
CREATE TABLE `salaries` (
`emp_no` int(11) NOT NULL,
`salary` int(11) NOT NULL,
`from_date` date NOT NULL,
`to_date` date NOT NULL,
PRIMARY KEY (`emp_no`,`from_date`));


*/

select s.emp_no, count(*) as t
from salaries as s
group by s.emp_no
having count(*) > 15

/*

过滤分组 用 having 
聚类函数可以直接作为列名

*/

select s.emp_no, count(s.emp_no) as t
from salaries as s
group by s.emp_no
having count(*) > 15