# 存储过程与存储函数

#### **Origin: Danfer Wang**

**存储过程、存储函数在使用过程中存在争议，应根据实际业务需求和安全规范谨慎使用。**

## 存储过程

### SQL指令执行过程

1. 在客户端编写并运行SQL指令
2. 通过数据库连接将SQL指令发送到数据库
3. 数据库接收SQL指令
4. SQL引擎编译并执行SQL语句
5. 将执行SQL指令的结果通过数据库连接传递给客户端
6. 客户端显示查询结果

**提出两个开发中的实际需求：**

- 重复多次执行相同SQL指令，每次执行都需要将语句通过数据库连接传递到MySQL服务，并且需要编译和执行。效率降低。
- 连续执行多个SQL指令，后续指令参数需要之前指令执行的结果。单条指令无法满足。

### 存储过程概念

将能够完成特定功能的SQL语句进行封装，编译之后保存在数据库服务端，并且命名。当客户端需要执行这个功能时，不需要额外SQL语句，直接通过封装时的命名即可完成调用，获取执行结果。可以嵌套逻辑控制语句，完成多次调用。

### 优点

1. 简化操作，提高SQL语句的复用率

2. 避免重复操作中的失误

3. 减小网络使用量，降低对外暴露的风险，提高查询数据的安全性

### 缺点

1. 可移植性差，不能跨引擎使用，需要重新编写
2. 调试困难，复杂逻辑下灾难性debug与运维
3. 版本控制困难，难以迭代，在数据库或表更新后可能会失效
4. 不适合高并发场景，多DB协同对可扩展性要求高，存储过程和存储函数难以维护

### 存储过程的分类

按照存储过程的参数类型：

- 无参数 - 无传参无返回
- 仅IN - 有传参无返回
- 仅OUT - 无传参有返回
- IN OUT - 有传参有返回
- INOUT - 有传参有返回

## 存储过程的使用

### 创建

```mysql
CREATE PROCEDURE sp_name ([proc_parameter[,...]])
	[characteristic ...]
	BEGIN
		routine_body
	END
```

```mysql
proc_parameter:
    [ IN(default) | OUT | INOUT ] param_name datatype
characteristic:
    COMMENT 'string' #表示注释
  | LANGUAGE SQL #表示存储过程是由SQL语句构成
  | [NOT] DETERMINISTIC #表示执行结果是否确定
  | { CONTAINS SQL | NO SQL | READS SQL DATA | MODIFIES SQL DATA } #表示存储过程中对数据的操作：包含SQL（默认）|不包含SQL|包含读操作|包含写操作
  | SQL SECURITY { DEFINER | INVOKER } #表示执行该存储过程的权限：仅该存储过程创建者（默认）|有该存储过程访问权限者
```
注意使用分隔符声明，以区别标识SQL语句的结束和存储过程的结束
```mysql
DELIMITER $ #修改分隔符为$ （习惯上使用$）
DELIMITER ; #将分隔符修改回；
```

### 调用

```mysql
CALL sp_name([proc_parameter[,...]]);
```

```mysql
SET @name := value;
CALL sp_name([proc_parameter[,...]]);
SELECT @name;
```

## 存储函数

将自定义的函数保存在MySQL服务端，在使用上与MySQL内建函数一样，提高数据库操作与管理的效率。

### 创建存储函数

```mysql
CREATE FUNCTION function_name ([func_parameter[,...]])
    RETURNS datatype
    [characteristic ...] 
    BEGIN
    	routine_body
    END
```

```mysql
func_parameter:
    param_name datatype
characteristic:
    COMMENT 'string' #表示注释
  | LANGUAGE SQL #表示函数是由SQL语句构成
  | [NOT] DETERMINISTIC #表示返回结果是否确定
  | { CONTAINS SQL | NO SQL | READS SQL DATA | MODIFIES SQL DATA } #表示函数中对数据的操作：包含SQL（默认）|不包含SQL|包含读操作|包含写操作
  | SQL SECURITY { DEFINER | INVOKER } #表示执行该函数的权限：仅该函数创建者（默认）|有该函数访问权限者
```

### 调用存储函数

```mysql
SELECT function_name([func_parameter[,...]]);
```

```mysql
SET @para_name := value;
SELECT function_name(@para_name);
```

## 比较存储过程与存储函数

|          | 关键字    | 传参与调用        | 返回值 | 应用场景         | 适用范围    |
| -------- | --------- | ----------------- | ------ | ---------------- | ----------- |
| 存储过程 | PROCEDURE | CALL sp_name()    | 多个   | 更新             | 包括DDL DML |
| 存储函数 | FUNCTION  | SELECT function() | 一个   | 返回结果为一个值 | 可在DQL     |

## 存储过程和存储函数的操作

### 查看创建信息

1. SHOW CREATE

```mysql
SHOW CREATE PROCEDURE sp_name;
```

```mysql
SHOW CREATE FUNCTION function_name;
```

2. SHOW STATUS

```mysql
SHOW PROCEDURE STATUS;
SHOW FUNCTION STATUS;
```

```mysql
SHOW PROCEDURE STATUS LIKE sp_name;
SHOW FUNCTION STATUS LIKE function_name;
```

3. information_schema.Routines

```mysql
SELECT * FROM information_schema.Routines
WHERE ROUTINE_NAME = sp_name | function_name [AND ROUTINE_TYPE = 'PROCEDURE | FUNCTION'];
```

### 修改特性

不能影响存储过程或存储函数的功能（不改变函数体内的业务逻），仅改变其特性characteristic

```mysql
ALTER PROCEDURE sp_name [characteristic ...];
ALTER FUNCTION function_name [characteristic ...];
```

```mysql
characteristic:
    COMMENT 'string'
  | LANGUAGE SQL
  | { CONTAINS SQL | NO SQL | READS SQL DATA | MODIFIES SQL DATA }
  | SQL SECURITY { DEFINER | INVOKER }
```

### 删除存储过程或存储函数

```mysql
DROP PROCEDURE [IF EXISTS] sp_name;
DROP FUNCTION [IF EXISTS] function_name;
```

