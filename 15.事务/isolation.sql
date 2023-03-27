-- 隔离级别
-- 两个或多个MySQL控制台（PowerShell）

-- 查看当前MySQL的隔离级别
SELECT @@tx_isolation;
-- MySQL8.0及以上请使用
SELECT @@transaction_isolation;

-- B: 设置其中一个控制台的隔离级别为 Read uncommitted
SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

-- A: 创建表
CREATE TABLE account(
		id INT,
		`name` VARCHAR(32),
		money INT);

-- A: 添加数据
INSERT INTO account VALUES(100, 'Tom', 2000);

-- B: Read uncommitted 事务端出现脏读
SELECT * FROM account；

-- A: 修改，添加并提交
UPDATE account SET money = 9000 WHERE id = 100;
INSERT INTO account VALUES(200, 'Jerry', 3000);
COMMIT;

-- B: Read uncommitted 事务端出现不可重复读和幻读
SELECT * FROM account；

-- B: 设置其中一个控制台的隔离级别为 Read committed
SET SESSION TRANSACTION ISOLATION LEVEL READ COMMITTED;

-- A: 添加数据
INSERT INTO account VALUES(300, 'Dogg', 8000);

-- B: Read committed 事务端不会出现脏读
SELECT * FROM account；

-- A: 修改，添加并提交
UPDATE account SET money = 9900 WHERE id = 100;
INSERT INTO account VALUES(200, 'Jerry', 2000);
COMMIT;

-- B: Read committed 事务端仍出现不可重复读和幻读
SELECT * FROM account;

-- B: 设置其中一个控制台的隔离级别为 Repeatable read
SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ;

-- A: 修改，添加并提交
INSERT INTO account VALUES(400, 'Madam', 6000);
UPDATE account SET money = 7700 WHERE id = 100;
COMMIT;

-- B: 未提交前可重复度
SELECT * FROM account；
-- B：提交后读到A操作后数据
COMMIT;
SELECT * FROM account；

-- B: 设置其中一个控制台的隔离级别为 Seriaziable
SET SESSION TRANSACTION ISOLATION LEVEL SERIALIZABLE;

-- A: 修改，添加但是没有提交
INSERT INTO account VALUES(500, 'Perry', 3000);
UPDATE account SET money = 68500 WHERE id = 100;

-- B: 卡住，不可访问，过一段时间事务失去连接
SELECT * FROM account；

-- B：(可以重现开启事务，)仍然卡住
(START TRANSACTION;)
SELECT * FROM account；

-- A：提交
-- B：一旦A提交，B立刻同时看到
COMMIT；