//
//  ProfileView.swift
//  DODAWERK
//
//  Created by Ellen Stavrou on 18/11/2023.
//

import SwiftUI

struct ProfileView: View {
    
    @ObservedObject var authManager = AuthManager()
    
    var body: some View {
        VStack {
            Text("Welcome!")
            
            Button {
                authManager.signOut()
            } label: {
                Text("Sign out")
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
