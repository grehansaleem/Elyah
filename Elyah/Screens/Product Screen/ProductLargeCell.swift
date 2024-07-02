//
//  ProductLargeCell.swift
//  Elyah
//
//  Created by Appcrates_Dev on 9/29/20.
//  Copyright © 2020 Appcrates. All rights reserved.
//

import SwiftUI

struct ProductLargeCell: View {
    let name: String
    let image: String
    
    var body: some View {
        ZStack(alignment: .bottom){
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
                    )
                    .frame(width: screenWidth - 60, height: 240)
            )
                .frame(width: screenWidth - 60, height: 240)
                .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))
                .shadow(color: Color.black.opacity(0.9), radius: 10, x: 0, y: 0)
            VStack {
                Text(name)
                    .font(Font.custom(Font.textaAltHeavy, size: 21))
                    .foregroundColor(Color.white)
                Spacer().frame(height: 25)
            }
        }
    }
}

struct ProductLargeCell_Previews: PreviewProvider {
    static var previews: some View {
        ProductLargeCell(name: EBooks[0].name, image: EBooks[0].image)
    }
}
