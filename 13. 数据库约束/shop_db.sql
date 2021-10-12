-- 一个例子：商店售货系统
CREATE DATABASE shop_db

-- 创建表
CREATE TABLE goods(
	goods_id INT PRIMARY KEY,
	goods_name VARCHAR(32) NOT NULL DEFAULT '',
	price DECIMAL(10,2) CHECK(price BETWEEN 1.0 AND 99999.99),
	category VARCHAR(32),
	provider VARCHAR(32))
	
CREATE TABLE customers(
	customer_id INT PRIMARY KEY,
	`name` VARCHAR(32) NOT NULL DEFAULT '',
	address VARCHAR(32),
	email VARCHAR(32) UNIQUE,
	sex ENUM('男','女','未定义') NOT NULL,
	id_id INT UNIQUE NOT NULL)

CREATE TABLE purchases(
	oerder_id INT UNSIGNED PRIMARY KEY,
	customer_id INT NOT NULL,
	goods_id INT NOT NULL,
	num INT NOT NULL DEFAULT 0,
	FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
	FOREIGN KEY (goods_id) REFERENCES goods(goods_id))
	
DESC goods
DESC customers
DESC purchases