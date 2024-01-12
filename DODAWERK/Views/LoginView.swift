//
//  LoginView.swift
//  DODAWERK
//
//  Created by Ellen Stavrou on 18/11/2023.
//

import SwiftUI

struct LoginView: View {

    @StateObject var authManager = AuthManager()
    
    var body: some View {
        
        GeometryReader { geometry in
            NavigationView {
                ZStack {
                    Rectangle()
                        .background(content: {
                            Image("coaching")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                        })
                        .foregroundColor(.clear)
                    
                    Rectangle()
                        .foregroundColor(.black)
                        .opacity(0.5)
                    
                    VStack {
                        Text("DO DA WERK")
                            .bold()
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .padding(.top, 170)
                        
                        Text("Ready?")
                            .foregroundColor(.white)
                            .font(.callout)
                            .padding(.bottom, 300)
                        
                        TextField("", text: $authManager.email, prompt: Text("Email").foregroundColor(.black.opacity(0.7)))
                            .disableAutocorrection(true)
                            .padding(.leading, 5)
                            .foregroundColor(.white)
                            .background(
                                RoundedRectangle(cornerRadius: 5).fill(Color.white.opacity(0.3)))
                        
                        SecureField("", text: $authManager.password, prompt: Text("Password").foregroundColor(.black.opacity(0.7)))
                            .foregroundColor(.white)
                            .disableAutocorrection(true)
                            .padding(.leading, 5)
                            .background(
                                RoundedRectangle(cornerRadius: 5).fill(Color.white.opacity(0.3)))
                        
                        Button {
                            authManager.login(email: authManager.email, password: authManager.password) { success in
                                if success {
                                    MainView()
                                } else {
                                    Text("Log in attempt failed")
                                }
                            }
                        } label: {
                            Text("Log in")
                                .foregroundColor(.white)
                        }
                        .padding(.top)
                        
                        Spacer()
                        
                        Text("New to DDW?")
                            .foregroundColor(.white)
                        
                        NavigationLink {
                            RegisterView()
                        } label: {
                            Text("Sign up here")
                        }
                        .padding(.top, 2)
                        .padding(.bottom, 30)

                    }
                    .padding()
                
                }
                .ignoresSafeArea()
                
                
            }
        }
        
    }
    
    struct LoginView_Previews: PreviewProvider {
        static var previews: some View {
            LoginView()
        }
    }
}
