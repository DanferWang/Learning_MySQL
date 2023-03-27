# MySQL事务

#### **Origin: Danfer Wang**

## 事务

事务用于保证数据的一致性，由一组相关的DML语句（数据操作语句）组成，这组语句要么全部成功，要么全部失败。

当执行事务时，MySQL会在操作对象表上加锁，防止其他用户更改表中的数据。

**几个重要操作：**

- START TRANSACTION：开始事务
- SAVEPOINT：设置保存点
- ROLLBACK TO：回退事务
- ROLLBACK：回退全部事务
- COMMIT：提交事务，所有操作生效，不能回退

开启条件：

- 开始事务
- 设置保存点

## 事务操作

```mysql
START TRANSACTION
SAVEPOINT point_name1

DML

SAVEPOINT point_name2

DML

SAVEPOINT point_name...

DML...

ROLLBACK TO point_name2
...
ROLLBACK
COMMIT
```



## 事务作用重要环节

### 回退事务

保存点时事务中的工作点、时间点，用于取消部分事务。

当提交事务时，会自动删除该事务所定义的所有保存点。

当执行回退事务时，通过指定的保存点可以回退到指定的工作点、时间点。

### 提交事务

执行COMMIT提交事务后，确认事务的变化、结束事务、删除所有保存点、释放锁，数据操作正式生效。

结束事务后，其他会话（连接）将可以查看到事务变化后的新数据。

## 事务使用细节

- 若不开始事务，则DML操作自动提交，直接生效，不能回滚

- 开始事务后，若没有创建保存点，可以直接ROLLBACK，默认回到事务开始的工作点、时间点

- 可在一个事务中创建多个保存点；可以在事务没有提交前回退到任意一个保存点，但是只能向前回退

- MySQL的事务机制需要InnoDB储存引擎支持

- 开始事务也可以：

  ```mysql
  -- 与 START TRANSACTION 等效
  SET AUTOCOMMIT = OFF
  ```

  

## 隔离级别

- **隔离**：多个连接开启各自事务操作数据库中的数据时，数据库管理系统要负责隔离操作，以保证各个连接在获取数据时的准确性。

- 若没有设置隔离级别，则会出现：
  - **Dirty read**（脏读）：一个事务读取另一个事务尚未提交的操作
  - **Nonrepeatable read**（不可重复读）：同一查询在同一事务中多次进行，因为其他事务**提交修改或者删除操作**，每次返回不同的结果
  - **Phantom read**（幻读、虚读）：同一查询在同一事务中多次进行，因为其他事务**提交插入操作**，每次返回不同的结果

### MySQL隔离级别

**隔离级别**：定义事务和事务之间的隔离程度

|           隔离级别           | 脏读 | 不可重复读 | 幻读 |   锁   |
| :--------------------------: | :--: | :--------: | :--: | :----: |
| Read uncommitted（读未提交） |  √   |     √      |  √   | 不加锁 |
|  Read committed（读已提交）  |  ×   |     √      |  √   | 不加锁 |
| Repeatable read（可重复读）  |  ×   |     ×      |  ×   | 不加锁 |
|   Serializable（可串行化）   |  ×   |     ×      |  ×   |  加锁  |

## 操作隔离级别

```mysql
-- 查看当前会话隔离级别
-- MySQL8.0以下
SELECT @@tx_isolation;
--MySQL8.0及以上
SELECT @@transaction_isolation;

-- 查看系统当前隔离级别
SELECT @@global.tx_isolation;
--MySQL8.0及以上
SELECT @@global.transaction_isolation;

-- 设置当前会话隔离级别
SET SESSION TRANSACTION ISOLATION LEVEL []

-- 设置系统当前隔离级别
SET GLOBAL TRANSACTION ISOLATION LEVEL []
```

- MySQL默认的事务隔离级别是Repeatable read（可重复读），一般情况下没有特殊需求，该级别可以满足绝大多部分情况，没有必要修改

- 修改全局默认隔离级别在系统配置文件my.ini中[mysqld]添加：

  ```powershell
  transaction-isolation = parameter
  ```

  parameter可以是：READ-UNCOMMITTED, READ-COMMITTER, REPEATABLE-READ, SERIALIZABLE

  然后重启数据库。

## ACID特性

### Atomicity 原子性

事务是一个不可分割的工作单位，事务中的操作要么都发生，要么都不发生

### Consistency 一致性

事务必须使数据库从一个一致性状态变换到另一个一致性状态

### Isolation 隔离性

当多个用户并发地访问数据库时，数据库为每一个用户开启一个事务，不能被其他事务地数据操作所干扰，多个并发事务之间相互隔离

### Durability 持久性

一个事务一旦被提交，它对数据库中数据的改变就是永久性的，之后不能有任何影响，即使数据库发生故障
