//
//  ContentView.swift
//  FootballAppSwiftUI
//
//  Created by piotr koscielny on 12/5/25.
//

import SwiftUI

struct WelcomeView: View {
    
    @AppStorage(AppStorageKeysHelper.firstLaunch) private var firstLaunch = false
    
    var body: some View {
        ZStack {
            Image("welcomeImage")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack {
                Text("Welcome to Football App")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .padding(.top, 40)
                    .padding(.horizontal, 15)
                
                Spacer()
                
                Button {
                    firstLaunch = true
                } label: {
                    Text("Start")
                        .font(.title)
                        .fontWeight(.heavy)
                        .frame(maxWidth: .infinity)
                        .frame(height: 40)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        .padding(.horizontal, 24)
                    
                }
                .padding(.bottom, 40)
            }
        }
    }
}

#Preview {
    WelcomeView()
}
