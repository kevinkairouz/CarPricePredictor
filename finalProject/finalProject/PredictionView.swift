//
//  PredictionView.swift
//  finalProject
//
//  Created by Kev on 1/14/26.
//

import SwiftUI
import Charts


//MARK: make the api call inside of the form view when the button is pressed and then use binding to pass the data to the next screen to display the money and use animation to display the money

//or import charts

struct PredictionView: View {
    
    @State var color1: Color = .green
    @State var color2: Color = .gray
    
    
    var body: some View {
        ZStack{
            
            LinearGradient(colors: [color1, color2], startPoint: .top, endPoint: .bottomTrailing).ignoresSafeArea().animation(.easeInOut.speed(0.25).repeatForever(autoreverses: true), value: color1)
            
            
            Text("Prediction Screen")
        }
    }
}

#Preview {
    PredictionView()
}
