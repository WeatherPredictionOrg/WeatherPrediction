# 预测模型类，使用全年数据进行ARIMA建模，训练后保存为pkl文件，预测时直接加载模型
# 如果是在训练集的时间范围内“预测”，默认使用的是静态预测，会使用训练集对结果进行修正，所以效果很好。
# 训练集时间范围之外为动态预测，数据没有修正，所以效果十分平直
# 如果改成动态预测，图像仍然 straight line，可能需要更大的p/q值来构建模型
# 这种方法好像只能预测紧接着的日期，也就是说目前只能预测2010年之前的，命令行参数默认预测2009-06-20
from statsmodels.graphics.tsaplots import plot_acf, plot_pacf
from statsmodels.tsa.stattools import adfuller as ADF
import statsmodels.api as sm
from statsmodels.tsa.arima_model import ARIMA
import pmdarima as pm
import numpy as np
import argparse
import matplotlib.pyplot as plt
import pandas as pd
import pickle
from sklearn import metrics
# from terms.dataGenerator import DataGenerator
from dataGenerator import DataGenerator
import warnings
warnings.filterwarnings("ignore")

root_path = ''


# 保存模型
def save_model(file_path, model):
    with open(file_path, 'wb') as f:
        pickle.dump(model, f)


# 加载模型
def load_model(file_path):
    with open(file_path, 'rb') as f:
        model = pickle.load(f)
    return model


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


class Predictor2:
    normal_model_path = root_path+'models/normal_{}_model.pkl'
    auto_model_path = root_path+'models/auto_{}_model.pkl'

    # 外部调用接口，起始时间，是否使用auto_arima
    # 返回从起始时间开始7天的tavg，tmax，tmin
    def predict_by_date(self, date, auto_model=False):
        res = []
        date_list = pd.date_range(date, periods=7)
        res.append(predictor.predict(date_list[0], date_list[-1], auto_model=auto_model))
        return res

    def predict(self, start, end, auto_model=False):
        # print('start={}, end={}'.format(start, end))
        result = []
        for label in labels[1:4]:  # 对每一个标签构建模型
            if auto_model:
                model = load_model(self.auto_model_path.format(label))
                # model = pm.auto_arima(data, seasonal=True, m=12)
                forecasts = model.predict(n_periods=7)
                result.append(forecasts[-1])
            else:
                model = load_model(self.normal_model_path.format(label))
                forecasts = model.predict(start=start, end=end, typ='levels', dynamic=False)
                result.append(forecasts.values)

        return result

    def train(self, start, end, auto_model, model_saved=False):
        self.data_raw = pd.read_csv('1980-01-01-2010-01-01-None.csv', index_col='date')

        for label in labels[1:2]:  # 对每一个标签构建模型
            data = self.data_raw[label]

            if auto_model:
                model = pm.auto_arima(data)
                # model = pm.auto_arima(data, seasonal=True, m=12)
                if date.year <= 2012:
                    forecasts = model.predict_in_sample(start=date.year, end=date.year)
                else:
                    forecasts = model.predict(n_periods=date.year-2012)
                print(forecasts)

                if model_saved:
                    save_model(self.auto_model_path.format(label), model)
            else:
                auto = False
                if auto:
                    best_order = find_best_order(data, True)
                else:
                    # diff1 = data.diff().fillna(0)
                    # diff2 = diff1.diff().fillna(0)
                    # plt.plot(data.values)
                    # plt.show()
                    # plt.plot(diff1.values)
                    # plt.show()
                    print('ADF={}'.format(ADF(data)))
                    # plot_acf(data)
                    # plt.show()
                    # plot_pacf(data)
                    # plt.show()
                    best_order = (12, 1, 10)
                    # return

                if best_order is None:
                    break
                print('use {}'.format(best_order))
                model = sm.tsa.ARIMA(data, order=best_order).fit(disp=0)
                forecasts = model.predict(start=start, end=end, typ='levels')
                print(forecasts)
                # plt.plot(forecasts)
                model.plot_predict(start=start, end=end)
                plt.show()

                if model_saved:
                    save_model(self.normal_model_path.format(label), model)


parser = argparse.ArgumentParser(description='Process some integers.')
parser.add_argument('-start', type=str, default='2009-06-20',
                    help='predict the data')
parser.add_argument('-auto', action='store_true',
                    help='whether to use the auto_arima')

if __name__ == '__main__':
    args = parser.parse_args()
    predictor = Predictor2()
    train = False
    if train:
        date_list = pd.date_range('2009-12-25', periods=14)
        predictor.train(date_list[0], date_list[-1], False, model_saved=False)
    else:
        # 暂时不要开auto，模型文件有点大没往上放
        res = predictor.predict_by_date(args.start, args.auto)
        # res = predictor.predict_by_date(args.start, args.auto)
        np.set_printoptions(formatter={'float': '{: 0.2f}'.format})
        # print(res)
        res0 = np.array(res).swapaxes(0, 1)
        for aaa in res0:
            print(aaa[0])
        #     plt.plot(aaa[0])
        # plt.show()
