//
//  SettingsTextHeader.swift
//  Elyah
//
//  Created by Appcrates_Dev on 9/30/20.
//  Copyright © 2020 Appcrates. All rights reserved.
//

import SwiftUI

struct SettingsTextHeader: View {
    let text: String
    
    init(text: String) {
        self.text = text
    }
    var body: some View {
        HStack {
            Text(text)
                .modifier(TextModifier(color: Color.primaryTextColor.opacity(0.6)))
                .padding(.leading, 25)
            Spacer()
        }
        .frame(width: screenWidth - 30)
        .padding(.top, 30)
        .padding(.bottom, 5)
    }
}
