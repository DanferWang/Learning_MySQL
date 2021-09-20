# 表操作
# 创建表
CREATE TABLE `user` (
	id INT,
	`name` VARCHAR(255),
	`password` VARCHAR(255),
	birthday DATE)
	CHARACTER SET utf8 COLLATE utf8_bin ENGINE INNODB

# 修改表
# 在createTable_excr之上
ALTER TABLE emp 
			ADD image VARCHAR(32) NOT NULL DEFAULT '' 
			AFTER resume;

# 显示表的结构
DESC emp;

ALTER TABLE emp
			MODIFY job VARCHAR(60) NOT NULL DEFAULT '';

ALTER TABLE emp
			DROP sex;

RENAME emp TO employee;

ALTER emp CHARACTER SET utf8;

ALTER TABLE emp 
			CHANGE `name` user_name VARCHAR(64) NOT NULL DEFAULT '';