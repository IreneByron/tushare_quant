-- 使用tushare database
USE tushare;

---------------- hk_basic 操作记录 ---------------
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




-------------- ggt_top10 操作记录 -----------------
alter table ggt_top10 change trade_date trade_date varchar(20);
alter table ggt_top10 change ts_code ts_code varchar(20);
ALTER TABLE ggt_top10 ADD PRIMARY KEY ( `trade_date`,`ts_code`,`market_type`);
 desc ggt_top10;
-- +---------------+-------------+------+-----+---------+-------+
-- | Field         | Type        | Null | Key | Default | Extra |
-- +---------------+-------------+------+-----+---------+-------+
-- | trade_date    | varchar(20) | NO   | PRI | NULL    |       |
-- | ts_code       | varchar(20) | NO   | PRI | NULL    |       |
-- | name          | text        | YES  |     | NULL    |       |
-- | close         | double      | YES  |     | NULL    |       |
-- | p_change      | double      | YES  |     | NULL    |       |
-- | rank          | bigint(20)  | YES  |     | NULL    |       |
-- | market_type   | bigint(20)  | NO   | PRI | NULL    |       |
-- | amount        | text        | YES  |     | NULL    |       |
-- | net_amount    | text        | YES  |     | NULL    |       |
-- | sh_amount     | double      | YES  |     | NULL    |       |
-- | sh_net_amount | double      | YES  |     | NULL    |       |
-- | sh_buy        | double      | YES  |     | NULL    |       |
-- | sh_sell       | double      | YES  |     | NULL    |       |
-- | sz_amount     | double      | YES  |     | NULL    |       |
-- | sz_net_amount | double      | YES  |     | NULL    |       |
-- | sz_buy        | double      | YES  |     | NULL    |       |
-- | sz_sell       | double      | YES  |     | NULL    |       |
-- +---------------+-------------+------+-----+---------+-------+



-------------- ggt_daily 操作记录 -----------------
-- 设置ts_code为主键，防止重复数据
ALTER TABLE ggt_daily change trade_date trade_date varchar(20);
ALTER TABLE ggt_daily ADD PRIMARY KEY ( `trade_date`);

-- +-------------+-------------+------+-----+---------+-------+
-- | Field       | Type        | Null | Key | Default | Extra |
-- +-------------+-------------+------+-----+---------+-------+
-- | trade_date  | varchar(20) | NO   | PRI | NULL    |       |
-- | buy_amount  | double      | YES  |     | NULL    |       |
-- | buy_volume  | double      | YES  |     | NULL    |       |
-- | sell_amount | double      | YES  |     | NULL    |       |
-- | sell_volume | double      | YES  |     | NULL    |       |
-- +-------------+-------------+------+-----+---------+-------+
-- 5 rows in set (0.00 sec)
