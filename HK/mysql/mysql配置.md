
本地需要先启动mysql
查看数据 mysql -u root -p

## mysql字符集配置
文件 /etc/my.cnf，配置为
```
[mysqld]
# 设置默认字符集和排序规则
character-set-server=utf8mb4
collation-server=utf8mb4_unicode_ci

[client]
default-character-set=utf8mb4

[mysql]
default-character-set=utf8mb4
```
重启mysql。

验证配置是否生效，进入mysql查看
```
SHOW VARIABLES LIKE 'character_set%';
SHOW VARIABLES LIKE 'collation%';
```
确认以下输出：

character_set_server 和 character_set_database 应为 utf8mb4。

collation_server 应为 utf8mb4_unicode_ci。

## 修改数据库默认字符集
如果不幸，在配置mysql前把database建好了，那么就直接修改database的字符集。
```sql
ALTER DATABASE your_database CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
```
修改前：
+----------------------------+------------------------+
| DEFAULT_CHARACTER_SET_NAME | DEFAULT_COLLATION_NAME |
+----------------------------+------------------------+
| latin1                     | latin1_swedish_ci      |
+----------------------------+------------------------+

修改后：
+----------------------------+------------------------+
| DEFAULT_CHARACTER_SET_NAME | DEFAULT_COLLATION_NAME |
+----------------------------+------------------------+
| utf8mb4                    | utf8mb4_unicode_ci     |
+----------------------------+------------------------+