# 常用数据类型
# 数值类型
# 整型
CREATE TABLE t1(
	id TINYINT);
	CREATE TABLE t2(
	id TINYINT UNSIGNED);
	
INSERT INTO t1 VALUES(-129);
INSERT INTO t1 VALUES(-128);
INSERT INTO t1 VALUES(127);

SELECT * FROM t1

INSERT INTO t2 VALUES(-1);
INSERT INTO t2 VALUES(0);
INSERT INTO t2 VALUES(256);

SELECT * FROM t2

# bit类型
CREATE TABLE t3 (num BIT(8));
INSERT INTO t3 VALUES(1);
INSERT INTO t3 VALUES(5);
INSERT INTO t3 VALUES(256);
SELECT * FROM t3;
SELECT * FROM t3 WHERE num=5;

# 小数类型
# decimal/float/double
CREATE TABLE t4 (
	num1 FLOAT,
	num2 DOUBLE,
	num3 DECIMAL(30,20));
INSERT INTO t4 VALUES(88.12345678912345, 88.12345678912345, 88.12345678912345);
SELECT * FROM t4;

# 字符串类型
# char/varchar
CREATE TABLE t5 (
	`name` CHAR(255));

CREATE TABLE t6 (
	`name` VARCHAR(21844));

# text
CREATE TABLE t7 (
	content1 TEXT,
	content2 MEDIUMTEXT,
	content3 LONGTEXT);
INSERT INTO t7 VALUES('王浩辰','王浩辰浩王','王浩辰浩王浩辰');
SELECT * FROM t7;

# 时间类型
CREATE TABLE t8 (
	birthday DATE,
	jobtime DATETIME,
	login_time TIMESTAMP 
						NOT NULL DEFAULT CURRENT_TIMESTAMP 
						ON UPDATE CURRENT_TIMESTAMP);
SELECT * FROM t8;
INSERT INTO t8(birthday, jobtime) VALUES('2021-5-22','2021-5-22 10:00:56');
SELECT * FROM t8;