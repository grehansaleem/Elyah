//
//  SettingsScreen.swift
//  Elyah
//
//  Created by Appcrates_Dev on 9/30/20.
//  Copyright © 2020 Appcrates. All rights reserved.
//

import SwiftUI

struct SettingsScreen: View {
    @ObservedObject var state: AppState
    
    @State var isNotificationAllowed = true
    
    private func SettingsCloseAnimations() {
        self.state.animateScreenOpen = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.state.isShowingSettings = false
        }
    }
    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [ Color.primaryBackgroundColor, Color.splashColor
            ]), startPoint: .top,
                endPoint: .bottom)
                .frame(width: screenWidth)
            
            // MARK: - Main Content
            ScrollView (showsIndicators: false) {
                Spacer().frame(height: isIPhoneX ? 95 : 55)
                HStack {
                    Text("Settings")
                        .font(Font.custom(Font.textaAltHeavy, size: 34))
                        .foregroundColor(Color.whiteTextColor)
                        .padding(.bottom, 5)
                    Spacer()
                }
                .padding(.leading, 20)
                
                
                VStack (spacing: 10) {
                    Group {
                        ZStack {
                            TextImageButton(
                                title: "Allow notifications",
                                color: Color.white.opacity(0.1), action: {}
                            )
                            
                            
                            /// Toggle Button
                            HStack {
                                Spacer()
                                Button(action: {
                                    UIImpactFeedbackGenerator(style: .soft).impactOccurred()
                                    self.isNotificationAllowed.toggle()
                                    DispatchQueue.global(qos: .background).async {
                                        self.subscribeToNotifications()
                                    }
                                }) {
                                    ZStack {
                                        Rectangle()
                                            .frame(width: 50, height: 22)
                                            .foregroundColor(Color.white.opacity(0.8))
                                            .animation(.easeInOut(duration: 0.3))
                                            .cornerRadius(20)
                                        
                                        Circle()
                                            .frame(width: 25, height: 25)
                                            .foregroundColor(Color.white)
                                            .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 2)
                                            .offset(x: self.isNotificationAllowed ? 12 : -12)
                                            .animation(.interpolatingSpring(mass: 1, stiffness: 100, damping: 16, initialVelocity: 0))
                                        
                                        Circle()
                                        .frame(width: 22, height: 22)
                                        .foregroundColor(self.isNotificationAllowed ? Color.splashColor : Color.white)
                                        .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 2)
                                        .offset(x: self.isNotificationAllowed ? 12 : -12)
                                        .animation(.interpolatingSpring(mass: 1, stiffness: 100, damping: 16, initialVelocity: 0))
                                    }
                                }
                                .buttonStyle(ButtonBounce())
                                Spacer().frame(width: 35)
                            }
                        }
                        
                        TextImageButton(
                            title: "Create account",
                            color: Color.white.opacity(0.1),
                            action: { self.state.openAccount() }
                        )
                    }
                    
                    
                    Group {
                        SettingsTextHeader(text: "Be Social")
                        
                        TextImageButton(
                            title: "Direct message",
                            color: Color.white.opacity(0.1),
                            action: { self.state.openLinkedin() }
                        )
                        TextImageButton(
                            title: "Follow us on LinkedIn",
                            color: Color.white.opacity(0.1),
                            action: { self.state.openLinkedin() }
                        )
                    }
                    
                    
                    Group {
                        SettingsTextHeader(text: "More")
                        
                        TextImageButton(
                            title: "About us",
                            color: Color.white.opacity(0.1),
                            action: { self.state.openWeb() }
                        )
                        TextImageButton(
                            title: "Privacy policy",
                            color: Color.white.opacity(0.1),
                            action: { self.state.openPrivacyPolicy() }
                        )
                        TextImageButton(
                            title: "Terms of use",
                            color: Color.white.opacity(0.1),
                            action: { self.state.openTerms() }
                        )
                    }
                    
                    
                    /// Footer
                    VStack {
                        Image("nav-logo")
                            .renderingMode(.template)
                            .foregroundColor(Color.primaryTextColor.opacity(0.3))
                        Text("v1.0")
                            .modifier(TextModifier(size: 18, font: Font.textaAltBlack, color: Color.primaryTextColor))
                        
                    }
                    .padding(.top, 40)
                    
                    Spacer().frame(height: 140)
                }
            }
            
            
            /// Close Button
            VStack {
                Spacer().frame(height: 45)
                HStack {
                    Spacer()
                    ImageButton(
                        image: "nav-close",
                        background: Color.white.opacity(0.1),
                        blur: true,
                        action: {
                        self.SettingsCloseAnimations()
                    })
                }
                .padding(.horizontal, 20)
                Spacer()
            }
        }
    }
    
    // MARK: - API Call
    func subscribeToNotifications() {
        let json = ["user_email": "test123@gmail.com"]
        ElyahAPI.subscribe(json: json) { response in
            switch response {
            case .success(let response):
                print(response.message)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

struct SettingsScreen_Previews: PreviewProvider {
    static var previews: some View {
        SettingsScreen(state: AppState())
    }
}
