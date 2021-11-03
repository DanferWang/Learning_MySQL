-- 存储引擎
-- 查看所有存储引擎
SHOW ENGINES

-- MyISAM
CREATE TABLE t18(
		id INT,
		`name` VARCHAR(32)) ENGINE MYISAM
		
-- 不支持事务
START TRANSACTION;
SAVEPOINT a;
INSERT INTO t18 VALUES(1, 'Tom');
ROLLBACK TO a;
SELECT * FROM t18;

-- Memory
CREATE TABLE t19(
		id INT,
		`name` VARCHAR(32)) ENGINE MEMORY

-- 数据储存在内存中
INSERT INTO t19 VALUES(1, 'Tom'), (2, 'Jerry'), (3, 'Dogg');
SELECT * FROM t19;
-- 重启MySQL服务
SELECT * FROM t19;

-- 修改存储引擎
ALTER TABLE t18 ENGINE = INNODB
DESC t18