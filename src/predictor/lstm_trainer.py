# LSTM训练类，根据给定城市和数据标签进行训练并保存模型
# Author：童路勤
import math
import os
import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
from pandas import read_csv

os.environ['TF_CPP_MIN_LOG_LEVEL'] = '2'
import warnings

warnings.filterwarnings("ignore")
import tensorflow as tf

tf.compat.v1.logging.set_verbosity(tf.compat.v1.logging.ERROR)
from keras.models import Sequential
from keras.layers import Dense, LSTM
from sklearn.preprocessing import MinMaxScaler
from sklearn.metrics import mean_squared_error, mean_absolute_error, r2_score
from keras.optimizers import Adam
from keras.callbacks import ReduceLROnPlateau

root_path = ''


# 对正则化后的数据进行还原
def reprocess_data(scaler, data):
    reprocess = []
    for d in data:
        d = scaler.inverse_transform(d)
        reprocess.append(d)
    return reprocess


# 计算 MSE 等
def evaluate(label, y_true, y_pre, log_file=None):
    mse = mean_squared_error(y_true, y_pre)
    rmse = math.sqrt(mse)
    mae = mean_absolute_error(y_true, y_pre)
    r2 = r2_score(y_true, y_pre)
    print('{} MSE={}'.format(label, mse))
    print('{} RMSE={}'.format(label, rmse))
    print('{} MAE={}'.format(label, mae))
    print('{} R2={}'.format(label, r2))
    if log_file is not None:
        log_file.write('{} MSE={}\n'.format(label, mse))
        log_file.write('{} RMSE={}\n'.format(label, rmse))
        log_file.write('{} MAE={}\n'.format(label, mae))
        log_file.write('{} R2={}\n'.format(label, r2))


class LSTMPredictor:
    model_path = root_path + 'models/model_{}_{}.h5'  # 模型文件
    data_file = root_path + 'data/{}.csv'  # 训练数据
    predict_file = root_path + 'data/{}.csv'  # 预测数据
    time_step = 56  # 基于之前 time_step 个数据进行预测
    predict_num = 7  # 预测之后的 predict_num 个数据
    feature_num = 1  # 数据维度
    scaler = (-1, 1)  # 归一化参数
    layers = [128, 128]  # LSTM单元数

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
            model.compile(loss='mse', optimizer='adam')
        return model

    # 进行验证，在原数据集中分别取某些序列作为输入，得到预测序列，与原序列对比
    def validate(self):
        data_file = predictor.data_file.format(self.city_name)
        datas = predictor.load_data(data_file, self.label)
        st = 300
        period = 70
        plot_list = np.empty_like(datas[st:st + period])
        plot_list = np.reshape(plot_list, (plot_list.shape[0],))
        true_list = np.reshape(datas[st:st + period], (period,))
        plot_list[:] = np.nan
        time_step = predictor.time_step
        predict_num = predictor.predict_num

        for i in range(st, st + period - time_step - predict_num - 5, 9):
            print('current is {}'.format(i))
            x_true = datas[i:i + time_step].reshape((time_step,))
            y_true = datas[i + time_step:i + time_step + predict_num].reshape((predict_num,))
            y_pre = predictor.predict(x_true)
            print(y_pre)
            print(y_true)
            if y_pre is not None:
                plot_list[i + time_step - st:i + time_step + predict_num - st] = y_pre[0]
                evaluate(str(i), y_true, y_pre[0])

        plt.plot(plot_list, label='predict')
        plt.plot(true_list, label='y_true')
        plt.legend()
        plt.show()

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

    # 加载 csv 数据，用于训练或预测
    def load_data(self, filename, labels, remove_date=True):
        if remove_date:
            data_raw = read_csv(filename, index_col='date')
            data_raw = data_raw.loc[:, labels]
            start, end = 1980, 2000
            # for i in range(1980, 2021):
            #     f = data_raw['{}-01-01'.format(i):'{}-12-31'.format(i)]
            #     # print(f)
            #     print(i, f.isna().sum().sum())
            #     if f.isna().sum().sum() < 180:
            #         data_raw['{}-01-01'.format(i):'{}-12-31'.format(i)].fillna(method='ffill', inplace=True)
            #         data_raw['{}-01-01'.format(i):'{}-12-31'.format(i)].fillna(method='bfill', inplace=True)
            #         end = i
            #     else:
            #         end = i - 1
            #         break
            if end is not None:
                print('from {} to {}'.format(start, end))
                data_raw = data_raw['{}-01-01'.format(start):'{}-12-31'.format(end)]
                # data = data_raw.loc[:, labels]
                dataset = data_raw.values
                dataset = dataset.astype('float32')
                return dataset
            else:
                print('ERROR')
                return None
        else:
            data_raw = read_csv(filename)
            return data_raw

    # 将数据转换为时间序列格式
    def create_dataset(self, dataset):
        dataX, dataY = [], []
        for i in range(len(dataset) - self.time_step - self.predict_num):
            a = dataset[i:(i + self.time_step), 0]  # 第 i 到 i+self.time_step 个数据构成一个输入序列 x
            dataX.append(a)  # y 为 x 之后长为 self.predict_num 的序列
            dataY.append(dataset[i + self.time_step: i + self.time_step + self.predict_num, 0])
        return np.array(dataX), np.array(dataY)

    # 数据归一化，划分训练、验证集
    def process_data(self, dataset, scaler):
        np.random.seed(7)
        dataset = scaler.fit_transform(dataset)
        train_size = int(len(dataset) * 0.88)
        test_size = len(dataset) - train_size
        train, test = dataset[0:train_size, :], dataset[train_size:len(dataset), :]
        # 分别创建LSTM的输入数据
        trainX, trainY = self.create_dataset(train)
        testX, testY = self.create_dataset(test)
        # 将输入reshape为 keras LSTM 需要的维度 [samples, time steps, features]
        trainX = np.reshape(trainX, (trainX.shape[0], trainX.shape[1], self.feature_num))
        testX = np.reshape(testX, (testX.shape[0], testX.shape[1], self.feature_num))
        return trainX, trainY, testX, testY

    # 训练模型，训练结束后保存模型并输出在训练集和验证集上的预测效果
    def train(self, epochs=40, batch_size=64, log_file=None):
        dataset = self.load_data(self.data_file.format(self.city_name), [self.label])
        # 数据处理
        scaler = MinMaxScaler(feature_range=self.scaler)
        trainX, trainY, testX, testY = self.process_data(dataset, scaler)
        print(trainX)
        print(trainY)

        model = self.get_model(self.layers, compile=True)
        model.summary()
        reduce_lr = ReduceLROnPlateau(monitor='val_loss', factor=0.7, patience=3, verbose=1)

        history = model.fit(trainX, trainY, epochs=epochs, batch_size=batch_size, verbose=1,
                            validation_data=(testX, testY))
        model.save_weights(self.model_path.format(self.city_name, self.label))
        # 预测
        train_predict = model.predict(trainX)
        test_predict = model.predict(testX)
        # 逆正则化
        reprocessed = reprocess_data(scaler, [test_predict, testY, train_predict, trainY])
        repro_test_predict, repro_testY, repro_train_predict, repro_trainY = reprocessed
        # 计算 MSE 等
        evaluate('test', repro_testY, repro_test_predict, log_file=log_file)
        evaluate('train', repro_trainY, repro_train_predict, log_file=log_file)


if __name__ == '__main__':
    labels = ['tavg', 'tmax', 'tmin']
    train = True
    if train:
        city_name = 'wu lu mu qi_CHM00051463'
        log_file = open('{}.log'.format(city_name), 'w')
        for lab in labels[:1]:
            predictor = LSTMPredictor(city_name, lab)
            log_file.write(lab + '\n')
            predictor.train(epochs=40, batch_size=64, log_file=log_file)
        log_file.close()
    else:
        predictor = LSTMPredictor('beijing_CHM00054511', 'tmax')
        predictor.validate()
