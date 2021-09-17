# 数据库操作

> #### **Origin: Danfer Wang**

## 创建数据库

```mysql
CREATE DATABASE [IF NOT EXISTS] db_name
    [create_specification] ...

create_specification:
    [DEFAULT] CHARACTER SET [=] charset_name
  | [DEFAULT] COLLATE [=] collation_name
```

CHARACTER SET：指定数据库字符集，默认utf8

COLLATE： 数据库字符集的校对规则，常用utf8_bin[区分大小写]、utf8_general_ci[不区分大小写（默认）]

- 也可以通过Navicat图形化界面创建

### 区分大小写

- 表的字符集和字符集校验也可以自定义设置，默认是和数据库保持一致
- 举例：区分大小写时tom和Tom是两条记录；不区分大小写时tom和Tom是同一条记录

## 删除数据库

慎用！！！

```mysql
DROP DATABASE [IF EXISTS] db_name
```

## 查看数据库

```mysql
SHOW DATABASES # 显示全部数据库
SHOW CREATE DATABASE db_name # 显示数据库创建语句
```

在创建数据库或者表的时候，为了规避关键字，可以使用反引号``解决。一般情况下，为了安全，常常都带上反引号

## 备份与恢复数据库（表）

对于需要迁移DBMS的数据库或者内容特别重要的数据库，需要备份并恢复数据库

### 备份数据库

备份数据库需要在PowerShell中操作

```powershell
mysqldump -u 用户名 -p密码 -B 数据库1 数据库2 数据库n > 文件名.sql
```

备份文件就是其对应的SQL语句

### 恢复数据库

恢复数据库需要在MySQL terminal中操作

````powershell
source 文件名.sql
````

**注意**：此处可能会报错``ASCII '\0' appeared in the statement, but this is not allowed unless option --binary-mode is enabled and mysql is run in non-interactive mode. Set --binary-mode to 1 if ASCII '\0' is expected. Query: 'ÿþ-'.``解决办法是将备份导出的.sql文件编码规范转换成UTF-8编码，我猜想该问题是PowerShell的导出编码不规范导致的

也可以通过直接执行bak.sql文件中的语句：复制到Navicat的查询窗口中执行

### 备份与恢复数据库中的表

```powershell
mysqldump -u 用户名 -p密码 数据库 表1 表2 表n > bak_table.sql
```

