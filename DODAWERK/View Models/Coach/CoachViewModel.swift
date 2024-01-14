//
//  CoachViewModel.swift
//  DDW
//
//  Created by Ellen Stavrou on 14/12/2023.
//

import Foundation
import FirebaseAuth

class  CoachViewModel: ObservableObject {
    @Published var currentUserId: String = ""
    private var handler: AuthStateDidChangeListenerHandle?
    
    init() {
        self.handler = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
            }
        }
    }
}
