# MySQL索引

#### **Origin: Danfer Wang**

索引是提高数据库性能最“物美价廉”的方法之一，不用增加内存，不用更改程序，也不用调SQL，查询速度就可提高百倍或千倍。

首先执行 [massive_tbl.sql](./massive_tbl.sql) ，创建一个储存具有海量数据的数据库，并且新建一张表，其中包含8000000条记录（行）。

若没有创建索引，查询一条记录所需要的时间是不可以接受的！

## 索引的原理

当没有索引时，

```mysql
SELECT * FROM tbl
	WHERE expr
```

会逐条比较字段，全表顺序遍历，查询速度会非常慢。

创建 id 列的索引，

```mysql
CREATE INDEX index_name [index_type] 
	ON tbl(col)
	[index_option]
```

**建立新的数据结构**，例如：二叉树，Hash函数

当对数据增、删、改时，索引会被更新，执行效率会下降。实际工程项目中，查询需求是最主要的计算压力，增、删、改需求仅占很小一部分。

## 索引类型

- 主键索引：主键自动成为主索引

  ```mysql
  CREATE TABLE tbl(
  	col1 type PRIMARY KEY, -- 主键，同时也是索引
      col2 type,
      ...
  )
  ```

- 唯一索引：QNIQUE

  ​	若某列的值不允许重复，则有限使用唯一索引，这样可以进一步提高查询速度，否则使用普通索引，

  ```mysql
  CREATE TABLE tbl(
  	col1 type UNIQUE, -- 唯一，同时也是索引
      col2 type,
      ...
  )
  ```

- 普通索引

- 全文索引：适用于MyISAM，开发中使用Solr和ElasticSearch

## 索引的添加

添加索引有两种方式

```mysql
-- 1
CREATE [UNIQUE] INDEX index_name 
	ON tbl(col)

-- 2
ALTER TABLE tbl ADD INDEX index_name (col)
-- 添加主键索引
ALTER TABLE tbl ADD PRIMARY KEY col
```

## 索引的删除

```mysql
-- 删除索引
DROP INDEX index_name ON tbl

-- 删除主键索引
ALTER TABLE tbl DROP PRIMARY KEY
```

## 索引的查询

查询索引有多种方式

```mysql
-- 1
SHOW INDEX FROM tbl
-- 2
SHOW INDEXES FROM tbl
-- 3
SHOW KEYS FROM tbl
-- 4 不详细
DESC tbl
```

## 索引的使用场景

- 列（字段）较为频繁地被用作查询条件，适合创建索引，例如 id
- 唯一性太差的列（字段），不适合创建索引，例如 sex
- 更新频繁的列（字段），不适合创建索引
- 不会出现在 WHERE 子句中的列（字段），不适合创建索引

