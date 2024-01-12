//
//  CoachExerciseView.swift
//  DDW
//
//  Created by Ellen Stavrou on 19/12/2023.
//

import SwiftUI

struct CoachExerciseView: View {
    var exercise: Exercise
    @State private var isDeleteAlertPresented = false
    @Environment(\.presentationMode) var presentationMode
    var viewModel: CoachExerciseLibraryViewModel

    init(exercise: Exercise) {
        self.exercise = exercise
        self.viewModel = CoachExerciseLibraryViewModel(userId: exercise.id ?? "")
    }

    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Text(exercise.description)
                Spacer()
                Button {
                    isDeleteAlertPresented = true
                } label: {
                    Text("Delete Exercise")
                }
                .foregroundColor(.red)
            }
            .alert(isPresented: $isDeleteAlertPresented) {
                Alert(
                    title: Text("Delete Exercise"),
                    message: Text("Are you sure you want to delete this exercise?"),
                    primaryButton: .destructive(Text("Delete")) {
                        deleteExercise()
                    },
                    secondaryButton: .cancel()
                )
            }
            .navigationTitle(exercise.name)
            .onAppear{
                UITabBar.appearance().isHidden = true
            }
            .onDisappear{
                UITabBar.appearance().isHidden = false
            }
        }
        
    }

    private func deleteExercise() {
        viewModel.deleteExercise(exerciseId: exercise.id ?? "")
        presentationMode.wrappedValue.dismiss()
    }
}

struct CoachExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        CoachExerciseView(exercise: Exercise(name: "Squat", description: "Demo"))
    }
}
