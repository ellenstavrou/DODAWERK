//
//  ExerciseCardView.swift
//  DDW
//
//  Created by Ellen Stavrou on 12/12/2023.
//

import SwiftUI

struct ExerciseCardView: View {
    
    var exercise: Exercise
    
    var body: some View {
        
        ZStack {
            
            RoundedRectangle(cornerRadius: 15)
                .foregroundColor(.gray.opacity(0.3))
            
            HStack {
                
                VStack (alignment: .leading) {
                    
                    Text(exercise.name)
                        .bold()
                        .font(.headline)
                        .foregroundColor(.black)
                    
                    Text(exercise.description)
                        .font(.callout)
                        .foregroundColor(Color(red: 105/255, green: 105/255, blue: 105/255))
                }
                .padding(.init(top: 15, leading: 12, bottom: 15, trailing: 2))
                
                Spacer()
                
            }
        }
        .frame(height: 30)
        
    }
}

struct ExerciseCardView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseCardView(exercise: Exercise(name: "Squat", description: "demo description"))
    }
}
