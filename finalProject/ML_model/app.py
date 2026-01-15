from flask import Flask, jsonify, request
import model 

app = Flask(__name__) 
CodeyCopy = model.Codey() 

@app.route("/") 
def welcomeMessage(): 
    return "You are currently running Kevin's Car Price Predictior API!!"

@app.route("/predict", methods = ["POST"]) 
def makePrediction(user_X):  
    if request.method == "POST":  
        prediction_for_user = CodeyCopy.predict(user_X)  
        response = {"price": prediction_for_user} 
        return jsonify(response)
        
    else: 
        return "Problem with this route" 
    
    
def run():  
    app.run() 

run() 