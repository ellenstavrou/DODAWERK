//
//  CoachView.swift
//  DDW
//
//  Created by Ellen Stavrou on 22/11/2023.
//

import SwiftUI

struct CoachView: View {
    
    @ObservedObject var authManager = AuthManager()
    @StateObject var viewModel = CoachViewModel()
    
    @ViewBuilder
    var body: some View {
        
        TabView {
            
            NavigationView {
                CoachExerciseLibraryView(userId: viewModel.currentUserId)
            }
            .tabItem {
                VStack {
                    Image(systemName: "book.fill")
                    Text("Exercise Library")
                }
            }
            
            ClientLibraryView()
                .tabItem {
                    VStack {
                        Image(systemName: "person.3.fill")
                        Text("Client Programs")
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
}

struct CoachView_Previews: PreviewProvider {
    static var previews: some View {
        CoachView()
            .environmentObject(CoachViewModel())
    }
}
