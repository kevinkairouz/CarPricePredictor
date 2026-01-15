#core model
import pandas as pd  
from sklearn.ensemble import RandomForestRegressor 
from sklearn.linear_model import LinearRegression 
from sklearn.model_selection import train_test_split 
from sklearn.metrics import recall_score 

df = pd.read_csv("car_price_prediction_.csv")
Y = df[["Price"]]
X = df.drop(["Car ID", "Price"], axis=1) 
X = pd.get_dummies(X, columns=["Brand", "Fuel Type", "Transmission", "Condition", "Model"]) 



class Codey: 

    def __init__(self): 
        self.modelA = LinearRegression()
        self.modelB = RandomForestRegressor() 
        
    
    
    def train(self): 
        X_train, X_test, Y_train, Y_test = train_test_split(X,Y, train_size=0.8, random_state=42, stratify=Y)   
        self.modelA.fit(X_train, Y_train) 
        
        
        
        

    def predict(self): 

        """ 
        this function will use train as a helper function in order to train the model and take a param 
        
        
        """
        return None
        

        
