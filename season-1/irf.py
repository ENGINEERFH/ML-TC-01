#!/usr/bin/python
# -*- coding: utf-8 -*-
from sklearn.model_selection import cross_val_score,ShuffleSplit
from sklearn import metrics
from sklearn.datasets import load_boston
from sklearn.ensemble import RandomForestClassifier
from sklearn.model_selection import GridSearchCV , train_test_split
from sklearn.metrics import precision_recall_curve, roc_curve, auc, classification_report,make_scorer,f1_score
import pandas as pd
import numpy as np
import matplotlib.pylab as plt
import time


def cv(X,y):
    # 元分类器
    classifier = RandomForestClassifier(oob_score=True , random_state=33 , n_jobs=-1 , class_weight='balanced')

    # 设置参数


    param_grid = {'n_estimators':[30],  #需要较少的降低方差,默认10
                  'criterion': ['gini'],
                   # 'max_depth': rg,
                   'min_samples_split': [2], #分裂所需的最小样本数，默认2
                   'min_samples_leaf': [8], #叶节点最小样本数 ，默认1
                   'max_features': [70] #默认所有特征数的开方
                  }
    #0.6658

    # param_grid2 = {'n_estimators':[45],
    #               'criterion': ['gini'],
    #               # 'max_depth': [8],
    #               'min_samples_split': [2],
    #               'min_samples_leaf': [9],
    #               'max_features': [80]
    #               }
    #0.6777



    # param_grid3 = {'n_estimators':[45],
    #               'criterion': ['gini'],
    #               # # 'max_depth': [8],
    #               'min_samples_split': [2],
    #               'min_samples_leaf': [9],
    #               'max_features': [40],
    #               }
    #0.6846

    # param_grid4 = {'n_estimators':[55],
    #               'criterion': ['gini'],
    #               # 'max_depth': [8],
    #               'min_samples_split': [2],
    #               'min_samples_leaf': [13],
    #               'max_features': [55],
    #               }
    #0.6806

    rg1 = range(1, 15, 2)
    rg = range(25, 110, 5)
    # param_grid5 = {'n_estimators':[35],
    #               'criterion': ['gini'],
    #               # 'max_depth': [6],
    #               'min_samples_split': [2],
    #               'min_samples_leaf': [9],
    #               'max_features': [70],
    #               }

    #0.7231
    #运行网格搜索 GridSearch
    accuracy = []
    stdlist = []
    fscorer = make_scorer(f1_score, greater_is_better=True)
    grid = GridSearchCV(classifier, param_grid=param_grid, cv=5, scoring=fscorer, verbose=2)
    grid.fit(X, y)

    #输出最好参数和成绩
    print grid.best_params_
    print grid.best_score_

    # 画图平均准确度
    fig = plt.figure(1, figsize=(16, 12))
    plt.clf()
    ax1 = fig.add_subplot(1, 2, 1)
    ax2 = fig.add_subplot(1, 2, 2)
    scores = grid.grid_scores_
    for i in range(len(scores)):
        accu = scores[i][1]
        stdnum = np.std(scores[i][2])
        accuracy.append(accu)
        stdlist.append(stdnum)
    ax1.plot(rg, accuracy, linewidth=2)
    ax2.plot(rg, stdlist, linewidth=2)
    plt.axis('tight')
    ax1.set_xlabel('n_estimators')
    ax1.set_ylabel('accuracy')
    ax2.set_xlabel('n_estimators')
    ax2.set_ylabel('std_accuracy')
    plt.show()

def new_cv(X,y):

    # 拆分数据->X1 2 3 4 5和y1 2 3 4 5
    X_one = X[:1000]
    y_one = y[:1000]
    X_zero = X[1000:]
    y_zero = y[1000:]
    bestscore = 0
    tempscore = 0
    bestparam = 0
    # bestparam1 = 0
    for n in range(10, 50, 5):
        for i in range(1, 11, 1):
            test_X1, train_X1, test_y1, train_y1 = train_test_split(X_zero, y_zero, test_size=3800, random_state=333 + i*33)
            test_X2, train_X2, test_y2, train_y2 = train_test_split(test_X1, test_y1, test_size=3800, random_state=333 + i*33)
            test_X3, train_X3, test_y3, train_y3 = train_test_split(test_X2, test_y2, test_size=3800, random_state=333 + i*33)
            train_X5, train_X4, train_y5, train_y4 = train_test_split(test_X3, test_y3, test_size=3800, random_state=333 + i*33)
            tX1 = pd.concat([train_X1, X_one], ignore_index=True)
            ty1 = pd.concat([train_y1, y_one], ignore_index=True)
            tX2 = pd.concat([train_X2, X_one], ignore_index=True)
            ty2 = pd.concat([train_y2, y_one], ignore_index=True)
            tX3 = pd.concat([train_X3, X_one], ignore_index=True)
            ty3 = pd.concat([train_y3, y_one], ignore_index=True)
            tX4 = pd.concat([train_X4, X_one], ignore_index=True)
            ty4 = pd.concat([train_y4, y_one], ignore_index=True)
            tX5 = pd.concat([train_X5, X_one], ignore_index=True)
            ty5 = pd.concat([train_y5, y_one], ignore_index=True)
            ttX1, temp1, tty1, temp2 = train_test_split(tX1, ty1, test_size=0, random_state=3 + i*33)
            ttX2, temp1, tty2, temp2 = train_test_split(tX2, ty2, test_size=0, random_state=3 + i*33)
            ttX3, temp1, tty3, temp2 = train_test_split(tX3, ty3, test_size=0, random_state=3 + i*33)
            ttX4, temp1, tty4, temp2 = train_test_split(tX4, ty4, test_size=0, random_state=3 + i*33)
            ttX5, temp1, tty5, temp2 = train_test_split(tX5, ty5, test_size=0, random_state=3 + i*33)
            X1 = ttX1.reset_index(drop=True)
            y1 = tty1.reset_index(drop=True)
            X2 = ttX2.reset_index(drop=True)
            y2 = tty2.reset_index(drop=True)
            X3 = ttX3.reset_index(drop=True)
            y3 = tty3.reset_index(drop=True)
            X4 = ttX4.reset_index(drop=True)
            y4 = tty4.reset_index(drop=True)
            X5 = ttX5.reset_index(drop=True)
            y5 = tty5.reset_index(drop=True)

            # 元分类器 , class_weight='balanced'
            classifier1 = RandomForestClassifier(oob_score=True, random_state=33 + i*33, n_jobs=-1, class_weight={0: 0.25, 1: 0.75})
            classifier2 = RandomForestClassifier(oob_score=True, random_state=33 + i*33, n_jobs=-1, class_weight={0: 0.25, 1: 0.75})
            classifier3 = RandomForestClassifier(oob_score=True, random_state=33 + i*33, n_jobs=-1, class_weight={0: 0.25, 1: 0.75})
            classifier4 = RandomForestClassifier(oob_score=True, random_state=33 + i*33, n_jobs=-1, class_weight={0: 0.25, 1: 0.75})
            classifier5 = RandomForestClassifier(oob_score=True, random_state=33 + i*33, n_jobs=-1, class_weight={0: 0.25, 1: 0.75})
            # 设置参数
            param_grid = {'n_estimators': [n],  #需要较少的降低方差,
                          'criterion': ['gini'],
                          # 'min_samples_split': [2],
                          # 'min_samples_leaf': [1],
                          # 'max_features': [70]
                          }

            #运行网格搜索 GridSearch
            fscorer = make_scorer(f1_score, greater_is_better=True)

            grid1 = GridSearchCV(classifier1, param_grid=param_grid, n_jobs=-1, cv=5, scoring=fscorer)
            grid1.fit(X1, y1)
            print '------------------------------------------------------------------------cv-1--done'
            grid2 = GridSearchCV(classifier2, param_grid=param_grid, n_jobs=-1, cv=5, scoring=fscorer)
            grid2.fit(X2, y2)
            print '------------------------------------------------------------------------cv-2--done'
            grid3 = GridSearchCV(classifier3, param_grid=param_grid, n_jobs=-1, cv=5, scoring=fscorer)
            grid3.fit(X3, y3)
            print '------------------------------------------------------------------------cv-3--done'
            grid4 = GridSearchCV(classifier4, param_grid=param_grid, n_jobs=-1, cv=5, scoring=fscorer)
            grid4.fit(X4, y4)
            print '------------------------------------------------------------------------cv-4--done'
            grid5 = GridSearchCV(classifier5, param_grid=param_grid, n_jobs=-1, cv=5, scoring=fscorer,)
            grid5.fit(X5, y5)
            print '------------------------------------------------------------------------cv-5--done'

            #输出最好参数和成绩
            tempscore += np.mean([grid1.best_score_, grid2.best_score_, grid3.best_score_, grid4.best_score_, grid5.best_score_])
            print '----------------------------------------------------------------------------------'
        tempscore_mean = tempscore/10
        tempscore = 0
        print '----------------------------------------------------tempparam:'
        print n
        # print n1
        print '----------------------------------------------------tempscore:'
        print tempscore_mean
        if(tempscore_mean > bestscore):
            bestscore = tempscore_mean
            bestparam = n
            # bestparam1 = n1
    print '----------------------------------------------------全部结束!!!'
    print '----------------------------------------------------bestparam:'
    print bestparam
    # print bestparam1
    print '----------------------------------------------------bestscore:'
    print bestscore


#预测
def predict(X1, y1, X2, y2, X3, y3, X4, y4, X5, y5, t):

    temp = pd.read_csv('./data/df_id_test.csv', encoding='utf-8',low_memory=False)
    temp1 = pd.read_csv('./data/df_id_test.csv', encoding='utf-8',low_memory=False)
    test_t = pd.read_csv('./data/feature_t.csv' , encoding='utf-8' , low_memory=False)

    ###################111111111#######################
    classifier1 = RandomForestClassifier(n_estimators=30, criterion='gini', max_features=70,
                                         min_samples_split=2, min_samples_leaf=8, verbose=2, oob_score=True,
                                         random_state=33, n_jobs=-1, class_weight='balanced')
    classifier1.fit(X1, y1)
    pred1 = classifier1.predict(t)
    # ####################22222222########################
    classifier2 = RandomForestClassifier(n_estimators=45, criterion='gini', max_features=80,
                                        min_samples_split=2, min_samples_leaf=9, verbose=2, oob_score=True,
                                        random_state=33, n_jobs=-1, class_weight='balanced')
    classifier2.fit(X2, y2)
    pred2 = classifier2.predict(t)
    # ###################333333333#######################
    classifier3 = RandomForestClassifier(n_estimators=45, criterion='gini', max_features=40,
                                        min_samples_split=2, min_samples_leaf=9, verbose=2, oob_score=True,
                                        random_state=33, n_jobs=-1, class_weight='balanced')
    classifier3.fit(X3, y3)
    pred3 = classifier3.predict(t)
    # ###################444444444#######################
    classifier4 = RandomForestClassifier(n_estimators=55, criterion='gini', max_features=55,
                                        min_samples_split=2, min_samples_leaf=13, verbose=2, oob_score=True,
                                        random_state=33, n_jobs=-1, class_weight='balanced')
    classifier4.fit(X4, y4)
    pred4 = classifier4.predict(t)

    # ###################555555555#######################
    classifier5 = RandomForestClassifier(n_estimators=35, criterion='gini', max_features=70,
                                         min_samples_split=2, min_samples_leaf=9, verbose=2, oob_score=True,
                                         random_state=33, n_jobs=-1, class_weight='balanced')
    classifier5.fit(X5, y5)
    pred5 = classifier5.predict(t)

    # print classification_report(y, pred2)

    #输出feature的重要性
    # f, ax = plt.subplots(figsize=(7, 5))
    # ax.bar(range(len(classifier1.feature_importances_)), classifier1.feature_importances_)
    # ax.set_title("Feature Importances")
    # f.show()
    # print 1

    #计算最终预测
    pred_sum = pred1 + pred2 + pred3 + pred4 + pred5
    pred = np.where(pred_sum > 4, 1, 0)

    for n in test_t.index:
        temp = temp.replace(test_t.at[n, u'个人编码'], pred[n])
    temp2 = pd.concat([temp1,temp], axis=1, ignore_index=True)
    temp2.to_csv('./data/pred7.csv', encoding='utf-8', header=False, index=False)
    count = 0
    for n in range(0,4000,1):
        if pred[n] == 1:
            count +=1
    print count

def new_predict(X,y,t):

    temp = pd.read_csv('./data/df_id_test.csv', encoding='utf-8', low_memory=False)
    temp_t = pd.read_csv('./data/df_id_test.csv', encoding='utf-8', low_memory=False)
    test_t = pd.read_csv('./data/feature_t.csv', encoding='utf-8', low_memory=False)
    # 拆分数据->X1 2 3 4 5和y1 2 3 4 5
    X_one = X[:1000]
    y_one = y[:1000]
    X_zero = X[1000:]
    y_zero = y[1000:]
    pred_t = 0
    for i in range(1, 11, 1):
        test_X1, train_X1, test_y1, train_y1 = train_test_split(X_zero, y_zero, test_size=3800,
                                                                random_state=333 + i * 33)
        test_X2, train_X2, test_y2, train_y2 = train_test_split(test_X1, test_y1, test_size=3800,
                                                                random_state=333 + i * 33)
        test_X3, train_X3, test_y3, train_y3 = train_test_split(test_X2, test_y2, test_size=3800,
                                                                random_state=333 + i * 33)
        train_X5, train_X4, train_y5, train_y4 = train_test_split(test_X3, test_y3, test_size=3800,
                                                                  random_state=333 + i * 33)
        tX1 = pd.concat([train_X1, X_one], ignore_index=True)
        ty1 = pd.concat([train_y1, y_one], ignore_index=True)
        tX2 = pd.concat([train_X2, X_one], ignore_index=True)
        ty2 = pd.concat([train_y2, y_one], ignore_index=True)
        tX3 = pd.concat([train_X3, X_one], ignore_index=True)
        ty3 = pd.concat([train_y3, y_one], ignore_index=True)
        tX4 = pd.concat([train_X4, X_one], ignore_index=True)
        ty4 = pd.concat([train_y4, y_one], ignore_index=True)
        tX5 = pd.concat([train_X5, X_one], ignore_index=True)
        ty5 = pd.concat([train_y5, y_one], ignore_index=True)
        ttX1, temp1, tty1, temp2 = train_test_split(tX1, ty1, test_size=0, random_state=3 + i * 33)
        ttX2, temp1, tty2, temp2 = train_test_split(tX2, ty2, test_size=0, random_state=3 + i * 33)
        ttX3, temp1, tty3, temp2 = train_test_split(tX3, ty3, test_size=0, random_state=3 + i * 33)
        ttX4, temp1, tty4, temp2 = train_test_split(tX4, ty4, test_size=0, random_state=3 + i * 33)
        ttX5, temp1, tty5, temp2 = train_test_split(tX5, ty5, test_size=0, random_state=3 + i * 33)
        X1 = ttX1.reset_index(drop=True)
        y1 = tty1.reset_index(drop=True)
        X2 = ttX2.reset_index(drop=True)
        y2 = tty2.reset_index(drop=True)
        X3 = ttX3.reset_index(drop=True)
        y3 = tty3.reset_index(drop=True)
        X4 = ttX4.reset_index(drop=True)
        y4 = tty4.reset_index(drop=True)
        X5 = ttX5.reset_index(drop=True)
        y5 = tty5.reset_index(drop=True)

        ###################111111111#######################
        classifier1 = RandomForestClassifier(n_estimators=35, criterion='gini', max_features=55,
                                             min_samples_split=2, min_samples_leaf=9, verbose=2, oob_score=True,
                                             random_state=33 + i * 33, n_jobs=-1, class_weight={0: 0.25, 1: 0.75})
        classifier1.fit(X1, y1)
        pred1 = classifier1.predict(t)
        # ####################22222222########################
        classifier2 = RandomForestClassifier(n_estimators=35, criterion='gini', max_features=55,
                                             min_samples_split=2, min_samples_leaf=9, verbose=2, oob_score=True,
                                             random_state=33 + i * 33, n_jobs=-1, class_weight={0: 0.25, 1: 0.75})
        classifier2.fit(X2, y2)
        pred2 = classifier2.predict(t)
        # ###################333333333#######################
        classifier3 = RandomForestClassifier(n_estimators=35, criterion='gini', max_features=55,
                                             min_samples_split=2, min_samples_leaf=9, verbose=2, oob_score=True,
                                             random_state=33 + i * 33, n_jobs=-1, class_weight={0: 0.25, 1: 0.75})
        classifier3.fit(X3, y3)
        pred3 = classifier3.predict(t)
        # ###################444444444#######################
        classifier4 = RandomForestClassifier(n_estimators=35, criterion='gini', max_features=55,
                                             min_samples_split=2, min_samples_leaf=9, verbose=2, oob_score=True,
                                             random_state=33 + i * 33, n_jobs=-1, class_weight={0: 0.25, 1: 0.75})
        classifier4.fit(X4, y4)
        pred4 = classifier4.predict(t)

        # ###################555555555#######################
        classifier5 = RandomForestClassifier(n_estimators=35, criterion='gini', max_features=55,
                                             min_samples_split=2, min_samples_leaf=9, verbose=2, oob_score=True,
                                             random_state=33 + i * 33, n_jobs=-1, class_weight={0: 0.25, 1: 0.75})
        classifier5.fit(X5, y5)
        pred5 = classifier5.predict(t)

        # 计算每一次循环的预测
        pred_sum = pred1 + pred2 + pred3 + pred4 + pred5
        pred_t += pred_sum
    pred = np.where(pred_t >= 50, 1, 0)

    for n in test_t.index:
        temp = temp.replace(test_t.at[n, u'个人编码'], pred[n])
    temp2 = pd.concat([temp_t, temp], axis=1)
    # temp.to_csv('./data/temp_t.csv', encoding='utf-8')
    # temp2 = pd.concat([temp1, temp], axis=1, ignore_index=True)
    temp2.to_csv('./data/pred081422.csv', encoding='utf-8', header=False, index=False)

    tmp_high = pd.read_csv('./data/pred0728_wzn.csv', header=None)
    tmp_test = pd.read_csv('./data/pred081422.csv', header=None)
    fake_high = tmp_high[tmp_high[1] == 1].index
    fake_test = tmp_test[tmp_test[1] == 1].index
    n = 0
    for i in fake_test:
        if i in fake_high:
            n += 1
    print "total %d in high" % (len(fake_high))
    print "len test %d" % (len(fake_test))
    print "same %d for test" % (n)







if __name__ == '__main__':
    # 获取原始数据
    data = pd.read_csv('./data/feature.csv', encoding='utf-8', low_memory=False)
    test = pd.read_csv('./data/feature_t.csv', encoding='utf-8', low_memory=False)

    # 64->32,RandomForestClassifierRandomForestClassifier的数据大小是32位的
    for n in data.columns:
        if data[n].dtype == 'int64':
            data[n] = data[n].astype('int32')
        if data[n].dtype == 'float64':
            data[n] = data[n].astype('float32')
    for tn in test.columns:
        if test[tn].dtypes == 'int64':
            test[tn] = test[tn].astype('int32')
        if test[tn].dtypes == 'float64':
            test[tn] = test[tn].astype('float32')

    # 去除nan
    data = data.fillna(0)
    test = test.fillna(0)

    # 获取X,y,t
    # x_columns = [x for x in data.columns if x not in [u'个人编码', u'label', u'threeHostpital', u'skew_手术费发生金额',
    #                                                   u'skew_手术费自费金额', u'skew_手术费申报金额', u'skew_高价材料发生金额',
    #                                                   u'skew_成分输血申报金额', u'skew_其它申报金额', u'skew_起付线标准金额',
    #                                                   u'skew_残疾军人医疗补助基金支付金额', u'skew_城乡优抚补助金额',
    #                                                   u'diff_贵重检查费金额', u'diff_检查费自费金额', u'diff_治疗费自费金额',
    #                                                   u'diff_手术费发生金额', u'diff_手术费自费金额', u'diff_手术费申报金额',
    #                                                   u'diff_高价材料发生金额', u'diff_成分输血申报金额', u'diff_其它申报金额',
    #                                                   u'diff_起付线标准金额', u'diff_公务员医疗补助基金支付金额', u'diff_残疾军人医疗补助基金支付金额'
    #                                                   u'diff_残疾军人医疗补助基金支付金额', u'diff_城乡优抚补助金额']]
    #
    # t_columns = [x for x in test.columns if x not in [u'个人编码', u'threeHostpital', u'skew_手术费发生金额',
    #                                                   u'skew_手术费自费金额', u'skew_手术费申报金额', u'skew_高价材料发生金额',
    #                                                   u'skew_成分输血申报金额', u'skew_其它申报金额', u'skew_起付线标准金额',
    #                                                   u'skew_残疾军人医疗补助基金支付金额', u'skew_城乡优抚补助金额',
    #                                                   u'diff_贵重检查费金额', u'diff_检查费自费金额', u'diff_治疗费自费金额',
    #                                                   u'diff_手术费发生金额', u'diff_手术费自费金额', u'diff_手术费申报金额',
    #                                                   u'diff_高价材料发生金额', u'diff_成分输血申报金额', u'diff_其它申报金额',
    #                                                   u'diff_起付线标准金额', u'diff_公务员医疗补助基金支付金额', u'diff_残疾军人医疗补助基金支付金额'
    #                                                   u'diff_残疾军人医疗补助基金支付金额', u'diff_城乡优抚补助金额']]

    x_columns = [x for x in data.columns if x not in [u'个人编码', u'label', u'threeHostpital', u'skew_手术费发生金额',
                                                      u'skew_手术费自费金额', u'skew_手术费申报金额', u'skew_高价材料发生金额',
                                                      u'skew_成分输血申报金额', u'skew_其它申报金额', u'skew_起付线标准金额',
                                                      u'skew_残疾军人医疗补助基金支付金额', u'skew_城乡优抚补助金额',
                                                      u'diff_贵重检查费金额', u'diff_检查费自费金额', u'diff_治疗费自费金额',
                                                      u'diff_手术费发生金额', u'diff_手术费自费金额', u'diff_手术费申报金额',
                                                      u'diff_高价材料发生金额', u'diff_成分输血申报金额', u'diff_其它申报金额',
                                                      u'diff_起付线标准金额', u'diff_公务员医疗补助基金支付金额', u'diff_残疾军人医疗补助基金支付金额'
                                                      u'diff_残疾军人医疗补助基金支付金额', u'diff_城乡优抚补助金额', u'num_fake_price']]

    t_columns = [x for x in test.columns if x not in [u'个人编码', u'threeHostpital', u'skew_手术费发生金额',
                                                      u'skew_手术费自费金额', u'skew_手术费申报金额', u'skew_高价材料发生金额',
                                                      u'skew_成分输血申报金额', u'skew_其它申报金额', u'skew_起付线标准金额',
                                                      u'skew_残疾军人医疗补助基金支付金额', u'skew_城乡优抚补助金额',
                                                      u'diff_贵重检查费金额', u'diff_检查费自费金额', u'diff_治疗费自费金额',
                                                      u'diff_手术费发生金额', u'diff_手术费自费金额', u'diff_手术费申报金额',
                                                      u'diff_高价材料发生金额', u'diff_成分输血申报金额', u'diff_其它申报金额',
                                                      u'diff_起付线标准金额', u'diff_公务员医疗补助基金支付金额', u'diff_残疾军人医疗补助基金支付金额'
                                                      u'diff_残疾军人医疗补助基金支付金额', u'diff_城乡优抚补助金额', u'num_fake_price']]

    y = data['label']
    X = data[x_columns]
    t = test[t_columns]

    # new_cv(X, y)
    new_predict(X, y, t)



    #调参
    # cv(X5, y5)

    #预测
    # predict(X1, y1, X2, y2, X3, y3, X4, y4, X5, y5, t)