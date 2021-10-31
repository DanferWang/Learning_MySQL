-- index 索引
-- 创建索引
CREATE TABLE t16(
	id INT,
	`name` VARCHAR(32))

-- 查询是否有索引
SHOW INDEXES FROM t16

-- 添加索引
-- 添加唯一索引 1
CREATE UNIQUE INDEX id_index ON t16(id)
-- 添加普通索引 1
CREATE INDEX id_index ON t16(id)
-- 添加普通索引 2
ALTER TABLE t16 ADD INDEX id_index (id)
-- 添加主键索引 2
ALTER TABLE t16 ADD PRIMARY KEY (id)

-- 删除索引
DROP INDEX id_index ON t16
-- 删除主键索引
ALTER TABLE t16 DROP PRIMARY KEY

-- 查看索引
SHOW INDEX FROM t16
SHOW INDEXES FROM t16
SHOW KEYS FROM t16
DESC t16