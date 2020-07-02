# import pandas as pd
#
#
# class DataRead:
#     def __init__(self, path):
#         self.path = path
#
#     def read(self):
#         with open(self.path)as file:
#             data = pd.read_csv(file)
#             # head_data = data.head(2)
#             # print(head_data)
#             print(data)
#
#

import csv
import json


class Tran:

    # 这里的path是绝对路径----比如'C:/Users/Air/Downloads/2199398.csv'

    def __init__(self, path_csv, path_json):
        self.path_csv = path_csv
        self.path_json = path_json

    def tran(self):

        fr = open(self.path_csv, "r", encoding='utf-8')
        ls = []
        for line in fr:
            line = line.replace("\n", "")
            ls.append(line.split(","))
        fr.close()
        fw = open(self.path_json, "w", encoding='utf-8')
        for i in range(1, len(ls)):
            ls[i] = dict(zip(ls[0], ls[i]))
        b = json.dumps(ls[1:], sort_keys=True, indent=9, ensure_ascii=False)
        print(b)
        fw.write(b)
        fw.close()
