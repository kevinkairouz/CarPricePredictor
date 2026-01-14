import pandas as pd  
from sklearn.ensemble import RandomForestRegressor 
from sklearn.linear_model import LinearRegression 
from sklearn.model_selection import train_test_split 
from sklearn.model_selection import GridSearchCV 
from sklearn.model_selection import RandomizedSearchCV 
from sklearn.metrics import recall_score 

df = pd.read_csv("car_price_prediction_.csv")

Y = df[["Price"]]
X = df.drop(["Car ID", "Price"], axis=1) 
X = pd.get_dummies(X, columns=["Brand", "Fuel Type", "Transmission", "Condition", "Model"]) 



class Codey: 

    def __init__(self, modelA, modelB): 
        modelA = LinearRegression()  
        modelB = RandomForestRegressor() 
    

    def train(): 
        return None

    

    def predict():  

        """ 
        this function will use train as a helper function in order to train the model and take a param 
        
        
        """
        return None
        

        
