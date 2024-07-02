//
//  ProductSmallCell.swift
//  Elyah
//
//  Created by Appcrates_Dev on 9/29/20.
//  Copyright © 2020 Appcrates. All rights reserved.
//

import SwiftUI

struct ProductSmallCell: View {
    let name: String
    let image: String
    var action: () -> Void

    init(name: String, image: String, action: @escaping () -> Void) {
        self.name = name
        self.image = image
        self.action = action
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 98, height: 98, alignment: .center)
                .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))
                .onTapGesture {
                    self.action()
            }

            Text(name)
                .font(Font.custom(Font.textaAltBold, size: 17))
                .foregroundColor(Color.primaryTextColor)
                .lineLimit(1)
                .frame(width: 98)
        }
    }
}

struct ProductSmallCell_Previews: PreviewProvider {
    static var previews: some View {
        ProductSmallCell(name: Comics[0].name, image: Comics[0].image, action: {})
        .previewLayout(.sizeThatFits)
        .background(Color.primaryBackgroundColor)
    }
}
