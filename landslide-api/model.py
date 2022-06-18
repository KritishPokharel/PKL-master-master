import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
# Importing the dataset
dataset = pd.read_csv("final_data.csv")
X = dataset.drop(['output', 'DISTRICT', 'Unnamed: 0'], axis=1)
y = dataset['output']

import xgboost
xgb = xgboost.XGBRegressor(
    max_depth=2,
    gamma=2,
    eta=0.8,
    reg_alpha=0.5,
    reg_lambda=0.5
)
res = xgb.fit(X,y)

from sklearn.linear_model import LogisticRegression
log_reg = LogisticRegression(
    penalty='l2',
    C=0.1
)
reg = log_reg.fit(X, y)

from sklearn.ensemble import RandomForestClassifier
rf = RandomForestClassifier()
forest = rf.fit(X,y)

import joblib
joblib.dump(res, "model_xgb.pkl")
joblib.dump(reg, "model_reg.pkl")
joblib.dump(forest, "model_forest.pkl")
cols=X.columns
joblib.dump(cols, "model_cols.pkl")
