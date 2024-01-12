//
//  RegisterView.swift
//  DDW
//
//  Created by Ellen Stavrou on 20/11/2023.
//

import SwiftUI

struct RegisterView: View {
    
    @StateObject var viewModel = RegisterViewModel()
    @StateObject var authManager = AuthManager()
    @State private var navigateToMainView = false
    
    var body: some View {
        
        NavigationView {
            ZStack {
                Rectangle()
                    .background(content: {
                        Image("boys")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    })
                    .foregroundColor(.clear)
                
                Rectangle()
                    .foregroundColor(.black)
                    .opacity(0.5)
                
                VStack {
                    Text("CREATE ACCOUNT")
                        .foregroundColor(.white)
                        .bold()
                        .font(.largeTitle)
                    
                    Text("Get to werk")
                        .foregroundColor(.white)
                        .font(.callout)
                        .padding(.bottom)
                    
                    TextField("", text: $viewModel.name, prompt: Text("Name").foregroundColor(.black.opacity(0.7)))
                        .disableAutocorrection(true)
                        .padding(.leading, 5)
                        .foregroundColor(.white)
                        .background(
                            RoundedRectangle(cornerRadius: 5).fill(Color.white.opacity(0.3)))
                    
                    TextField("", text: $viewModel.email, prompt: Text("Email").foregroundColor(.black.opacity(0.7)))
                        .disableAutocorrection(true)
                        .padding(.leading, 5)
                        .foregroundColor(.white)
                        .background(
                            RoundedRectangle(cornerRadius: 5).fill(Color.white.opacity(0.3)))
                    
                    SecureField("", text: $viewModel.password, prompt: Text("Password").foregroundColor(.black.opacity(0.7)))
                        .foregroundColor(.white)
                        .disableAutocorrection(true)
                        .padding(.leading, 5)
                        .background(
                            RoundedRectangle(cornerRadius: 5).fill(Color.white.opacity(0.3)))
                    
                    Button {
                        viewModel.registerAndLogin(authManager: authManager) { success in
                            if success {
                                navigateToMainView = true
                            } else {
                                print("Registration failed")
                            }
                        }
                        
                    } label: {
                        Text("Create account")
                    }
                    .padding(.top)
                    NavigationLink(destination: MainView(), isActive: $navigateToMainView, label: {EmptyView()}).hidden()
                }
                .padding()
                
            }
            .ignoresSafeArea()
            
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
