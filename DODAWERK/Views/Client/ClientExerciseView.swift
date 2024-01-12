//
//  ExerciseView.swift
//  DDW
//
//  Created by Ellen Stavrou on 12/12/2023.
//

import SwiftUI

struct ClientExerciseView: View {
    
    var exercise: Exercise
    
    var body: some View {
        
        NavigationView {
            
            VStack (alignment: .leading) {
                
                // video
                
                Text(exercise.description)
            }
            .navigationTitle(exercise.name)
        }
        
    }
}

struct ClientExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        ClientExerciseView(exercise: Exercise(name: "Squat", description: "Demo description"))
    }
}
