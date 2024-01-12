//
//  ClientExerciseLibraryView.swift
//  DDW
//
//  Created by Ellen Stavrou on 11/12/2023.
//
import FirebaseFirestore
import SwiftUI

struct ClientExerciseLibraryView: View {
    
    @StateObject var viewModel = ClientExerciseLibraryViewModel()
    @FirestoreQuery var exercises: [Exercise]
    
    init() {
        self._exercises = FirestoreQuery(collectionPath: "exercises")
    }
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                List(exercises) { exercise in
                    NavigationLink {
                        ClientExerciseView(exercise: exercise)
                    } label: {
                        ExerciseCardView(exercise: exercise)
                    }
                }
                .listStyle(PlainListStyle())
            }
        }
        .navigationTitle("Exercise Library")
    }
}

struct ClientExerciseLibraryView_Previews: PreviewProvider {
    static var previews: some View {
        ClientExerciseLibraryView()
    }
}
