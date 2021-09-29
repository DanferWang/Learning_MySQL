-- SELECT的查询增强
-- 日期比较
SELECT * FROM emp
			WHERE hiredate > '1991-01-01'

-- 模糊查询
SELECT ename, sal FROM emp
	WHERE ename LIKE 'S%'

SELECT ename, sal FROM emp
	WHERE ename LIKE '__O%'

-- 表结构
DESC emp

--  分页查询
SELECT * FROM emp
	ORDER BY empno
	LIMIT 0, 4

-- 查询、分组、筛选、排序、分页语法顺序
SELECT deptno, AVG(sal) AS 'average_sal' FROM emp
	GROUP BY deptno
	HAVING average_sal > 1000
	ORDER BY average_sal DESC
	LIMIT 0, 2