# SELECT查询增强

#### **Origin: Danfer Wang**

## datetime日期类型比较

- 使用WHERE子句
- 日期类型可以直接比较<, >, =
- 注意格式对齐

## 模糊查询 LIKE

- %： 表示0到多个任意字符
- _： 表示单个任意字符

## DESC

使用DESC查询表的结构

## 分页查询

```mysql
SELECT ...
	LIMIT start, rows
```

- 从start+1开始取，取出rows行，start从0开始计数
- LIMIT 每页显示条目数 * （页码-1）， 每页显示条目数

## 查询、分组、筛选、排序、分页语法顺序

```mysql
SELECT column FROM table
	WHERE expression
	GROUP BY column
	HAVING condition
	ORDER BY column
	LIMIT start, rows
```

- 顺序错乱→语法报错

