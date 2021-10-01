# Learning_MySQL

以MySQL服务为基础的SQL学习笔记

**每周一、三、五更新**

从安装配置MySQL服务开始，包括关系型数据库模型概念，数据库管理操作和SQL基础语法，直到数据库查询优化和海量数据高阶调优。

## MySQL数据库服务安装与配置

[MySQL数据库服务多平台安装与配置](https://github.com/DanferWang/Learning_MySQL/tree/master/1.%20MySQL%E5%A4%9A%E5%B9%B3%E5%8F%B0%E5%AE%89%E8%A3%85%E4%B8%8E%E9%85%8D%E7%BD%AE)

- 给出MySQL服务在三大主要运行平台（Windows，macOS，Ubuntu）的下载地址、安装方法、配置操作
- 建立服务-端口-对象的思维模式
- 简单介绍MySQL服务的运行维护基本指令

## MySQL数据库服务的基础认知

[MySQL与一众数据库服务的基础认知](https://github.com/DanferWang/Learning_MySQL/tree/master/2.%20MySQL%E5%9F%BA%E7%A1%80%E8%AE%A4%E7%9F%A5)

- 介绍MySQL数据库服务的三层体系结构
- 说明数据库的三层使用结构，不局限于MySQL，几乎所有关系型数据库系统都是类似的三层使用结构
- SQL语句分类
- 通过Java获取数据库服务、操作数据库、数据传输

## 数据库操作

[对DBMS下数据库的操作](https://github.com/DanferWang/Learning_MySQL/tree/master/3.%20%E6%95%B0%E6%8D%AE%E5%BA%93%E6%93%8D%E4%BD%9C)

- 创建数据库，SQL语句与应用程序图形化方法
- 删除数据库
- 查看数据库，``的使用
- 数据库的备份与恢复，以及对数据库中表的备份与恢复

## 表操作
[对数据库中表的操作](https://github.com/DanferWang/Learning_MySQL/tree/master/4.%20%E8%A1%A8%E6%93%8D%E4%BD%9C)

- 创建表，在数据库中新建一个schema，定义列名（字段名）及类型，以及后续将提到的约束；和表属性
- 修改表，表本身的增改查操作
- 删除表

## 常用数据类型

[在表中常用的数据类型（列类型）](https://github.com/DanferWang/Learning_MySQL/tree/master/5.%20%E5%B8%B8%E7%94%A8%E6%95%B0%E6%8D%AE%E7%B1%BB%E5%9E%8B)

- 列类型分类overview
- 数值类型
- 字符串类型
- 日期类型
- 枚举类型

## 数据的增删改查

[表中数据的增删改查](https://github.com/DanferWang/Learning_MySQL/tree/master/6.%20%E8%A1%A8%E4%B8%AD%E6%95%B0%E6%8D%AE%E5%A2%9E%E5%88%A0%E6%94%B9%E6%9F%A5)

- 增：INSERT
- 改：UPDATE
- 删：DELETE
- 查：SELECT
  - WHERE
  - ORDER BY

## 函数

[SQL函数](https://github.com/DanferWang/Learning_MySQL/tree/master/7.%20%E5%87%BD%E6%95%B0)

- 数据统计函数：计数、求和、平均、最值、分组统计
- 字符串函数：一系列对字符串对象的操作
- 数学相关函数：涉及到数学运算的函数
- 时间日期函数：时间与日期计算和操作函数
- 加密函数：计算MD5码与系统函数
- 流程控制函数：判断、选择语句

## 查询增强

[SELECT查询增强](https://github.com/DanferWang/Learning_MySQL/tree/master/8.%20%E6%9F%A5%E8%AF%A2%E5%A2%9E%E5%BC%BA)

- 日期类型比较
- 模糊查询
- 显示结构DESC
- 分页查询
- 查询中的语法逻辑顺序

## 多表查询

[多表查询](https://github.com/DanferWang/Learning_MySQL/tree/master/9.%20%E5%A4%9A%E8%A1%A8%E6%9F%A5%E8%AF%A2)

- 表与表之间的笛卡尔积
- 同一表的自连接
- 多表间的外连接
