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

import SwiftUI

struct FormView: View {
    
    @State var color1: Color = .green
    @State var color2: Color = .gray
    
    @State var BrandSubmitted: String = ""
    @State var YearSubmitted: String = ""
    @State var EngineSizeSubmitted: String = ""
    @State var FuelTypeSubmitted: String = ""
    @State var TransmissionSubmitted: String = ""
    @State var MileageSubmitted: String = ""
    @State var ConditionSubmitted: String = ""
    @State var ModelSubmitted: String = ""
    @State var popUpMessage: String = ""
    
    let categories: [String] = ["Brand", "Year", "Engine Size", "Fuel Type", "Transmission", "Mileage", "Condition", "Model"]
    
    
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
                        .frame(height: 420)
                    
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
                    
                    
                    TextField("Engine Size", text: $EngineSizeSubmitted)
                        .padding()
                        .background(.gray.opacity(0.8))
                        .cornerRadius(100)
                        .font(.headline)
                        .foregroundStyle(.white)
                        .padding()
                        .shadow(radius: 8)
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                    
                    TextField("Fuel Type", text: $FuelTypeSubmitted)
                        .padding()
                        .background(.gray.opacity(0.8))
                        .cornerRadius(100)
                        .font(.headline)
                        .foregroundStyle(.white)
                        .padding()
                        .shadow(radius: 8)
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                    
                    TextField("Transmission", text: $TransmissionSubmitted)
                        .padding()
                        .background(.gray.opacity(0.8))
                        .cornerRadius(100)
                        .font(.headline)
                        .foregroundStyle(.white)
                        .padding()
                        .shadow(radius: 8)
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                    
                    TextField("Mileage", text: $MileageSubmitted)
                        .padding()
                        .background(.gray.opacity(0.8))
                        .cornerRadius(100)
                        .font(.headline)
                        .foregroundStyle(.white)
                        .padding()
                        .shadow(radius: 8)
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                    
                    TextField("Condition", text: $ConditionSubmitted)
                        .padding()
                        .background(.gray.opacity(0.8))
                        .cornerRadius(100)
                        .font(.headline)
                        .foregroundStyle(.white)
                        .padding()
                        .shadow(radius: 8)
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                    
                    TextField("Model", text: $ModelSubmitted)
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
                        if BrandSubmitted.trimmingCharacters(in: .whitespaces).isEmpty == true || YearSubmitted.trimmingCharacters(in: .whitespaces).isEmpty == true || EngineSizeSubmitted.trimmingCharacters(in: .whitespaces).isEmpty == true || FuelTypeSubmitted.trimmingCharacters(in: .whitespaces).isEmpty == true || TransmissionSubmitted.trimmingCharacters(in: .whitespaces).isEmpty == true || MileageSubmitted.trimmingCharacters(in: .whitespaces).isEmpty == true || ConditionSubmitted.trimmingCharacters(in: .whitespaces).isEmpty == true || ModelSubmitted.trimmingCharacters(in: .whitespaces).isEmpty == true{
                            
                            popUpMessage = "Invalid Details"
                            
                        }
                        else{
                            
                        }
                    } label: {
                        Text("Predict Value")
                        
                    }.frame(width: 200, height: 60)
                        .foregroundStyle(.green)
                        .background(.black)
                        .cornerRadius(12)
                        .shadow(radius: 10)
                        
                    
                    

                    
                    
                    
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


