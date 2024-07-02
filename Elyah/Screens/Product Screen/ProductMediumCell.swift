//
//  ProductMediumCell.swift
//  Elyah
//
//  Created by Appcrates_Dev on 9/29/20.
//  Copyright © 2020 Appcrates. All rights reserved.
//

import SwiftUI

struct ProductMediumCell: View {
    let name: String
    let image: String

    init(name: String, image: String) {
        self.name = name
        self.image = image
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Image(image)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .overlay(
                    LinearGradient(
                        gradient: Gradient(
                            colors: [
                                Color.black.opacity(0),
                                Color.black.opacity(0),
                                Color.black.opacity(0.4)
                            ]
                        ),
                        startPoint: .top,
                        endPoint: .bottom
                    ).frame(width: screenWidth/2 - 25, height: screenWidth/2 - 25, alignment: .center)
                        .cornerRadius(22))
                .frame(width: screenWidth/2 - 25, height: screenWidth/2 - 25, alignment: .center)
            
            VStack {
                Text(name)
                    .font(Font.custom(Font.textaAltHeavy, size: 18))
                    .foregroundColor(Color.white)
            }.frame(height: 40, alignment: .top)
        }
        .frame(width: screenWidth/2 - 25, height: screenWidth/2 - 25, alignment: .center)
        .cornerRadius(22)
    }
}

struct ProductMediumCell_Previews: PreviewProvider {
    static var previews: some View {
        ProductMediumCell(name: Techs[0].name, image: Techs[0].image)
    }
}
