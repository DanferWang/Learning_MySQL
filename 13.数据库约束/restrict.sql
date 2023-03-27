-- MySQL约束
-- 主键
CREATE TABLE t11
		(id INT PRIMARY KEY,
			`name` VARCHAR(32),
			mail VARCHAR(32))

INSERT INTO t11
		VALUES(1, 'jack', 'jack@gmail.com'), (2, 'tom', 'tom@gmail.com')

SELECT * FROM t11

INSERT INTO t11
		VALUES(1, 'dd', 'dd@gmail.com')

-- 复合主键
CREATE TABLE t12
		(id INT,
			`name` VARCHAR(32),
			mail VARCHAR(32),
			PRIMARY KEY(id, `name`))

INSERT INTO t12
		VALUES(1, 'jack', 'jack@gmail.com'), (2, 'tom', 'tom@gmail.com')

SELECT * FROM t12

INSERT INTO t12
		VALUES(1, 'dd', 'dd@gmail.com')

DESC t12

-- 唯一
CREATE TABLE t13
		(id INT UNIQUE,
			`name` VARCHAR(32),
			email VARCHAR(32))

INSERT INTO t13
		VALUES(1, 'jack', 'jack@gmail.com'), (2, 'tom', 'tom@gmail.com')

INSERT INTO t13
		VALUES(1, 'dd', 'dd@gmail.com')
		
INSERT INTO t13
		VALUES(NULL, 'dd', 'dd@gmail.com')
INSERT INTO t13
		VALUES(NULL, 'tt', 'tt@gmail.com')
		
SELECT * FROM t13

-- 外键
-- 首先建立主表
CREATE TABLE my_class
		(id INT PRIMARY KEY,
			`name` VARCHAR(32) NOT NULL DEFAULT '',
			address VARCHAR(32))

-- 其次建立从表
CREATE TABLE my_stu
		(id INT PRIMARY KEY,
			`name` VARCHAR(32) NOT NULL DEFAULT '',
			class INT,
			FOREIGN KEY (class) REFERENCES my_class(id))

DESC my_stu

INSERT INTO my_class
		VALUES(1, 'java', 'beijing'), (2, 'my_sql','shanghai')

SELECT * FROM my_class

INSERT INTO my_stu
		VALUES(100, 'tom', 1)
INSERT INTO my_stu
		VALUES(200, 'jerry', 2)
INSERT INTO my_stu
		VALUES(300, 'dog', 3)

SELECT * FROM my_stu

INSERT INTO my_class
		VALUES(3, 'pytorch', 'shenzhen')

INSERT INTO my_stu
		VALUES(300, 'dog', 3)
INSERT INTO my_stu
		VALUES(400, 'puppy', NULL)

SELECT * FROM my_stu

DELETE FROM my_class
		WHERE `name` = 'pytorch'

-- 检查
CREATE TABLE t14
		(id INT PRIMARY KEY,
			`name` VARCHAR(32),
			sex VARCHAR(6) CHECK(sex in ('male','female')))

INSERT INTO t14
		VALUES(1, 'fake', 'mid')

SELECT * FROM t14

-- 自增长
CREATE TABLE t15
		(id INT PRIMARY KEY AUTO_INCREMENT,
		email VARCHAR(32),
		`name` VARCHAR(32))

INSERT INTO t15 VALUES(NULL, '123@qq.com', 'wang')
INSERT INTO t15(email, `name`) VALUES('123@gmail.com', 'sun')

SELECT * FROM t15

INSERT INTO t15 VALUES(666, '123@163.com', 'shi')
INSERT INTO t15 VALUES(NULL, '123@yahoo.com', 'li')

SELECT * FROM t15