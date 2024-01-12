//
//  ClientView.swift
//  DDW
//
//  Created by Ellen Stavrou on 24/11/2023.
//

import SwiftUI

struct ClientView: View {
    
    @ObservedObject var authManager = AuthManager()
    
    @ViewBuilder
    var body: some View {
        
        TabView {
            
            ClientExerciseLibraryView()
                .tabItem {
                    VStack {
                        Image(systemName: "book.fill")
                        Text("Exercise Library")
                    }
                }
            
            MyProgramView()
                .tabItem {
                    VStack {
                        Image(systemName: "figure.run")
                        Text("My Program")
                    }
                }
            
            ProfileView()
                .tabItem {
                    VStack {
                        Image(systemName: "person.circle")
                        Text("Profile")
                    }
                }
        }
        
    }

struct ClientView_Previews: PreviewProvider {
    
    static var previews: some View {
        ClientView()
        
        }

    }
}
