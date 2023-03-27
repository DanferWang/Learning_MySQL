-- 权限管理
-- 创建一个用户bear，密码1024，仅允许从本地登录，不允许远程登录
CREATE USER 'bear'@'localhost' IDENTIFIED BY '1024'

-- - 使用root用户创建testdb数据库及其下的news表
CREATE DATABASE testdb
CREATE TABLE news(
	id INT,
	content VARCHAR(32))
INSERT INTO news VALUES(1, 'News')
SELECT * FROM news

-- 给bear分配查看news表和添加数据的权限
GRANT SELECT, INSERT
	ON testdb.news
	TO 'bear'@'localhost'

-- 以bear的身份查看news表中数据并添加数据
SELECT * FROM news
INSERT INTO news VALUES(2, 'News')

-- 使用root用户修改bear用户的密码为abcd
SET PASSWORD FOR 'bear'@'localhost' = PASSWORD('abcd')

-- 使用root用户回收bear用户的所有权限
REVOKE ALL ON testdb.news FROM 'bear'@'localhost'

-- 使用root用户删除bear用户
DROP USER 'bear'@'localhost'
