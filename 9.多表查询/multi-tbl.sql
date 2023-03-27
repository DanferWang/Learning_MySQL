-- 多表查询
-- 笛卡尔积
SELECT * FROM emp, dept

-- 带有过滤条件
SELECT ename, sal, dname, emp.deptno
		FROM emp, dept
		WHERE emp.deptno = dept.deptno AND emp.deptno = 10

SELECT ename, sal, grade
		FROM emp, salgrade
		WHERE sal BETWEEN losal AND hisal

-- 自连接
SELECT worker.ename AS '职员', manager.ename AS '上级'
		FROM emp worker, emp manager
		WHERE worker.mgr = manager.empno