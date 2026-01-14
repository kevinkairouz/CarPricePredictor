//
//  PredictionView.swift
//  finalProject
//
//  Created by Kev on 1/14/26.
//

import SwiftUI
import Charts


//MARK: make the api call inside of the form view when the button is pressed and then use binding to pass the data to the next screen to display the money and use animation to display the money

//MARK: it is possible we may need to make the data type for state prediction into Result data type since we have to decode from JSON formatted data

//MARK: add animation to the words and have them animate indefinetly with option to make another prediction

struct PredictionView: View {
    
    @State var color1: Color = .green
    @State var color2: Color = .gray
    
    
    
    @State var firstPart: String = ""
    @State var secondPart: String = ""
    @State var prediction: String = ""
    
    @State var messagePrediction: String = ""
    
    
    var body: some View {
        ZStack{
            
            LinearGradient(colors: [color1, color2], startPoint: .top, endPoint: .bottomTrailing).ignoresSafeArea().animation(.easeInOut.speed(0.25).repeatForever(autoreverses: true), value: color1)
            
            VStack{
                Text(firstPart)
            
                Text(secondPart)
                Spacer()
            }
            .font(.title)
             .font(.headline)
             .fontWeight(.black)
             .bold()
             .foregroundStyle(.background)
             .padding(.top, 150)
             .animation(.bouncy.speed(0.2).delay(0.5), value: firstPart)
             .animation(.bouncy.speed(0.2).delay(0.5), value: secondPart)
            
            
                
             .onAppear(){
                 firstPart = "Your car is estimated"
                 secondPart = "to be worth..."
                 

             }
                
        }
    }
}

#Preview {
    PredictionView()
}
