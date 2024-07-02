//
//  ProductCard.swift
//  Elyah
//
//  Created by Appcrates_Dev on 9/29/20.
//  Copyright © 2020 Appcrates. All rights reserved.
//

import SwiftUI

struct ProductCard: View {
    @ObservedObject var state: AppState
    
    @Environment(\.presentationMode) var presentation
    let selectedProducts: [Product]

    private func cardCloseAnimations() {
        self.state.animateCardOpen = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.state.isShowingProduct = false
        }
    }

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            Spacer().frame(height: isIPhoneX ? 110 : 50)
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [ Color.primaryBackgroundColor, Color.splashColor
                ]), startPoint: .top,
                    endPoint: .bottom)
                    .frame(width: screenWidth)
                
                // MARK: - Main Content
                VStack {
                    /// Products Cover
                    ZStack(alignment: .bottom) {
                        GeometryReader { geometry in
                            Image(self.selectedProducts[2].image)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .overlay(
                                    LinearGradient(
                                        gradient: Gradient(
                                            colors: [
                                                Color.black.opacity(0),
                                                Color.black.opacity(0.4)
                                            ]
                                        ),
                                        startPoint: .top,
                                        endPoint: .bottom
                                    )
                            )
                                .frame(width: geometry.size.width, height: geometry.size.height)
                                .offset(y: geometry.frame(in: .global).minY/9)
                                .clipped()
                        }
                        .frame(height: 195)

                        /// Close Button
                        VStack {
                            Spacer().frame(height: 20)
                            
                            HStack {
                                Spacer()
                                ImageButton(
                                    image: "nav-close",
                                    background: Color.white.opacity(0.1),
                                    blur: true,
                                    action: {
                                    self.cardCloseAnimations()
                                })
                            }
                            .padding(.horizontal, 15)
                            
                            Spacer().frame(height: 30)

                            Text("All Products")
                                .font(Font.custom(Font.textaAltHeavy, size: 30))
                                .foregroundColor(Color.white)
                                .animation(nil)
                            
                            Spacer().frame(height: 45)
                        }
                        .frame(height: 195)
                    }
                    .padding(.bottom, 30)

                    
                    /// All Products
                    VStack (spacing: 3) {
                        ForEach(selectedProducts) { product in
                            ProductCell(
                                name: product.name,
                                image: product.image
                            )
                        }
                    }

                    
                    /// Footer
                    VStack {
                        TextImageButton(
                            title: "elyah@linkedin",
                            image: "linkedin-icon",
                            color: Color.white.opacity(0.1),
                            action: {
                                self.state.openLinkedin()
                        })
                        .padding(.top, 30)

                        TextButton(
                            title: "Close",
                            textColor: Color.white.opacity(0.8),
                            width: 100,
                            height: 40,
                            action: {
                                self.cardCloseAnimations()
                        })
                            .padding(.top, 20)
                    }

                    /// Bottom Spacing
                    Spacer().frame(height: 70)
                }
                .animation(nil)
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}


struct ProductCard_Previews: PreviewProvider {
    static var previews: some View {
        ProductCard(state: AppState(), selectedProducts: AppState().selectedProducts)
    }
}
