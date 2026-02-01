//
//  OnboardingView.swift
//  finalProject
//
//  Created by Kev on 1/16/26.
//

import SwiftUI


struct startView: View{
    @StateObject var audio_manager = audioManager()
    
//    @AppStorage("completeOB") var completeOB = false
//    @AppStorage("isSignedIn") var isSignedIn = false
    
    //MARK: in the future we can add a deep learning framework so people can upload image from camera 

    
    
    var body: some View{
        ZStack{
            MeshGradient(width: 2, height: 3, points: [
                [0.0, 0.0], [1.0, 0.0],
                [0.0, 0.5], [1.0,0.5],
                [0.0, 1.0], [1.0, 1.0]], colors: [.green, .gray, .black, .gray, .gray, .green]).ignoresSafeArea()
            
        
                TabView {
                    OnboardingView()
                    moneyOnboardingView()
                    youReadyView()
                }.tabViewStyle(.page)
            }
//            else if !isSignedIn{
//                ContentView()
//            }
//            else{
//                FormView()
//            }
        }
        
    }


struct OnboardingView: View {
    
    @State var carPlacement: Int = 0
    @State var message: String = ""
    
    @StateObject var audio_Manager = audioManager()

    var body: some View {
        ZStack{
            MeshGradient(width: 2, height: 3, points: [
                [0.0, 0.0], [1.0, 0.0],
                [0.0, 0.5], [1.0,0.5],
                [0.0, 1.0], [1.0, 1.0]], colors: [.green, .gray, .black, .gray, .gray, .green]).ignoresSafeArea()
              
            VStack{
                Spacer()
                Image("carOB").resizable().frame(width: 300, height: 225).offset(x: CGFloat(carPlacement)).animation(.smooth().speed(0.3).repeatForever(autoreverses: true), value: carPlacement)
                    .shadow(radius: 12)
            }.padding(.bottom, 190)
            
            VStack{
                Text(message)
                        .font(.title)
                       .fontWeight(.semibold)
                       .foregroundColor(.white)
                       .tracking(1.2)
                       .multilineTextAlignment(.center)
                       .padding(.top, 40)
                       .padding(.horizontal)
                       .shadow(radius: 12)
                       .animation(.bouncy.speed(0.3), value: message)
                Spacer()
                       
                    
            }.padding(.top, 157)
            
                
            
            
        }.onAppear(){
            carPlacement += 329
            message = "Welcome to Codey Car Predictor"
            audio_Manager.playMusic(named: "song_for_app")
        }
    }
}

#Preview {
    startView()
}

struct moneyOnboardingView: View {
    
    @State var message1: String = ""
    @State var message2: String = ""
    
    @State var shadowAmount: Int = 0
    var body: some View {
        ZStack{
            MeshGradient(width: 2, height: 3, points: [
                [0.0, 0.0], [1.0, 0.0],
                [0.0, 0.5], [1.0,0.5],
                [0.0, 1.0], [1.0, 1.0]], colors: [.green, .gray, .black, .gray, .gray, .green]).ignoresSafeArea()
            
            
            VStack{
                Spacer()
                Image("moneyOB").resizable().frame(width: 550, height: 300).shadow(color: .green, radius: CGFloat(shadowAmount)).animation(.smooth.speed(0.62).repeatForever(autoreverses: true), value: shadowAmount)
            }.padding(.bottom, 200)
            
            VStack{
                Spacer()
                Text(message1)
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .tracking(1.2)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                        .shadow(radius: 12)
                        .animation(.bouncy.speed(0.4), value: message1)
                Text(message2)
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .tracking(1.2)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                        .shadow(radius: 12)
                        .animation(.bouncy.speed(0.4), value: message2)
            }.padding(.bottom, 500)
            
            
            
            
                .onAppear(){
                    message1 = "Check to see"
                    message2 = "What your car cashes for"
                    shadowAmount += 100
                }
            
        }
    }
}

struct youReadyView: View {
    @State var message1: String = ""
    @State var message2: String = ""
    @State var isPressed = false
    @State var showSignIn = false
//    @AppStorage("completeOB") var completeOB = false

    
    var body: some View {
        ZStack{
            MeshGradient(width: 2, height: 3, points: [
                [0.0, 0.0], [1.0, 0.0],
                [0.0, 0.5], [1.0,0.5],
                [0.0, 1.0], [1.0, 1.0]], colors: [.green, .gray, .black, .gray, .gray, .green]).ignoresSafeArea()
            
            VStack{
                Image("handOB").resizable().frame(width: 500, height: 450).shadow(radius: 12)
            }
            
            VStack{
                Text(message1)
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .tracking(1.2)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    .shadow(radius: 12)
                    .animation(.bouncy.speed(0.2), value: message1)

                Text(message2)
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .tracking(1.2)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    .shadow(radius: 12)
                    .animation(.bouncy.speed(0.2), value: message2)
                Spacer()
            }.padding(.top, 185)
            
            VStack(spacing: 78){
                
                Spacer()
                
                ZStack{
                    Circle()
                        .frame(width: 180, height: 80)
                        .foregroundStyle(.black)
                        .offset(y: 5)
                    Button {
                        isPressed = true
//                        completeOB = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.37) {
                            isPressed = false
                            showSignIn = true
                            
                            
                        }
                        
                    } label: {
                        Image(systemName: "arrowshape.forward.fill").resizable().frame(width: 35, height: 35)
                        
                    }.frame(width: 180, height: 80)
                        .background(.black)
                        .foregroundStyle(.white)
                        .fontWeight(.bold)
                        .clipShape(.circle)
                        .shadow(radius: 12)
                        .offset(y: isPressed ? 0 : -5)
                        .animation(.easeInOut(duration: 0.37), value: isPressed)
                        .fullScreenCover(isPresented: $showSignIn) {
                            ContentView()
                        }
                    
                    
                    
                }.padding(.bottom, 63)
            }
            
            
            .onAppear(){
                message1 = "What are you waiting for?"
                message2 = "Press that button!"
                
            }
        }
        
    }
}
