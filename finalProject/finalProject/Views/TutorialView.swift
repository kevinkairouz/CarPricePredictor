//
//  TutorialView.swift
//  finalProject
//
//  Created by Kev on 2/1/26.
//

import SwiftUI
import AVKit
import AVFoundation

struct TutorialView: View {
    var body: some View {
        NavigationStack{
            
            ZStack{
                MeshGradient(width: 2, height: 3, points: [
                    [0.0, 0.0], [1.0, 0.0],
                    [0.0, 0.5], [1.0,0.5],
                    [0.0, 1.0], [1.0, 1.0]], colors: [.green, .gray, .black, .gray, .gray, .green]).ignoresSafeArea()
                
                
                
                VStack{
                    Text("Need Help?")
                    Text("Watch a Video!")
                    Spacer()
                }
                .fontWidth(.expanded)
                .font(.largeTitle)
                .foregroundStyle(.white)
                .padding(.top, 100)
                
                
                
                VStack(spacing: 40){
                    NavigationLink {
                        DemoView1()
                        
                    } label: {
                        HStack{
                            Image(systemName: "checkmark.square")
                            Text("Logging In")
                        }
                        .foregroundStyle(.white)
                        .frame(width: 350, height: 90)
                        .background(.black)
                        .cornerRadius(12)
                        .shadow(radius: 12)
                    }
                    
                    NavigationLink {
                        DemoView2()
                        
                    } label: {
                        HStack{
                            Image(systemName: "keyboard.fill")
                            Text("How to make Predicitions")
                        }
                        .foregroundStyle(.white)
                        .frame(width: 350, height: 90)
                        .background(.gray.opacity(0.7))
                        .cornerRadius(12)
                        .shadow(radius: 12)
                    }

                }
            }
            
          
            
            
            
            
            
        }
    }
}

#Preview {
    TutorialView()
}


struct DemoView1: View{
    @StateObject var vm = videoManager()
    
    var body: some View{
        
        ZStack{
            MeshGradient(width: 2, height: 3, points: [
                [0.0, 0.0], [1.0, 0.0],
                [0.0, 0.5], [1.0,0.5],
                [0.0, 1.0], [1.0, 1.0]], colors: [.green, .gray, .black, .gray, .gray, .green]).ignoresSafeArea()
            
            
            
            VStack{
                VideoPlayer(player: vm.videoPlayer)
                    .frame(width: 410, height: 410)
            }
        }
         
    }
}


struct DemoView2: View {
    @StateObject var vm2 = videoManager()
    var body: some View {
        ZStack{
            MeshGradient(width: 2, height: 3, points: [
                [0.0, 0.0], [1.0, 0.0],
                [0.0, 0.5], [1.0,0.5],
                [0.0, 1.0], [1.0, 1.0]], colors: [.green, .gray, .black, .gray, .gray, .green]).ignoresSafeArea()
            
            
            
            VStack{
                VideoPlayer(player: vm2.videoPlayer2)
                    .frame(width: 410, height: 410)
            }
        }
        
    }
}
