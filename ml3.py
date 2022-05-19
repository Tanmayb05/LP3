# import packages
import numpy as np
import pandas as pd
from sklearn.neighbors import KNeighborsClassifier 

x = [[2, 4], [4, 4], [4, 6], [4, 2], [6, 2], [6, 4], [8, 2]]
y = ["Orange", "Blue", "Orange", "Orange", "Blue", "Orange", "Blue"]

classifier = KNeighborsClassifier(n_neighbors=3)
classifier.fit(x,y)
x_test = np.array([6,6]) 
y_pred = classifier.predict([x_test]) 

print(y_pred)