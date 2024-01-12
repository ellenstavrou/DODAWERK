//
//  ClientExerciseLibraryViewModel.swift
//  DDW
//
//  Created by Ellen Stavrou on 12/12/2023.
//

import Foundation
import FirebaseFirestore
import Combine

class ClientExerciseLibraryViewModel: ObservableObject {
    
    @Published var exercises: [Exercise] = []
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        fetchExercises()
    }
    
    func fetchExercises() {
        let query = Firestore.firestore().collection("exercises")
        
        query.addSnapshotListener { querySnapshot, error in
            guard let documents = querySnapshot?.documents else {
                print("Error fetching documents: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            self.exercises = documents.compactMap { document in
                try? document.data(as: Exercise.self)
            }
        }
    }
}
