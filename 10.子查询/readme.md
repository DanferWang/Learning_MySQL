# 表的子查询

#### **Origin: Danfer Wang**

## 子查询

子查询（嵌套查询）：嵌入在其他SQL语句中的SELECT语句。

- 单行子查询：只返回一条数据的子查询语句
- 多行子查询：子查询语句返回多行数据结果，使用关键字 IN 

## 临时表

```mysql
SELECT *
	FROM( SELECT *
         	FROM tbl
         	GROUP BY col
    	) temp_tbl, tbl
    WHERE expr [, expression]
```

## 操作符： ALL / ANY

ALL： （任意）全部的子查询结果

```mysql
SELECT *
	FROM tbl
    WHERE col > ALL (
    				SELECT *
        				FROM tbl
        				WHERE expr
    )
```

ANY： （存在）子查询结果之一

```mysql
SELECT *
	FROM tbl
    WHERE col > ANY (
    				SELECT *
        				FROM tbl
        				WHERE expr
    )
```

## 多列子查询

返回多个列数据的子查询语句

子查询**字段对应**：

```mysql
(field1, field2, ...) = (SELECT field1, field2 ... FROM ...)
```

```mysql
SELECT *
	FROM tbl
    WHERE (field1, field2, ...) = (SELECT field1, field2 ... FROM ...)
```

