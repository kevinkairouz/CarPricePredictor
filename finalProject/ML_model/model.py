#core model
import pandas as pd  
from sklearn.ensemble import RandomForestRegressor 
from sklearn.linear_model import LinearRegression 
from sklearn.tree import DecisionTreeRegressor
from sklearn.model_selection import train_test_split 
import matplotlib.pyplot as plt 



df = pd.read_csv("carvana.csv") 
df['Brand'] = ''
df.loc[df['Name'].str.contains('Acura', case=False), 'Brand'] = 'Acura'
df.loc[df['Name'].str.contains('Alfa', case=False), 'Brand'] = 'Alfa Romeo'
df.loc[df['Name'].str.contains('Audi', case=False), 'Brand'] = 'Audi'
df.loc[df['Name'].str.contains('BMW', case=False), 'Brand'] = 'BMW'
df.loc[df['Name'].str.contains('Buick', case=False), 'Brand'] = 'Buick'
df.loc[df['Name'].str.contains('Cadillac', case=False), 'Brand'] = 'Cadillac'
df.loc[df['Name'].str.contains('Chevrolet', case=False), 'Brand'] = 'Chevrolet'
df.loc[df['Name'].str.contains('Chrysler', case=False), 'Brand'] = 'Chrysler'
df.loc[df['Name'].str.contains('Dodge', case=False), 'Brand'] = 'Dodge'
df.loc[df['Name'].str.contains('FIAT', case=False), 'Brand'] = 'Fiat'
df.loc[df['Name'].str.contains('Ford', case=False), 'Brand'] = 'Ford'
df.loc[df['Name'].str.contains('GMC', case=False), 'Brand'] = 'GMC'
df.loc[df['Name'].str.contains('Genesis', case=False), 'Brand'] = 'Genesis'
df.loc[df['Name'].str.contains('Honda', case=False), 'Brand'] = 'Honda'
df.loc[df['Name'].str.contains('Hyundai', case=False), 'Brand'] = 'Hyundai'
df.loc[df['Name'].str.contains('INFINITI', case=False), 'Brand'] = 'Infiniti'
df.loc[df['Name'].str.contains('Jaguar', case=False), 'Brand'] = 'Jaguar'
df.loc[df['Name'].str.contains('Jeep', case=False), 'Brand'] = 'Jeep'
df.loc[df['Name'].str.contains('Kia', case=False), 'Brand'] = 'Kia'
df.loc[df['Name'].str.contains('Land Rover', case=False), 'Brand'] = 'Land Rover'
df.loc[df['Name'].str.contains('Lexus', case=False), 'Brand'] = 'Lexus'
df.loc[df['Name'].str.contains('Lincoln', case=False), 'Brand'] = 'Lincoln'
df.loc[df['Name'].str.contains('MAZDA', case=False), 'Brand'] = 'Mazda'
df.loc[df['Name'].str.contains('MINI', case=False), 'Brand'] = 'Mini'
df.loc[df['Name'].str.contains('Maserati', case=False), 'Brand'] = 'Maserati'
df.loc[df['Name'].str.contains('Mercedes-Benz', case=False), 'Brand'] = 'Mercedes-Benz'
df.loc[df['Name'].str.contains('Mitsubishi', case=False), 'Brand'] = 'Mitsubishi'
df.loc[df['Name'].str.contains('Nissan', case=False), 'Brand'] = 'Nissan'
df.loc[df['Name'].str.contains('Polestar', case=False), 'Brand'] = 'Polestar'
df.loc[df['Name'].str.contains('Pontiac', case=False), 'Brand'] = 'Pontiac'
df.loc[df['Name'].str.contains('Porsche', case=False), 'Brand'] = 'Porsche'
df.loc[df['Name'].str.contains('Ram', case=False), 'Brand'] = 'Ram'
df.loc[df['Name'].str.contains('Saturn', case=False), 'Brand'] = 'Saturn'
df.loc[df['Name'].str.contains('Scion', case=False), 'Brand'] = 'Scion'
df.loc[df['Name'].str.contains('Subaru', case=False), 'Brand'] = 'Subaru'
df.loc[df['Name'].str.contains('Tesla', case=False), 'Brand'] = 'Tesla'
df.loc[df['Name'].str.contains('Toyota', case=False), 'Brand'] = 'Toyota'
df.loc[df['Name'].str.contains('Volkswagen', case=False), 'Brand'] = 'Volkswagen'
df.loc[df['Name'].str.contains('Volvo', case=False), 'Brand'] = 'Volvo'
df.loc[df['Name'].str.contains('smart', case=False), 'Brand'] = 'Smart' 

df = pd.get_dummies(df,columns=["Brand"])

Y = df["Price"]
X = df.drop(["Price", "Name"], axis=1)  



class Codey: 

    def __init__(self): 
        self.model = RandomForestRegressor()
    def predict(self, user_X):
        X_train, X_test, Y_train, Y_test = train_test_split(X,Y, train_size=0.8, random_state=42)
        self.model.fit(X_train, Y_train)
        brand, year, miles = user_X
        input_data = {col: 0 for col in X.columns}
        input_data["Year"] = year
        input_data["Miles"] = miles
        brand_col = f"Brand_{brand}"
        if brand_col in input_data:
            input_data[brand_col] = 1
        
        input_df = pd.DataFrame([input_data], columns=X.columns)
        Y_predicted = self.model.predict(input_df)
        return float(Y_predicted[0]) 
    def test(self): 
        X_train, X_test, Y_train, Y_test = train_test_split(X,Y, train_size=0.8, random_state=42)  
        self.model.fit(X_train, Y_train) 
        print(self.model.score(X_test, Y_test))
         
    

# codey = Codey() 

# codey.test()

          



            
        


