-- 存储过程
-- 创建存储过程及调用
-- 无传参无返回
DELIMITER $
CREATE PROCEDURE select_all_data()
	BEGIN
		SELECT * FROM emp;
	END$
DELIMITER ;
-- 调用存储过程
CALL select_all_data();

-- OUT
DELIMITER $
CREATE PROCEDURE show_min_sal(OUT min_sal DECIMAL)
	BEGIN
		SELECT MIN(sal) INTO min_sal
		FROM emp;
	END$
DELIMITER ;
-- 调用并查看
CALL show_min_sal(@min_sal);
SELECT @min_sal;

-- IN
DELIMITER $
CREATE PROCEDURE show_emp_sal_name(IN empname VARCHAR(20))
	BEGIN
		SELECT ename, sal
		FROM emp
		WHERE ename = empname;
	END$
DELIMITER ;
-- 调用并传参1
CALL show_emp_sal_name('ALLEN');
-- 调用并传参2
SET @emp_name := 'ALLEN';
CALL show_emp_sal_name(@emp_name);

-- IN OUT
DELIMITER $
CREATE PROCEDURE show_emp_sal(IN empname VARCHAR(20), OUT empsal DECIMAL)
	BEGIN
		SELECT sal INTO empsal
		FROM emp
		WHERE ename = empname;
	END$
DELIMITER ;
-- 调用传参并查看
CALL show_emp_sal('ALLEN', @emp_sal);
SELECT @emp_sal;

-- INOUT
DELIMITER$
CREATE PROCEDURE show_mgr_name(INOUT empname VARCHAR(20))
	BEGIN
		SELECT ename INTO empname
		FROM emp
		WHERE empno = 
			(
				SELECT mgr FROM emp
				WHERE ename = empname
			);
	END$
DELIMITER ;
-- 调用传参并查看
SET @emp_name := 'ALLEN';
CALL show_mgr_name(@emp_name);
SELECT@emp_name