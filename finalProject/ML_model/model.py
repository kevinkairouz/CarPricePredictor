#core model
import pandas as pd  
from sklearn.ensemble import RandomForestRegressor 
from sklearn.model_selection import train_test_split 
from sklearn.metrics import recall_score 
from sklearn.metrics import precision_score

df = pd.read_csv("car_price_prediction_.csv")
Y = df[["Price"]]
X = df.drop(["Car ID", "Price"], axis=1) 
X = pd.get_dummies(X, columns=["Brand", "Fuel Type", "Transmission", "Condition", "Model"]) 

class Codey: 

    def __init__(self): 
        self.model = RandomForestRegressor() 
    def train(self): 
        X_train, X_test, Y_train, Y_test = train_test_split(X,Y, train_size=0.8, random_state=42)   
        self.model.fit(X_train, Y_train) 
    def predict(self, user_X):  
        self.train() 
        Y_predicted = self.model.predict(user_X) 
        return Y_predicted 
        

        
