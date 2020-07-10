# LSTM预测类，模型的预测接口，需要补全预测日期前 time_step 天的数据才可正常预测
# 现在 2013 年之前均可
# Author：童路勤
import os

import numpy as np
import pandas as pd
from pandas import read_csv

os.environ['TF_CPP_MIN_LOG_LEVEL'] = '2'
import warnings

warnings.filterwarnings("ignore")
import tensorflow as tf

tf.compat.v1.logging.set_verbosity(tf.compat.v1.logging.ERROR)
from keras.models import Sequential
from keras.layers import Dense
from keras.layers import LSTM
from sklearn.preprocessing import MinMaxScaler
from keras.optimizers import Adam
import argparse
from dateutil import parser

# .py 文件所在路径，为解决 java 调用时使用相对路径无法找到文件的问题
root_path = ''


class LSTMPredictor:
    model_path = root_path + 'models/model_{}_{}.h5'  # 模型文件
    data_file = root_path + 'data/{}.csv'  # 训练数据
    predict_file = root_path + 'data/{}.csv'  # 预测数据
    time_step = 14  # 基于之前 time_step 个数据进行预测
    predict_num = 7  # 预测之后的 predict_num 个数据
    feature_num = 1  # 数据维度
    scaler = (0, 1)  # 归一化参数
    layers = [64, 64]  # LSTM单元数

    def __init__(self, city_name, label):
        self.city_name = city_name
        self.label = label

    # 根据 LSTM 单元数，构建 LSTM 网络
    def get_model(self, layers, compile=False):
        model = Sequential()
        model.add(LSTM(layers[0], input_shape=(self.time_step, self.feature_num), return_sequences=True))
        model.add(LSTM(layers[1]))
        model.add(Dense(self.predict_num))
        if compile:
            model.compile(loss='mse', optimizer=Adam())
        return model

    # 输入长度为 self.time_step 的序列，预测序列后长度为 self.predict_num 的序列
    def predict(self, x_pred):
        model = self.get_model(self.layers)
        model.load_weights(self.model_path.format(self.city_name, self.label))
        predict_x = np.array(x_pred).astype(float)
        # reshape，用于归一化
        predict_x = np.reshape(predict_x, (self.time_step, self.feature_num))
        scaler_predict = MinMaxScaler(feature_range=self.scaler)
        predict_x = scaler_predict.fit_transform(predict_x)
        # reshape，用于输入 LSTM
        predict_x = np.reshape(predict_x, (1, self.time_step, self.feature_num))
        predict_y = model.predict(predict_x)
        # 逆归一化得到结果
        predict_y = scaler_predict.inverse_transform(predict_y)

        return predict_y

    # 输出以指定日期为日期起点的7天的数据
    def predict_by_date(self, date):
        # 得到指定日期前长度为 self.time_step 的序列
        data_file = predictor.predict_file.format(self.city_name)
        datas = predictor.load_data(data_file, [self.label], remove_date=False)
        datas['date'] = datas['date'].apply(parser.parse)
        end_row = datas[datas['date'] == date].index[0] - 1
        start_row = end_row - self.time_step + 1
        x_pred = datas.loc[start_row:end_row, self.label]
        # 输入网络进行预测
        y_pred = self.predict(x_pred)[0]
        return y_pred

    # 加载 csv 数据，用于训练或预测
    def load_data(self, filename, labels, remove_date=True):
        data_raw = read_csv(filename)
        if remove_date:
            data = data_raw.loc[:, labels]
            dataset = data.values
            dataset = dataset.astype('float32')
            return dataset
        else:
            return data_raw


arg_parser = argparse.ArgumentParser(description='Set a specific city and start date')
arg_parser.add_argument('-city', type=str, required=True, help='the city')
arg_parser.add_argument('-start', type=str, default='2005-06-20', help='the start date')

if __name__ == '__main__':
    labels = ['tavg', 'tmax', 'tmin']
    args = arg_parser.parse_args()
    predictor = LSTMPredictor(args.city, 'tavg')
    date = args.start
    result = []
    for label in labels:
        predictor.label = label
        result.append(predictor.predict_by_date(date))
    # 以下为规范化输出，预测 n 天，每天3个数据，则格式为：
    # n 行，每行 m+1 个值用空格隔开，分别是 日期 tavg tmax tmin
    # 日期格式形如 2010-02-02
    res = np.array(result)
    res = res.swapaxes(0, 1)
    np.set_printoptions(formatter={'float': '{: 0.2f}'.format})
    res0 = np.round(res, 2)
    res0 = res0.astype(str)
    date_list = pd.date_range(date, periods=7)
    date_list = np.array(date_list.strftime("%Y-%m-%d"))
    res0 = np.insert(res0, 0, date_list, axis=1)
    for aaa in res0:
        li = aaa.tolist()
        print(' '.join(li))
