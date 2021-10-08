# 合并查询

#### **Origin: Danfer Wang**

## 合并查询

合并多个SELECT语句结果，使用集合操作符**UNION**, **UNION** **ALL**。

**UNION ALL** 直接合并两个查询结果，不去重

```mysql
SELECT field1, field2, ...
		FROM tbl
		WHERE expr
UNION ALL
SELECT field1, field2, ...
		FROM tbl
		WHERE expr
```

**UNION** 合并两个查询结果，去重，相当于取并集

```mysql
SELECT field1, field2, ...
		FROM tbl
		WHERE expr
UNION
SELECT field1, field2, ...
		FROM tbl
		WHERE expr
```

