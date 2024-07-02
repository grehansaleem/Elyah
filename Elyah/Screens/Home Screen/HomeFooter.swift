//
//  HomeFooter.swift
//  Elyah
//
//  Created by Appcrates_Dev on 9/29/20.
//  Copyright © 2020 Appcrates. All rights reserved.
//

import SwiftUI

struct HomeFooter: View {
    
    @ObservedObject var state: AppState

    var body: some View {
        VStack(alignment: .center, spacing: 20) {

            Color.primaryTextColor.opacity(0.4)
                .frame(width: screenWidth - 50, height: 1, alignment: .center)
                .padding(.vertical, 20)

            TextImageButton(
                title: "elyah@linkedin",
                image: "linkedin-icon",
                color: Color.white.opacity(0.1),
                action: {
                    self.state.openLinkedin()
            })

            Text("Follow us on LinkedIn to get quantum updates")
                .modifier(TextModifier(size: 17, color: Color.primaryTextColor))
                .frame(width: 260, alignment: .center)
                .multilineTextAlignment(.center)
                .lineSpacing(3)
                .lineLimit(2)
        }
    }
}

struct HomeFooter_Previews: PreviewProvider {
    static var previews: some View {
        HomeFooter(state: AppState())
    }
}
