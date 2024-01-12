//
//  AuthManager.swift
//  DDW
//
//  Created by Ellen Stavrou on 24/11/2023.
//

import Foundation
import Firebase
import FirebaseAuth
import Combine

class AuthManager: ObservableObject {
    
    @Published var user: User?
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init() {
        addStateListener()
    }
    
    func addStateListener() {
        
        Auth.auth().addStateDidChangeListener { [weak self] auth, user in
            if let user = user {
                self?.fetchUserData(uid: user.uid)
            } else {
                self?.user = nil
                    }
                }
    }
    
    func fetchUserData(uid: String) {
        
        let db = Firestore.firestore()
        
        db.collection("users").document(uid).getDocument { [weak self] document, error in
            if let document = document, document.exists {
                do {
                    let user = try document.data(as: User.self)
                    self?.user = user
                } catch {
                    print("Error decoding user data: \(error.localizedDescription)")
                        }
                    }
                }
    }
    
    func login(email: String, password: String, completion: @escaping (Bool) -> Void) {
        guard validate() else {
            completion(false)
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password)
        
    }
    
    private func validate() -> Bool {
        errorMessage = ""
        
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
                !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            
            errorMessage = "Please fill in all fields."
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please enter a valid email"
            return false
        }
        
        return true
            
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            self.user = nil
        } catch {
            print("Error signing out.")
        }
        
    }
    
    func isCoach() -> Bool {
        return user?.userType == "coach"
    }
}
