//
//  Home.swift
//  Love&Care(SwiftUI)
//
//  Created by Mohamed Saad on 20/05/2024.
//

import SwiftUI

struct Home: View {
    
    @AppStorage("isOnboarding") var isOnboarding: Bool = false
    @State var isAnimating = false
    let feedback = UINotificationFeedbackGenerator()
    
    var body: some View {
        
        VStack {
            Spacer()
            //MARK: - Header
            ZStack{
                CircleGroupView(circleGroupColor: .gray)
                Image("baby-boy")
                    .resizable()
                    .scaledToFit()
                    .offset(y: isAnimating ? 30 : -30)
                    .animation(.easeInOut(duration: 1).repeatForever(), value: isAnimating)
                    
            }//ZStack
              
            //MARK: - Center
            
            Text("Having Children just puts the whole world in perspective. Every Thing else just disappears. ")
                .multilineTextAlignment(.center)
                .font(.title3)
                .foregroundStyle(.gray)
            
            Spacer()
            
            //MARK: - Footer
            
            Button(action: {
                isOnboarding.toggle()
                playSound(soundFile: "success", soundType: "m4a")
                feedback.notificationOccurred(.success)
            }, label: {
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    .imageScale(.large)
                Text("Restart")
                    .font(.system(size: 25, design: .rounded))
                    .fontWeight(.bold)
            })
            .buttonStyle( .borderedProminent )
            .buttonBorderShape(.capsule)
            
            Spacer()
            
        }//VStack end
        .padding(.horizontal, 20)
        .onAppear(){
            isAnimating.toggle()
        }
        
    }
}

#Preview {
    Home()
}
