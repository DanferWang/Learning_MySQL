-- MySQL用户管理
-- 创建用户
CREATE USER 'user_01'@'localhost' IDENTIFIED BY 'password_01'

SELECT * FROM mysql.`user`

-- 删除用户
DROP USER 'user_01'@'localhost'

-- 修改自己的密码（登录到user_01）
SET PASSWORD = PASSWORD('123456')

-- 修改别人的密码（登录到root）
SET PASSWORD FOR user_01@localhost = PASSWORD('password_01')
