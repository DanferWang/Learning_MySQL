# curd on table

CREATE TABLE `goods` (
	id INT,
	goods_name VARCHAR(10),
	price DOUBLE);

# insert
INSERT INTO `goods` (id, goods_name, price)
	VALUES(10, 'HUAWEI', 2000);

INSERT INTO `goods` (id, goods_name, price)
	VALUES(11, 'Apple', 1999);

INSERT INTO `goods` (id, goods_name, price)
	VALUES(12, 'VIVO', 2199), (13, 'XIAOMI', 1999);

INSERT INTO `goods`
	VALUES(14, 'OPPO', 2499);
	
INSERT INTO `goods` (id, goods_name, price)
	VALUES('8848', '8848', 23999);

INSERT INTO `goods` (id, goods_name, price)
	VALUES(11, 'Samsung', NULL);

SELECT * FROM `goods`

# update
UPDATE emp SET salary = 5000

UPDATE emp
	SET salary = 6000
	WHERE user_name = 'Danfer'

INSERT INTO emp
	VALUES(2, 'Haochen', '2021-06-01', '2021-06-01 15:25:59', 'sleeping for fun', 7000, '真他妈的牛逼，睡觉都能赚钱', 'h:\\haha.jpg')

UPDATE emp
	SET salary = salary + 1000, job = 'sleeping and eating'
	WHERE user_name = 'Danfer'

SELECT * FROM emp

# delete
DELETE FROM emp
	WHERE user_name = 'Danfer'
	
DELETE FROM emp

SELECT * FROM emp

# select
CREATE TABLE score(
	id INT,
	`name` VARCHAR(20),
	chinese INT,
	math INT,
	english INT);

INSERT INTO score
	VALUES (1, '王123', 102, 135, 143),
				(2, '东123', 116, 132, 142),
				(3, '刘123轩', 108, 135, 140),
				(4, '梁123', 106, 125, 138),
				(5, '周123', 121, 113, 143),
				(6, '刘456', 128, 138, 137);

SELECT * FROM score;

SELECT `name`, english FROM score;

SELECT DISTINCT english FROM score;

SELECT `name`, (chinese + math + english) FROM score;

SELECT `name`, (chinese + math + english) AS total FROM score;

SELECT * FROM score WHERE `name`='王123'

SELECT * FROM score WHERE chinese>=105

SELECT * FROM score WHERE (chinese+math+english)>=369

SELECT * FROM score WHERE chinese>110 AND math>120

SELECT * FROM score WHERE `name` LIKE '刘%'

SELECT * FROM score WHERE `name` LIKE '%轩' order by math

SELECT `name`, chinese, math, english, (chinese+math+english) as total FROM score order by total desc
