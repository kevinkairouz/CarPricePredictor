//
//  ContentView.swift
//  finalProject
//
//  Created by Kev on 1/12/26.
//

import SwiftUI

struct ContentView: View {
    
    @State var color1: Color = .green
    @State var color2: Color = .gray
    
    @State var emailSubmitted: String = ""
    @State var passwordSubmitted: String = ""
    
    @State var airplane_placement: Int = -145
    
    @State var h: Int = 20
    @State var w: Int = 20
    
    var body: some View {
        
        NavigationStack{
            ZStack{
                LinearGradient(colors: [color1, color2], startPoint: .top, endPoint: .bottomTrailing).ignoresSafeArea().animation(.easeInOut.speed(0.25).repeatForever(autoreverses: true), value: color1)
                
                VStack{
                    Text("Welcome Back")
                        .font(.system(size: 33, weight: .semibold, design: .serif))
                    Spacer()
                }.padding(.top, 135)
                
                
                VStack(spacing: 30){
                    TextField("Email", text: $emailSubmitted)
                        .padding()
                        .background(.gray.opacity(0.8))
                        .cornerRadius(12)
                        .font(.headline)
                        .foregroundStyle(.white)
                        .padding()
                        .shadow(radius: 8)
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                    
                    SecureField("Password", text: $passwordSubmitted)
                        .padding()
                        .background(.gray.opacity(0.8))
                        .cornerRadius(12)
                        .font(.headline)
                        .foregroundStyle(.white)
                        .padding()
                        .shadow(radius: 8)
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                }
                
                ZStack{
                    
                    
                    
                    VStack{
                        Spacer()
                        Button {
                            airplane_placement = 145
                            h = 30
                            w = 30
                        } label: {
                            Text("Sign-In")
                        }
                        .frame(width: 330, height: 60)
                        .background(.green)
                        .cornerRadius(12)
                        .foregroundStyle(.black)
                        .fontWeight(.black)
                        .shadow(radius: 10)
                        
                        
                    }.padding(.bottom, 200)
                    
                    VStack{
                        Spacer()
                        Image(systemName: "airplane")
                            .resizable()
                            .frame(width: CGFloat(w), height: CGFloat(h))
                            .animation(.easeIn.speed(0.2), value: h)
                            .animation(.easeIn.speed(0.2), value: w)
                            .animation(.smooth.speed(0.5), value: airplane_placement)
                            //MARK: make airplane bigger and when the button is tapped, make sure that the airplane gets bigger and flies to the end of the sign-in button and then takes you to home page t
                        
                    }.padding(.bottom, 220).offset(x: CGFloat(airplane_placement))
                        .shadow(radius: 10)
                    
                    
                }
                
                
                

                

                

                

                
                
            }
        }
       
        
        .onAppear {
            color1 = .gray
            color2 = .green
        }
    }
}

#Preview {
    ContentView()
}
