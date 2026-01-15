from flask import Flask, jsonify, request
import numpy as np 
import model 

app = Flask(__name__) 
CodeyCopy = model.Codey() 

@app.route("/") 
def welcomeMessage(): 
    return "You are currently running Kevin's Car Price Predictior API!!"

@app.route("/predict", methods = ["POST"]) 
def makePrediction():   
    user_X = [] 

    if request.method == "POST":   
        json_data = request.get_json() 
        brand = json_data.get("Brand") 
        year = json_data.get("Year") 
        miles = json_data.get("Miles")
         
        
        prediction_for_user = CodeyCopy.predict(user_X)  
        response = {"price": prediction_for_user} 
        return jsonify(response)
        
    else: 
        return "Problem with this route" 
    
    
def run():  
    app.run() 

run() 