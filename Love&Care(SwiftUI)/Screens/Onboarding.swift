//
//  Onboarding.swift
//  Love&Care(SwiftUI)
//
//  Created by Mohamed Saad on 20/05/2024.
//

import SwiftUI

struct Onboarding: View {
    
    @AppStorage("isOnboarding") var isOnboarding : Bool = true
    @State var isAnimating = false
    @State var offsetValue = CGSize()
    @State var buttonOffset = CGSize()
    @State var buttonWidth = UIScreen.main.bounds.width - 80
    let feedback = UINotificationFeedbackGenerator()
    
    var body: some View {
        
        ZStack{
            Color("ColorBlue")
                .ignoresSafeArea(.all)
            
            VStack{
                //MARK: - Header
                VStack{
                    Text(buttonOffset.width > 0 ? "Love" : "Care.")
                        .font(.system(size: 60))
                        .fontWeight(.heavy)
                        .foregroundStyle(.white)
                    
                    Text("Life doesn't come with a manua, it comes with mother.")
                        .font(.title3)
                        .fontWeight(.light)
                        .foregroundStyle(.white)
                        .padding(.horizontal, 10)
                        .multilineTextAlignment(.center)
                    
                }//:Vstack
                .offset(y: isAnimating ? 0 : -100)
                .animation(.easeInOut(duration: 1), value: isAnimating)
                
                Spacer()
                
                //MARK: - Center
                ZStack{
                    CircleGroupView(circleGroupColor: .white)
                        .offset(x: -offsetValue.width)
                        .blur(radius: abs(offsetValue.width)/5, opaque: false)
                    Image("happy-pregnant")
                        .resizable()
                        .scaledToFit()
                        .offset(x: offsetValue.width)
                        .rotationEffect(.degrees(offsetValue.width / 15))
                        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.5), radius: 8, x: 3, y: 30)
                        .scaleEffect(isAnimating ? 1 : 0.3)
                        .animation(.easeOut(duration: 1), value: isAnimating)
                        .overlay(alignment: .bottom) {
                            Image(systemName: "arrow.left.and.right.circle")
                                .font(.system(size: 40, weight: .ultraLight, design: .rounded))
                                .foregroundStyle(.white)
                                .opacity(offsetValue == .zero ? 1 : 0)
                        }//:overlay
                        .frame(width: 300, alignment: .center)
                }//:ZStack
                .gesture( DragGesture()
                    .onChanged({ gesture in
                        if gesture.translation.width <= 150 && gesture.translation.width >= -150 {
                            offsetValue = gesture.translation
                        }
                    })
                    .onEnded({ _ in
                        withAnimation(.easeOut(duration: 0.5)){
                            offsetValue = .zero
                        }
                        
                    })
                )
                
                Spacer()
                
                //MARK: - Footer
                
                ZStack{
                //background
                    Capsule()
                        .fill(.white.opacity(0.2))
                    Capsule()
                        .fill(.white.opacity(0.2))
                        .padding(8)
                    
                //Text
                    Text("Start")
                            .font(.system(size: 30, design: .rounded))
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                    
                // capsule dynamic
                    
                    HStack{
                        Capsule()
                            .fill(Color("ColorRed"))
                            .frame(width: 80 + buttonOffset.width)
                        Spacer()
                    }
                    
                //Dragable Circle
                
                    HStack{
                        ZStack{
                            Circle()
                                .fill(Color("ColorRed"))
                            Circle()
                                .fill(.black.opacity(0.2))
                                .padding(8)
                            
                            Image(systemName: "chevron.right.2")
                                .font(.system(size: 24, weight: .bold, design: .rounded))
                                .foregroundStyle(.white)
                        }//Zstack (end of dragable circle)
                        Spacer()
                    }//Hstack (end of dragable circle)
                    .offset(x: abs(buttonOffset.width))
                    .gesture(DragGesture()
                        .onChanged({ gesture in
                            if abs(gesture.translation.width) < buttonWidth {
                                buttonOffset = gesture.translation
                            }
                        })
                        .onEnded({ gesture in
                            withAnimation(.linear) {
                                if buttonOffset.width >= (buttonWidth / 2) {
                                    isOnboarding = false
                                    playSound(soundFile: "chimeup", soundType: "mp3")
                                    feedback.notificationOccurred(.success)
                                }else{
                                    buttonOffset = .zero
                                    feedback.notificationOccurred(.error)
                                }
                            }
                        })
                    )
                    
                    
                    
                }//:ZStack
                .frame(height: 80, alignment: .center)
                .padding(.horizontal, 40)
                .offset(y: isAnimating ? 0 : 100)
                .animation(.easeIn(duration: 1), value: isAnimating)
                
            }//:Vstack
            
        }//:ZStack
        
        .onAppear(){
            isAnimating.toggle()
        }
        
    }
}

#Preview {
    Onboarding()
}
