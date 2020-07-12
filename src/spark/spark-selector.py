"""simply select data from data-set divided by year"""
from pyspark.sql import SparkSession
import pandas as pd
year = 1983
cities = []
with open('E:/map2.txt', 'r') as maplist:
    lines = maplist.readlines()
for line in lines:
    cities.append((line[:11].strip(), line[12:].strip()))
log_file = open('E:/log_file_{}.log'.format(year), 'w')
csvFile = "E:/weather_data/{}.csv".format(year)
spark = SparkSession.builder.appName("SimpleApp").getOrCreate()
df = spark.read.csv(csvFile).cache()
df = df.drop('_c4', '_c5', '_c6', '_c7')
num = 0
for city_num, city_name in cities:
    try:
        print('extract: {} {}'.format(num, city_name))
        df1 = df.filter("_c0 == '"+city_num+"'")
        df2 = df1.select("_c1", "_c2", "_c3")
        df2 = df2.toDF("date", "key", "value")
        df2 = df2.withColumn('value', df2.value / 10)
        tavg = df2.filter("key == 'TAVG'").drop('key').withColumnRenamed('value', 'tavg').toPandas()
        tmax = df2.filter("key == 'TMAX'").drop('key').withColumnRenamed('value', 'tmax').toPandas()
        tmin = df2.filter("key == 'TMIN'").drop('key').withColumnRenamed('value', 'tmin').toPandas()
        tbin1 = pd.merge(tavg, tmax, how='outer', on='date')
        tbin1 = pd.merge(tbin1, tmin, how='outer', on='date')
        tbin1.to_csv('E:/data_p3/{}_{}_{}.csv'.format(city_name, city_num, year), index=None)
    except:
        log_file.write('{}-{} has error.\n'.format(city_num, city_name))
    num = num + 1

log_file.close()
       
spark.stop()