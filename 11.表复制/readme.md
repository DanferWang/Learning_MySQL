# 表复制

#### **Origin: Danfer Wang**

## 自我复制数据（蠕虫复制）

为了测试SQL语句的执行效率，需要海量数据，可通过**自我复制数据**为表创建海量数据。

- 从其他表复制：

```mysql
INSERT INTO tbl_to_copy
		(field1, field2, ...)
		SELECT feild3, field4, ...
			FROM tble_to_be_copied
```

- 自我复制

```mysql
INSERT INTO tbl_to_copy
		SELECT *
			FROM tbl_to_copy
```

