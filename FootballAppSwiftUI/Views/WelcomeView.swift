//
//  ContentView.swift
//  FootballAppSwiftUI
//
//  Created by piotr koscielny on 12/5/25.
//

import SwiftUI

struct WelcomeView: View {
    
    @AppStorage(AppStorageKeysHelper.firstLaunch) private var firstLaunch = false
    private let welcomeText = NSLocalizedString("WelcomeView_Text", comment: "welcome text")
    private let buttonLabel = NSLocalizedString("WelcomeView_buttonLabel", comment: "button label")
    
    var body: some View {
        ZStack {
            Image("welcomeImage")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack {
                Text(welcomeText)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .padding(.top, 40)
                    .padding(.horizontal, 15)
                
                Spacer()
                
                Button {
                    firstLaunch = true
                } label: {
                    Text(buttonLabel)
                        .accessibilityIdentifier("welcomeView_button")
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
