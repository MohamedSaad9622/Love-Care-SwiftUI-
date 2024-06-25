//
//  CircleGroupView.swift
//  Love&Care(SwiftUI)
//
//  Created by Mohamed Saad on 20/05/2024.
//

import SwiftUI

struct CircleGroupView: View {
    
    var circleGroupColor: Color = .gray
    @State var isAnimating = false
    
    var body: some View {
        ZStack{
            
            Circle()
                .stroke(circleGroupColor.opacity(0.2), lineWidth: 40)
                .frame(width: 270, height: 270, alignment: .center)
            Circle()
                .stroke(circleGroupColor.opacity(0.2), lineWidth: 80)
                .frame(width: 270, height: 270, alignment: .center)
                
        }//:ZStack
        .scaleEffect(isAnimating ? 1 : 0.5)
        .animation(.easeInOut(duration: 1), value: isAnimating)
        .onAppear(perform: {
            isAnimating.toggle()
        })
    }
}

#Preview {
    CircleGroupView()
}
