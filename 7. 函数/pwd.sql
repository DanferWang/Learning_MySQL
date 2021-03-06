-- 加密和系统函数
SELECT USER() FROM DUAL

SELECT DATABASE()

SELECT MD5('`123456***danfer') FROM DUAL

-- 常用于保护用户密码的应用中
CREATE TABLE register_user(id INT,
														`name` VARCHAR(32) NOT NULL DEFAULT '',
														pwd CHAR(32) NOT NULL DEFAULT '')

INSERT INTO register_user
				VALUES(1, '王一二', MD5('123456***danfer'))

SELECT * FROM register_user

SELECT * FROM register_user
					WHERE `name`='王一二' AND pwd=MD5('123456***danfer')

-- MySQL数据库中的用户密码是用PASSWORD函数加密
SELECT PASSWORD('123456***danfer') FROM DUAL -- *914654D500504734C4417E9ADA832616E0590316
SELECT * FROM mysql.user
