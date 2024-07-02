//
//  ProductCell.swift
//  Elyah
//
//  Created by Appcrates_Dev on 9/29/20.
//  Copyright © 2020 Appcrates. All rights reserved.
//

import SwiftUI

struct ProductCell: View {
    let name: String
    let image: String

    var body: some View {
        ZStack(alignment: .bottom){
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
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
            HStack {
                Text(name)
                    .font(Font.custom(Font.textaAltBold, size: 20))
                    .foregroundColor(Color.white)
                    .animation(nil)
            }.padding(.bottom, 15)

        }
        .frame(width: screenWidth, alignment: .center)
    }
}

struct ProductCell_Previews: PreviewProvider {
    static var previews: some View {
        ProductCell(name: Featured[0].name, image: Featured[0].image)
    }
}
