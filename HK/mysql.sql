-- 本地需要先启动mysql
-- 可以开个终端查看数据 mysql -u root -p

-- 使用tushare database
USE tushare;

------- hk_basic 操作记录-----
-- 设置合适的字符集
ALTER TABLE hk_basic convert TO CHARACTER SET utf8mb4; 
-- 设置ts_code为主键，防止重复数据
ALTER TABLE hk_basic change ts_code ts_code varchar(20);
ALTER TABLE hk_basic ADD PRIMARY KEY ( `ts_code`);

-- 最终数据表长这样
-- +-------------+-------------+------+-----+---------+-------+
-- | Field       | Type        | Null | Key | Default | Extra |
-- +-------------+-------------+------+-----+---------+-------+
-- | ts_code     | varchar(20) | NO   | PRI | NULL    |       |
-- | name        | mediumtext  | YES  |     | NULL    |       |
-- | fullname    | mediumtext  | YES  |     | NULL    |       |
-- | enname      | mediumtext  | YES  |     | NULL    |       |
-- | cn_spell    | mediumtext  | YES  |     | NULL    |       |
-- | market      | mediumtext  | YES  |     | NULL    |       |
-- | list_status | mediumtext  | YES  |     | NULL    |       |
-- | list_date   | mediumtext  | YES  |     | NULL    |       |
-- | delist_date | mediumtext  | YES  |     | NULL    |       |
-- | trade_unit  | double      | YES  |     | NULL    |       |
-- | isin        | mediumtext  | YES  |     | NULL    |       |
-- | curr_type   | mediumtext  | YES  |     | NULL    |       |
-- +-------------+-------------+------+-----+---------+-------+
-- 12 rows in set (0.00 sec)

-- 20250703 港股2663支股票

