//
//  ProductTextHeader.swift
//  Elyah
//
//  Created by Appcrates_Dev on 9/29/20.
//  Copyright © 2020 Appcrates. All rights reserved.
//

import SwiftUI

struct ProductTextHeader: View {
    var text: String
    
    var body: some View {
        HStack {
            Text(text)
                .modifier(TextModifier(size: 22))
            Spacer()
        }
        .padding(.leading, 20)
        .padding(.top, 10)
    }
}

struct ProductTextHeader_Previews: PreviewProvider {
    static var previews: some View {
        ProductTextHeader(text: "Featured")
    }
}
