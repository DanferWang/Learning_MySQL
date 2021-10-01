-- 外连接
CREATE TABLE stu
		(id INT,
			`name` VARCHAR(32))
INSERT INTO stu
		VALUES(1, 'jack'),(2, 'tom'),(3, 'kity'),(4,'nono')
SELECT * FROM stu

CREATE TABLE exam
		(id INT,
			grade int)
INSERT INTO exam
		VALUES(1, 56), (2, 76), (11, 8)
SELECT * FROM exam

-- 左外连接
SELECT `name`, stu.id, grade
		FROM stu LEFT JOIN exam
		ON stu.id = exam.id

-- 右外连接
SELECT `name`, stu.id, grade
		FROM stu RIGHT JOIN exam
		ON stu.id = exam.id

-- excr
SELECT dname, ename, job
		FROM dept LEFT JOIN emp
		ON dept.deptno = emp.deptno
		ORDER BY dname