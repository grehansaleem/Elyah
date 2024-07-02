//
//  AppState.swift
//  Elyah
//
//  Created by Appcrates_Dev on 9/29/20.
//  Copyright © 2020 Appcrates. All rights reserved.
//

import SwiftUI
import Combine

final class AppState: ObservableObject {
    
    @Published var selectedProducts: [Product] = []
    
    @Published var isShowingSettings = false
    @Published var isShowingProduct = false
    
    @Published var animateCardOpen = false
    @Published var animateScreenOpen = false
    
    func openLinkedin() {
        let linkedin = URL(string: "https://www.linkedin.com/company/elyah")!
        navigateToBrowser(pageURL: linkedin)
    }
    
    func openWeb() {
        let webPage = URL(string: "https://www.elyah.io")!
        navigateToBrowser(pageURL: webPage)
    }
    
    func openAccount() {
        let accountPage = URL(string: "https://www.elyah.io/users/sign_up")!
        navigateToBrowser(pageURL: accountPage)
    }
    
    func openTerms() {
        let termsPage = URL(string: "https://www.elyah.io/terms")!
        navigateToBrowser(pageURL: termsPage)
    }
    
    func openPrivacyPolicy() {
        let policyPage = URL(string: "https://www.elyah.io/privacy")!
        navigateToBrowser(pageURL: policyPage)
    }
    
    func navigateToBrowser(pageURL: URL) {
        if UIApplication.shared.canOpenURL(pageURL) {
            UIApplication.shared.open(pageURL , options: [:], completionHandler: nil)
        }
    }
}
