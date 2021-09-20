# 表操作

> #### **Origin: Danfer Wang**

## 创建表

```mysql
CREATE TABLE table_name
	(field1 datatype,
     field2 datatype,
     field3 datatype,
     ...)
     [DEFAULT] CHARACTER SET [=] charset_name
  | [DEFAULT] COLLATE [=] collation_name
  | [DEFAULT] ENGINE [=] engine_name
```

CHARACTER SET：指定数据库字符集，默认为数据库字符集

COLLATE：数据库字符集的校对规则，默认与数据库校对规则相同

- 也可以通过Navicat图形化创建

创建相同字段和定义的表

```mysql
CREATE TABLE new_tbl LIKE existing_tbl
```



## 修改表

- 可通过Navicat图形化修改

### 添加行（记录）

添加行（记录），本质上就是给表中按照规定的格式添加数据

```mysql
-- 按照指定列插入数据，可存在空列（字段）
INSERT INTO tbl(col1, col3, ...)
	VALUES(data1, data3, ...)

-- 完整插入数据，不允许存在空列（字段）
INSERT INTO tbl
	VALUES(data1, data2, ...)
```

### 添加列

```mysql
ALTER TABLE tbl_name
ADD [COLUMN] (col_name datatype [DEFAULT expr]
     [,col_name datatype]...);
```

- 不允许为空，并指定默认：NOT NULL DEFAULT ''

### 修改列的数据类型

```mysql
ALTER TABLE tbl_name
MODIFY [COLUMN] (col_name datatype [DEFAULT expr]
     [,col_name datatype]...);
```

### 修改列的名称

```mysql
ALTER TABLE tbl_name
CHANGE col_name new_name datatype [DEFAULT expr];
```

### 删除列

```mysql
ALTER TABLE tbl_name
DROP [COLUMN] (col_name);
```

### 查看表的结构

```mysql
DESC tbl_name;
```

### 修改表名

```mysql
RENAME tbl_name TO new_tbl_name;
```

### 修改表的字符集

```mysql
ALTER tbl_name CHRACTER SET set_name;
```

## 删除表

也可通过Navicat图形化修改

```mysql
DROP TABLE [IF EXISTS] tbl1 [, tbl2, ...]
```

**谨慎使用DROP操作，按时备份数据库**
