//
//  NewExerciseViewModel.swift
//  DDW
//
//  Created by Ellen Stavrou on 14/12/2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class NewExerciseViewModel: ObservableObject {
    
    @Published var name: String = ""
    @Published var description: String = ""
    
    init() {}
    
    var canSave: Bool {
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard !description.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        return true
    }
    
    func save() {
        
        guard canSave else {
            print("Cannot save. Check data.")
            return
        }
        
        let newId = UUID().uuidString
        let newExercise = Exercise(name: name, description: description)
        
        let db = Firestore.firestore()
        db.collection("exercises").document(newId).setData(newExercise.asDictionary()) { error in
            if let error = error {
                print("Error saving document: \(error)")
            } else {
                print("Document saved successfully!")
            }
        }

    }
    
    
}


