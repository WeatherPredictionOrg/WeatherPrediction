import pandas as pd
from datetime import datetime
from dateutil import parser


# 生成数据类
class DataGenerator:

    def __init__(self, file_path):
        self.data_raw = pd.read_csv(file_path, encoding='utf-8')
        self.data_raw['date'] = self.data_raw['DATE'].apply(parser.parse)
        self.data_raw['tmax'] = self.data_raw['TMAX'].astype(float)
        self.data_raw['tmin'] = self.data_raw['TMIN'].astype(float)
        self.data_raw['tavg'] = self.data_raw['TAVG'].astype(float)

    # 生成start-end时间段内的labels数据，可以指定是否存储为文件
    # 可以指定时间段内的特定某天，如special_day=[month, day]
    def generate(self, start, end, labels, special_day=None, file=False):
        data = self.data_raw.loc[:, labels]

        for label in labels:
            data = data[pd.Series.notnull(data[label])]

        # print(pd.to_datetime(start))
        data = data[(data['date'] >= pd.to_datetime(start)) & (data['date'] <= pd.to_datetime(end))]
        if special_day:
            data.query("date.dt.day == {} & date.dt.month == {}".format(special_day[1], special_day[0]), inplace=True)
        if file:
            data.to_csv('{}-{}-{}.csv'.format(start, end, special_day), index=None)

        return data


if __name__ == '__main__':
    generator = DataGenerator('full_data.csv')
    lens = generator.generate('1980-01-01', '2000-01-01', ['date', 'tmin', 'tmax', 'tavg'])
    print(lens)
