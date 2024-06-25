//
//  ContentView.swift
//  Love&Care(SwiftUI)
//
//  Created by Mohamed Saad on 15/05/2024.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("isOnboarding") var isOnboarding : Bool = true
    
    var body: some View {
        VStack {
            
            if isOnboarding {
                Onboarding()
            }else{
                Home()
            }
            
        }
        .safeAreaPadding()
    }
}

#Preview {
    ContentView()
}
