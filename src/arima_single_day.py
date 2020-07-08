# 预测模型类，使用历年某天的数据进行ARIMA建模，预测时根据7个日期值分别进行建模
# 模型数量多，时间消耗大，但因为数据量小，模型预测“波动性”好，不至于平直，但准确率未验证
# 更好的效果仍需要更长的时间寻找pq值，可以提前把pq值或者整个模型存储至文件，但需要存储的数据比较多，每一天对应3个模型
# 或者提前预测存储至数据库
# 命令行参数默认预测2020-06-20
from statsmodels.graphics.tsaplots import plot_acf, plot_pacf
from statsmodels.tsa.stattools import adfuller as ADF
import statsmodels.api as sm
from statsmodels.tsa.arima_model import ARIMA
import pmdarima as pm
import numpy as np
import argparse
import matplotlib.pyplot as plt
import pandas as pd
from sklearn import metrics
# from terms.dataGenerator import DataGenerator
from dataGenerator import DataGenerator
import warnings
warnings.filterwarnings("ignore")


# 评估函数
def eval_metrics(y_true, y_pred):
    # 计算MAE, MSE, MAPE值
    metrics_dict = dict()
    metrics_dict['MAE'] = metrics.mean_absolute_error(y_true, y_pred)
    metrics_dict['MSE'] = metrics.mean_squared_error(y_true, y_pred)
    metrics_dict['MAPE'] = np.mean(np.true_divide(np.abs(y_true - y_pred), y_true))
    return metrics_dict


start_all = '1980-01-01'
end_all = '2012-12-31'
labels = ['date', 'tavg', 'tmax', 'tmin']  # 所有数据标签


# 寻找最优参数
def find_best_order(data, is_train):
    minn = np.inf
    min_order = None
    for d in range(2):
        for p in range(8):
            for q in range(8):
                if p + q == 0:
                    continue
                try:
                    models = sm.tsa.ARIMA(data, order=(p, d, q)).fit(disp=0)
                    if is_train:
                        print(p, d, q, models.bic)
                    if models.bic < minn:
                        minn = models.bic
                        min_order = (p, d, q)
                except:
                    print('error')

    if min_order is None:
        print('ERROR')
    return min_order


class Predictor1:
    def __init__(self):
        self.generator = DataGenerator()
        self.data_raw = self.generator.generate(start_all, end_all, labels)

    # 外部调用接口，起始时间，是否使用auto_arima，是否在普通arima模式下使用固定的pq值
    # 返回从起始时间开始7天的tavg，tmax，tmin
    def predict_by_date(self, date, auto_model=False, fixed_param=True):
        date_list = pd.date_range(date, periods=7)
        res = []
        for d in date_list:
            date_s = pd.to_datetime(d)
            res.append(predictor.predict(date_s, auto_model=auto_model, fixed_param=fixed_param))
        return res

    def predict(self, date, auto_model=False, fixed_param=True):
        self.data_raw = self.generator.generate(start_all, end_all, labels, [date.month, date.day])  # 生成需要的数据
        self.data_raw.set_index(['date'], inplace=True)
        result = []
        for label in labels[1:]:  # 对每一个标签构建模型
            data = self.data_raw[label]
            data.index = pd.date_range('1980', periods=33, freq='12M')

            if auto_model:
                model = pm.auto_arima(data)
                # model = pm.auto_arima(data, seasonal=True, m=12)
                if date.year <= 2012:
                    forecasts = model.predict_in_sample(start=date.year, end=date.year)
                else:
                    forecasts = model.predict(n_periods=date.year-2012)
                result.append(forecasts[-1])
            else:
                if fixed_param:
                    best_order = (0, 1, 1)  # 参数是临时的，未调整
                else:
                    best_order = find_best_order(data, False)
                    # if best_order is None:
                    #     break;
                model = sm.tsa.ARIMA(data, order=best_order).fit(disp=0)
                forecasts = model.predict(start='2013', end=str(date.year), typ='levels')
                result.append(forecasts.values[-1])

        return result

    def train(self, date, auto_model):
        self.data_raw = self.generator.generate(start_all, end_all, labels, [date.month, date.day])  # 生成需要的数据
        self.data_raw.set_index(['date'], inplace=True)

        for label in labels[3:4]:  # 对每一个标签构建模型
            data = self.data_raw[label]
            data.index = pd.date_range('1980', periods=33, freq='12M')

            if auto_model:
                model = pm.auto_arima(data)
                # model = pm.auto_arima(data, seasonal=True, m=12)
                if date.year <= 2012:
                    forecasts = model.predict_in_sample(start=date.year, end=date.year)
                else:
                    forecasts = model.predict(n_periods=date.year-2012)
                print(forecasts)
            else:
                auto = False
                if auto:
                    best_order = find_best_order(data, True)
                else:
                    # diff1 = data.diff().fillna(0)
                    # diff2 = diff1.diff().fillna(0)
                    # plt.plot(data)
                    # plt.show()
                    # plt.plot(diff2)
                    # plt.show()
                    # print('ADF={}'.format(ADF(diff2)))
                    # plot_acf(diff2)
                    # plt.show()
                    # plot_pacf(diff2)
                    # plt.show()
                    best_order = (7, 0, 6)
                    # return

                if best_order is None:
                    break
                print('use {}'.format(best_order))
                model = sm.tsa.ARIMA(data, order=best_order).fit(disp=0)
                forecasts = model.predict(start='2013', end=str(date.year), typ='levels')
                print(forecasts)
                # plt.plot(forecasts)
                model.plot_predict(start='2002', end=str(date.year))
                plt.show()


parser = argparse.ArgumentParser(description='Process some integers.')
parser.add_argument('-start', type=str, default='2020-06-20',
                    help='predict the data')
parser.add_argument('-auto', action='store_true',
                    help='whether to use the auto_arima')
parser.add_argument('-nofixed', action='store_true',
                    help='whether to use the fixed param p and q')

if __name__ == '__main__':
    # auto_arima seasonal，m=12 完成7天3个模型，共2min
    # auto_arima 完成需求，共10s
    # 固定参数的 arima，完成需求，时间因参数大小而定
    args = parser.parse_args()
    predictor = Predictor1()
    train = False
    if train:
        predictor.train(pd.to_datetime('2020-06-25'), False)
    else:
        res = predictor.predict_by_date(args.start, args.auto, not args.nofixed)
        np.set_printoptions(formatter={'float': '{: 0.2f}'.format})
        # print(res)
        res0 = np.array(res).swapaxes(0, 1)
        for aaa in res0:
            print(aaa)
        #     plt.plot(aaa)
        # plt.show()


