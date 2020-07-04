# 预测模型类，暂时使用了1980-2010年的数据
# Author: 童路勤
from statsmodels.graphics.tsaplots import plot_acf, plot_pacf
from statsmodels.tsa.stattools import adfuller as ADF
from pmdarima.model_selection import train_test_split
import pmdarima as pm
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
import pickle
from sklearn import metrics
import logging
# coding=utf-8
logging.basicConfig(level=logging.DEBUG)

ord_version = True  # 是否使用statsmodels的旧ARIMA类
if ord_version:
    from statsmodels.tsa.arima_model import ARIMA
else:
    from statsmodels.tsa.arima.model import ARIMA
forecast_mode = True  # 是否使用ARIMA的forecast函数，否则使用predict函数


# 外部接口类
class Predictor:
    def __init__(self, is_auto):
        # 加载模型，是否使用auto_arima
        if is_auto:
            self.model = AutoARIMA()
        else:
            self.model = NormalARIMA()

    def predict(self, start, end, file_name=None):
        # 预测start-end时间内的最低/最高气温，存储在file_name文件中
        # 返回存储预测结果的pandas.DataFrame
        date_list = [x for x in list(pd.date_range(start=start, end=end))]
        date_list = pd.Series(date_list)
        if True:
            res = self.model.predict(start, end)  # 调用对应模型的predict方法进行预测
            res0 = pd.Series(res[0])
            res1 = pd.Series(res[1])
            res1.name = 'tmax'
            frame = pd.DataFrame(list(zip(date_list, res0)))
            frame = frame.join(res1)
            frame.columns = ['date', 'tmin', 'tmax']
            print(frame)
            if file_name:
                frame.to_csv(file_name, index=None)
            frame.to_json(force_ascii=False)    
            return frame

    def validate(self):
        # 验证模型，需要特定源数据
        self.model.validate('tmin', model_saved=True)
        self.model.validate('tmax', model_saved=True)


class NormalARIMA:
    # 手动ARIMA方法

    param_dict = {  # 临时的不同label的p/q值，不准确
        'tmin': [3, 6],  # mse=20.8
        'tmax': [5, 2]   # mse=52.6
    }

    model_path = 'models/normal_{}_model.pkl'

    def __init__(self):
        logging.debug('normal ARIMA')

    def predict(self, start, end):
        logging.debug('Predicting')
        res_list = []
        for key in self.param_dict.keys():
            logging.debug('Loading {} model'.format(key))
            model = load_model(self.model_path.format(key))
            if forecast_mode:
                delta = pd.to_datetime(end) - pd.to_datetime(start)     # 时间差
                data_predict = model.forecast(delta.days)  # 预测
                res_list.append(data_predict[0])
            else:
                data_predict = model.predict(start, end, True)
                res_list.append(data_predict)

        return res_list

    def validate(self, label, validate_len=7, model_saved=False):
        # 加载数据
        data_raw = pd.read_csv('demo3.csv', index_col='date')   # read csv
        data1 = data_raw.loc[:, [label]]
        point = data1.shape[0] - validate_len
        data_train = data1[:point]
        data_test = data1[point:]
        diff1 = data_train.diff().dropna()    # 1阶差分
        print('the data ADF={}'.format(ADF(data_train)))
        print('the diff1 ADF={}'.format(ADF(diff1)))
        if forecast_mode:
            data_test = np.array(data_test)
            data_test = data_test.reshape(data_test.shape[0])

        data_train.plot()     # show the raw data graph
        plt.show()

        diff1.plot()    # show the diff1 data graph
        plt.show()

        plot_acf(diff1)  # diff1自相关图
        plt.show()

        plot_pacf(diff1)  # diff1的偏自相关图
        plt.show()
        # return
        p, q = self.param_dict[label]

        model = ARIMA(data_train, order=(p, 1, q)).fit()
        if forecast_mode:
            data_predict = model.forecast(validate_len)     # 预测
        else:
            data_predict = model.predict('2009-12-26', '2010-01-01', True)
        print('predicted:')
        print(data_predict)
        if forecast_mode and ord_version:  # 得到置信区间
            toplist = []
            bottomlist = []
            for bottom, top in data_predict[2]:
                toplist.append(top)
                bottomlist.append(bottom)
        # if ord_version:
            eval_dict = eval_metrics(data_test, data_predict[0])  # 计算评估
        else:
            eval_dict = eval_metrics(np.array(data_test), np.array(data_predict))

        print('eval={}'.format(eval_dict))

        if model_saved:
            logging.debug('Saving model')
            save_model(self.model_path.format(label), model)

        logging.debug('Plotting result')  # 画图
        if forecast_mode and ord_version:
            plt.plot([i for i in range(validate_len)], data_predict[0], c='red')
            plt.plot([i for i in range(validate_len)], toplist, c='blue')
            plt.plot([i for i in range(validate_len)], bottomlist, c='blue')
        else:
            plt.plot([i for i in range(validate_len)], data_predict, c='red')
        plt.plot([i for i in range(validate_len)], data_test, c='yellow')

        plt.show()


class AutoARIMA:
    # 自动ARIMA方法，未调节，严重不准
    label_list = ['tmin', 'tmax']  # mse=33.7, mse=108.1
    model_path = 'models/auto_{}_model.pkl'

    def __init__(self):
        logging.debug('auto ARIMA')
        self.data = pd.read_csv('demo3.csv')

    def predict(self, start, end):
        logging.debug('Predicting')
        res_list = []
        for key in self.label_list:
            logging.debug('Loading {} model'.format(key))
            model = load_model(self.model_path.format(key))
            delta = pd.to_datetime(end) - pd.to_datetime(start)  # 时间差
            data_predict = model.predict(n_periods=delta.days)
            res_list.append(data_predict)

        return res_list

    def validate(self, label, validate_len=7, model_saved=False):
        data_raw = pd.read_csv('demo3.csv', index_col='date')  # read csv
        point = data_raw.shape[0] - validate_len
        data_train, data_test = train_test_split(data_raw[label], train_size=point)

        model = pm.auto_arima(data_train)

        if model_saved:
            logging.debug('Saving model')
            save_model(self.model_path.format(label), model)
        data_test = data_test.tolist()

        forecasts = model.predict(validate_len)
        forecasts = [round(i, 1) for i in forecasts]

        print(data_test)
        print(forecasts)
        eval_dict = eval_metrics(data_test, np.array(forecasts))
        print(eval_dict)

        logging.debug('Plotting result')  # 画图
        plt.plot([i for i in range(validate_len)], data_test, c='yellow')
        plt.plot([i for i in range(validate_len)], forecasts, c='green')
        plt.show()


def eval_metrics(y_true, y_pred):
    # 计算MAE, MSE, MAPE值
    metrics_dict = dict()
    metrics_dict['MAE'] = metrics.mean_absolute_error(y_true, y_pred)
    metrics_dict['MSE'] = metrics.mean_squared_error(y_true, y_pred)
    metrics_dict['MAPE'] = np.mean(np.true_divide(np.abs(y_true - y_pred), y_true))
    return metrics_dict


# 保存模型
def save_model(file_path, model):
    with open(file_path, 'wb') as f:
        pickle.dump(model, f)


# 加载模型
def load_model(file_path):
    with open(file_path, 'rb') as f:
        model = pickle.load(f)
    return model


if __name__ == '__main__':
    predictor = Predictor(False)
    # predictor.validate()
    predictor.predict('2009-12-26', '2010-01-1')
