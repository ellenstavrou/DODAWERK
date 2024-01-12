//
//  CoachExerciseLibraryView.swift
//  DDW
//
//  Created by Ellen Stavrou on 05/12/2023.
//

import SwiftUI
import FirebaseFirestore

struct CoachExerciseLibraryView: View {
    
    @StateObject var viewModel: CoachExerciseLibraryViewModel
    @State var showingAddExerciseSheet = false
    
    @FirestoreQuery var exercises: [Exercise]

    init(userId: String) {
        self._exercises = FirestoreQuery(collectionPath: "exercises")
        self._viewModel = StateObject(wrappedValue: CoachExerciseLibraryViewModel(userId: userId))
    }

    var body: some View {
        NavigationStack {
            
            ScrollView {
                
                VStack (alignment: .leading) {
                    ForEach(exercises) { exercise in
                        NavigationLink {
                            CoachExerciseView(exercise: exercise)
                        } label: {
                            ExerciseCardView(exercise: exercise)
                                .padding(.bottom, 50)
                        }
                    }
                }
                .padding(.top, 30)
                
            }
            .padding(.horizontal)
            .navigationTitle("Exercise Library")
            .toolbar {
                Button {
                    viewModel.showingNewExerciseView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewExerciseView) {
                NewExerciseView(newExercisePresented: $viewModel.showingNewExerciseView)
            }
        }
        .ignoresSafeArea()
        .onAppear {
            viewModel.loadData()
            print("Exercises: \(exercises)")
        }
        // title
        
        // plus icon
        
        // search bar
        
        // list of exercises
    }
}

struct CoachExerciseLibraryView_Previews: PreviewProvider {
    static var previews: some View {
        CoachExerciseLibraryView(userId: "tDxkTdiohgf9XN8RYUALdFCWfST2")
    }
}
