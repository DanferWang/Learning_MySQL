-- 存储函数
-- 创建存储函数并调用
DELIMITER $
CREATE FUNCTION show_job_name()
RETURNS VARCHAR(9)
DETERMINISTIC
CONTAINS SQL
READS SQL DATA
BEGIN
	RETURN (SELECT job FROM emp WHERE ename = 'SCOTT');
END$
DELIMITER ;
-- 调用
SELECT show_job_name();

DELIMITER $
CREATE FUNCTION show_job(emp_name VARCHAR(20))
RETURNS VARCHAR(9)
BEGIN
	RETURN (SELECT job FROM emp WHERE ename = emp_name);
END$
DELIMITER ;
-- 传参并调用
SET @empname := 'SCOTT';
SELECT show_job(@empname);