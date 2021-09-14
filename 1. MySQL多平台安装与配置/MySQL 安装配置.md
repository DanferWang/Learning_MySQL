# MySQL 安装配置（Windows源码）

> #### **Origin: Danfer Wang**

## 下载并解压缩

下载安装压缩文件[这里](https://cdn.mysql.com//archives/mysql-5.7/mysql-5.7.19-winx64.zip)

解压缩到一个全英文并且至少有5G空间的路径下

## 设置环境变量

进入解压缩后的文件夹中的bin目录下，复制该文件夹路径，粘贴到用户环境变量中

## 配置文件

在安装目录下配置MySQL服务文件 my.ini

注意创建数据文件夹E:\mysql_data\

```text
[client]
port=7777
default-character-set=utf8
[mysqld]
basedir=D:\mysql-5.7.19-winx64\
datadir=E:\mysql_data\
port=7777
character_set_server=utf8
skip-grant-tables
```

## 初始化MySQL服务

在bin目录下以管理员身份PowerShell：

```powershell
mysqld -install # 创建MySQL服务
mysqld --initialize-insecure --user=mysql # 初始化数据库服务
net start mysql # 启动MySQL服务
net stop mysql # 停止MySQL服务
```

## 管理MySQL

同样在bin文件路径下管理员PowerShell：

```powershell
mysql -u root -p # 进入MySQL terminal，初始化后密码为空
use mysql; # 修改数据库
update user set authentication_string=password('xxx') where user='root' and Host='localhost'; # 修改密码
flush privileges; # 刷新权限
quit; # 退出terminal
```

对my.ini文件中，注释掉跳过安全检查，并重新启动MySQL服务，用新密码进入MySQL

- **注意**：-u 后可以加空格，-p后若要加密码，**一定不能加空格**

## 删库

```powershell
sc delete mysql
```

## MySQL服务：命令行

连接到MySQL服务（MySQL数据库）:

```powershell
mysql -h 主机IP -P 端口 -u 用户名 -p密码
mysql -P 7777 -u root -p xxx
```

- 如果没有-h 主机，默认是localhost

- 如果没有-P 端口，默认是3306

# MySQL 安装配置（macOS DMG包）

## 下载DMG包

点击[这里](https://dev.mysql.com/downloads/mysql/)到下载页面

选择合适的处理器版本和操作系统版本，注意macOS 11 Big Sur版本向下兼容macOS 10.15 Catalina。

## 安装

打开DMG文件，并允许储存与安装权限。

虽然提供了更改安装路径的选项，但是**强烈不建议**更改默认的安装路径！！

点击Customize Install（“自定义安装”）可以选择安装组件：（建议）

- MySQL Server
- Preference Pane
- Launchd Support

开始安装并选择增强加密

自动配置root用户，设置密码

## ## 查看MySQL系统配置

在Apple系统设置中最下方可以看到MySQL服务，点击进入可以查看与配置

**建议取消**开机启动MySQL服务

## 安装交互软件

- Shell

  点击[这里](https://dev.mysql.com/downloads/shell/)下载MySQL Shell on macOS

  选择合适的处理器和Shell版本

  全部点击Continue（继续下一步）完成

- [DataGrip](https://www.jetbrains.com/datagrip/)

![pic](https://github.com/DanferWang/Learning_MySQL/blob/master/1.%20MySQL%E5%A4%9A%E5%B9%B3%E5%8F%B0%E5%AE%89%E8%A3%85%E4%B8%8E%E9%85%8D%E7%BD%AE/MySQL%20%E5%AE%89%E8%A3%85%E9%85%8D%E7%BD%AE%EF%BC%88Windows%EF%BC%89.assets/image-20210830130148081.png?raw=true)

## MySQL服务：命令行

连接到MySQL服务（MySQL数据库）:

```powershell
mysqlsh -h 主机IP -P 端口 -u 用户名 -p密码
mysqlsh -P 7777 -u root -p xxx
```

- 如果没有-h 主机，默认是localhost

- 如果没有-P 端口，默认是3306

```shell
\sql %进入SQL语言编写指令
```

详细命令参考[这里](https://cn-blogs.cn/mysql-5.7-google-zh/mysql-shell.html#mysql-shell-commands)

# MySQL 安装配置（Ubuntu）

```shell
sudo apt-get install mysql-server
sudo apt-get install mysql-client
sudo apt-get install libmysqlclient-dev

sudo netstat -tap
grep mysql

mysql -u root -p 
```

```shell
sudo service mysql start
sudo service mysql stop
sudo service mysql status
```

```shell
dpkg -l | grep mysql | grep it

sudo apt-get remove mysql-server
sudo apt-get autoremove
sudo apt-get remove <>

dpkg -l | grep mysql | grep it
```

