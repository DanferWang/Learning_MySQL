# 多表查询

#### **Origin: Danfer Wang**

## 笛卡尔积

```mysql
SELECT * FROM tbl1, tbl2 [,...]
```

- 默认情况下，当两个表直接SELECT查询时，有如下规则（**笛卡尔积**）：
  - 从tbl1中取出一行，与第二张表的每一行（记录）进行组合（拼接），返回结果：含有两张表的的所有列。
  - 返回的记录行数为tbl1行数 * tbl2行数。

**关键：设计出正确的过滤条件，WHERE**

- 当需要指定某个表的某一列：tbl.col

**多表查询的WHERE过滤条件数量不能小于表数-1**

## 自连接

自连接： 在同一张表的连接查询。

**特点：**

- 把同一张表当作两张表使用
- 需要给表取别名： tbl_name alian_name
- 列明不明确时，可以指定列的别名： col_name AS 'alian_name'

```mysql
SELECT alian1.col AS 'col_alian1', alian2.col AS 'col_alian2'
		FROM tbl alian1, tbl alian2
		WHERE expr [, expression...]
```

## 外连接

- **左外连接**：左侧的表完全显示 **LEFT JOIN ... ON**
- **右外连接**：右侧的表完全显示 **RIGHT JOIN ... ON**
- **全外连接**：有，但是没必要 **FULL JOIN ... ON**

```mysql
-- 左外连接
SELECT col1, tbl1.col2, col3
		FROM tbl1 LEFT JOIN tbl2
		ON tbl1.col2 = tbl2.col2
```

```mysql
-- 右外连接
SELECT col1, tbl1.col2, col3
		FROM tbl1 RIGHT JOIN tbl2
		ON tbl1.col2 = tbl2.col2
```

