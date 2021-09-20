# 创建表示例
CREATE TABLE emp (
	id INT,
	`name` VARCHAR(32),
	sex CHAR(1),
	birthday DATE,
	entry_date DATETIME,
	job VARCHAR(32),
	salary DOUBLE,
	resume MEDIUMTEXT) CHARSET utf8 COLLATE utf8_bin ENGINE INNODB;

INSERT INTO emp VALUES(001,'Danfer','M','2021-05-12','2021-05-13 22:22:22','sleeping only',5000,'be able to do anything');

SELECT * FROM emp;