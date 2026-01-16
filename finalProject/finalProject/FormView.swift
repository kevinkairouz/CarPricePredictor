//
//  FormView.swift
//  finalProject
//
//  Created by Kev on 1/13/26.
//

import SwiftUI

//
//  ContentView.swift
//  finalProject
//
//  Created by Kev on 1/12/26.
//

//MARK: create a tab bar that has two options, predictions, settings
//MARK: also use pageview for tabs in order to create an onboarding view for the app!!
//MARK: bonus (create sign-in with google) 

import SwiftUI

struct FormView: View {
    
    @State var color1: Color = .green
    @State var color2: Color = .gray
    
    @State var BrandSubmitted: String = ""
    @State var YearSubmitted: String = ""
    @State var MilesSubmitted: String = ""
    @State var popUpMessage: String = ""
    @State var showPredictionScreen: Bool = false
    @State var predictedPrice: Float = 0.0
    
    @State var X_input: CarInfo = CarInfo(Brand: "", Year: 0, Miles: 0)
    
    let categories: [String] = ["Brand", "Year", "Miles"]
    
    @StateObject var api_manager = apiFetcher()
    
    
    var body: some View {
        
        ZStack{
            LinearGradient(colors: [color1, color2], startPoint: .top, endPoint: .bottomTrailing).ignoresSafeArea().animation(.easeInOut.speed(0.25).repeatForever(autoreverses: true), value: color1)
            
            
            VStack{
                Text(popUpMessage)
            }
            
            VStack{
                HStack{
                    Capsule()
                        .foregroundStyle(LinearGradient(colors: [.teal, .clear], startPoint: .trailing, endPoint: .topLeading))
                        .blur(radius: 10)
                    

                    
                    Spacer()
                }.padding(.leading, 20)
                Spacer()
            }
            
            
            

            
            
            ScrollView(){
                VStack{
                    Spacer()
                        .frame(height: 100)
                    
                    Text("Enter Car Details")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                    
                    
                    TextField("Brand", text: $BrandSubmitted)
                        .padding()
                        .background(.gray.opacity(0.8))
                        .cornerRadius(100)
                        .font(.headline)
                        .foregroundStyle(.white)
                        .padding()
                        .shadow(radius: 8)
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                    
                    TextField("Year", text: $YearSubmitted)
                        .padding()
                        .background(.gray.opacity(0.8))
                        .cornerRadius(100)
                        .font(.headline)
                        .foregroundStyle(.white)
                        .padding()
                        .shadow(radius: 8)
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                    
                    
                    TextField("Miles", text: $MilesSubmitted)
                        .padding()
                        .background(.gray.opacity(0.8))
                        .cornerRadius(100)
                        .font(.headline)
                        .foregroundStyle(.white)
                        .padding()
                        .shadow(radius: 8)
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                    
                    
                    
                    
                    Button {
                        if BrandSubmitted.trimmingCharacters(in: .whitespaces).isEmpty == true || YearSubmitted.trimmingCharacters(in: .whitespaces).isEmpty == true || MilesSubmitted.trimmingCharacters(in: .whitespaces).isEmpty == true{
                            
                            popUpMessage = "Invalid Details"
                            
                        }
                        else{
                            let y = Int(YearSubmitted)
                            let m = Int(MilesSubmitted)
                            X_input = CarInfo(Brand: BrandSubmitted, Year: y ?? 0 , Miles: m ?? 0)
                            Task{
                                
                                let res = try await api_manager.fetchData(X: X_input)
                                predictedPrice = res
                                showPredictionScreen.toggle()
                            }
                            
                        }
                    } label: {
                        Text("Predict Value")
                        
                    }.frame(width: 200, height: 60)
                        .foregroundStyle(.green)
                        .background(.black)
                        .cornerRadius(12)
                        .shadow(radius: 10)
                        .fullScreenCover(isPresented: $showPredictionScreen) {
                            PredictionView(predictedPrice: $predictedPrice)
                        }
                        
                    
                    

                    
                    
                    
                }
            }.defaultScrollAnchor(.center)
            
            
        }
            
            
       
        
        .onAppear {
            color1 = .gray
            color2 = .green
        }
    }
}

#Preview {
    FormView()
}


