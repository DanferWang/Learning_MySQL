# 常用数据类型（列类型）

#### **Origin: Danfer Wang**

## 列类型分类

### 数值类型

- 整形：

  ![image-20210522171747827](https://github.com/DanferWang/Learning_MySQL/blob/master/5.%20%E5%B8%B8%E7%94%A8%E6%95%B0%E6%8D%AE%E7%B1%BB%E5%9E%8B/5.%20%E5%B8%B8%E7%94%A8%E6%95%B0%E6%8D%AE%E7%B1%BB%E5%9E%8B.assets/image-20210522171747827.png?raw=true)

  - tinyint【1个字节】
  - smallint【2个字节】
  - mediumint【3个字节】
  - **int【4个字节】**
  - bigint【8个字节】

- 小数类型：

  - float【单精度 4个字节】
  - **double【双精度 8个字节】**
  - **decimal[M,D]【大小取决于M（长度），D（小数）】**

### 文本（字符串）类型

- **char(size) 0-255**
- **varchar(size) 0-65535 【2^16-1】**
- **text 0-2^16-1**
- longtext 0-2^32-1

### 二进制类型

- blob 0-2^16-1
- longblob 0-2^32-1

### 日期类型

- date【日期 年月日】
- time【时间 时分秒】
- **datetime【年月日时分秒 yyyy-MM-dd HH:mm:ss】**
- **timestamp【时间戳】**
- year【年】

## 数值类型

### 整型

**在能满足需求的情况下，尽可能选择占用空间小的类型。**

没有指定unsigned，则就是有符号的：

​	field_name datatype unsigned

- bit类型：
  - bit(m) m在1-64内
  - 添加数据的范围按照m决定
  - 在表内是按位二进制存储
  - 查询时可按十进制查询

### 小数类型

- decimal[m,d] [unsigned]:

  M是小数位数的总数（精度），D是小数点后的位数（标度）。如果D=0，则该值没有小数点后的部分。

  M最大65，D最大30。D默认值为0，m默认值为10。

  **若希望小数精度高，使用decimal。**

  decimal可以存储很大很大的数。

## 字符串类型

- char(size)
  - 固定长度字符串，最大**255字符**
  - 定长：分配空间一定，容易产生空间浪费

- varchar(size)
  - 可变长度字符串 最大**65532字节**
  - utf8编码最大21844字符，1-3个字符用于储存字段长度（3个字节一个字符）
  - gbk编码最大32766字符（2个字节一个字符）
  - 变长：按照实际数据分配空间，实际数据大小+（1-3）字节

- 使用细节：
  - size是字符数
  - 数据不区分字母和汉字
  - 若数据是定长，推荐使用char，例如md5，邮编，手机号码。身份证号码，查询速度快
  - 字段长度不确定，只能使用varchar，例如评论留言，文章，也可用text替换

## 日期类型

```mysql
CREATE TABLE ts
(	t1 DATE,
	t2 DATETIME,
	t3 TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP)
```

- timestamp在insert与update时会自动更新

## 枚举类型

```mysql
ENUM(element1, element2, ...)
```

限制数据为在枚举集合中的元素
