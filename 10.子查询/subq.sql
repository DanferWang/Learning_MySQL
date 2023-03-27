-- 子查询
-- 单行子查询
SELECT * 
		FROM emp
		WHERE deptno = (
			SELECT deptno
					FROM emp
					WHERE ename = 'SMITH'
			)

-- 多行子查询
SELECT ename, job, sal, deptno
		FROM emp
		WHERE job in (
			SELECT DISTINCT job
				FROM emp
				WHERE deptno = 10
				) AND deptno != 10

-- ALL
SELECT ename, sal, deptno
		FROM emp
		WHERE sal > ALL(
									SELECT sal
										FROM emp
										WHERE deptno = 30
										)

-- ANY
SELECT ename, sal, deptno
		FROM emp
		WHERE sal > ANY(
									SELECT sal
										FROM emp
										WHERE deptno = 30
										)

-- 多列子查询
SELECT *
		FROM emp
		WHERE (deptno, job) = ( SELECT deptno, job
															FROM emp
															WHERE ename = 'ALLEN'
															)
					AND ename <> 'ALLEN'

-- excr
SELECT *
		FROM (SELECT deptno, AVG(sal) AS 'avg_sal'
						FROM emp
						GROUP BY deptno) temp_avg, emp
		WHERE temp_avg.deptno = emp.deptno AND emp.sal > temp_avg.avg_sal

SELECT dept.*, temp.count
		FROM dept, (SELECT deptno, COUNT(*) AS 'count'
									FROM emp
									GROUP BY deptno) temp
		WHERE dept.deptno = temp.deptno
