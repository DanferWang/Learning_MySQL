-- 视图 view
-- 创建视图
CREATE VIEW emp_view_01
	AS
	SELECT empno, ename, job, deptno FROM emp

-- 查看视图
DESC emp_view_01
SELECT * FROM emp_view_01
-- 无法查询到未在视图中定义的及基表数据
SELECT ename, sal FROM emp_view_01

-- 查看创建视图的指令
SHOW CREATE VIEW emp_view_01

-- 删除视图
DROP VIEW emp_view_01

-- 修改视图可以观察到基表也将变化
UPDATE emp_view_01
	SET job = 'MANAGER' WHERE empno = 7369

SELECT * FROM emp
SELECT * FROM emp_view_01

-- 修改基表可以观察到视图将发生变化
UPDATE emp_view_01
	SET job = 'SALEMAN' WHERE empno = 7369

SELECT * FROM emp
SELECT * FROM emp_view_01

-- 在视图中创建新视图
CREATE VIEW emp_view_02
	AS
	SELECT empno, ename FROM emp_view_01

SELECT * FROM emp_view_02
