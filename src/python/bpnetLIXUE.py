import math
import random
import pymysql  #导入 pymysql
import argparse

#打开数据库连接
db= pymysql.connect(host="localhost",user="user1",
    password="pw_user1",db="athlete",port=3306)

# 使用cursor()方法获取操作游标
cur = db.cursor()

#1.查询操作
# 编写sql 查询语句  user 对应我的表名
sql1 = "select Speed from rtable limit 90"
sql2= "select Weight,Air,Ang,High from rtable limit 90"
try:
    cur.execute(sql1)    #执行sql语句

    results = cur.fetchall()    #获取查询的所有记录
    cur.execute(sql2)    #执行sql语句

    enter1 = cur.fetchall()    #获取查询的所有记录
except Exception as e:
    raise e
finally:
    db.close()








random.seed(0)


def rand(a, b):
    return (b - a) * random.random() + a


def make_matrix(m, n, fill=0.0):
    mat = []
    for i in range(m):
        mat.append([fill] * n)
    return mat


def sigmoid(x):
    return 1.0 / (1.0 + math.exp(-x))


def sigmoid_derivative(x):
    return x * (1 - x)


class BPNeuralNetwork:
    def __init__(self):
        self.input_n = 0
        self.hidden_n = 0
        self.output_n = 0
        self.input_cells = []
        self.hidden_cells = []
        self.output_cells = []
        self.input_weights = []
        self.output_weights = []
        self.input_correction = []
        self.output_correction = []

    def setup(self, ni, nh, no):
        self.input_n = ni + 1
        self.hidden_n = nh
        self.output_n = no
        # init cells
        self.input_cells = [1.0] * self.input_n
        self.hidden_cells = [1.0] * self.hidden_n
        self.output_cells = [1.0] * self.output_n
        # init weights
        self.input_weights = make_matrix(self.input_n, self.hidden_n)
        self.output_weights = make_matrix(self.hidden_n, self.output_n)
        # random activate
        for i in range(self.input_n):
            for h in range(self.hidden_n):
                self.input_weights[i][h] = rand(-0.2, 0.2)
        for h in range(self.hidden_n):
            for o in range(self.output_n):
                self.output_weights[h][o] = rand(-2.0, 2.0)
        # init correction matrix
        self.input_correction = make_matrix(self.input_n, self.hidden_n)
        self.output_correction = make_matrix(self.hidden_n, self.output_n)

    def predict(self, inputs):
        # activate input layer
        for i in range(self.input_n - 1):
            self.input_cells[i] = inputs[i]
        # activate hidden layer
        for j in range(self.hidden_n):
            total = 0.0
            for i in range(self.input_n):
                total += self.input_cells[i] * self.input_weights[i][j]
            self.hidden_cells[j] = sigmoid(total)
        # activate output layer
        for k in range(self.output_n):
            total = 0.0
            for j in range(self.hidden_n):
                total += self.hidden_cells[j] * self.output_weights[j][k]
            self.output_cells[k] = sigmoid(total)
        return self.output_cells[:]

    def back_propagate(self, case, label, learn, correct):
        # feed forward
        self.predict(case)
        # get output layer error
        output_deltas = [0.0] * self.output_n
        for o in range(self.output_n):
            error = label[o] - self.output_cells[o]
            output_deltas[o] = sigmoid_derivative(self.output_cells[o]) * error
        # get hidden layer error
        hidden_deltas = [0.0] * self.hidden_n
        for h in range(self.hidden_n):
            error = 0.0
            for o in range(self.output_n):
                error += output_deltas[o] * self.output_weights[h][o]
            hidden_deltas[h] = sigmoid_derivative(self.hidden_cells[h]) * error
        # update output weights
        for h in range(self.hidden_n):
            for o in range(self.output_n):
                change = output_deltas[o] * self.hidden_cells[h]
                self.output_weights[h][o] += learn * change + correct * self.output_correction[h][o]
                self.output_correction[h][o] = change
        # update input weights
        for i in range(self.input_n):
            for h in range(self.hidden_n):
                change = hidden_deltas[h] * self.input_cells[i]
                self.input_weights[i][h] += learn * change + correct * self.input_correction[i][h]
                self.input_correction[i][h] = change
        # get global error
        error = 0.0
        for o in range(len(label)):
            error += 0.5 * (label[o] - self.output_cells[o]) ** 2
        return error

    def train(self, cases, labels, limit=10000, learn=0.1, correct=0.1):
        for j in range(limit):
            error = 0.0
            for i in range(len(cases)):
                label = labels[i]
                case = cases[i]
                error += self.back_propagate(case, label, learn, correct)
            #print("{}.error is:{}".format(j,error))

    def test(self,mytestdata):
        cases = enter1
        labels = results
        #casess = [
        #    [1.2, 1.2, 8, 10 ],
        #]
        case=mytestdata
        self.setup(4, 6, 1)
        self.train(cases, labels, 10000, 0.05, 0.1)
        #for case in casess:#这里的cases可以变成自己准备预测的数据
            #print(self.predict(case))
        print(self.predict(case))

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('--testdata', default="[1.2, 1.2, 8, 10]", type=str)

    args = parser.parse_args()
    mydata = args.testdata
    datas  = mydata.split("[")[1].split("]")[0].split(",")
    testdata = []
    for i in datas:
        testdata.append(float(i))

    # print(testdata)

    nn = BPNeuralNetwork()
    nn.test(testdata)
