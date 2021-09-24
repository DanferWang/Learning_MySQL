#  数据的增删改查

#### **Origin: Danfer Wang**

## 增：INSERT

```mysql
INSERT INTO tbl_name [(column [, column ...])] 
VALUES(value [, value ...]);
```

- 插入的数据必须与字段的数据类型相同

- 数据的长度必须在列的规定范围为内

- 在values中列出的数据位置必须与被加入的列的把排列位置相对应

- 字符和日期型数据应该包含在单引号中，若字符串可以被转换成数值型，则可以在该字段内完成隐式转换

- 列可以插入空值NULL，前提是该字段允许空值

- 可以一条语句添加多条数据：

  VALUES (...), (...), (...), ...

- 如果给表中所有字段添加数据，可省略字段名称
- 存在默认值时，当插入的数据没有该字段的值，则默认添加为默认值；否则会报错：若某字段没有指定NOT NULL，当添加数据时没有给定该值，则默认将NULL插入到该字段

## 改：UPDATE

```mysql
UPDATE tbl_name
	SET	col_name1=expr1 [, col_name2=expr2, ...]
	[WHERE where_definition]
```

- 若没有WHERE，则修改所有现存的条目（**慎用！！！**）
- 可以在一条语句中同时修改多个字段

## 删：DELETE

```mysql
DELETE FROM tbl_name
	[WHERE where_definition]
```

- 若没有WHERE表达式，则删除所有数据条目。该操作不同于DROP TABLE语句
- 若要删除条目中某一列的值，应该使用UPDATE语句置空（NULL或者''）

## 查：SELECT

```mysql
SELECT [DISTINCT] *|{col_name1, col_name2, ...}
	FROM tbl_name;
```

- DISTINCT可选，显示结果时去掉重复数据，只有查询结果所有字段相同时，才会去掉重复数据

- 可以使用表达式对查询的列进行运算

  ```mysql
  SELECT * | {col_name1 | expression, col_name1 | expression, ...} FROM tbl_name
  ```

- 使用AS语句，对查询结果的列名重命名

  ```mysql
  SELECT col_name AS 别名 FROM tbl_name
  ```
  
### **在where子句中常用的运算符**

#### 	比较运算符

- \>	<	<=	>=	=	<>	!= 大于小于
- BETWEEN ... AND ... 在某一区间的值：闭区间
- IN(set) 在集合（列表）里的值
- [NOT] LIKE 'pattern' 模糊查询：'王%' 以王开头的字符串
- IS NULL 是否为空

#### 	逻辑运算符

- and 与
- or 或
- not 非

### order by 子句排序查询结果

```mysql
SELECT * | {col_name1 | expression, col_name1 | expression, ...} 
	FROM tbl_name
	order by column asc|desc [, column asc|desc, ...]
```

- column 指定排序的列
- asc 升序（默认），desc 降序
- order by子句应该在SELECT语句的结尾

- 可以通过 , 实现多层次排序
