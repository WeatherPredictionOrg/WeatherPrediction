# LSTM单变量训练/预测，用7天数据预测下一个7天的tmin。并未具体调参和训练
# 在训练集和测试集上mse=30+，预测效果不好，后续调整
# Author：童路勤
import numpy as np
import matplotlib.pyplot as plt
from pandas import read_csv
from keras.models import Sequential
from keras.layers import Dense
from keras.layers import LSTM
from keras.models import load_model
from sklearn.preprocessing import MinMaxScaler
from sklearn.metrics import mean_squared_error
import warnings
warnings.filterwarnings("ignore")


# 读取数据
def read_data():
    data_raw = read_csv('1980-1990.csv', engine='python')
    print(data_raw)
    data = data_raw.loc[:, ['tmin']]
    dataset = data.values
    dataset = dataset.astype('float32')
    return dataset


# 创建数据集，将数据按照time_step展开
# Param 源数据，time_step，预测数
def create_dataset(dataset, time_step=1, predict_num=1):
    dataX, dataY = [], []
    for i in range(len(dataset) - time_step - predict_num):
        a = dataset[i:(i + time_step), 0]
        dataX.append(a)
        dataY.append(dataset[i + time_step: i + time_step + predict_num, 0])
    return np.array(dataX), np.array(dataY)


# 对数据正则化、划分训练测试集，创建LSTM的输入数据
def process_data(dataset, time_step, scaler, predict_num, feature_num):
    np.random.seed(7)
    # 正则化
    dataset = scaler.fit_transform(dataset)
    # 划分数据集
    train_size = int(len(dataset) * 0.88)
    test_size = len(dataset) - train_size
    train, test = dataset[0:train_size, :], dataset[train_size:len(dataset), :]
    # 分别创建LSTM的输入数据
    trainX, trainY = create_dataset(train, time_step, predict_num)
    testX, testY = create_dataset(test, time_step, predict_num)
    # 将输入reshape为 keras LSTM 需要的维度 [samples, time steps, features]
    trainX = np.reshape(trainX, (trainX.shape[0], trainX.shape[1], feature_num))
    testX = np.reshape(testX, (testX.shape[0], testX.shape[1], feature_num))

    return trainX, trainY, testX, testY


# 创建LSTM模型
def get_model(input_shape, layers, predict_num):
    model = Sequential()
    model.add(LSTM(layers[0], input_shape=input_shape, return_sequences=True))
    model.add(LSTM(layers[1]))
    model.add(Dense(predict_num))
    model.compile(loss='mse', optimizer='adam')
    return model


# 对正则化后的数据进行还原
def reprocess_data(scaler, data):
    reprocess = []
    for d in data:
        d = scaler.inverse_transform(d)
        reprocess.append(d)
    return reprocess


# 计算 MSE
def evaluate(label, y_true, y_pre):
    mse = mean_squared_error(y_true, y_pre)
    print('{} MSE={}'.format(label, mse))


class LSTMPredictor:
    model_path = 'my_model1.h5'
    time_step = 7       # 基于之前time_step个数据进行预测
    predict_num = 7     # 预测之后的predict_num个数据
    feature_num = 1     # 数据维度

    def __init__(self):
        print('use LSTM model')

    # 传入某个7天的数据，预测下个7天的数据
    def predict(self, src):
        try:
            model = load_model(self.model_path)
        except:
            print('Model file not found!')
            return None

        predict_x = np.array(src).astype(float)
        # reshape，用于正则化
        predict_x = np.reshape(predict_x, (self.time_step, self.feature_num))
        scaler_predict = MinMaxScaler(feature_range=(0, 1))
        predict_x = scaler_predict.fit_transform(predict_x)
        # reshape，用于输入 LSTM
        predict_x = np.reshape(predict_x, (1, self.time_step, self.feature_num))
        predict_y = model.predict(predict_x)
        # 逆正则化得到结果
        predict_y = scaler_predict.inverse_transform(predict_y)

        return predict_y

    def train(self):
        dataset1 = read_data()
        # 数据处理
        scaler = MinMaxScaler(feature_range=(0, 1))
        trainX, trainY, testX, testY = process_data(dataset1, self.time_step, scaler, self.predict_num, self.feature_num)

        model = get_model((self.time_step, self.feature_num), [64, 128], self.predict_num)
        model.summary()

        history = model.fit(trainX, trainY, epochs=100, batch_size=4, verbose=2)
        model.save(self.model_path)
        # 预测
        train_predict = model.predict(trainX)
        test_predict = model.predict(testX)
        # 逆正则化
        reprocessed = reprocess_data(scaler, [test_predict, testY, train_predict, trainY])
        repro_test_predict, repro_testY, repro_train_predict, repro_trainY = reprocessed
        # 计算MSE
        evaluate('test', repro_testY, repro_test_predict)
        evaluate('train', repro_trainY, repro_train_predict)
        # 绘图
        plt.plot(repro_test_predict[:, 0])
        plt.plot(repro_testY[:, 0])
        plt.show()


if __name__ == '__main__':
    predictor = LSTMPredictor()
    train = False
    if train:
        predictor.train()
    else:
        y_pre = predictor.predict([13, 5, 15, 18, 21, 14, 13])  # 1-from 1980-01-10 to 01-16
        # y_pre = predictor.predict([27, 24, 27, 28, 25, 24, 25])  # 2-from 1999-11-25 to 12-01
        if y_pre is not None:
            datext = np.array([9, 13, 11, 13, 16, 11, 20])  # 真实数据1
            # datext = np.array([27, 34, 31, 21, 24, 23, 22])  # 真实数据2
            print(y_pre)
            print(datext)

            plt.plot(y_pre[0])
            plt.plot(datext)
            plt.show()
