# SQL 函数

#### **Origin: Danfer Wang**

## 数据统计函数

### 计数函数 count

count返回行的总数

```mysql
SELECT count(*)|count(column) FROM table
	WHERE expression
```

- count(column)在计数时会排除NULL列
- 参数可以是表达式

### 求和函数 sum

```mysql
SELECT sum(column){, sum(column)...} FROM table
	WHERE expression
```

- 只对数值求和才有意义
- 多列求和中间用 , 连接

### 平均函数 avg

```mysql
SELECT avg(column){, avg(column)...} FROM table
	WHERE expression
```

### 最值函数 min max

```mysql
SELECT min|max(column){, min|max(column)...} FROM table
	WHERE expression
```

- 数值范围在统计中有重要应用

### 分组统计 group by/having

group by 用于对列的分组

having 对分组后的结果进行过滤

```mysql
SELECT column1, column2, ... FROM table
	group by column (having ...)
```

- 如果要使用having，在select语句中尽量使用as别名，以免在having中重复计算，浪费计算资源和时间

## 字符串函数

### 字符串相关函数

|              函数名称及参数              |              返回值描述              |
| :--------------------------------------: | :----------------------------------: |
|               CHARSET(str)               |             返回字符串集             |
|      CONCAT(string [, string ...])       |              连接字符串              |
|         INSTR(string, substring)         | 返回substring在string中的位置，默认0 |
|              UCASE(string)               |            转换成大写字母            |
|              LCASE(string)               |            转换成小写字母            |
|           LEFT(string, length)           |     从string中左起取length个字符     |
|          RIGHT(string, length)           |     从string中右起取length个字符     |
|              LENGTH(string)              |          返回string字节长度          |
|   REPLACE(string, target, replacement)   |  在string中用replacement替换target   |
|         STRCMP(string1. string2)         |        逐字符比较两字符串大小        |
| SUBSTRING(string, position, [, length])  |  从string的position起取length个字符  |
| LTRIM(string) RTRIM(string) TRIM(string) |      去除前端、后端、前后端空格      |

- DUAL 亚元表，系统表，一般可做为测试表使用

## 数学计算函数

### 数学相关函数

|         函数名称及参数          |        返回值描述         |
| :-----------------------------: | :-----------------------: |
|            ABS(num)             |        返回绝对值         |
|        BIN(decimal_num)         |      十进制转二进制       |
|          CEILING(num)           |         向上取整          |
|  CONV(num, from_base, to_base)  |         进制转换          |
|           FLOOR(num)            |         向下取整          |
|   FORMAT(num, decimal_place)    | 保留decimal_place小数位数 |
|        HEX(decimal_num)         |     十进制转十六进制      |
| LEAST(num1, num2 [, num3, ...]) |        返回最小值         |
|      MOD(num, denominator)      |           取余            |
|          RAND([seed])           |  返回[0.0, 1.0]的随机数   |

- 使用rand()，每次返回不同的随机数

  使用rand(seed)，返回由seed决定的唯一随机数

## 时间日期函数

### 时间日期相关函数

|              函数名称及参数              |        返回值描述        |
| :--------------------------------------: | :----------------------: |
|              CURRENT_DATE()              |       返回当前日期       |
|              CURRENT_TIME()              |       返回当前时间       |
|           CURRENT_TIMESTAMP()            |      返回当前时间戳      |
|              DATE(datetime)              |  返回datetime的日期部分  |
| DATE_ADD(date, INTERVAL d_value d_type)  |   在date上加日期或时间   |
| DATE_SUB (date, INTERVAL d_value d_type) |   在date上减日期或时间   |
|          DATEDIFF(date1, date2)          |   返回两个日期差（天）   |
|          TIMEDIFF(date1, date2)          | 返回两个时间差（时分秒） |
|                  NOW()                   |       返回当前时间       |
|       YEAR\|MONTH\|DATE(datetime)        |        返回年月日        |
|     FROM_UNIXTIME(unixtime, format)      | 从Unix时间转换为datetime |
|             UNIX_TIMESTAMP()             |     返回当前Unix时间     |

- d_type可以是年、月、日、时、分、秒
- date类型也可以用datetime或者timestamp
- Unix时间单位是秒
- FROM_UNIXTIME(unixtime, format)中unixtime是以秒为单位的整数，format是形如'%Y-%m-%d %H:%i:%s'的格式分隔符

## 加密和系统函数

|  函数名称及参数  |         返回值描述         |
| :--------------: | :------------------------: |
|      USER()      | 返回查询用户与对应的IP地址 |
|    DATABASE()    |       返回数据库名称       |
|   MD5(string)    |     计算string的MD5码      |
| PASSWORD(string) |    MySQL计算密码的方法     |

- 常用于保护用户密码的应用中
- MySQL数据库中的用户密码使用PASSWORD函数加密

## 流程控制函数

|                        函数名称及参数                        |                         流程控制描述                         |
| :----------------------------------------------------------: | :----------------------------------------------------------: |
|          IF(expression1, expression2, expression3)           | 如果expression1为true，则返回expression2，否则返回expression3 |
|               IFNULL(expression1, expression2)               | 如果expression1不为NULL则返回expression1，否则返回expression2 |
| SELECT CASE WHEN expression1 THEN expression2 [...] ELSE expression3 END | 如果expression1为真，则返回expression2，... ，否则返回expression3 |

- 判断是否为空：IS NULL

