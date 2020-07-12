"""simply select data from data-set divided by year"""
from pyspark.sql import SparkSession
import pandas as pd

cities = []
log_file = open('E:/log_file.log', 'w')
with open('E:/map2.txt', 'r') as maplist:
    lines = maplist.readlines()
for line in lines:
    cities.append((line[:11].strip(), line[12:].strip()))
spark = SparkSession.builder.appName("SimpleApp").getOrCreate()
for city_num, city_name in cities:
    df = spark.read.csv('E:/data_p3/{}_{}_{}.csv'.format(city_name, city_num, 1980), header=True)
    for i in range(1981, 2021):
        print('merge precess: {} {}'.format(i, city_name))
        df1 = spark.read.csv('E:/data_p3/{}_{}_{}.csv'.format(city_name, city_num, i), header=True)
        df = df.unionAll(df1)
    df_pd = df.toPandas()
    try:
        df_pd['date'] = pd.to_datetime(df_pd['date'], format='%Y%m%d')
    except:
        log_file.write('Error happens in {}\n'.format(city_name))
    df_pd.to_csv('E:/data_p4/{}_{}.csv'.format(city_name, city_num), index=None)

spark.stop()