/*
从titles表获取按照title进行分组，每组个数大于等于2，给出title以及对应的数目t。
注意对于重复的title进行忽略。
CREATE TABLE IF NOT EXISTS `titles` (
`emp_no` int(11) NOT NULL,
`title` varchar(50) NOT NULL,
`from_date` date NOT NULL,
`to_date` date DEFAULT NULL);
*/

Select  title, count( distinct emp_no ) as t
from titles
group by title
having t >= 2

-- 对于重复的title进行忽略。 其实是 emp_no 重复




-- 也可先找出emp_no唯一的表格，再在其中查找

select title,count(*) as t
from (select distinct emp_no,title,from_date,to_date
     from titles )
group by title having t>=2;