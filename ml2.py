import numpy as np
import pandas as pd
from sklearn.preprocessing import LabelEncoder
from sklearn.tree import DecisionTreeClassifier as dtc

labelencoder_x = LabelEncoder()
dataset = pd.read_csv("ml2.csv")
dataset = dataset.apply(LabelEncoder().fit_transform)

x = dataset.iloc[ : ,  : -1]
y = dataset['Buys']
x = np.asarray(x)
c = dtc().fit(x, y)

print(c.predict([[2, 0, 1, 0],[1,0,0,0]]))