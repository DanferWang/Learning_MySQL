-- 合并查询
-- union all
SELECT ename, sal, job 
		FROM emp
		WHERE sal > 2500
UNION ALL
SELECT ename, sal, job
		FROM emp
		WHERE job = 'MANAGER'

-- union
SELECT ename, sal, job 
		FROM emp
		WHERE sal > 2500
UNION
SELECT ename, sal, job
		FROM emp
		WHERE job = 'MANAGER'