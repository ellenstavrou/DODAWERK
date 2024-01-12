//
//  CoachExerciseLibraryViewModel.swift
//  DDW
//
//  Created by Ellen Stavrou on 05/12/2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class CoachExerciseLibraryViewModel: ObservableObject {
    
    private let db = Firestore.firestore()
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    @Published var showingNewExerciseView = false
    @Published var exercises: [Exercise] = []
    
    func addExercise(name: String, description: String) {
        var exercise = Exercise(name: name, description: description)
        
        do {
            let documentReference = try db.collection("exercises").addDocument(from: exercise)
            exercise.id = documentReference.documentID
        } catch {
            print("Error encoding exercise: \(error)")
        }
    }
    
    func deleteExercise(exerciseId: String) {
        
        let db = Firestore.firestore()
        
        db.collection("exercises")
            .document(exerciseId)
            .delete()
    }
    
    func loadData() {
        db.collection("exercises").whereField("userId", isEqualTo: userId).addSnapshotListener { querySnapshot, error in
            if let error = error {
                print("Error getting exercises: \(error.localizedDescription)")
                return
            }

            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }

            self.exercises = documents.compactMap { document in
                do {
                    var decodedExercise = try document.data(as: Exercise.self)
                    decodedExercise.id = document.documentID  // No optional chaining here
                    return decodedExercise
                } catch {
                    print("Error decoding exercise: \(error.localizedDescription)")
                    return nil
                }
            }
        }
    }









   
}
