import tushare as ts
import time
from sqlalchemy import create_engine, text
from datetime import datetime, timedelta


# mysql配置
def get_engine_ts():
    # 需要自己设置本地mysql密码
    with open('../config/mysql_password', 'r') as file:
        mysql_password = file.read().strip()  

    mysql_ip='localhost'
    mysql_port=3306
    database='tushare' # 需要自己新建下database
    engine_ts = create_engine(f"mysql+pymysql://root:{mysql_password}@{mysql_ip}:   {mysql_port}/{database}?charset=utf8mb4")
    return engine_ts

# tushare配置
def get_pro():
    # 需要自己设置tushare账户token
    with open('../config/tushare_token', 'r') as file:
        tushare_token = file.read().strip()

    ts.set_token(tushare_token)
    pro = ts.pro_api()
    return pro

# 全局变量
engine_ts = get_engine_ts()
pro=get_pro()


# 港股列表
def hk_basic():

    print("获取全部可交易股票基础信息")
    df = pro.hk_basic()
    df.to_sql('hk_basic', engine_ts, index=False, if_exists='append', chunksize=5000) 

    # print("获取全部退市股票基础信息")
    # df = pro.hk_basic(list_status='D')

    # print("获取全部暂停上市股票基础信息")
    # df = pro.hk_basic(list_status='L')


def hk_tradecal():
    print("港股交易日")
    df = pro.hk_tradecal(start_date='20180101', end_date='20211231')
    df.to_sql('hk_tradecal', engine_ts, index=False, if_exists='replace', chunksize=5000) 

def ggt_top10(trade_date):
    print("港股通十大成交股",trade_date)
    df = pro.ggt_top10(trade_date=trade_date)
    df.to_sql('ggt_top10', engine_ts, index=False, if_exists='replace', chunksize=5000) 

def multi_ggt_top10():
    start_date = datetime(2025, 7, 1)  # 起始日期

    for i in range(300):  # 往前n天
        date = (start_date - timedelta(days=i)).strftime("%Y%m%d")
        ggt_top10(date)
        time.sleep(0.5)

def run():
    # 港股列表
    # hk_basic()

    # 港股交易日
    # hk_tradecal()

    # 港股通十大成交股
    # ggt_top10('20250702')
    multi_ggt_top10()


if __name__ == '__main__':
    run()