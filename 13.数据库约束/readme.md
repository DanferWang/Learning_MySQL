# MySQL约束

#### **Origin: Danfer Wang**

约束用于确保数据库中的数据满足特定的业务需求和规则。

## 主键： PRIMARY KEY

在定义表时，主键用于唯一标识表行的数据，当定义主键约束后，该列中的数据不能出现重复。

```mysql
col type PRIMARY KEY
```

- 主键不能重复且不能为NULL
- 一张表中最多有一个主键，但可以时复合主键

```mysql
col1 type,
col2 type,
col3 type,
PRIMARY KEY(col1, col2)
```

- 使用DESC可以查看约束情况
- 在实际开发中，往往每个表都会设置主键

## 非空：NOT NULL

在列上定义了NOT NULL，当插入数据时，必须为该列提供数据，而不允许时NULL。

```mysql
col type NOT NULL
```

## 唯一： UNIQUE

在列上定义了UNIQUE，该列的值不允许重复。

```mysql
col type UNIQUE
```

- 如果没有NOT NULL约束，则UNIQUE列（字段）处允许有多个NULL
- 如果一个列（字段）上约束了UNIQUE NOT NULL，则使用效果类似于PRIMARY KEY
- 一张表中可以有多个UNIQUE列（字段）

## 外键： FOREIGN KEY

用于定义主表和从表之间的关系：

- FOREIGN KEY约束在从表上
- 主表必须含有PRIMARY KEY或者UNIQUE约束，外键必须指向他们
- 从表含有外键约束的列（字段）必须在主表的主键列（字段）中存在或者为NULL（没有约束NOT NULL时）
- 否则插入数据失败
- 建立主外键关系，数据不能随意删除：主表中删除行（记录）时，必须先考虑从表外键是否还存在相关列（字段）数据

```mysql
FOREIGN KEY (col2) REFERENCES tbl1(col1)
## col2是从表列名，tbl1(col1)是主表主键名或者唯一列名
```

- 表的类型是InnoDB才支持外键
- 外键的数据类型必须和其参考的主键数据类型一致，但是长度可以不一样

## 检查： CHECK

用于强制行（记录）数据必须满足的条件。

Oracle和SQL Server均支持，MySQL5.7还不支持，语法通顺但不会生效。

```mysql
col type CHECK(conditions)
```

## 自增长：AUTO_INCREMENT

在表中，存在一个INT或者DOUBLE类型的列（字段），希望在添加记录的时候该列（字段）从1开始，并且自动增长（+1），例如id列。可以使用自增长约束。

```mysql
col INT|DOUBLE PRIMARY KEY | UNIQUE AUTO_INCREMENT
```

使用自增长的表，在添加数据的时候可以有以下三种插入方式：

```mysql
-- col1 为自增长列（字段）
-- 1
INSERT INTO tbl(col1, col2, ...) VALUES(NULL, values2, ...)
-- 2
INSERT INTO tbl VALUES(NULL, value2, ...)
-- 3
INSERT INTO tbl(col2, ...) VALUES(value2, ...)
```

**注意：**

- 自增长一般和主键配合使用

- 单独使用时需要UNIQUE约束

- 自增长默认从1开始，通过以下语句修改初始值

  ```mysql
  ALTER tbl AUTO_INCREMENT = new_value
  ```

- 若对自增长列赋指定值，则按指定值为主，下一次自增长按照新指定值为起点。一般不这么做，有悖设计逻辑。



## 一个例子

[商店售货系统表设计](./shop_db.sql)

​	现在有一个商店的数据库shop_db，用于记录客户及其购物情况

，由以下三个表组成：

- goods（商品编号goods_id，商品名称goods_name，单价price，商品类别category，供应商provider）
- customers（客户编号customer_id，性名name，住址address，电子邮件email，性别sex，身份证号id_id）
- purchases（订单号order_id，客户编号customer_id，商品编号goods_id，购买数量num）

创建该数据库以及合适的表，并在定义中声明：

​	1、每个表的主键和外键

​	2、客户的性名不能为空值

​	3、电子邮件不能重复

​	4、客户的性别只能是[男|女|未定义]

​	5、单价范围[1.0, 99999.99]
