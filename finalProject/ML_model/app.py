from flask import Flask, jsonify, request 
import mysql.connector as sql
import model 

app = Flask(__name__) 
CodeyCopy = model.Codey() 

def insertData(brand, year, miles): 
    query = "insert into carinfo values (%s,%s,%s)" 
    data = (brand, year, miles)  
    db = sql.connect(host = "localhost", user = "root", password = "Dominics1", database = "cars") 
    cursor = db.cursor() 
    cursor.execute(query, data) 
    db.commit()


@app.route("/") 
def welcomeMessage(): 
    return "You are currently running Kevin's Car Price Predictior API!!"

@app.route("/predict", methods = ["POST"]) 
def makePrediction():   
    if request.method == "POST":   
        json_data = request.get_json() 
        brand = json_data.get("Brand") 
        year = json_data.get("Year") 
        miles = json_data.get("Miles") 
        
        user_X = [brand, year, miles] 
        prediction_for_user = CodeyCopy.predict(user_X)  
        response = {"Price": prediction_for_user}  
        insertData(brand, year, miles)
        print("you have succesfully made a prediction and sent to app") 
        #call our insert function to insert into our MySQL db 
        return jsonify(response)
        
    else: 
        return "Problem with this route" 

@app.route("/test") 
def testRoute(): 
    return "testing, you have reached /test"
    
def run():
    app.run()

if __name__ == "__main__":
    run() 

#for testing purposes
# insertData("Toyota", 2004, 500) 
