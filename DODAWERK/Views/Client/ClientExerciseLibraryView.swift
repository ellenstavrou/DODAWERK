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
        
        NavigationStack {
            
            ScrollView {
                VStack {
                    
                    ForEach(exercises) { exercise in
                        NavigationLink {
                            ClientExerciseView(exercise: exercise)
                        } label: {
                            ExerciseCardView(exercise: exercise)
                                .padding(.bottom, 50)
                        }
                    }
                }
                .padding(.top, 30)
            }
            .navigationTitle("Exercise Library")
            .padding(.horizontal)
            
        }

    }
}

struct ClientExerciseLibraryView_Previews: PreviewProvider {
    static var previews: some View {
        ClientExerciseLibraryView()
    }
}
