//
//  RegisterViewModel.swift
//  DODAWERK
//
//  Created by Ellen Stavrou on 18/11/2023.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class RegisterViewModel: ObservableObject {
    
    init() {}
    
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var userType: RegisterViewModel.UserType = .client
    
    enum UserType: String {
        case client
        case coach
    }
    
    func registerAndLogin(authManager: AuthManager, completion: @escaping (Bool) -> Void) {
        guard validate() else {
            completion(false)
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            if let error = error {
                completion(false)
                return
            }
            
            guard let userId = result?.user.uid else {
                completion(false)
                return
            }
            
            self?.insertUserRecord(id: userId)
            
            authManager.login(email: self?.email ?? "", password: self?.password ?? "") { success in
                completion(success)
            }
            
        }
        
        
    }
    
    private func insertUserRecord(id: String) {
        let newUser = User(id: id, name: name, email: email, userType: userType.rawValue, joined: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
        
    }
    
    private func validate() -> Bool {
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
                !email.trimmingCharacters(in: .whitespaces).isEmpty,
                !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }

        
        guard email.contains("@") && email.contains(".") else {
            return false
        }
        
        guard password.count >= 6 else {
            return false
        }
        
        return true
    }
}
