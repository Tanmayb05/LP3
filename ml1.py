import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from sklearn.linear_model import LinearRegression

dataset = pd.read_csv("ml1.csv")
x = dataset.iloc[:,:-1].values
y = dataset.iloc[:,1].values

regressor = LinearRegression()
regressor.fit(x,y) 
accuracy = regressor.score(x,y)*100
print("Coefficient : ",regressor.coef_)
print("intercept : ",regressor.intercept_)
print("Accuracy : ",accuracy)

hours = int(input("Enter the no of hours : "))
predicted_value = regressor.predict([[hours]])
print(predicted_value)

plt.plot(x,y,'o', label="data point")
plt.plot(x,regressor.predict(x), color='#ff0000', label='regression line')
plt.xlabel('Driving Hours')
plt.ylabel('Risk Score')
plt.legend()
plt.show()