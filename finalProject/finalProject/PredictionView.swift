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

//MARK: use a binding because you are going to make api

struct PredictionView: View {
    
    @State var color1: Color = .green
    @State var color2: Color = .gray
    
    
    
    @State var firstPart: String = ""
    @State var secondPart: String = ""
    @State var prediction: String = ""
    
    @State var messagePrediction: String = ""
    
    @State var start = 0.5
    @State var finish = 0.6
    
    @Binding var predictedPrice: Float
    
    
    
    
    
    
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
             .animation(.bouncy.speed(0.2).delay(1.5), value: prediction)
            
            VStack{
                Spacer()
                Text(prediction)
                    .font(.system(size: 30, weight: .black))  // Add this
                            .foregroundStyle(.white)
            }.padding(.top, 50)
            
            
            VStack{
                Spacer()
                Text("$" + messagePrediction)
                    .font(.title)
                     .font(.headline)
                     .fontWeight(.black)
                     .bold()
                     .foregroundStyle(.background)
                     .animation(.bouncy.speed(0.25), value: messagePrediction)
                    
            }.padding(.bottom, 320)
            
            VStack{
                Spacer()
                ZStack{
                    Circle()
                        .trim(from: start, to: finish)
                        .stroke(LinearGradient(colors: [.teal, .green], startPoint: .leading, endPoint: .trailing), lineWidth: 20)
                        .frame(width: 295, height: 295)
                        .animation(.bouncy.speed(0.15), value: start)
                        .animation(.bouncy.speed(0.15), value: finish)
                       
                    
                    
                    
                }
            }.padding(.bottom, 175)
            
            
            
            
            VStack{
                Spacer()
                
                Button {
                    
                } label: {
                    HStack{
                        Image(systemName: "car")
                        Text("Calculate Again")
                    }.foregroundStyle(.black).fontWeight(.semibold)
                }

            }
            
            
                
             .onAppear(){
                 firstPart = "Your car is estimated"
                 secondPart = "to be worth..."
                 start = 0.0
                 finish = 1.0
                 messagePrediction = String(predictedPrice)
                 
                 
                 

             }
                
        }
        
    }
}

#Preview {
    PredictionView(predictedPrice: .constant(25000.00))
}
