-- 表复制
CREATE TABLE tbl_to_copy
		(id INT,
			`name` VARCHAR(32),
			sal DOUBLE,
			job VARCHAR(32),
			deptno INT)

DESC tbl_to_copy

SELECT * FROM tbl_to_copy

-- 从其他表复制
INSERT INTO tbl_to_copy
		(id, `name`, sal, job, deptno)
		SELECT empno, ename, sal, job, deptno
				FROM emp

SELECT * FROM tbl_to_copy

-- 自我复制
INSERT INTO tbl_to_copy
		SELECT *
				FROM tbl_to_copy

SELECT COUNT(*) FROM tbl_to_copy