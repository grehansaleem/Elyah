//
//  NavigationScreen.swift
//  Elyah
//
//  Created by Appcrates_Dev on 9/29/20.
//  Copyright © 2020 Appcrates. All rights reserved.
//

import SwiftUI

struct NavigationScreen: View {
    @ObservedObject var state: AppState
    
    var body: some View {
        HomeScreen(state: state)
    }
}
