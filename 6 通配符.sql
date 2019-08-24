-- 第 6 课 用通配符进行过滤
-- like 后跟的搜索模式利用通配符匹配而不是简单的相等匹配进 行比较。
-- 用通配符进行过滤
-- % 通配符 %表示任何字符出现任意次数 0 次 1 次 多次
-- Microsoft Access，需要使用*而不是%。

SELECT prod_name, prod_price, prod_desc
FROM products
where prod_name like "%bean bag%"

-- 根据邮件 地址的一部分来查找电子邮件，例如 
WHERE email LIKE 'b%@forta.com'。
/* 包括 Access 在内的许多 DBMS 都用空格来填补字段的内容
子句 WHERE prod_name LIKE 'F%y'只匹配以F开头、以y结尾的prod_name。 如果值后面跟空格，则不是以 y 结尾，所以 Fish bean bag toy 就 不会检索出来

简单的解决办法是给搜索模式再增加一个%号:'F%y%' 还匹配 y 之后的字符(或空格)。更好的解决办法是用函数去掉空格
*/

-- 通配符%看起来像是可以匹配任何东西，但有个例外，这就是 NULL。




-- _ 通配符
-- 使用的是 Microsoft Access，需要使用?而不是_。



