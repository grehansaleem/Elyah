//
//  HomeScreen.swift
//  Elyah
//
//  Created by Appcrates_Dev on 9/29/20.
//  Copyright © 2020 Appcrates. All rights reserved.
//

import SwiftUI

struct HomeScreen: View {
    @ObservedObject var state: AppState
    
    @State private var initialAnimation = false
    @State private var pulsate = false
    
    private func cardOpenAnimations() {
        self.state.isShowingProduct = true
        self.state.animateCardOpen = true
    }
    
    private func SettingsOpenAnimations() {
        self.state.isShowingSettings = true
        self.state.animateScreenOpen = true
    }
    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [ Color.primaryBackgroundColor, Color.splashColor
            ]), startPoint: .top,
                endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
                .frame(width: screenWidth, height: screenHeight)
            
            // MARK: - Main Content
            ScrollView(.vertical, showsIndicators: false) {
                Spacer().frame(height: isIPhoneX ? 110 : 90)
                
                VStack {
                    /// Featured Products
                    ForEach(TopFeatured) { product in
                        Button(action: {
                            self.state.selectedProducts = Featured
                            self.cardOpenAnimations()
                        }) {
                            ProductFeaturedView(
                                name: product.name,
                                image: product.image)
                                .padding(.bottom, 20)
                        }
                        .buttonStyle(ButtonBounce())
                    }
                    .opacity(self.initialAnimation ? 1 : 0)
                    .animation(.easeInOut(duration: 0.3))
                    .scaleEffect(self.initialAnimation ? 1 : 0.8)
                    .animation(.interpolatingSpring(mass: 1, stiffness: 100, damping: 16, initialVelocity: 0))
                    
                    
                    
                    /// Ebook Products
                    ProductTextHeader(text: "Ebooks")
                    ScrollView (.horizontal, showsIndicators: false) {
                        HStack(spacing: 0) {
                            ForEach(EBooks) { product in
                                GeometryReader { geometry in
                                    ProductLargeCell(
                                        name: product.name,
                                        image: product.image
                                    )
                                        .rotation3DEffect(Angle(degrees:
                                            Double(geometry.frame(in: .global).minX - 40) / -20
                                        ), axis: (x: 0, y: 10.0, z: 0))
                                }
                                .onTapGesture {
                                    self.state.selectedProducts = EBooks
                                    self.cardOpenAnimations()
                                }
                                .frame(width: screenWidth - 60, height: 240)
                                .padding(.vertical, 18)
                            }
                        }
                        .padding(.horizontal, 20)
                    }
                    .offset(x: self.initialAnimation ? 0 : screenWidth)
                    .animation(.interpolatingSpring(mass: 1, stiffness: 100, damping: 16, initialVelocity: 0))
                    
                    
                    
                    /// Comic Products
                    ProductTextHeader(text: "Comics")
                    ScrollView (.horizontal, showsIndicators: false) {
                        HStack(spacing: 0) {
                            ForEach(Comics) { product in
                                ProductSmallCell(
                                    name: product.name,
                                    image: product.image,
                                    action: {
                                        self.state.selectedProducts = Comics
                                        self.cardOpenAnimations()
                                })
                            }
                            .frame(width: 110, height: 140)
                            .padding(.top, 18)
                        }
                        .padding(.horizontal, 16)
                        .padding(.bottom, 15)
                    }
                    .frame(width: screenWidth)
                    .offset(x: self.initialAnimation ? 0 : screenWidth)
                    .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
                    
                    
                    
                    /// Technology Products
                    Group {
                        ProductTextHeader(text: "Technology")
                        VStack(alignment: .leading) {
                            HStack {
                                ForEach(TechsRowOne) { product in
                                    ProductMediumCell(
                                        name: product.name,
                                        image: product.image
                                    )
                                        .onTapGesture {
                                            self.state.selectedProducts = Techs
                                            self.cardOpenAnimations()
                                    }
                                }
                            }
                            
                            HStack {
                                ForEach(TechsRowTwo) { product in
                                    ProductMediumCell(
                                        name: product.name,
                                        image: product.image
                                    )
                                        .onTapGesture {
                                            self.state.selectedProducts = Techs
                                            self.cardOpenAnimations()
                                    }
                                }
                            }
                            
                            HStack {
                                ForEach(TechsRowThree) { product in
                                    ProductMediumCell(
                                        name: product.name,
                                        image: product.image
                                    )
                                        .onTapGesture {
                                            self.state.selectedProducts = Techs
                                            self.cardOpenAnimations()
                                    }
                                }
                            }
                        }
                    }
                    .padding(.bottom, 20)
                    .opacity(self.initialAnimation ? 1 : 0)
                    .animation(.easeInOut(duration: 0.4))
                    
                    
                    
                    /// Miscellaneous Products
                    ProductTextHeader(text: "Miscellaneous")
                    ScrollView (.horizontal, showsIndicators: false) {
                        HStack(spacing: 0) {
                            ForEach(Miscellaneous) { product in
                                GeometryReader { geometry in
                                    ProductLargeCell(
                                        name: product.name,
                                        image: product.image
                                    )
                                        .rotation3DEffect(Angle(degrees:
                                            Double(geometry.frame(in: .global).minX - 40) / -20
                                        ), axis: (x: 0, y: 10.0, z: 0))
                                }
                                .onTapGesture {
                                    self.state.selectedProducts = Miscellaneous
                                    self.cardOpenAnimations()
                                }
                                .frame(width: screenWidth - 60, height: 240)
                                .padding(.vertical, 18)
                            }
                        }.padding([.leading, .bottom, .trailing], 25)
                    }
                    
                    
                    
                    /// Footer
                    HomeFooter(state: state)
                    
                    /// Bottom Spacing
                    Spacer().frame(width: 0, height: 50)
                }
            }
            
            
            
            // MARK: - Nav
            VStack {
                Spacer().frame(height: 50)
                Image("nav-logo")
                    .shadow(color: Color.black, radius: 20, x: 0, y: 0)
                    .opacity(self.initialAnimation ? 1 : 0)
                    .animation(.easeInOut(duration: 0.3))
                    .scaleEffect(self.initialAnimation ? 1 : 0.8)
                    .animation(.interpolatingSpring(mass: 1, stiffness: 100, damping: 16, initialVelocity: 0))
                Spacer()
            }
            
            /// Settings Button
            VStack {
                Spacer().frame(height: 45)
                HStack {
                    Spacer()
                    ImageButton(image: "notification-icon", width: 50, height: 50, corner: 25, background: Color.clear, blur: true, action: {
                        self.SettingsOpenAnimations()
                    })
                        .scaleEffect(self.pulsate ? 1 : 0.9)
                        .animation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true).speed(1.5))
                        .shadow(color: Color.black.opacity(0.4), radius: 20, x: 0, y: 0)
                        .onAppear() {
                            self.pulsate.toggle()
                    }
                }
                .padding(.horizontal, 20)

                Spacer()
            }
            
            
            
            // MARK: - Products card
            if self.state.isShowingProduct {
                ProductCard(state: state, selectedProducts: self.state.selectedProducts)
                    .offset(y: state.animateCardOpen ? 0 : screenHeight)
                    .animation(.interpolatingSpring(mass: 1, stiffness: 100, damping: 16, initialVelocity: 0))
                    .transition(.move(edge: .bottom))
            }
            
            
            
            // MARK: - Settings Screen
            if self.state.isShowingSettings {
                SettingsScreen(state: state)
                    .offset(x: state.animateScreenOpen ? 0 : screenWidth)
                    .animation(.interpolatingSpring(mass: 1, stiffness: 100, damping: 16, initialVelocity: 0))
                    .transition(.move(edge: .trailing))
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.0) {
                self.initialAnimation = true
            }
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen(state: AppState())
    }
}
