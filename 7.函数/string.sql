-- 字符串函数
SELECT CHARSET(ename) FROM emp

SELECT CONCAT(ename, ' job is ', job) FROM emp

-- DUAL 亚元表，系统表，一般可做为测试表使用
SELECT INSTR('王一二','一二') FROM DUAL

SELECT UCASE(ename), LCASE(ename) FROM emp

SELECT LEFT(ename,3), RIGHT(ename,3) FROM emp

SELECT LENGTH(ename), LENGTH('王浩辰') FROM emp

SELECT REPLACE(job,'MANAGER','经理') FROM emp

SELECT STRCMP('abc', 'ABC') FROM DUAL
SELECT STRCMP('abc', 'bbc') FROM DUAL
SELECT STRCMP('bbc', 'abc') FROM DUAL

SELECT SUBSTRING(ename, 2, 4) FROM emp

SELECT CONCAT(LCASE(LEFT(ename,1)), SUBSTRING(ename,2)) FROM emp
