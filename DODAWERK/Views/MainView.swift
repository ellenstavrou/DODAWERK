//
//  MainView.swift
//  DODAWERK
//
//  Created by Ellen Stavrou on 20/11/2023.
//

import SwiftUI
import FirebaseAuth

struct MainView: View {
    
    @StateObject private var authManager = AuthManager()
    
    var body: some View {
        
        NavigationView {
            Group {
                if let user = authManager.user {
                    determineNextView(user: user)
                } else {
                    LoginView()
                }
            }
        }
        .onAppear {
            authManager.addStateListener()
        }
    }
    
    private func determineNextView(user: User) -> some View {
        if authManager.isCoach() {
            return AnyView(CoachView())
        } else {
            return AnyView(ClientView())
        }
    }
    
}
