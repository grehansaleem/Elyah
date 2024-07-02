//
//  ProductFeaturedView.swift
//  Elyah
//
//  Created by Appcrates_Dev on 9/29/20.
//  Copyright © 2020 Appcrates. All rights reserved.
//

import SwiftUI

struct ProductFeaturedView: View {
    let name: String
    let image: String

    var body: some View {
        ZStack(alignment: .topLeading) {
            ZStack {
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .overlay(
                        Rectangle()
                            .foregroundColor(Color.black.opacity(0.3))
                )
                    .frame(width: screenWidth - 30, height: 126, alignment: .center)
                    .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))
                    .shadow(color: Color.black.opacity(0.4), radius: 10, x: 0, y: 0)
                Text(name)
                    .font(Font.custom(Font.textaAltHeavy, size: 22))
                    .foregroundColor(Color.white)
            }

            ZStack {
                BackgroundBlurView(style: .light)
                    .frame(width: 85, height: 30, alignment: .center)
                    .background(Color.black.opacity(0.6))
                    .cornerRadius(10)
                Text("Featured")
                    .font(Font.custom(Font.textaAltHeavy, size: 15))
                    .tracking(2)
                    .foregroundColor(Color.white)
            }.padding([.leading, .top], 12)
        }
    }
}

struct ProductFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        ProductFeaturedView(name: Featured[0].name, image: Featured[0].image)
    }
}
