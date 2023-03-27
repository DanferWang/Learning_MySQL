# MySQL用户管理

#### **Origin: Danfer Wang**

根据不同的参与人员，赋予其相应的MySQL操作权限，管理员root根据需要创建不同用户并赋予其相应权限，供相关人员使用

## 用户

MySQL的用户储存在系统数据库mysql中的user表内。

	- host 表示允许登录的位置，localhost表示该用户仅允许通过本机使用MySQL服务，也可以指定IP地址
	- user 表示用户名
	- authentication_string 用户密码（经过password函数加密）

## 管理操作

- 创建用户

  ```mysql
  CREATE USER user_name@host_name IDENTIFIED BY pwd
  ```

- 删除用户

  ```mysql
  DROP USER user_name @ host_name
  ```

- 修改密码

  ```mysql
  -- 修改自己的密码
  SET PASSWORD = PASSWORD(new_pwd)
  -- 修改别人的密码
  SET PASSWORD FOR user_name@host_name = PASSWORD(new_pwd)
  ```

## MySQL权限管理

MySQL中的权限：

![img](.\assets\3.png)

### 给用户授权

```mysql
GRANT privilege_list ON db.object TO user_name@host_name [IDENTIFIED BY pwd]
```

IDENTIFIED BY pwd :

- 若该用户存在，则修改该用户的密码为pwd
- 若该用户不存在，则创建该用户

### 回收权限

```mysql
REVOKE privilege_list on db.object FROM user_name@host_name
```

### 权限生效

```mysql
FLUSH PRIVILEGES
```

当给用户授权后，若权限没有立即生效，可通过权限生效刷新用户的权限。通常情况下，MySQL5.7及以上版本在授权后会立即生效。

## 用户管理细节

- 创建用户时，若不指定hostname，则为默认%，表示所有IP都可以通过该用户访问MySQL服务
- hostname可以通过%表示网关，例如username@'192.168.1.%'
- 删除用户时，若hostname不是%，则必须要明确指定

## 一个用户权限管理的示例

[privilege_manage.sql](./privilege_manage.sql)

- 创建一个用户bear，密码1024，仅允许从本地登录，不允许远程登录
- 使用root用户创建testdb数据库及其下的news表
- 给bear分配查看news表和添加数据的权限
- 以bear的身份查看news表中数据并添加数据
- 使用root用户修改bear用户的密码为abcd
- 使用root用户回收bear用户的所有权限
- 使用root用户删除bear用户

